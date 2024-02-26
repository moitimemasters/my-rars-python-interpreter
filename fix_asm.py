from subprocess import PIPE, Popen
import re

REPLACEMENTS = {}

ABORT_FUNCTION = ["abort:", "li a7, 93", "li a0, 1", "ecall"]

PRELUDE = [*ABORT_FUNCTION]

with open("build/clean.asm") as f:
    cntns = f.readlines()


def demangle_symbol(symbol: str) -> str:
    with Popen(("c++filt", symbol), stdout=PIPE, universal_newlines=True) as process:
        process.wait()
        return process.stdout.read().strip()



def demangle_globals_and_labels(line: str) -> tuple[str, ...]:
    if line.startswith(".globl"):
        demangled = demangle_symbol(line[7:])
        return line ,f"#\t{demangled}"
    if line.endswith(":"):
        demangled = demangle_symbol(line[:-1])
        return line, f"#\t{demangled}"
    return (line,)

def get_comm(line: str) -> tuple[str, int, int] | None:
    regexp = re.compile(r"\.comm.(\w+),(\d+),(\d+)")
    if found := regexp.findall(line):
        label, size, alignment = found[0]
        size = int(size)
        alignment = int(alignment)
        if alignment == 8:
            alignment = 3
        elif alignment == 4:
            alignment = 2
        elif alignment == 2:
            alignment = 1
        else:
            alignment = 0
        return label, size, alignment
    return None


def expand_comm(line: str) -> tuple[str, ...]:
    if comm := get_comm(line):  # type: ignore
        label, size, alignment = comm
        return (
            ".data",
            f".align {alignment}",
            label + ":",
            f".space {size}",
            ".text",
        )
    return (line,)


contents = PRELUDE
for line in cntns:
    for extended_demangling in demangle_globals_and_labels(line.strip()):
        contents.extend(expand_comm(extended_demangling))


result = []

current = 0

data_directives = [".byte", ".string", ".dword", ".word", ".half", ".ascii", ".asciz", ".space"]


def starts_by_data(line: str) -> bool:
    for directive in data_directives:
        if line.startswith(directive):
            return True
    return False


while current < len(contents):
    line = contents[current]
    if line.endswith(":"):
        break
    result.append(line)
    current += 1

while current < len(contents):
    current_from_label = current + 1

    lable = contents[current]
    tmp = []
    is_data = False

    while current_from_label < len(contents):
        line = contents[current_from_label]

        if line.endswith(":"):
            break

        if starts_by_data(line):
            is_data = True

        tmp.append(line)
        current_from_label += 1

    if is_data:
        result.append(".data")
        result.append(lable)
        result.extend(tmp)
        result.append(".text")
    else:
        result.append(lable)
        result.extend(tmp)

    current = current_from_label


def parse_broken_instruction(instr: str) -> tuple[str, str, str, str] | None:
    regex = re.compile(r"((?:s|lb)\w).(\w\d+|zero).%lo\((\w+)\)\((\w\d+)\)")
    if found := regex.findall(instr):
        return found[0]
    return None


def filter_double_sections(result):
    current_section = ".text"
    for line, next_line in zip(result, result[1:]):
        if line not in (".data", ".text"):
            yield line
        else:
            if next_line not in (".data", ".text") and line != current_section:
                current_section = line
                yield line

    if result[-1] not in (".data", ".text"):
        yield result[-1]


def fix_store_instruction(result):
    for line in result:
        if "__cxxabi" in line:
            continue
        if parsed := parse_broken_instruction(line):
            instr, fr, label, to = parsed
            yield "addi sp,sp,4"
            yield "sd t0,0(sp)"
            yield f"mv t0,{to}"
            yield f"addi t0,t0,%lo({label})"
            yield f"{instr} {fr},0(t0)"
            yield "ld t0,(sp)"
            yield "addi sp,sp,-4"
        elif line.startswith(".set"):
            what, to = line[5:].split(",")
            REPLACEMENTS[what] = to
        else:
            yield line


resulting_content = "\n".join(fix_store_instruction(filter_double_sections(result)))

for what, to in REPLACEMENTS.items():
    print(what, to)
    resulting_content = resulting_content.replace(what, to)

with open("build/fixed.asm", "w") as f:
    f.write(resulting_content)
