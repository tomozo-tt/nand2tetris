#include "Parser.h"
#include <fstream>
#include <iostream>

namespace nand2tetris {

Parser::Parser(const char* file_path[]) {
    std::ifstream ifs(*file_path);
    

    if (!ifs) {
        std::cout << "file open error" << std::endl;
    }

    std::string line;
    while (getline(ifs, line)) {
        

    }

}

Parser::~Parser() {
}


}
