// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// R0にR0を加算する作業をR1回繰り返し、R2に格納する
    @count
    M=0         // count初期化
    @R2
    M=0         // R2初期化
    @result
    M=0         // result初期化
(LOOP)
    @count
    D=M         // D = count
    @R1
    D=D-M       // D = count - R1
    @END
    D;JGE       // もし (count-R1)>=0 ならENDへ移動
    @count
    D=M         // D = count
    M=D+1       // count++

    @result
    D=M         // Dに現在の計算結果を格納
    @R0
    D=D+M       // Dに、R0に格納されている値を加算して格納
    @result
    M=D         // resultに計算結果格納
    @R2
    M=D         // R2にも計算結果格納
    @LOOP
    0;JMP
(END)
    @END
    0;JMP