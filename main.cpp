#include "ast.hpp"
#include "memory/allocator.hpp"
#include "memory/pointers.hpp"
#include "parser.hpp"
#include "syscall/syscall.hpp"
#include "util/file.hpp"
#include "util/string.hpp"
#include "util/vec.hpp"

#define RISCV

#ifdef RISCV

void* operator new(std::size_t size) { return memory::alloc(size); }

void operator delete(void* p) {
    memory::free(reinterpret_cast<memory::word_t*>(p));
}

void* operator new[](std::size_t size) {
    // rsyscall::print_string("new[]\n");
    return memory::alloc(size);
}

void operator delete[](void* p) {
    memory::free(reinterpret_cast<memory::word_t*>(p));
}

#endif

int main() {
    const char* file_name =
        "/home/ivanpesnya/my-rars-python-interpreter/test.py";
    auto tokenizer_descriptor =
        rsyscall::open_file(file_name, (int)rstd::open_flag::read);

    if (tokenizer_descriptor < 0) {
        rsyscall::print_string("Error opening file: ");
        rsyscall::print_string(file_name);
        rsyscall::print_string("\n");
        rsyscall::exit(1);
    }
    lexer_t lexer(tokenizer_descriptor);
    // for (auto token = lexer.next_tok();
    //      token.token != eof && token.token != UNDEFINED;
    //      token = lexer.next_tok()) {
    //     rsyscall::print_string("Token: ");
    //     rsyscall::print_string(token.to_string().c_str());
    //     rsyscall::print_string("\n");
    // }
    parser_t parser(lexer);
    auto ast_result = parser.parse_expression();
    if (ast_result.is_error) {
        rsyscall::print_string("Error parsing expression: ");
        rsyscall::print_string(ast_result.error);
        rsyscall::print_string("\n");
        rsyscall::exit(1);
    }
    if (ast_result.maybe_node.node.token.token == eof) {
        rsyscall::print_string(
            ast_result.maybe_node.node.token.to_string().c_str());
    }
    rsyscall::print_string("Parsed expression\n");
    // check that numbers are different
    // consider ast is 5 + 6
    auto node = ast_result.maybe_node.node;
    auto lhs = node.children[0];
    auto rhs = node.children[1];
    if (lhs.token.data == rhs.token.data) {
        rsyscall::print_string("Error: lhs and rhs are the same\n");
        rsyscall::exit(1);
    }
    rsyscall::print_string("\n");
    rsyscall::close_file(tokenizer_descriptor);
    rsyscall::exit(0);
}
