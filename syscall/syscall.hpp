#pragma once

#include <cstdint>
namespace rsyscall {

inline void* my_sbrk(int64_t size) {
    void* result;
    __asm__ volatile("addi a7, zero, 9\n\t"
                     "add a0, zero, %1\n\t"
                     "ecall\n\t"
                     "mv %0, a0"
                     : "=r"(result)
                     : "r"(size)
                     : "a7", "a0");
    return result;
}

inline void exit(int64_t exit_code) {
    __asm__ volatile("addi a7, zero, 93\n\t"
                     "add a0, zero, %0\n\t"
                     "ecall\n\t" ::"r"(exit_code)
                     : "a7", "a0");
}

inline void print_int(int64_t number) {
    __asm__ volatile("li a7, 1\n\t"
                     "mv a0, %0\n\t"
                     "ecall\n\t" ::"r"(number)
                     : "a7", "a0");
}

inline void print_string(const char* str) {
    __asm__ volatile("li a7, 4\n\t"
                     "mv a0, %0\n\t"
                     "ecall\n\t" ::"r"(str)
                     : "a7", "a0");
}

inline int64_t open_file(const char* path, int64_t flag) {
    int64_t open_file_descriptor;
    __asm__ volatile("li a7, 1024\n\t"
                     "mv a0, %1\n\t"
                     "mv a1, %2\n\t"
                     "ecall \n\t"
                     "mv %0, a0 \n\t"
                     : "=r"(open_file_descriptor)
                     : "r"(path), "r"(flag)
                     : "a7", "a0", "a1");
    return open_file_descriptor;
}

inline void close_file(int64_t descriptor) {
    __asm__ volatile("li a7, 57\n\t"
                     "mv a0, %0\n\t"
                     "ecall\n\t" ::"r"(descriptor)
                     : "a7", "a0");
}

inline int64_t read_from_descriptor(int64_t descriptor, char* buffer,
                                    int64_t max_length) {
    int64_t bytes_read;
    __asm__ volatile("li a7, 63\n\t"
                     "mv a0, %1\n\t"
                     "mv a1, %2\n\t"
                     "mv a2, %3\n\t"
                     "ecall\n\t"
                     "mv %0, a0\n\t"
                     : "=r"(bytes_read)
                     : "r"(descriptor), "r"(buffer), "r"(max_length)
                     : "a7", "a0", "a1", "a2");
    return bytes_read;
}

inline int64_t write_to_descriptor(int descriptor, char* buffer,
                                   int64_t bytes) {
    int64_t bytes_written;
    __asm__ volatile("li a7, 64\n\t"
                     "mv a0, %1\n\t"
                     "mv a1, %2\n\t"
                     "mv a2, %3\n\t"
                     "ecall\n\t"
                     "mv %0, a0\n\t"
                     : "=r"(bytes_written)
                     : "r"(descriptor), "r"(buffer), "r"(bytes)
                     : "a7", "a0", "a1", "a2");
    return bytes_written;
}

} // namespace rsyscall
