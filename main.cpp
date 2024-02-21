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

void* operator new[](std::size_t size) { return memory::alloc(size); }

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
    rsyscall::print_string("Opened file\n");
    lexer_t lexer(tokenizer_descriptor);
    auto token = lexer.next_tok();
    for (; token.token != eof && token.token != UNDEFINED;
         token = lexer.next_tok()) {
        rsyscall::print_string("Token: '");
        // rsyscall::print_string(token.to_string().c_str());
        rsyscall::print_string("' data: '");
        token.data.push_back('\0');
        rsyscall::print_string(token.data.c_str());
        rsyscall::print_string("'\n");
    }
    if (token.token == UNDEFINED) {
        rsyscall::print_string("Undefined token: @");
        token.data.push_back('\0');
        rsyscall::print_string(token.data.c_str());
        rsyscall::print_string("\n");
    } else {
        rsyscall::print_string("EOF\n");
    }
    rsyscall::close_file(tokenizer_descriptor);
    rsyscall::exit(0);
}
