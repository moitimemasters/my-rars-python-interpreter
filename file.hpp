#pragma once

class File
{
  public:
    File(const char* path);
    ~File();
    const char* getContents() const;

  private:
    const char* _buffer;
    char* _current;
};
