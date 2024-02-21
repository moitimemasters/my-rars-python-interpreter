#include "syscall/syscall.hpp"
#include "util/string.hpp"

#include <cstddef>
#include <functional>

#define LEX_DEBUG

using std::function;

static auto iota = 0;

// python tokens
enum token_t : size_t {
    UNDEFINED,
    eof,

    NEWLINE,
    SPACE,

    INT_10,
    FLOAT_10,
    NAME,

    AND,
    AS,
    // ASYNC,
    // AWAIT,

    BOOL,
    BREAK,

    CONTINUE,

    DICT,
    DEF,
    DEL,

    EXCEPTION,
    EXCEPT,

    FROM,
    FOR,

    GETATTR,

    IMPORT,
    IS,
    IN,
    IF,

    LIST,
    LEN,

    OR,

    PASS,

    RETURN,

    SETATTR,
    SET,

    YIELD,

    // OPERATORS and etc. (that doesn't contain letters or digits or spaces)
    // OPERATORS
    // ARITHMETIC
    PLUS,
    MINUS,
    MUL,
    DIV,
    MOD,
    POW,
    FLOORDIV,
    // BITWISE
    BINVERT,
    BAND,
    BOR,
    BXOR,
    BLSHIFT,
    BRSHIFT,
    // COMPARISON
    EQ,
    NE,
    LT,
    GT,
    LE,
    GE,
    // LOGICAL
    LOR,
    LAND,
    LNOT,
    // ASSIGNMENT
    ASSIGN,
    AUG_PLUS,
    AUG_MINUS,
    AUG_MUL,
    AUG_DIV,
    AUG_MOD,
    AUG_POW,
    AUG_FLOORDIV,
    AUG_BAND,
    AUG_BOR,
    AUG_BXOR,
    AUG_BLSHIFT,
    AUG_BRSHIFT,
    AUG_BINVERT,
    // SEPARATORS
    COMMA,
    DOT,
    COLON,
    SEMICOLON,
    // BRACKETS
    LPAREN,   // (
    RPAREN,   // )
    LBRACKET, // [
    RBRACKET, // ]
    LBRACE,   // {
    RBRACE,   // }

    // LITERALS
    DOUBLE_QUOTE,
    SINGLE_QUOTE,
    // TRIPLE_DOUBLE_QUOTE,
    // TRIPLE_SINGLE_QUOTE,

    // STRING MISC
    STRING_CONTENT,

    // COMMENTS
    HASHTAG_COMMENT
};

#ifdef LEX_DEBUG

const char* TOKEN_NAMES[82] = {"undefined\0",
                               "eof\0",
                               "newline\0",
                               "space\0",
                               "int_10\0",
                               "float_10\0",
                               "name\0",
                               "and\0",
                               "as\0",
                               "\0",
                               "break\0",
                               "continue\0",
                               "dict\0",
                               "def\0",
                               "del\0",
                               "exception\0",
                               "except\0",
                               "from\0",
                               "for\0",
                               "getattr\0",
                               "import\0",
                               "is\0",
                               "in\0",
                               "if\0",
                               "list\0",
                               "len\0",
                               "or\0",
                               "pass\0",
                               "return\0",
                               "setattr\0",
                               "set\0",
                               "yield\0",
                               "plus\0",
                               "minus\0",
                               "mul\0",
                               "div\0",
                               "mod\0",
                               "pow\0",
                               "floordiv\0",
                               "binvert\0",
                               "band\0",
                               "bor\0",
                               "bxor\0",
                               "blshift\0",
                               "brshift\0",
                               "eq\0",
                               "ne\0",
                               "lt\0",
                               "gt\0",
                               "le\0",
                               "ge\0",
                               "lor\0",
                               "land\0",
                               "lnot\0",
                               "assign\0",
                               "aug_plus\0",
                               "aug_minus\0",
                               "aug_mul\0",
                               "aug_div\0",
                               "aug_mod\0",
                               "aug_pow\0",
                               "aug_floordiv\0",
                               "aug_band\0",
                               "aug_bor\0",
                               "aug_bxor\0",
                               "aug_blshift\0",
                               "aug_brshift\0",
                               "aug_binvert\0",
                               "comma\0",
                               "dot\0",
                               "colon\0",
                               "semicolon\0",
                               "lparen\0",
                               "rparen\0",
                               "lbracket\0",
                               "rbracket\0",
                               "lbrace\0",
                               "rbrace\0",
                               "double_quote\0",
                               "single_quote\0",
                               "string_content\0",
                               "hashtag_comment\0"};

#endif

inline rstd::string itoa(size_t number) {
    rstd::string result;
    if (number == 0) {
        result.push_back('0');
        return result;
    }
    while (number > 0) {
        result.push_back('0' + number % 10);
        number /= 10;
    }
    return result;
}

struct parsed_token_t {
    token_t token;
    size_t start, end, row, col;
    rstd::string data = {};

#ifdef LEX_DEBUG
    inline rstd::string to_string() const {
        rstd::string result = rstd::string(TOKEN_NAMES[token]);
        result.push_back('\0');
        return result;
    }
#endif
};

struct lexer_t {
    int64_t descriptor;
    char* buffer;
    size_t current_read_position = 0;

    bool ended_reading = false;
    size_t max_length = 128;

    size_t cur_position = 0, cur_row = 0, cur_col = 0;
    rstd::string current_string{};
    // function<char()> get_char;
    // function<void()> advancechar;

    inline void advance() {
        if (get_char() == '\n') {
            cur_col = 0;
            ++cur_row;
        } else {
            ++cur_col;
        }
        advance_char();
        ++cur_position;
    }

    ~lexer_t() { ::operator delete[](buffer); }

    lexer_t(int64_t descriptor) : descriptor(descriptor) {
        buffer = ::new (::operator new[](sizeof(char) * 128)) char[128];
        auto bytes_read =
            rsyscall::read_from_descriptor(descriptor, buffer, 128);
        if (bytes_read < 0) {
            rsyscall::print_string("Error reading from descriptor\n");
            rsyscall::exit(0);
        }
        if (bytes_read < 128) {
            ended_reading = true;
        }
        max_length = static_cast<size_t>(bytes_read);
    }

    inline char get_char() {
        if (current_read_position == max_length) {
            if (ended_reading) {
                return '\0';
            }
            auto bytes_read =
                rsyscall::read_from_descriptor(descriptor, buffer, 128);
            if (bytes_read < 0) {
                rsyscall::print_string("Error reading from descriptor\n");
                rsyscall::exit(0);
            }
            if (bytes_read < 128) {
                ended_reading = true;
            }
            max_length = static_cast<size_t>(bytes_read);
            current_read_position = 0;
        }
        return buffer[current_read_position];
    }

    inline void advance_char() {
        if (current_read_position == max_length) {
            if (ended_reading) {
                return;
            }
            auto bytes_read =
                rsyscall::read_from_descriptor(descriptor, buffer, 128);
            if (bytes_read < 0) {
                rsyscall::print_string("Error reading from descriptor\n");
                rsyscall::exit(0);
            }
            if (bytes_read < 128) {
                ended_reading = true;
            }
            max_length = static_cast<size_t>(bytes_read);
            current_read_position = 0;
        }
        if (buffer[current_read_position] == '\n') {
            cur_col = 0;
            ++cur_row;
        } else {
            ++cur_col;
        }
        ++current_read_position;
        // ++cur_position;
    }

    char next_char() {
        char c;
        if (descriptor < 0) {
            return '\0';
        }
        if (rsyscall::read_from_descriptor(descriptor, &c, 1) == 0) {
            return '\0';
        }
        return c;
    }

    inline bool can_continue_name(const char c) {
        return ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') ||
               ('0' <= c && c <= '9') || c == '_';
    }

    inline size_t parse_exact(const char* representation, size_t shift = 0) {
        const size_t n = rstd::strlen(representation);
        if (shift >= n) {
            return shift;
        }
        auto start_position = cur_position;
        for (auto cur = representation + shift; *cur != '\0'; ++cur) {
            if (*cur != get_char()) {
                return cur_position - start_position + shift;
            }
            current_string.push_back(*cur);
            advance();
        }
        return cur_position - start_position + shift;
    }

    inline size_t parse_word(const char* represenation, size_t shift = 0) {
        const size_t n = rstd::strlen(represenation);
        if (shift >= n) {
            return shift;
        }
        auto start_position = cur_position;
        for (auto cur = represenation + shift; *cur != '\0'; ++cur) {
            if (*cur != get_char()) {
                return cur_position - start_position + shift;
            }
            current_string.push_back(*cur);
            advance();
        }
        const auto c = get_char();
        if (can_continue_name(c)) {
            current_string.push_back(c);
            advance();
        }
        return cur_position - start_position + shift;
    }

    inline bool isdigit(const char c) { return '0' <= c && c <= '9'; }

    inline parsed_token_t parse_space() {
        const auto c = get_char();
        if (c == '\0') {
            return parsed_token_t{.token = eof};
        }
        advance();
        if (c == ' ') {
            return parsed_token_t{.token = SPACE};
        }
        if (c == '\t') {
            return parsed_token_t{.token = SPACE};
        }
        if (c == '\n') {
            return parsed_token_t{.token = NEWLINE};
        }
        return parsed_token_t{
            .token = UNDEFINED,
            .start = cur_position - 1,
            .end = cur_position,
            .row = cur_row,
            .col = cur_col,
            .data = rstd::string(1, c),
        };
    }

    inline parsed_token_t parse_name(size_t start, size_t row, size_t col,
                                     size_t shift = 0) {
        if (shift == 0)
            current_string.clear();

        for (auto c = get_char(); can_continue_name(c);
             advance(), c = get_char()) {
            current_string.push_back(c);
        }
        shift += cur_position - start;
        if (shift == 0) {
            return parse_space();
        }

        auto parsed_token = parsed_token_t{
            .token = NAME,
            .start = start,
            .end = cur_position,
            .row = row,
            .col = col,
            .data = current_string,
        };
        current_string.clear();
        return parsed_token;
    }

    inline parsed_token_t parse_number() {
        size_t shift = 0;
        const auto start = cur_position;
        const auto col = cur_col;
        const auto row = cur_row;
        current_string.clear();
        auto c = get_char();
        for (; isdigit(c); advance(), ++shift, c = get_char()) {
            current_string.push_back(c);
        }
        if (shift == 0) {
            return parse_name(start, row, col, shift);
        }
        if (c == '\0' || c != '.') {
            auto parsed_token = parsed_token_t{
                .token = INT_10,
                .start = start,
                .end = cur_position,
                .row = row,
                .col = col,
                .data = current_string,
            };
            current_string.clear();
            return parsed_token;
        }
        current_string.push_back(c);
        advance();
        ++shift;
        for (; isdigit(c); advance(), ++shift) {
            current_string.push_back(c);
        }
        auto parsed_token = parsed_token_t{
            .token = INT_10,
            .start = start,
            .end = cur_position,
            .row = row,
            .col = col,
            .data = current_string,
        };
        current_string.clear();
        return parsed_token;
    }

    inline parsed_token_t parse_comment() {
        const auto start = cur_position;
        const auto col = cur_col;
        const auto row = cur_row;
        current_string.clear();
        const auto c = get_char();
        if (c == '\0') {
            return parsed_token_t{.token = eof};
        }
        if (c == '#') {
            for (; c != '\n' && c != '\0'; advance()) {
                current_string.push_back(c);
            }
            return parsed_token_t{
                .token = HASHTAG_COMMENT,
                .start = start,
                .end = cur_position,
                .row = row,
                .col = col,
                .data = current_string,
            };
        }
        return parsed_token_t{.token = UNDEFINED,
                              .start = start,
                              .end = cur_position,
                              .row = row,
                              .col = col};
    }

    inline parsed_token_t parse_string_unescape() {
        const auto start = cur_position;
        const auto col = cur_col;
        const auto row = cur_row;
        current_string.clear();
        const char closing_quote = get_char();
        // we know c is open quote
        advance();
        for (auto c = get_char(); c != closing_quote;
             advance(), c = get_char()) {
            if (c == '\0') {
                return parsed_token_t{.token = UNDEFINED,
                                      .start = start,
                                      .end = cur_position,
                                      .row = row,
                                      .col = col,
                                      .data = current_string};
            }
            if (c == '\\') {
                // current_string.push_back(c);
                auto before_escape_position = cur_position;
                auto before_escape_col = cur_col;
                auto before_escape_row = cur_row;
                advance();
                const auto escaped = get_char();
                switch (escaped) {
                case 'n':
                    current_string.push_back('\n');
                    break;
                case 't':
                    current_string.push_back('\t');
                    break;
                case 'r':
                    current_string.push_back('\r');
                    break;
                case '0':
                    current_string.push_back('\0');
                    break;
                default:
                    current_string.push_back(c);
                    current_string.push_back(escaped);
                    return parsed_token_t{.token = UNDEFINED,
                                          .start = start,
                                          .end = cur_position,
                                          .row = row,
                                          .col = col,
                                          .data = current_string};
                }
            } else {
                if (c == '\n') {
                    return parsed_token_t{.token = UNDEFINED,
                                          .start = start,
                                          .end = cur_position,
                                          .row = row,
                                          .col = col,
                                          .data = current_string};
                }
                current_string.push_back(c);
            }
        }
        advance();
        return parsed_token_t{.token = STRING_CONTENT,
                              .start = start,
                              .end = cur_position,
                              .row = row,
                              .col = col,
                              .data = current_string};
    }

    inline parsed_token_t parse_non_name() {
        const auto saved_start_position = cur_position;
        const auto saved_col = cur_col;
        const auto saved_row = cur_row;
        current_string.clear();
        const auto c = get_char();
        if (c == '\0') {
            return parsed_token_t{.token = eof};
        }
        // >>=, >>, >=, >
        auto parsed = parse_exact(">>=");
        // can't be more than 3 because it is parsed_exact
        if (parsed == 3) {
            return parsed_token_t{.token = AUG_BRSHIFT,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 2) {
            return parsed_token_t{.token = BRSHIFT,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            parsed = parse_exact(">=", parsed);
            if (parsed == 2) {
                return parsed_token_t{.token = GE,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            } else if (parsed == 1) {
                return parsed_token_t{.token = GT,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            }
        }
        // <<=, <<, <=, <
        parsed = parse_exact("<<=");
        if (parsed == 3) {
            return parsed_token_t{.token = AUG_BLSHIFT,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 2) {
            return parsed_token_t{.token = BLSHIFT,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            parsed = parse_exact("<=", parsed);
            if (parsed == 2) {
                return parsed_token_t{.token = LE,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            } else if (parsed == 1) {
                return parsed_token_t{.token = LT,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            }
        }
        // == and =
        parsed = parse_exact("==");
        if (parsed == 2) {
            return parsed_token_t{.token = EQ,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            parsed = parse_exact("=", parsed);
            if (parsed == 1) {
                return parsed_token_t{.token = ASSIGN,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            }
        }
        // !=
        parsed = parse_exact("!=");
        if (parsed == 2) {
            return parsed_token_t{.token = NE,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            return parsed_token_t{.token = UNDEFINED,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col,
                                  .data = current_string};
        }
        // += and +
        parsed = parse_exact("+=");
        if (parsed == 2) {
            return parsed_token_t{.token = AUG_PLUS,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            return parsed_token_t{.token = PLUS,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        }
        // -= and -
        parsed = parse_exact("-=");
        if (parsed == 2) {
            return parsed_token_t{.token = AUG_MINUS,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            return parsed_token_t{.token = MINUS,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        }
        // **=, **, *= and *
        parsed = parse_exact("**=");
        if (parsed == 3) {
            return parsed_token_t{.token = AUG_POW,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 2) {
            return parsed_token_t{.token = POW,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            parsed = parse_exact("*=", parsed);
            if (parsed == 2) {
                return parsed_token_t{.token = AUG_MUL,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            } else if (parsed == 1) {
                return parsed_token_t{.token = MUL,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            }
        }
        // //= /= // and /
        parsed = parse_exact("//=");
        if (parsed == 3) {
            return parsed_token_t{.token = AUG_FLOORDIV,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 2) {
            return parsed_token_t{.token = FLOORDIV,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            parsed = parse_exact("/=", parsed);
            if (parsed == 2) {
                return parsed_token_t{.token = AUG_DIV,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            }
            return parsed_token_t{.token = DIV,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        }
        // %= and %
        parsed = parse_exact("%=");
        if (parsed == 2) {
            return parsed_token_t{.token = AUG_MOD,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            return parsed_token_t{.token = MOD,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        }
        // |= and |
        parsed = parse_exact("|=");
        if (parsed == 2) {
            return parsed_token_t{.token = AUG_BOR,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            return parsed_token_t{.token = BOR,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        }
        // &= and &
        parsed = parse_exact("&=");
        if (parsed == 2) {
            return parsed_token_t{.token = AUG_BAND,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            return parsed_token_t{.token = BAND,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        }
        // ^= and ^
        parsed = parse_exact("^=");
        if (parsed == 2) {
            return parsed_token_t{.token = AUG_BXOR,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            return parsed_token_t{.token = BXOR,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        }
        // ~= and ~
        parsed = parse_exact("~=");
        if (parsed == 2) {
            return parsed_token_t{.token = AUG_BINVERT,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            return parsed_token_t{.token = BINVERT,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        }
        // disallow triple quotes for now
        // so no more complex parsing
        // only one char tokens
        token_t parsed_one_char_token = UNDEFINED;
        switch (c) {
        case ',':
            parsed_one_char_token = COMMA;
            break;
        case '.':
            parsed_one_char_token = DOT;
            break;
        case ':':
            parsed_one_char_token = COLON;
            break;
        case ';':
            parsed_one_char_token = SEMICOLON;
            break;
        case '(':
            parsed_one_char_token = LPAREN;
            break;
        case ')':
            parsed_one_char_token = RPAREN;
            break;
        case '[':
            parsed_one_char_token = LBRACKET;
            break;
        case ']':
            parsed_one_char_token = RBRACKET;
            break;
        case '{':
            parsed_one_char_token = LBRACE;
            break;
        case '}':
            parsed_one_char_token = RBRACE;
            break;
        case '"':
            parsed_one_char_token = DOUBLE_QUOTE;
            break;
        case '\'':
            parsed_one_char_token = SINGLE_QUOTE;
            break;
        case '#':
            parsed_one_char_token = HASHTAG_COMMENT;
            break;
        default:
            parsed_one_char_token = UNDEFINED;
            break;
        }
        if (parsed_one_char_token == HASHTAG_COMMENT) {
            return parse_comment();
        }
        if (parsed_one_char_token == DOUBLE_QUOTE ||
            parsed_one_char_token == SINGLE_QUOTE) {
            return parse_string_unescape();
        }
        if (parsed_one_char_token != UNDEFINED) {

            advance();
            return parsed_token_t{
                .token = parsed_one_char_token,
                .start = saved_start_position,
                .end = cur_position,
                .row = saved_row,
                .col = saved_col,
            };
        }
        return parsed_token_t{.token = UNDEFINED,
                              .start = saved_start_position,
                              .end = cur_position,
                              .row = saved_row,
                              .col = saved_col};
    }

    inline parsed_token_t next_tok() {
        current_string.clear();
        char c = get_char();
        if (c == '\0') {
            return parsed_token_t{.token = eof};
        }

        auto saved_start_position = cur_position;
        auto saved_col = cur_col;
        auto saved_row = cur_row;
        // A
        auto parsed = parse_word("and");
        if (parsed > 3) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed == 3) {
            return parsed_token_t{
                .token = AND,
                .start = saved_start_position,
                .end = cur_position,
                .row = saved_row,
                .col = saved_col,
            };
        } else if (parsed == 1) {
            if (parsed = parse_word("as", parsed); parsed == 2) {
                return parsed_token_t{
                    .token = AS,
                    .start = saved_start_position,
                    .end = cur_position,
                    .row = saved_row,
                    .col = saved_col,
                };
            }
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed != 0) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        }

        // B
        parsed = parse_word("break");
        if (parsed > 5) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed == 5) {
            return parsed_token_t{.token = BREAK,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            if (parsed = parse_word("bool", parsed); parsed == 4) {
                return parsed_token_t{.token = BOOL,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            }
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed != 0) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        }

        // C
        parsed = parse_word("continue");
        if (parsed > 8) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed == 8) {
            return parsed_token_t{.token = CONTINUE,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed != 0) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        }
        // D
        parsed = parse_word("dict");
        if (parsed > 4) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed == 4) {
            return parsed_token_t{.token = DICT,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            parsed = parse_word("def", parsed);
            if (parsed > 3) {
                return parse_name(saved_start_position, saved_row, saved_col,
                                  parsed);
            } else if (parsed == 3) {
                return parsed_token_t{.token = DEF,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            } else if (parsed == 2) {
                if (parsed = parse_word("del", parsed); parsed == 3) {
                    return parsed_token_t{.token = DEL,
                                          .start = saved_start_position,
                                          .end = cur_position,
                                          .row = saved_row,
                                          .col = saved_col};
                }
                return parse_name(saved_start_position, saved_row, saved_col,
                                  parsed);
            } else if (parsed != 0) {
                return parse_name(saved_start_position, saved_row, saved_col,
                                  parsed);
            }
        } else if (parsed != 0) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        }
        // E
        parsed = parse_word("exception");
        if (parsed > 9) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed == 9) {
            return parsed_token_t{.token = EXCEPTION,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 6) {
            if (parsed = parse_word("except", parsed); parsed == 6) {
                return parsed_token_t{.token = EXCEPT,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            }
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed != 0) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        }

        // F
        parsed = parse_word("from");
        if (parsed > 4) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed == 4) {
            return parsed_token_t{.token = FROM,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            if (parsed = parse_word("for", parsed); parsed == 3) {
                return parsed_token_t{.token = FOR,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            }
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed != 0) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        }

        // G
        parsed = parse_word("getattr");
        if (parsed > 7) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed == 7) {
            return parsed_token_t{.token = GETATTR,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed != 0) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        }

        // I
        parsed = parse_word("import");

        if (parsed > 6) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed == 6) {
            return parsed_token_t{.token = IMPORT,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            parsed = parse_word("is", parsed);
            if (parsed > 2) {
                return parse_name(saved_start_position, saved_row, saved_col,
                                  parsed);
            }
            if (parsed == 2) {
                return parsed_token_t{.token = IS,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            }
            parsed = parse_word("in", parsed);
            if (parsed > 2) {
                return parse_name(saved_start_position, saved_row, saved_col,
                                  parsed);
            }
            if (parsed == 2) {
                return parsed_token_t{.token = IN,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            }
            parsed = parse_word("if", parsed);
            if (parsed > 2) {
                return parse_name(saved_start_position, saved_row, saved_col,
                                  parsed);
            }
            if (parsed == 2) {
                return parsed_token_t{.token = IF,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            }
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed != 0) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        }
        // L
        parsed = parse_word("list");
        if (parsed > 4) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed == 4) {
            return parsed_token_t{.token = LIST,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 1) {
            if (parsed = parse_word("len", parsed); parsed == 3) {
                return parsed_token_t{.token = LEN,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            }
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed != 0) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        }
        // O
        parsed = parse_word("or");
        if (parsed > 2) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed == 2) {
            return parsed_token_t{.token = OR,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed != 0) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        }
        // R
        parsed = parse_word("return");
        if (parsed > 6) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed == 6) {
            return parsed_token_t{
                .token = RETURN,
                .start = saved_start_position,
                .end = cur_position,
                .row = saved_row,
                .col = saved_col,
                .data = current_string,
            };
        } else if (parsed != 0) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        }
        // S
        parsed = parse_word("setattr");
        if (parsed > 7) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed == 7) {
            return parsed_token_t{.token = SETATTR,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed == 3) {
            if (parsed = parse_word("set", parsed); parsed == 3) {
                return parsed_token_t{.token = SET,
                                      .start = saved_start_position,
                                      .end = cur_position,
                                      .row = saved_row,
                                      .col = saved_col};
            }
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed != 0) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        }
        // Y
        parsed = parse_word("yield");
        if (parsed > 5) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        } else if (parsed == 5) {
            return parsed_token_t{.token = YIELD,
                                  .start = saved_start_position,
                                  .end = cur_position,
                                  .row = saved_row,
                                  .col = saved_col};
        } else if (parsed != 0) {
            return parse_name(saved_start_position, saved_row, saved_col,
                              parsed);
        }
        if (isdigit(c)) {
            return parse_number();
        }
        if (can_continue_name(c)) {
            return parse_name(cur_position, cur_row, cur_col);
        }
        if (c == ' ' || c == '\t' || c == '\n') {
            return parse_space();
        }
        return parse_non_name();
    }
};
