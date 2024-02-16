import re

with open("build/clean.asm") as f:
    contents = f.readlines()

contents = list(map(str.strip, contents))

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
    regex = re.compile("(s\w).(\w\d),%lo\((\w+)\)\((\w\d)\)")
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
            yield ".eqv" + line[4:]
        else:
            yield line


with open("build/fixed.asm", "w") as f:
    f.writelines(map(lambda x: x + "\n", fix_store_instruction(filter_double_sections(result))))
