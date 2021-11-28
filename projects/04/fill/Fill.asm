// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

    @8192       // 0x2000（ピクセル数）
    D=A
    @maxcount
    M=D         // maxcountにピクセル数代入

    @16384      // 0x4000（スクリーンの最初のビット）
    D=A
    @pixel
    M=D         // pixelを0x4000で初期化

(LOOP)
    @count
    M=0         // countを初期化
    @24576      // 0x6000（キーボードのメモリマップ）
    D=M         // キーボード入力に対応するコード（ASCIIとその他）がDに格納される
    @LOOPBLACK
    D;JNE       // Dの値が0でなかったとき（すなわちキーボード入力があったとき）LOOPBLACKにジャンプ
    
(LOOPWHITE)
    // Dの値が0なので、0x4000〜0x6000に対応するビットを0にする
    @count
    D=M         // D = count
    @maxcount
    D=D-M       // D = count - maxcount
    @LOOP
    D;JGE       // もし (count-maxcount)>=0 ならLOOPへ移動

    @count
    D=M         // Dにcountの値を格納

    @pixel
    D=D+M       // Dに対象ピクセル（0x4000+count）のアドレス格納
    A=D
    M=0         // 0x0000000000000000

    @count
    D=M         // D = count
    M=D+1       // count++

    @LOOPWHITE
    0;JMP

(LOOPBLACK)
    // 0x4000〜0x6000に対応するビットを1にする
    @count
    D=M         // D = count
    @maxcount
    D=D-M       // D = count - maxcount
    @LOOP
    D;JGE       // もし (count-maxcount)>=0 ならLOOPへ移動

    @count
    D=M         // Dにcountの値を格納

    @pixel
    D=D+M       // Dに対象ピクセル（0x4000+count）のアドレス格納
    A=D
    M=-1        // 0x1111111111111111

    @count
    D=M         // D = count
    M=D+1       // count++

    @LOOPBLACK
    0;JMP
