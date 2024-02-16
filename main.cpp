#include "memory/allocator.hpp"
#include "memory/pointers.hpp"
#include "syscall/syscall.hpp"
#include "util/vec.hpp"

void* operator new(std::size_t size) {
    if (void* p = memory::alloc(size))
        return p;
    throw std::bad_alloc{};
}

void operator delete(void* p) {
    memory::free(reinterpret_cast<memory::word_t*>(p));
}

void* operator new[](std::size_t size) {
    if (void* p = memory::alloc(size))
        return p;
    throw std::bad_alloc{};
}

void operator delete[](void* p) {
    memory::free(reinterpret_cast<memory::word_t*>(p));
}

int main() {
    rstd::vec<int> a(100);
    for (size_t i = 0; i < 100; ++i) {
        rsyscall::print_int(a[i]);
        rsyscall::print_string("\n");
    }
    rsyscall::exit(0);
}
