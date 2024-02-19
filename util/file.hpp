#pragma once

#include "result.hpp"
#include "string.hpp"
#include "../syscall/syscall.hpp"
#include "../memory/pointers.hpp"

namespace rstd {
    enum class open_flag {
        read = 0,
        write = 1,
        append = 2
    };

    struct file_error {};
    struct descriptor_error: file_error {};
    struct read_error: file_error{};

    inline Result<int, file_error> read_file(const char* file_name, string& out) {
        auto descriptor = rsyscall::open_file(file_name, (int) open_flag::read);
        if (descriptor < 0) {
            return Err<file_error>(descriptor_error{});
        }
        char buffer[129];
        while (auto bytes = rsyscall::read_from_descriptor(descriptor, buffer, 128)) {
            if (bytes < 0) {
                return Err<file_error>(read_error{});
            }
            for (size_t i = 0; i < bytes; ++i) {
                out.push_back(buffer[i]);
            }
            if (bytes < 128) {
                break;
            }
        }
        return Ok(0);
    }
}
