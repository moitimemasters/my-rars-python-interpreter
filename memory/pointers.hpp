#pragma once

#include <memory>
#include <type_traits>

#include "allocator.hpp"

namespace memory {

template <class T> class unique_ptr {
  public:
    unique_ptr() : ptr_(nullptr) {}

    explicit unique_ptr(T* target) : ptr_(target) {}

    unique_ptr(const unique_ptr& copy) = delete;

    unique_ptr(unique_ptr&& move) {
        ptr_ = move.ptr_;
        move.ptr_ = nullptr;
    }

    ~unique_ptr() { ::operator delete(ptr_); }

    unique_ptr& operator=(const unique_ptr&) = delete;

    unique_ptr& operator=(unique_ptr&& move) {
        ::operator delete(ptr_);
        ptr_ = move.ptr_;
        move.ptr_ = nullptr;
        return *this;
    }

    T* operator->() { return ptr_; }

    void Reset(T* object = nullptr) {
        T* temp = ptr_;
        ptr_ = object;
        ::operator delete(temp);
    }

  private:
    T* ptr_;
};

template <class T, class... Args> unique_ptr<T> make_unique(Args&&... args) {
    return unique_ptr<T>(::new (::operator new(sizeof(T)))
                             T(std::forward<Args>(args)...));
};

template <class T> class __counter {
  public:
    explicit __counter(T* ptr) : ptr_(ptr), strong_count_(1), weak_count_(0) {}

    T* ptr_;
    int64_t strong_count_;
    int64_t weak_count_;
};

template <class T> class weak_ptr;

template <class T> class shared_ptr {
    friend class weak_ptr<T>;

  public:
    shared_ptr() : counter_(nullptr) {}

    explicit shared_ptr(T* ptr)
        : counter_(::new (::operator new(sizeof(__counter<T>)))
                       __counter<T>(ptr)) {}

    shared_ptr(const shared_ptr& other) : counter_(other.counter_) {
        IncrementCounter();
    }

    shared_ptr(shared_ptr&& other) noexcept : counter_(other.counter_) {
        other.counter_ = nullptr;
    }

    explicit shared_ptr(const weak_ptr<T>& other) : counter_(other.counter_) {
        IncrementCounter();
    }

    ~shared_ptr() { DecrementCounter(); }

    shared_ptr& operator=(const shared_ptr& other) {
        if (this != &other) {
            DecrementCounter();
            counter_ = other.counter_;
            IncrementCounter();
        }

        return *this;
    }

    shared_ptr& operator=(shared_ptr&& other) noexcept {
        if (this != &other) {
            DecrementCounter();
            counter_ = other.counter_;
            other.counter_ = nullptr;
        }

        return *this;
    }

    void Reset() {
        DecrementCounter();
        counter_ = nullptr;
    }

    void Reset(T* ptr) {
        DecrementCounter();
        counter_ =
            ::new (::operator new(sizeof(__counter<T>))) __counter<T>(ptr);
    }

    T* Get() const { return counter_ ? counter_->ptr_ : nullptr; }

    explicit operator bool() const { return counter_ != nullptr; }

    T* operator->() const { return counter_->ptr_; }

    T& operator*() const { return *(counter_->ptr_); }

  private:
    __counter<T>* counter_;

    void IncrementCounter() {
        if (counter_) {
            ++counter_->strong_count_;
        }
    }

    void DecrementCounter() {
        if (counter_) {
            --counter_->strong_count_;

            if (counter_->strong_count_ == 0) {
                if (counter_->weak_count_ == 0) {
                    ::operator delete(counter_->ptr_);
                    ::operator delete(counter_);
                } else {
                    ::operator delete(counter_->ptr_);
                    counter_->ptr_ = nullptr;
                }
            }
        }
    }
};

template <class T> class weak_ptr {
    friend class shared_ptr<T>;

  public:
    weak_ptr() : counter_(nullptr) {}

    explicit weak_ptr(const shared_ptr<T>& shared_ptr)
        : counter_(shared_ptr.counter_) {
        IncrementCounter();
    }

    weak_ptr(const weak_ptr& other) : counter_(other.counter_) {
        IncrementCounter();
    }

    weak_ptr(weak_ptr&& other) noexcept : counter_(other.counter_) {
        other.counter_ = nullptr;
    }

    ~weak_ptr() { DecrementCounter(); }

    weak_ptr& operator=(const weak_ptr& other) {
        if (this != &other) {
            DecrementCounter();
            counter_ = other.counter_;
            IncrementCounter();
        }

        return *this;
    }

    weak_ptr& operator=(weak_ptr&& other) noexcept {
        if (this != &other) {
            DecrementCounter();
            counter_ = other.counter_;
            other.counter_ = nullptr;
        }

        return *this;
    }

    void Reset() {
        DecrementCounter();
        counter_ = nullptr;
    }

    shared_ptr<T> Lock() const { return shared_ptr<T>(*this); }

    bool IsExpired() const { return !counter_ || counter_->strong_count_ == 0; }

    explicit operator bool() const { return counter_ != nullptr; }

  private:
    __counter<T>* counter_;

    void IncrementCounter() {
        if (counter_) {
            ++counter_->weak_count_;
        }
    }

    void DecrementCounter() {
        if (counter_) {
            --counter_->weak_count_;

            if (counter_->strong_count_ == 0 && counter_->weak_count_ == 0) {
                ::operator delete(counter_);
            }
        }
    }
};

template <class T, class... Args>
inline shared_ptr<T> make_shared(Args&&... args) {
    return shared_ptr<T>(::new (::operator new(sizeof(T)))
                             T(std::forward<Args>(args)...));
};

template <class T, class... Args> inline weak_ptr<T> make_weak(Args&&... args) {
    return weak_ptr<T>(::new (::operator new(sizeof(T)))
                           T(std::forward<Args>(args)...));
};

} // namespace memory
