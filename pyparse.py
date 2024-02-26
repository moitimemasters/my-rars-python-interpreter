tokens = [1, "-", 2, "*", "(", 3, "+", 2, ")"]

token_iter = iter(tokens)


current_token = None


def next_tok():
    global current_token
    try:
        current_token = next(token_iter)
        return current_token
    except:
        return None


def parse_primary():
    result = next_tok()
    if result == "(":
        inner = parse_expr()
        if current_token == ")":
            return inner
        raise Exception("( was not closed")
    return None


def parse_number():
    if result := parse_primary():
        return result

    if isinstance(current_token, (int, float)):
        return current_token

    return None


def parse_product():
    lhs = parse_number()

    if lhs is None:
        return None

    while (token := next_tok()) and token in ("*", "/"):
        if token == "*":
            lhs *= parse_number()
        else:
            lhs /= parse_number()
    return lhs


def parse_sum():
    lhs = parse_product()
    if lhs is None:
        return None
    while current_token in ("+", "-"):
        if current_token == "+":
            lhs += parse_product()
        else:
            lhs -= parse_product()
    return lhs


def parse_expr():
    return parse_sum()


print(parse_expr())
