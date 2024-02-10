#pragma once

#include <cstddef>
#include <cstdint>
#include <memory>
#include <utility>

#include "syscall.hpp"

namespace memory {

using word_t = intptr_t;

struct Block
{
    std::size_t size;
    bool used;
    Block* next = nullptr;
    word_t data[1];
};

static Block* heapStart = nullptr;
static auto top = heapStart;

inline size_t
align(size_t n)
{
    return (n + sizeof(word_t) - 1) & ~(sizeof(word_t) - 1);
}

inline size_t
allocSize(size_t size)
{
    return size + sizeof(Block) - sizeof(std::declval<Block>().data);
}

inline Block*
requestFromOS(size_t size)
{
    auto block = (Block*)rsyscall::my_sbrk(0);

    if (rsyscall::my_sbrk(allocSize(size)) == (void*)-1) {
        return nullptr;
    }

    return block;
}

inline Block*
firstFit(size_t size)
{
    auto block = heapStart;

    while (block != nullptr) {
        if (block->used || block->size < size) {
            block = block->next;
            continue;
        }
        return block;
    }

    return nullptr;
}

inline Block*
findBlock(size_t size)
{
    return firstFit(size);
}

inline word_t*
alloc(size_t size)
{
    size = align(size);

    if (auto block = findBlock(size)) {
        return block->data;
    }

    auto block = requestFromOS(size);

    block->size = size;
    block->used = true;

    if (heapStart == nullptr) {
        heapStart = block;
    }

    if (top != nullptr) {
        top->next = block;
    }
    top = block;
    return block->data;
}

inline Block*
getHeader(word_t* data)
{
    return (Block*)((char*)data + sizeof(std::declval<Block>().data) -
                    sizeof(Block));
}

inline void
free(word_t* data)
{
    auto block = getHeader(data);
    block->used = false;
}

} // namespace memory