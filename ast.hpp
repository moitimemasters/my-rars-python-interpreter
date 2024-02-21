#include "parser.hpp"
#include "util/vec.hpp"

// let's build ast for expressions
// using tokens from lexer

// for now, let's just build a tree of tokens for arithmetic expressions

// we will use recursive descent parsing

struct ast_node_t {
    parsed_token_t token;
    rstd::vec<ast_node_t> children;
    ast_node_t(parsed_token_t token) : token(token) {}
    virtual ~ast_node_t() = default;
};

struct binary_op_node_t : ast_node_t {
    binary_op_node_t(parsed_token_t token) : ast_node_t(token) {}
};

struct unary_op_node_t : ast_node_t {
    unary_op_node_t(parsed_token_t token) : ast_node_t(token) {}
};

struct number_node_t : ast_node_t {
    number_node_t(parsed_token_t token) : ast_node_t(token) {}
};


void print_ast(const ast_node_t& node, int depth = 0) {
    for (int i = 0; i < depth; ++i) {
        rsyscall::print_string("  ");
    }
    rsyscall::print_string(node.token.to_string().c_str());
    rsyscall::print_string("\n");
    for (const auto& child : node.children) {
        print_ast(child, depth + 1);
    }
}
