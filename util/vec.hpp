#pragma once
#include "../memory/allocator.hpp"

#include <algorithm>
#include <initializer_list>
#include <iterator>
#include <new>

namespace rstd {
template <class T> class vec {
  private:
    T* data_ = nullptr;
    size_t size_ = 0;
    size_t capacity_ = 0;

    void realloc(size_t new_size) {
        if (data_ == nullptr) {
            data_ = ::new (::operator new[](sizeof(T) * new_size)) T[new_size];
            capacity_ = new_size;
            return;
        }

        T* new_data =
            ::new (::operator new[](sizeof(T) * new_size)) T[new_size];

        memory::memmove(new_data, data_, size_);
        capacity_ = new_size;
        ::operator delete[](data_);
        data_ = new_data;
    }

  public:
    vec() { reserve(1); }

    explicit vec(size_t size, T element = 0) {
        reserve(size);
        for (auto i = 0; i < size; ++i) {
            push_back(element);
        }
    }

    vec(std::initializer_list<T> list) {
        auto first = list.begin();
        auto last = list.end();

        reserve(std::distance(first, last));

        while (first != last) {
            push_back(*first);
            ++first;
        }
    }

    vec(const vec& rhs) {
        reserve(rhs.size());

        for (auto i = 0; i < rhs.size(); ++i) {
            push_back(rhs[i]);
        }
    }

    vec(vec&& rhs)
        : data_(rhs.data()), size_(rhs.size()), capacity_(rhs.capacity()) {
        rhs.data_ = nullptr;
    }

    vec& operator=(vec rhs) {
        swap(rhs);

        return *this;
    }

    ~vec() { ::operator delete[](data_); }

    void swap(vec& rhs) {
        std::swap(data_, rhs.data_);
        std::swap(size_, rhs.size_);
        std::swap(capacity_, rhs.capacity_);
    }

    void reserve(size_t size) {
        if (size == 0) {
            size = 1;
        }
        if (size <= capacity_) {
            return;
        }

        realloc(size);
    }

    void push_back(T value) {
        if (size_ == capacity_) {
            realloc(capacity_ * 2);
        }

        data_[size_++] = value;
    }

    void pop_back() { --size_; }

    T& operator[](size_t index) { return data_[index]; }

    T operator[](size_t index) const { return data_[index]; }

    size_t size() const { return size_; }

    size_t capacity() const { return capacity_; }

    T* data() const { return data_; }

    void clear() { size_ = 0; }

    class Iterator {
      public:
        Iterator() {}

        explicit Iterator(T* current) : current_(current) {}

        Iterator& operator+=(ssize_t difference) {
            current_ += difference;
            return *this;
        }

        Iterator operator+(ssize_t difference) const {
            Iterator result(*this);
            result += difference;
            return result;
        }

        Iterator& operator-=(ssize_t difference) {
            current_ -= difference;
            return *this;
        }

        Iterator operator-(ssize_t difference) const {
            Iterator result(*this);
            result -= difference;
            return result;
        }

        Iterator& operator++() {
            *this += 1;
            return *this;
        }

        Iterator operator++(int) {
            Iterator result(*this);
            ++(*this);
            return result;
        }

        Iterator& operator--() {
            *this -= 1;
            return *this;
        }

        Iterator operator--(int) {
            Iterator result(*this);
            --(*this);
            return result;
        }

        bool operator==(const Iterator& rhs) const {
            return current_ == rhs.current_;
        }

        bool operator!=(const Iterator& rhs) const {
            return current_ != rhs.current_;
        }

        T& operator*() { return *current_; }

        T* operator->() { return current_; }

        size_t operator-(const Iterator& other) const {
            return current_ - other.current_;
        }

      private:
        T* current_;
    };

    Iterator begin() { // NOLINT
        return Iterator(data_);
    }

    Iterator end() { // NOLINT
        return Iterator(data_ + size_);
    }

    Iterator Begin() { return begin(); }

    Iterator End() { return end(); }
};
} // namespace rstd
