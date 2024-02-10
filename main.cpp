#include "allocator.hpp"
#include "syscall.hpp"

int
main()
{
    int64_t descriptor = rsyscall::open_file("/home/ivanpesnya/a.rs", 0);
    if (descriptor < 0) {
        rsyscall::print_string("couldn't load file\n");
        rsyscall::exit(1);
    }
    char* buffer = (char*)memory::alloc(sizeof(char) * 128);
    int64_t bytes_read =
      rsyscall::read_from_descriptor(descriptor, buffer, 128);
    if (bytes_read < 0) {
        rsyscall::print_string("couldn't read from descriptor\n");
    }
    rsyscall::print_string("===FILE CONTENTS===\n");
    rsyscall::print_string(buffer);
    rsyscall::print_string("===END OF FILE===\n");
    rsyscall::close_file(descriptor);
    rsyscall::exit(0);
}
