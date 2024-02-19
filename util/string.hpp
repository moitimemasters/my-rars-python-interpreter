#pragma once

#include "result.hpp"
#include "../memory/allocator.hpp"
#include <functional>
#include <tuple>
#include <type_traits>

struct string_out_of_range {};

namespace rstd {

inline size_t strlen(const char* str) {
    auto length = 0;

    while (*str != '\0') {
        ++length;
        ++str;
    }

    return length;
}

inline int strcmp(const char* first, const char* second) {
    while (*first != '\0' && *first == *second) {
        ++first;
        ++second;
    }

    return static_cast<int>(*first) - static_cast<int>(*second);
}

inline int strncmp(const char* first, const char* second, size_t count) {
    for (auto i = 0; i < count; ++i) {

        if (*first != *second) {
            return static_cast<int>(*first) - static_cast<int>(*second);
        }

        if (*first == '\0' || *second == '\0') {
            return 0;
        }

        ++first;
        ++second;
    }

    return 0;
}

inline char* strcpy(char* dest, const char* src) {
    auto begin = dest;

    while (*src != '\0') {
        *dest = *src;
        ++dest;
        ++src;
    }

    *dest = '\0';

    return begin;
}

inline char* strncpy(char* dest, const char* src, size_t count) {
    auto begin = dest;

    for (auto i = 0; i < count; ++i) {
        if (*src != '\0') {
            *dest = *src;
            ++src;
        } else {
            *dest = '\0';
        }
        ++dest;
    }

    return begin;
}

inline char* strcat(char* dest, const char* src) {
    auto begin = dest;

    while (*dest != '\0') {
        ++dest;
    }

    while (*src != '\0') {
        *dest = *src;
        ++dest;
        ++src;
    }

    *dest = '\0';

    return begin;
}

inline char* strncat(char* dest, const char* src, size_t count) {
    auto begin = dest;

    while (*dest != '\0') {
        ++dest;
    }

    for (size_t i = 0; i < count; ++i) {
        if (*src != '\0') {
            *dest = *src;
            ++dest;
            ++src;
        } else {
            break;
        }
    }

    *dest = '\0';

    return begin;
}

inline const char* strchr(const char* str, char symbol) {
    while (*str != '\0') {
        if (*str == symbol) {
            return str;
        }
        ++str;
    }

    if (symbol == '\0') {
        return str;
    }

    return nullptr;
}

inline const char* strrchr(const char* str, char symbol) {
    const char* last = nullptr;

    while (*str != '\0') {
        if (*str == symbol) {
            last = str;
        }
        ++str;
    }

    if (symbol == '\0') {
        return str;
    }

    return last;
}

inline size_t strspn(const char* dest, const char* src) {
    auto count = 0;

    while (*dest != '\0' && strchr(src, *dest) != nullptr) {
        ++count;
        ++dest;
    }

    return count;
}

inline size_t strcspn(const char* dest, const char* src) {
    auto count = 0;

    while (*dest != '\0' && strchr(src, *dest) == nullptr) {
        ++count;
        ++dest;
    }

    return count;
}

inline const char* strpbrk(const char* dest, const char* breakset) {
    while (*dest != '\0') {
        if (strchr(breakset, *dest)) {
            return dest;
        }
        ++dest;
    }

    return nullptr;
}

inline const char* strstr(const char* str, const char* pattern) {
    if (*pattern == '\0') {
        return str;
    }

    while (*str != '\0') {
        const char* const_pattern = pattern;
        const char* const_str = str;

        while (*const_pattern != '\0' && *const_str == *const_pattern) {
            ++const_str;
            ++const_pattern;
        }

        if (*const_pattern == '\0') {
            return str;
        }

        ++str;
    }

    return nullptr;
}

class string {
    size_t size_;
    size_t capacity_;
    char* data_;

  public:
    inline string() : size_(0), capacity_(0), data_(nullptr) {}

    inline string(size_t size, char symbol) : size_(size), capacity_(size) {
        if (size_ == 0) {
            data_ = nullptr;
            return;
        }

        data_ = ::new (::operator new[](sizeof(char) * size_)) char[size_];
        for (auto i = 0; i < size_; ++i) {
            data_[i] = symbol;
        }
    }

    inline string(const char* src)
        : size_(strlen(src)), capacity_(strlen(src)), data_(nullptr) {
        if (size_ == 0) {
            return;
        }

        data_ = ::new (::operator new[](sizeof(char) * size_)) char[size_];
        for (auto i = 0; i < size_; ++i) {
            data_[i] = src[i];
        }
    }

    inline string(const char* src, size_t size)
        : size_(size), capacity_(size), data_(nullptr) {
        if (size_ == 0) {
            return;
        }

        data_ = ::new (::operator new[](sizeof(char) * size_)) char[size_];
        for (auto i = 0; i < size_; ++i) {
            data_[i] = src[i];
        }
    }

    inline ~string() { clear(); }

    inline string(string& other)
        : size_(other.size()), capacity_(other.capacity()) {
        if (this == &other) {
            return;
        }

        if (capacity_ == 0) {
            data_ = nullptr;
            return;
        }

        data_ =
            ::new (::operator new[](sizeof(char) * capacity_)) char[capacity_];
        for (auto i = 0; i < size_; ++i) {
            data_[i] = other[i].ok_value().get();
        }
    }

    inline string& operator=(string& other) {
        if (this == &other) {
            return *this;
        }

        size_ = other.size();
        capacity_ = other.capacity();
        ::delete[] data_;
        data_ = size_ > 0 ? ::new (::operator new[](sizeof(char) *
                                                    capacity_)) char[capacity_]
                          : nullptr;
        for (auto i = 0; i < size_; ++i) {
            data_[i] = other[i].ok_value().get();
        }
        return *this;
    }

    inline Result<std::reference_wrapper<char>, string_out_of_range>
    operator[](size_t idx) {
        if (idx >= size_) {
            return Err(string_out_of_range{});
        }

        return Ok(std::ref(*(data_ + idx)));
    }

    inline Result<std::reference_wrapper<char>, string_out_of_range>
    at(size_t idx) {
        return (*this)[idx];
    }

    inline Result<std::reference_wrapper<char>, string_out_of_range> front() {
        if (empty()) {
            return Err(string_out_of_range{});
        }

        return Ok(std::ref(*data_));
    }

    inline Result<std::reference_wrapper<char>, string_out_of_range> back() {
        if (empty()) {
            Err<string_out_of_range>(string_out_of_range{});
        }

        return Ok(std::ref(*(data_ + size_ - 1)));
    }

    inline const char* data() const { return data_; }

    inline char* data() { return data_; }

    inline const char* c_str() const { return data_; }

    inline char* c_str() { return data_; }

    inline bool empty() const { return size_ == 0; }

    inline size_t size() const { return size_; }

    inline size_t length() const { return size_; }

    inline size_t capacity() const { return capacity_; }

    inline void clear() {
        if (data_) {
            ::delete[] data_;
        }
        data_ = nullptr;
        size_ = 0;
        capacity_ = 0;
    }

    inline void swap(string& other) {
        memory::memswap(this->data_, other.data_);
        std::swap(this->size_, other.size_);
        std::swap(this->capacity_, other.capacity_);
    }

    inline void pop_back() {
        if (size_ == 0) {
            return;
        }

        --size_;
    }

    inline void push_back(char c) {
        if (capacity_ == 0) {
            ::delete[] data_;
            data_ = ::new (::operator new[](sizeof(char))) char[1];
            data_[0] = c;
            capacity_ = 1;
            size_ = 1;
            return;
        }

        if (size_ == capacity_) {
            reserve(capacity_ * 2);
        }

        ++size_;
        *(data_ + size_ - 1) = c;
    }

    inline void resize(size_t new_size, char symbol) {
        if (new_size > size_) {
            capacity_ = new_size * 2;

            if (data_ == nullptr) {
                data_ = ::new (
                    ::operator new[](sizeof(char) * capacity_)) char[capacity_];
            } else {
                reserve(capacity_);
            }

            for (auto i = size_; i < new_size; i++) {
                data_[i] = symbol;
            }

            size_ = new_size;
        } else {
            size_ = new_size;
        }
    }

    inline void reserve(size_t new_capacity) {
        if (new_capacity <= capacity_) {
            return;
        }

        auto new_data = ::new (
            ::operator new[](sizeof(char) * new_capacity)) char[new_capacity];
        memory::memmove(new_data, data_, size_);

        if (data_ != nullptr) {
            ::delete[] data_;
            data_ = nullptr;
        }

        data_ = new_data;
        capacity_ = new_capacity;

        if (new_capacity < capacity_) {
            size_ = new_capacity;
        }
    }

    inline void shrink_to_fit() {
        capacity_ = size_;

        auto new_data =
            ::new (::operator new[](sizeof(char) * capacity_)) char[capacity_];
        memory::memmove(new_data, data_, size_);

        if (data_ != nullptr) {
            ::delete[] data_;
            data_ = nullptr;
        }

        data_ = new_data;
    }

    inline int compare(string& other) {
        if (size_ >= other.size()) {
            for (auto i = 0; i < other.size(); ++i) {
                if (at(i).ok_value().get() < other[i].ok_value().get()) {
                    return 1;
                } else if (at(i).ok_value().get() > other[i].ok_value().get()) {
                    return -1;
                }
            }

            return size_ == other.size() ? 0 : -1;
        }

        for (auto i = 0; i < size_; ++i) {
            if (at(i).ok_value().get() < other[i].ok_value().get()) {
                return 1;
            } else if (at(i).ok_value().get() > other[i].ok_value().get()) {
                return -1;
            }
        }

        return 1;
    }

    inline string& operator+=(string& other) {
        for (size_t i = 0; i < other.size(); ++i) {
            this->push_back(other[i].ok_value());
        }
        return *this;
    }

    inline friend rstd::string operator+(string& first, string& second) {
        rstd::string sum(first.size() + second.size(), ' ');

        auto first_size = first.size();
        for (auto i = 0; i < first_size; ++i) {
            sum[i].ok_value().get() = first[i].ok_value().get();
        }
        for (auto i = 0; i < second.size(); ++i) {
            sum[first_size + i].ok_value().get() = second[i].ok_value().get();
        }

        return sum;
    }
};

} // namespace rstd

inline bool operator==(rstd::string& first, rstd::string& second) {
    if (first.size() != second.size()) {
        return false;
    }

    for (auto i = 0; i < first.size(); ++i) {
        if (first[i].ok_value() != second[i].ok_value()) {
            return false;
        }
    }

    return true;
}

inline bool operator!=(rstd::string& first, rstd::string& second) {
    return !(first == second);
}

inline bool operator>(rstd::string& first, rstd::string& second) {
    return first.compare(second) < 0;
}

inline bool operator<(rstd::string& first, rstd::string& second) {
    return first.compare(second) > 0;
}

inline bool operator>=(rstd::string& first, rstd::string& second) {
    return first.compare(second) <= 0;
}

inline bool operator<=(rstd::string& first, rstd::string& second) {
    return first.compare(second) >= 0;
}

inline void SafeCpy(char* dest, const char* src, size_t len) {
    for (auto i = 0; i < len; ++i) {
        *(dest + i) = *(src + i);
    }
}
