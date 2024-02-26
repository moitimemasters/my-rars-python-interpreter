#pragma once

#include "ast.hpp"
#include "memory/allocator.hpp"
#include "parser.hpp"
#include "syscall/syscall.hpp"
#include "util/file.hpp"

struct interpreter_t
{
    ast_node_t root;
    inline interpreter_t(const char* file_name)
    {
        auto tokenizer_descriptor =
          rsyscall::open_file(file_name, (int)rstd::open_flag::read);

        if (tokenizer_descriptor < 0) {
            rsyscall::print_string("Error opening file: ");
            rsyscall::print_string(file_name);
            rsyscall::print_string("\n");
            rsyscall::exit(1);
        }
        lexer_t lexer(tokenizer_descriptor);
        parser_t parser(lexer);
        auto mayber_error_root = parser.parse_expression();
        if (mayber_error_root.is_error) {
            rsyscall::print_string("Error parsing file: ");
            rsyscall::print_string(file_name);
            rsyscall::print_string("\n");
            rsyscall::exit(1);
        }
        root = mayber_error_root.maybe_node.node;
    }
    inline void run()
    {
        rsyscall::print_string("Interpreter run\n");
        print_ast(root);
    }
};
