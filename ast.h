// let's write python parser to ast
// in pure c, without any dependencies
// and using malloc/free for memory management


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// enum node_type_t
typedef enum {
    UNKNOWN = 0,
    BINARY_OP,
    UNARY_OP,
    NUMBER
} node_type_t;

// struct ast_node_t
typedef struct ast_node_t {
    node_type_t type;
    struct ast_node_t** children;
    size_t children_count;
} ast_node_t;

// ast_node_t* ast_node_t_new(node_type_t type)
ast_node_t* ast_node_t_new(node_type_t type) {
    ast_node_t* node = (ast_node_t*)malloc(sizeof(ast_node_t));
    node->type = type;
    node->children = NULL;
    node->children_count = 0;
    return node;
}

// void ast_node_t_add_child(ast_node_t* node, ast_node_t* child)
void ast_node_t_add_child(ast_node_t* node, ast_node_t* child) {
    node->children = (ast_node_t**)realloc(node->children, sizeof(ast_node_t*) * (node->children_count + 1));
    node->children[node->children_count++] = child;
}

// struct parser_t
typedef struct parser_t {
    struct lexer_t* lexer;
    struct token_t current_token;
} parser_t;

// parser_t* parser_t_new(struct lexer_t* lexer)
parser_t* parser_t_new(struct lexer_t* lexer) {
    parser_t* parser = (parser_t*)malloc(sizeof(parser_t));
    parser->lexer = lexer;
    parser->current_token = lexer->get_next_token(lexer);
    return parser;
}
