#pragma once
#include "memory/allocator.hpp"
#include "parser.hpp"
#include "syscall/syscall.hpp"
#include "util/vec.hpp"

#define ASTDEBUG

struct ast_node_t;

enum node_type_t
{
    UNKNOWN = 0,
    BINARY_OP,
    UNARY_OP,
    NUMBER
};

#ifdef ASTDEBUG
inline void
print_ast(const ast_node_t& node, size_t depth = 0);

const char* NODE_NAMES[4] = {
    "UNKNOWN\0",
    "BINARY_OP\0",
    "UNARY_OP\0",
    "NUMBER\0",
};

#endif

struct ast_node_t
{
    node_type_t type = UNKNOWN;
    // rstd::vec<ast_node_t> children;
    ast_node_t* children = nullptr;
    parsed_token_t token;
    inline ast_node_t(const node_type_t& type, const parsed_token_t& token)
      : type(type)
      , token(token)
      , children((ast_node_t*)memory::alloc(sizeof(ast_node_t) * 10))
    {
    }
    inline ast_node_t() = default;
};

struct maybe_node_t
{
    bool is_none;
    ast_node_t node;
    inline maybe_node_t()
      : is_none(true)
    {
    }

    inline maybe_node_t(const ast_node_t& node)
      : is_none(false)
      , node(node)
    {
    }

    inline maybe_node_t(const maybe_node_t& other)
      : is_none(other.is_none)
      , node(other.node)
    {
    }
};

struct maybe_error_t
{
    bool is_error;
    const char* error = nullptr;
    maybe_node_t maybe_node;
    maybe_error_t() = delete;

    inline maybe_error_t(const maybe_node_t& maybe_node)
      : is_error(false)
      , maybe_node(maybe_node)
    {
    }

    inline maybe_error_t(const char* error)
      : is_error(true)
      , error(error)
    {
    }

    inline maybe_error_t(const maybe_error_t& other)
      : is_error(other.is_error)
      , error(other.error)
      , maybe_node(other.maybe_node)
    {
    }

    inline maybe_error_t(const ast_node_t& node)
      : is_error(false)
      , maybe_node(node)
    {
    }
};

struct parser_t
{
    lexer_t lexer;
    parsed_token_t current_token;

    inline parser_t(const lexer_t& lexer)
      : lexer(lexer)
    {
    }

    inline void skip_whitespace()
    {
        auto new_token = lexer.next_tok();
        while (new_token.token == SPACE || new_token.token == NEWLINE) {
            new_token = lexer.next_tok();
        }
        current_token = new_token;
    }

    inline parsed_token_t eat()
    {
        skip_whitespace();
        return current_token;
    }

    inline maybe_error_t parse_number()
    {
        if (current_token.token == eof) {
            return maybe_error_t(maybe_node_t());
        }
        // rsyscall::print_string("parse_number\n");
        eat();
        if (current_token.token == INT_10 || current_token.token == FLOAT_10) {

            const auto node = ast_node_t(NUMBER, current_token);

            auto result = maybe_node_t(node);
            // rsyscall::print_string("parsed number\n");
            return maybe_error_t(result);
        }
        return maybe_error_t(maybe_node_t());
    }

    inline maybe_error_t parse_product()
    {
        auto result = parse_number();

        if (result.is_error) {
            return result;
        }
        if (result.maybe_node.is_none) {
            return result;
        }
        rsyscall::print_string("parse_product\n");
        for (eat(); current_token.token == MUL || current_token.token == DIV ||
                    current_token.token == FLOORDIV;
             eat()) {
            rsyscall::print_string("parse_product inner\n");
            auto rhs = parse_number();
            if (result.is_error) {
                return result;
            }
            if (result.maybe_node.is_none) {
                return maybe_error_t(
                  "Expected expression after product expression");
            }
            auto result_node = ast_node_t(BINARY_OP, current_token);
            result_node.children[0] = result.maybe_node.node;
            result_node.children[1] = rhs.maybe_node.node;
            result = maybe_error_t(result_node);
            rsyscall::print_string("created binop\n");
            print_ast(result_node);
        }
        rsyscall::print_string("current_token: ");
        rsyscall::print_string(current_token.to_string().c_str());
        rsyscall::print_string("\n");
        // rsyscall::print_string("parse_product\n");
        return result;
    }

    inline maybe_error_t parse_sum()
    {
        auto result = parse_product();
        if (result.is_error) {
            return result;
        }
        if (result.maybe_node.is_none) {
            return result;
        }
        rsyscall::print_string("parse_sum\n");
        // eat happens in parse_product, so we don't need to eat here
        for (; current_token.token == PLUS || current_token.token == MINUS;) {
            rsyscall::print_string("parse_sum inner\n");

            auto rhs = parse_product();
            if (result.is_error) {
                return result;
            }
            if (result.maybe_node.is_none) {
                return maybe_error_t(
                  "Expected expression after sum expression");
            }
            auto result_node = ast_node_t(BINARY_OP, current_token);
            result_node.children[0] = result.maybe_node.node;
            result_node.children[1] = rhs.maybe_node.node;
            result = maybe_error_t(result_node);
        }
        return result;
    }

    inline maybe_error_t parse_expression()
    {

        // return ast_node_t(BINARY_OP, parsed_token_t());
        auto result = parse_sum();
        rsyscall::print_string("parsed_expression\n");
        return result;
    }
};

inline void
print_ast(const ast_node_t& node, size_t depth)
{
    for (size_t i = 0; i < depth; ++i) {
        rsyscall::print_string("  ");
    }
    rsyscall::print_string("Node: ");
    rsyscall::print_string(NODE_NAMES[node.type]);
    rsyscall::print_string("\n");
    for (size_t i = 0; i < 10; ++i) {
        if (node.children == nullptr) {
            break;
        }
        if (node.children[i].type != UNKNOWN) {
            print_ast(node.children[i], depth + 1);
        }
    }
}
