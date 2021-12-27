#ifndef NAND2TETRIS_PROJECTS_06_CODE_H_
#define NAND2TETRIS_PROJECTS_06_CODE_H_

#include <string>

namespace nand2tetris {

class Code {
private:
    /* data */
public:
    Code();
    ~Code();
    char* dest(std::string mnemonic);
    char* comp(std::string mnemonic);
    char* jump(std::string mnemonic);
};

}

#endif