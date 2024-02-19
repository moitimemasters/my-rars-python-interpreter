#include "memory/allocator.hpp"
#include "memory/pointers.hpp"
#include "syscall/syscall.hpp"
#include "util/file.hpp"
#include "util/string.hpp"
#include "util/vec.hpp"

void* operator new(std::size_t size) { return memory::alloc(size); }

void operator delete(void* p) {
    memory::free(reinterpret_cast<memory::word_t*>(p));
}

void* operator new[](std::size_t size) { return memory::alloc(size); }

void operator delete[](void* p) {
    memory::free(reinterpret_cast<memory::word_t*>(p));
}

int main() {
    rstd::string a{};
    auto result = rstd::read_file(
        "/home/ivanpesnya/my-rars-python-interpreter/build/fixed.asm", a);
    if (result.is_ok()) {
        rsyscall::print_string(a.c_str());
    } else {
        rsyscall::print_string("ERROR OCCURED WHILTE READING FILE");
    }
    rsyscall::exit(0);
}
