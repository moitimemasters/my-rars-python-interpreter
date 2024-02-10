#pragma once

namespace helpers {
void
leave_comment(const char* comment)
{
    __asm__ volatile("leave_comment");
}
}
