#ifndef NAND2TETRIS_PROJECTS_06_PARSER_H_
#define NAND2TETRIS_PROJECTS_06_PARSER_H_

#include <string>

namespace nand2tetris {

class Parser {
private:
    /* data */
public:
    typedef enum {
        A_COMMAND = 0,
        C_COMMAND = 1,
        L_COMMAND = 2
    } command_t;

    Parser(const char* file_path[]);
    ~Parser();
    bool hasMoreCommands();
    void advance();
    command_t commandType();
    std::string symbol();
    std::string dest();
    std::string comp();
    std::string jump();
};

}

#endif