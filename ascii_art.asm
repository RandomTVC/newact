section .data
    border_char db '='
    newline db 0xA

    art db "          ,.~~~.", 0xA
        db "    / ~ ,cCCCCCCCCCCA.,~..", 0xA
        db "   (_  acccccccccccccv'", 0xA
        db "  / \acccccccccccccc(       @|", 0xA
        db " (   ,CCCCCCCCCCCC*^``      ,CCO,ABB", 0xA
        db "  \  |ccccccccccv        `.dCCCCdBBB)                      .~.", 0xA
        db "   `(CCCCCCCCCCCi         )CCC*dBBB*                      CCC.,.", 0xA
        db "     vCCCCCCCCCCk.  @    dC*dBBBB*)                      `CCCYP", 0xA
        db "      `CCCCCCCCCCkn.   .d*dBBBB*)                     (CCn'CCCCC.", 0xA
        db "        `CCCCCCCCCCCCcyDBBY*_)                          `*(CCCCCCCCc.", 0xA
        db "          ", 34, "YC\ Am. dCCC*B*___)M.                         ,CCCCCCCCCC*", 39, 0xA
        db "             ~**~dCCId*_)MMM\_                            ,CCCCCCCC*", 0xA
        db "               `~. (C@C,CVUMMMMMMMM.~.                   ,CCCCCCCCY", 0xA
        db "                   ``~*cCA\ UMMMMMMm*C/'(~. .          .,cCCCCCCCCY", 0xA
        db "                       `*Cc`*MMMM*cCO`.\  7.~'    `.,~ndCCCCCCCCY", 0xA
        db "(Cb.                       `CCboQBB*`~~| /.         YCCCCCCCCCCCCC'", 0xA
        db " UCb.                       VBBB*`   \     ` .      YCCCCCCCCCC'", 0xA
        db ",~*CCb_                      `*      ,*      ` .   ?CCCCCCCC'", 0xA
        db "(CCCCKC.C~CCCb             _ - |                 `.  VCCCCCP", 0xA
        db " **YCUCCA*CC~C)              ,~.  _ -    `~.~'    ~* ~**CC'", 0xA
        db "   Yb**CCCCCPcc.  _  . . >       `.                   ` .", 0xA
        db "   *CCCCCCCCCCCCCCCCCcb          \                        ` .", 0xA
        db "    >CCCCCCCCCCCCCCCCCC.         |                            .~*dDDDDDDDbn.", 0xA
        db "     `vCCCCCCCCCCCCCCCC          |                          .~dDDDDDDDDDDDDDb.", 0xA
        db "      `CCCCCCCCCCCCCCCC)         /                       .dDDDDDDDDDDDDDDDDDDb.", 0xA
        db "        `*CCCCCCCCCCCCCI        .                      .DDDDDDDDDDDDDDDDDDDDDDD.", 0xA
        db "           `**CCC_CCCC*'.     .                       dDDDDDDDDDDDDDDDDDDDDDDDDD", 0xA
        db "                   `*`/\                            dDDDDDDDDDDDDDDDDDDDDDDDDDD.", 0xA
        db "                       |                           dDDDDDDDDDDDDDDDDDDDDDDDDDDD)", 0xA
        db "                     /---\                        dDDDDDDDDDDDDDDD,DDDDDDDDDDDD|", 0xA
        db "                     AVDD.                       .DDDDDDDDDDDDDDDD ADDDDDDDDDDD", 0xA
        db "                     Co 'DDb                    ,~aDDDDDDDDDDDDDDDD ADDDDDDDDDDV", 0xA
        db "                     V!!o'Db              ..~aaDDDDDDDDDDDDDDDDDD* .D.'VDDDDDDD'", 0xA
        db "                     `!!!!o`*D: DDDDDDDDDDDDDDDDDDDDDDDDD*   CDDDb.`VDDDDV", 0xA
        db "                     `!!!!!!!oo`DDDDDDDDDDDDDDDDDDDDD*   AVA*ODDbnn....n'", 0xA
        db "                      `!!!!!!!!!!o*ODDDDDDDDDDDDDDDP*   (MAVAVAn**DDDDDV", 0xA
        db "                        `+!!!*nADD)DDDn.*******.dDV     V*VAVAVAVAVAV,", 0xA
        db "                         nADDDDP*/DDDDDDDDDDDDDDD'      *VAVAVAVAVAV.", 0xA
        db "                         DD*.ndDV ADDDDDDDDDDDDDP       VAVAVAVAVV", 0xA
        db "                         VDDDDDV ADDDDDDDDDDDDD'        VAVAVAVAV/", 0xA
        db "                          VDDDD *DDDDDDDDDDDDDD/         \VAVAVAVV", 0xA
        db "                          `DDDDDDDDDDDDDDDDDDDD          VAVAVAV'", 0xA
        db "                           `DDDDDDDDDDDDDDDDDP            `*AV*", 0xA
        db "                             *DDDDDDDDDDDDDD*", 0xA
        db "                               *DDDDDDDDDD*", 0xA
        db "                                  `**''", 0xA, 0

section .text
    global _start

_start:
    call print_border
    call print_newline

    mov ecx, art
    call print_string

    call print_border
    call print_newline

    mov eax, 1
    xor ebx, ebx
    int 0x80

print_border:
    pusha
    mov edi, 76

.border_loop:
    mov eax, 4
    mov ebx, 1
    mov ecx, border_char
    mov edx, 1
    int 0x80
    
    dec edi
    jnz .border_loop

    popa
    ret

print_string:
    pusha
    mov edx, 0
    mov esi, ecx

.calc_length:
    cmp byte [esi + edx], 0
    je .print_now
    inc edx
    jmp .calc_length

.print_now:
    mov eax, 4
    mov ebx, 1
    int 0x80

    popa
    ret

print_newline:
    pusha
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    popa
    ret