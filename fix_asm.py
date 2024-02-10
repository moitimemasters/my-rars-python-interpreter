with open("clean.asm") as f:
    contents = f.readlines()

contents = list(map(str.strip, contents))

result = []

current = 0

data_directives = [".string", ".dword", ".word", ".half", ".ascii", ".asciz", ".space"]


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


with open("fixed.asm", "w") as f:
    f.writelines(map(lambda x: x + "\n", result))
