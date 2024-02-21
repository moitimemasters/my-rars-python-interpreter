with open("build/main") as f:
    contents = f.readlines()

unknown_directives = [
    ".weak",
    ".loc",
    ".type",
    ".file",
    ".attribute",
    ".option",
    ".cfi",
    ".size",
    ".zero",
    ".ident",
    ".section",
]


def in_unknown_directives(line: str) -> bool:
    for directive in unknown_directives:
        if line.strip().startswith(directive):
            return False
    return True


def restrict_align(line: str) -> bool:
    stripped = line.strip()
    if stripped.startswith(".align"):
        _, n = stripped.split()
        if int(n) < 4:
            return False
    return True


def remove_comments(line: str) -> str:
    if "#" in line:
        return line[: line.index("#")] + "\n"
    if line.startswith("/"):
        return ""
    return line


contents = filter(lambda x: not x.strip().startswith("#"), contents)
contents = filter(in_unknown_directives, contents)
contents = filter(restrict_align, contents)
contents = filter(lambda x: "throw" not in x, contents)
contents = map(remove_comments, contents)


with open("build/clean.asm", "w") as f:
    f.writelines(contents)
