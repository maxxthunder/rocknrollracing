; bank $80  (file offset $000000)
org $808000

L_808000:
    JML L_80800C                    ; $808000  5C 0C 80 80  mx
    db $00,$00,$00,$00,$00,$00,$00,$00                                 ; $808004
L_80800C:
    CLC                             ; $80800C  18           mx
    XCE                             ; $80800D  FB           mx
    PHK                             ; $80800E  4B           mx
    PLB                             ; $80800F  AB           mx
    REP #$10                        ; $808010  C2 10        mx
    LDA #$00                        ; $808012  A9 00        mX
    LDY #$0000                      ; $808014  A0 00 00     mX
L_808017:
    STA $0000,Y                     ; $808017  99 00 00     mX
    INY                             ; $80801A  C8           mX
    CPY #$0331                      ; $80801B  C0 31 03     mX
    BCC L_808017                    ; $80801E  90 F7        mX
    LDY #$0339                      ; $808020  A0 39 03     mX
L_808023:
    STA $0000,Y                     ; $808023  99 00 00     mX
    INY                             ; $808026  C8           mX
    CPY #$2000                      ; $808027  C0 00 20     mX
    BCC L_808023                    ; $80802A  90 F7        mX
    REP #$30                        ; $80802C  C2 30        mX
    LDA #$0000                      ; $80802E  A9 00 00     MX
    TCD                             ; $808031  5B           MX
    LDA #$01FF                      ; $808032  A9 FF 01     MX
    TCS                             ; $808035  1B           MX
    SEP #$30                        ; $808036  E2 30        MX
    JSL L_92EF72                    ; $808038  22 72 EF 92  mx
    JSL L_92EFF1                    ; $80803C  22 F1 EF 92  mx
    JSR L_808138                    ; $808040  20 38 81     mx
    JSL L_92F04D                    ; $808043  22 4D F0 92  mx
    JSR L_80F8DB                    ; $808047  20 DB F8     mx
    JSR L_808114                    ; $80804A  20 14 81     mx
    LDA #$01                        ; $80804D  A9 01        mx
    STA $0F0E                       ; $80804F  8D 0E 0F     mx
L_808052:
    LDX #$00                        ; $808052  A2 00        mx
    JSL L_81AC40                    ; $808054  22 40 AC 81  mx
    LDA $0F0E                       ; $808058  AD 0E 0F     mx
    BEQ L_80806E                    ; $80805B  F0 11        mx
    LDA $127E                       ; $80805D  AD 7E 12     mx
    JSR L_80DC5E                    ; $808060  20 5E DC     mx
    JSR L_808138                    ; $808063  20 38 81     mx
    JSR L_8080D9                    ; $808066  20 D9 80     mx
    JSR L_808138                    ; $808069  20 38 81     mx
    BRA L_808052                    ; $80806C  80 E4        mx
L_80806E:
    LDA $127E                       ; $80806E  AD 7E 12     mx
    JSR L_80DC5E                    ; $808071  20 5E DC     mx
    LDX #$01                        ; $808074  A2 01        mx
    JSL L_81AC40                    ; $808076  22 40 AC 81  mx
L_80807A:
    LDX #$02                        ; $80807A  A2 02        mx
    JSL L_81AC40                    ; $80807C  22 40 AC 81  mx
    JSR L_808138                    ; $808080  20 38 81     mx
    JSR L_808088                    ; $808083  20 88 80     mx
    BRA L_80807A                    ; $808086  80 F2        mx
L_808088:
    STZ $4200                       ; $808088  9C 00 42     mx
    SEI                             ; $80808B  78           mx
    JSR L_808114                    ; $80808C  20 14 81     mx
    LDA $031C                       ; $80808F  AD 1C 03     mx
    BEQ L_8080A2                    ; $808092  F0 0E        mx
    LDA $031E                       ; $808094  AD 1E 03     mx
    INC                             ; $808097  1A           mx
    AND #$1F                        ; $808098  29 1F        mx
    BNE L_80809D                    ; $80809A  D0 01        mx
    INC                             ; $80809C  1A           mx
L_80809D:
    STA $031E                       ; $80809D  8D 1E 03     mx
    BRA L_8080B0                    ; $8080A0  80 0E        mx
L_8080A2:
    LDX $0299                       ; $8080A2  AE 99 02     mx  planet
    LDA $82A4,X                     ; $8080A5  BD A4 82     mx
    CLC                             ; $8080A8  18           mx
    ADC $029B                       ; $8080A9  6D 9B 02     mx
    TAX                             ; $8080AC  AA           mx
    LDA $82AA,X                     ; $8080AD  BD AA 82     mx
L_8080B0:
    STA $13BF                       ; $8080B0  8D BF 13     mx
    JSL L_81B6D2                    ; $8080B3  22 D2 B6 81  mx
    JSR L_80B969                    ; $8080B7  20 69 B9     mx
    JSL L_81F8A7                    ; $8080BA  22 A7 F8 81  mx
    JSR L_80F91D                    ; $8080BE  20 1D F9     mx
    JSR L_80F986                    ; $8080C1  20 86 F9     mx
    LDX $0299                       ; $8080C4  AE 99 02     mx  planet
    LDA $029B                       ; $8080C7  AD 9B 02     mx
    INC                             ; $8080CA  1A           mx
    CMP $829E,X                     ; $8080CB  DD 9E 82     mx
    BEQ L_8080D4                    ; $8080CE  F0 04        mx
    STA $029B                       ; $8080D0  8D 9B 02     mx
    RTS                             ; $8080D3  60           mx
L_8080D4:
    JSL end_of_season               ; $8080D4  22 69 C8 81  mx
    RTS                             ; $8080D8  60           mx
L_8080D9:
    STZ $4200                       ; $8080D9  9C 00 42     mx
    SEI                             ; $8080DC  78           mx
    JSR L_808114                    ; $8080DD  20 14 81     mx
    STZ $0BFF                       ; $8080E0  9C FF 0B     mx
    LDA $0F0E                       ; $8080E3  AD 0E 0F     mx
    EOR #$02                        ; $8080E6  49 02        mx
    STA $0F0E                       ; $8080E8  8D 0E 0F     mx
    LDA $031F                       ; $8080EB  AD 1F 03     mx
    INC                             ; $8080EE  1A           mx
    AND #$03                        ; $8080EF  29 03        mx
    STA $031F                       ; $8080F1  8D 1F 03     mx
    STA $0299                       ; $8080F4  8D 99 02     mx  planet
    LDA $031E                       ; $8080F7  AD 1E 03     mx
    INC                             ; $8080FA  1A           mx
    AND #$1F                        ; $8080FB  29 1F        mx
    BNE L_808100                    ; $8080FD  D0 01        mx
    INC                             ; $8080FF  1A           mx
L_808100:
    STA $031E                       ; $808100  8D 1E 03     mx
    STA $13BF                       ; $808103  8D BF 13     mx
    JSL L_81B6D2                    ; $808106  22 D2 B6 81  mx
    JSR L_80B969                    ; $80810A  20 69 B9     mx
    JSR L_80F91D                    ; $80810D  20 1D F9     mx
    JSR L_80F986                    ; $808110  20 86 F9     mx
    RTS                             ; $808113  60           mx
L_808114:
    LDA #$80                        ; $808114  A9 80        mx
    JSR L_80F97B                    ; $808116  20 7B F9     mx
    LDY $1AEC                       ; $808119  AC EC 1A     mx
    INY                             ; $80811C  C8           mx
    CPY #$05                        ; $80811D  C0 05        mx
    BNE L_808123                    ; $80811F  D0 02        mx
    LDY #$00                        ; $808121  A0 00        mx
L_808123:
    STY $1AEC                       ; $808123  8C EC 1A     mx
    LDX $82F2,Y                     ; $808126  BE F2 82     mx
    JSR L_80F904                    ; $808129  20 04 F9     mx
    JSR L_80F986                    ; $80812C  20 86 F9     mx
    RTS                             ; $80812F  60           mx
L_808130:
    PHB                             ; $808130  8B           mx
    PHK                             ; $808131  4B           mx
    PLB                             ; $808132  AB           mx
    JSR L_808138                    ; $808133  20 38 81     mx
    PLB                             ; $808136  AB           mx
    RTL                             ; $808137  6B           mx
L_808138:
    SEI                             ; $808138  78           mx
    LDA #$09                        ; $808139  A9 09        mx
    STA $2105                       ; $80813B  8D 05 21     mx
    LDA #$61                        ; $80813E  A9 61        mx
    STA $2101                       ; $808140  8D 01 21     mx
    LDA #$01                        ; $808143  A9 01        mx
    STA $2107                       ; $808145  8D 07 21     mx
    LDA #$11                        ; $808148  A9 11        mx
    STA $2108                       ; $80814A  8D 08 21     mx
    LDA #$3D                        ; $80814D  A9 3D        mx
    STA $2109                       ; $80814F  8D 09 21     mx
    LDA #$44                        ; $808152  A9 44        mx
    STA $210B                       ; $808154  8D 0B 21     mx
    LDA #$03                        ; $808157  A9 03        mx
    STA $210C                       ; $808159  8D 0C 21     mx
    LDA #$17                        ; $80815C  A9 17        mx
    STA $212C                       ; $80815E  8D 2C 21     mx
    STZ $212D                       ; $808161  9C 2D 21     mx
    CLI                             ; $808164  58           mx
    RTS                             ; $808165  60           mx
L_808166:
    JML L_80816A                    ; $808166  5C 6A 81 80  mx
L_80816A:
    PHB                             ; $80816A  8B           mx
    PHK                             ; $80816B  4B           mx
    PLB                             ; $80816C  AB           mx
    REP #$30                        ; $80816D  C2 30        mx
    STA $2A                         ; $80816F  85 2A        MX
    STX $2C                         ; $808171  86 2C        MX
    STY $2E                         ; $808173  84 2E        MX
    SEP #$30                        ; $808175  E2 30        MX
    LDA $4210                       ; $808177  AD 10 42     mx
    AND #$80                        ; $80817A  29 80        mx
    BEQ L_80818A                    ; $80817C  F0 0C        mx
    LDX $0355                       ; $80817E  AE 55 03     mx  screen_id
    JSR ($8197,X)                   ; $808181  FC 97 81     mx
    JSR read_pads                   ; $808184  20 7D DC     mx
    JSR L_80FC1C                    ; $808187  20 1C FC     mx
L_80818A:
    REP #$30                        ; $80818A  C2 30        mx
    INC $127E                       ; $80818C  EE 7E 12     MX
    LDA $2A                         ; $80818F  A5 2A        MX
    LDX $2C                         ; $808191  A6 2C        MX
    LDY $2E                         ; $808193  A4 2E        MX
    PLB                             ; $808195  AB           MX
    RTI                             ; $808196  40           MX
    db $C0,$81,$1F,$BE,$C6,$81,$CB,$81,$D0,$81,$D5,$81,$DA,$81,$DF,$81 ; $808197
    db $E4,$81,$E9,$81,$EE,$81,$F3,$81,$F8,$81,$1A,$BE,$31,$BE,$4A,$BE ; $8081A7
    db $4E,$BF,$C1,$81                                                 ; $8081B7
L_8081BB:
    JML L_8081BF                    ; $8081BB  5C BF 81 80  mx
L_8081BF:
    RTI                             ; $8081BF  40           mx
L_8081C0:
    RTS                             ; $8081C0  60           mx
L_8081C1:
    JSL L_9FFC2E                    ; $8081C1  22 2E FC 9F  mx
    RTS                             ; $8081C5  60           mx
L_8081C6:
    JSL L_819A46                    ; $8081C6  22 46 9A 81  mx
    RTS                             ; $8081CA  60           mx
L_8081CB:
    JSL L_8191AB                    ; $8081CB  22 AB 91 81  mx
    RTS                             ; $8081CF  60           mx
L_8081D0:
    JSL L_81C28B                    ; $8081D0  22 8B C2 81  mx
    RTS                             ; $8081D4  60           mx
L_8081D5:
    JSL L_81B57A                    ; $8081D5  22 7A B5 81  mx
    RTS                             ; $8081D9  60           mx
L_8081DA:
    JSL L_81F874                    ; $8081DA  22 74 F8 81  mx
    RTS                             ; $8081DE  60           mx
L_8081DF:
    JSL L_81CEE6                    ; $8081DF  22 E6 CE 81  mx
    RTS                             ; $8081E3  60           mx
L_8081E4:
    JSL L_81CF03                    ; $8081E4  22 03 CF 81  mx
    RTS                             ; $8081E8  60           mx
L_8081E9:
    JSL L_81FE75                    ; $8081E9  22 75 FE 81  mx
    RTS                             ; $8081ED  60           mx
L_8081EE:
    JSL L_81AD21                    ; $8081EE  22 21 AD 81  mx
    RTS                             ; $8081F2  60           mx
L_8081F3:
    JSL L_81B9DD                    ; $8081F3  22 DD B9 81  mx
    RTS                             ; $8081F7  60           mx
L_8081F8:
    JSL L_81AB0D                    ; $8081F8  22 0D AB 81  mx
    RTS                             ; $8081FC  60           mx
L_8081FD:
    JML L_808201                    ; $8081FD  5C 01 82 80  mx
L_808201:
    PHP                             ; $808201  08           mx
    CLD                             ; $808202  D8           mx
    PHB                             ; $808203  8B           mx
    PHK                             ; $808204  4B           mx
    PLB                             ; $808205  AB           mx
    REP #$30                        ; $808206  C2 30        mx
    STA $2A                         ; $808208  85 2A        MX
    STX $2C                         ; $80820A  86 2C        MX
    STY $2E                         ; $80820C  84 2E        MX
    SEP #$30                        ; $80820E  E2 30        MX
    LDA $4211                       ; $808210  AD 11 42     mx
    AND #$80                        ; $808213  29 80        mx
    BEQ L_80821D                    ; $808215  F0 06        mx
    LDX $0356                       ; $808217  AE 56 03     mx
    JSR ($8228,X)                   ; $80821A  FC 28 82     mx
L_80821D:
    REP #$30                        ; $80821D  C2 30        mx
    LDA $2A                         ; $80821F  A5 2A        MX
    LDX $2C                         ; $808221  A6 2C        MX
    LDY $2E                         ; $808223  A4 2E        MX
    PLB                             ; $808225  AB           MX
    PLP                             ; $808226  28           MX
    RTI                             ; $808227  40           mx
    db $C0,$81,$98,$BF,$83,$82,$3E,$82,$34,$82,$39,$82,$22,$6B,$FC,$9F ; $808228
    db $60,$22,$8D,$FC,$9F,$60,$AD,$98,$02,$D0,$26,$1A,$8D,$98,$02,$A9 ; $808238
    db $98,$8D,$09,$42,$9C,$0A,$42,$AE,$C2,$02,$AC,$C3,$02,$AD,$12,$42 ; $808248
    db $29,$40,$F0,$F9,$8E,$0D,$21,$8C,$0D,$21,$8E,$11,$21,$8C,$11,$21 ; $808258
    db $60,$AE,$C4,$02,$AC,$C5,$02,$AD,$12,$42,$29,$40,$F0,$F9,$8E,$0D ; $808268
    db $21,$8C,$0D,$21,$8E,$11,$21,$8C,$11,$21,$60,$A2,$09,$A0,$FF,$AD ; $808278
    db $12,$42,$29,$40,$F0,$F9,$8E,$05,$21,$9C,$0D,$21,$9C,$0D,$21,$8C ; $808288
    db $0E,$21,$8C,$0E,$21,$60,$08,$0A,$0C,$0E,$0E,$0E,$00,$08,$12,$1E ; $808298
    db $2C,$3A,$01,$02,$03,$04,$01,$02,$03,$04,$05,$06,$07,$08,$09,$05 ; $8082A8
    db $06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,$0A,$0B,$0C,$0D,$0E,$0F ; $8082B8
    db $10,$11,$12,$13,$14,$15,$16,$10,$11,$12,$13,$14,$15,$16,$17,$18 ; $8082C8
    db $19,$1A,$1B,$1C,$1D,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F,$20,$21 ; $8082D8
    db $22,$23,$24,$1E,$1F,$20,$21,$22,$23,$24,$03,$04,$05,$06,$07     ; $8082E8
L_8082F7:
    PHB                             ; $8082F7  8B           MX
    PHK                             ; $8082F8  4B           MX
    PLB                             ; $8082F9  AB           MX
    JSR L_8082FF                    ; $8082FA  20 FF 82     MX
    PLB                             ; $8082FD  AB           MX
    RTL                             ; $8082FE  6B           MX
L_8082FF:
    STX $88                         ; $8082FF  86 88        MX
    JSR L_808320                    ; $808301  20 20 83     MX
    PHA                             ; $808304  48           MX
    PHX                             ; $808305  DA           MX
    LDA $88                         ; $808306  A5 88        MX
    PHA                             ; $808308  48           MX
    PEA $CB00                       ; $808309  F4 00 CB     MX
    PEA $1000                       ; $80830C  F4 00 10     MX
    JSR L_80852C                    ; $80830F  20 2C 85     MX
    PLA                             ; $808312  68           MX
    PLA                             ; $808313  68           MX
    PLA                             ; $808314  68           MX
    PLA                             ; $808315  68           MX
    PLA                             ; $808316  68           MX
    RTS                             ; $808317  60           MX
L_808318:
    PHB                             ; $808318  8B           MX
    PHK                             ; $808319  4B           MX
    PLB                             ; $80831A  AB           MX
    JSR L_808320                    ; $80831B  20 20 83     MX
    PLB                             ; $80831E  AB           MX
    RTL                             ; $80831F  6B           MX
L_808320:
    ASL                             ; $808320  0A           MX
    ASL                             ; $808321  0A           MX
    TAY                             ; $808322  A8           MX
    LDA #$8000                      ; $808323  A9 00 80     MX
    STA $04                         ; $808326  85 04        MX
    LDA #$0093                      ; $808328  A9 93 00     MX
    STA $06                         ; $80832B  85 06        MX
    LDA [$04],Y                     ; $80832D  B7 04        MX
    CLC                             ; $80832F  18           MX
    ADC #$8000                      ; $808330  69 00 80     MX
    TAX                             ; $808333  AA           MX
    INY                             ; $808334  C8           MX
    INY                             ; $808335  C8           MX
    LDA [$04],Y                     ; $808336  B7 04        MX
    ADC #$0093                      ; $808338  69 93 00     MX
    RTS                             ; $80833B  60           MX
L_80833C:
    PHB                             ; $80833C  8B           MX
    PHK                             ; $80833D  4B           MX
    PLB                             ; $80833E  AB           MX
    JSR L_808344                    ; $80833F  20 44 83     MX
    PLB                             ; $808342  AB           MX
    RTL                             ; $808343  6B           MX
L_808344:
    PHY                             ; $808344  5A           MX
    JSR L_808320                    ; $808345  20 20 83     MX
    PLY                             ; $808348  7A           MX
    PHA                             ; $808349  48           MX
    PHX                             ; $80834A  DA           MX
    PHY                             ; $80834B  5A           MX
    PEA $CB00                       ; $80834C  F4 00 CB     MX
    PEA $1000                       ; $80834F  F4 00 10     MX
    JSR L_8083D9                    ; $808352  20 D9 83     MX
    PLA                             ; $808355  68           MX
    PLA                             ; $808356  68           MX
    PLA                             ; $808357  68           MX
    PLA                             ; $808358  68           MX
    PLA                             ; $808359  68           MX
    RTS                             ; $80835A  60           MX
L_80835B:
    PHB                             ; $80835B  8B           MX
    PHK                             ; $80835C  4B           MX
    PLB                             ; $80835D  AB           MX
    JSR L_808363                    ; $80835E  20 63 83     MX
    PLB                             ; $808361  AB           MX
    RTL                             ; $808362  6B           MX
L_808363:
    PHY                             ; $808363  5A           MX
    JSR L_808320                    ; $808364  20 20 83     MX
    PLY                             ; $808367  7A           MX
    PHA                             ; $808368  48           MX
    PHX                             ; $808369  DA           MX
    PHY                             ; $80836A  5A           MX
    PEA $CB00                       ; $80836B  F4 00 CB     MX
    PEA $1000                       ; $80836E  F4 00 10     MX
    JSR L_8083CE                    ; $808371  20 CE 83     MX
    PLA                             ; $808374  68           MX
    PLA                             ; $808375  68           MX
    PLA                             ; $808376  68           MX
    PLA                             ; $808377  68           MX
    PLA                             ; $808378  68           MX
    RTS                             ; $808379  60           MX
L_80837A:
    PHA                             ; $80837A  48           MX
    JSR L_808320                    ; $80837B  20 20 83     MX
    PLY                             ; $80837E  7A           MX
    PHA                             ; $80837F  48           MX
    PHX                             ; $808380  DA           MX
    TYA                             ; $808381  98           MX
    ASL                             ; $808382  0A           MX
    ASL                             ; $808383  0A           MX
    TAY                             ; $808384  A8           MX
    LDA $8639,Y                     ; $808385  B9 39 86     MX
    PHA                             ; $808388  48           MX
    PEA $CB00                       ; $808389  F4 00 CB     MX
    PEA $1000                       ; $80838C  F4 00 10     MX
    JSR L_80850F                    ; $80838F  20 0F 85     MX
    TSX                             ; $808392  BA           MX
    TXA                             ; $808393  8A           MX
    CLC                             ; $808394  18           MX
    ADC #$000A                      ; $808395  69 0A 00     MX
    TAX                             ; $808398  AA           MX
    TXS                             ; $808399  9A           MX
    RTS                             ; $80839A  60           MX
L_80839B:
    PHB                             ; $80839B  8B           MX
    PHK                             ; $80839C  4B           MX
    PLB                             ; $80839D  AB           MX
    JSR L_8083A3                    ; $80839E  20 A3 83     MX
    PLB                             ; $8083A1  AB           MX
    RTL                             ; $8083A2  6B           MX
L_8083A3:
    PHA                             ; $8083A3  48           MX
    JSR L_808320                    ; $8083A4  20 20 83     MX
    PLY                             ; $8083A7  7A           MX
    PHA                             ; $8083A8  48           MX
    PHX                             ; $8083A9  DA           MX
    TYA                             ; $8083AA  98           MX
    ASL                             ; $8083AB  0A           MX
    ASL                             ; $8083AC  0A           MX
    TAY                             ; $8083AD  A8           MX
    LDA $8639,Y                     ; $8083AE  B9 39 86     MX
    PHA                             ; $8083B1  48           MX
    PEA $CB00                       ; $8083B2  F4 00 CB     MX
    PEA $1000                       ; $8083B5  F4 00 10     MX
    LDA $863B,Y                     ; $8083B8  B9 3B 86     MX
    BNE L_8083C2                    ; $8083BB  D0 05        MX
    JSR L_80852C                    ; $8083BD  20 2C 85     MX
    BRA L_8083C5                    ; $8083C0  80 03        MX
L_8083C2:
    JSR L_8083CE                    ; $8083C2  20 CE 83     MX
L_8083C5:
    TSX                             ; $8083C5  BA           MX
    TXA                             ; $8083C6  8A           MX
    CLC                             ; $8083C7  18           MX
    ADC #$000A                      ; $8083C8  69 0A 00     MX
    TAX                             ; $8083CB  AA           MX
    TXS                             ; $8083CC  9A           MX
    RTS                             ; $8083CD  60           MX
L_8083CE:
    LDA #$0080                      ; $8083CE  A9 80 00     MX
    STA $2115                       ; $8083D1  8D 15 21     MX
    LDA $07,S                       ; $8083D4  A3 07        MX
    STA $2116                       ; $8083D6  8D 16 21     MX
L_8083D9:
    LDA $09,S                       ; $8083D9  A3 09        MX
    STA $30                         ; $8083DB  85 30        MX
    LDA $0B,S                       ; $8083DD  A3 0B        MX
    STA $32                         ; $8083DF  85 32        MX
    LDA $05,S                       ; $8083E1  A3 05        MX
    STA $40                         ; $8083E3  85 40        MX
    STA $3C                         ; $8083E5  85 3C        MX
    LDA #$007E                      ; $8083E7  A9 7E 00     MX
    STA $42                         ; $8083EA  85 42        MX
    STA $3E                         ; $8083EC  85 3E        MX
    LDA [$30]                       ; $8083EE  A7 30        MX
    STA $34                         ; $8083F0  85 34        MX
    INC $30                         ; $8083F2  E6 30        MX
    BNE L_8083FD                    ; $8083F4  D0 07        MX
    LDY #$8000                      ; $8083F6  A0 00 80     MX
    STY $30                         ; $8083F9  84 30        MX
    INC $32                         ; $8083FB  E6 32        MX
L_8083FD:
    SEP #$20                        ; $8083FD  E2 20        MX
    LDA [$30]                       ; $8083FF  A7 30        mX
    STA $35                         ; $808401  85 35        mX
    REP #$20                        ; $808403  C2 20        mX
    INC $30                         ; $808405  E6 30        MX
    BNE L_808410                    ; $808407  D0 07        MX
    LDA #$8000                      ; $808409  A9 00 80     MX
    STA $30                         ; $80840C  85 30        MX
    INC $32                         ; $80840E  E6 32        MX
L_808410:
    LDA #$0000                      ; $808410  A9 00 00     MX
    SEC                             ; $808413  38           MX
    SBC $34                         ; $808414  E5 34        MX
    STA $34                         ; $808416  85 34        MX
    LDY #$0FFE                      ; $808418  A0 FE 0F     MX
    LDA #$0000                      ; $80841B  A9 00 00     MX
L_80841E:
    STA [$40],Y                     ; $80841E  97 40        MX
    DEY                             ; $808420  88           MX
    DEY                             ; $808421  88           MX
    BPL L_80841E                    ; $808422  10 FA        MX
    LDX #$1000                      ; $808424  A2 00 10     MX
    STZ $44                         ; $808427  64 44        MX
L_808429:
    LSR $44                         ; $808429  46 44        MX
    LDA $44                         ; $80842B  A5 44        MX
    BIT #$0100                      ; $80842D  89 00 01     MX
    BNE L_808446                    ; $808430  D0 14        MX
    LDA [$30]                       ; $808432  A7 30        MX
    INC $30                         ; $808434  E6 30        MX
    BNE L_808441                    ; $808436  D0 09        MX
    PHA                             ; $808438  48           MX
    LDA #$8000                      ; $808439  A9 00 80     MX
    STA $30                         ; $80843C  85 30        MX
    PLA                             ; $80843E  68           MX
    INC $32                         ; $80843F  E6 32        MX
L_808441:
    ORA #$FF00                      ; $808441  09 00 FF     MX
    STA $44                         ; $808444  85 44        MX
L_808446:
    LSR                             ; $808446  4A           MX
    BCC L_80847A                    ; $808447  90 31        MX
    SEP #$20                        ; $808449  E2 20        MX
    LDA [$30]                       ; $80844B  A7 30        mX
    STA [$3C]                       ; $80844D  87 3C        mX
    JSR L_8084E0                    ; $80844F  20 E0 84     mX
    REP #$20                        ; $808452  C2 20        mX
    INC $34                         ; $808454  E6 34        MX
    BNE L_808459                    ; $808456  D0 01        MX
L_808458:
    RTS                             ; $808458  60           MX
L_808459:
    INC $30                         ; $808459  E6 30        MX
    BNE L_808468                    ; $80845B  D0 0B        MX
    PHA                             ; $80845D  48           MX
    LDA $30                         ; $80845E  A5 30        MX
    ORA #$8000                      ; $808460  09 00 80     MX
    STA $30                         ; $808463  85 30        MX
    PLA                             ; $808465  68           MX
    INC $32                         ; $808466  E6 32        MX
L_808468:
    INC $3C                         ; $808468  E6 3C        MX
    BNE L_80846E                    ; $80846A  D0 02        MX
    INC $3E                         ; $80846C  E6 3E        MX
L_80846E:
    DEX                             ; $80846E  CA           MX
    BNE L_808429                    ; $80846F  D0 B8        MX
    LDX #$1000                      ; $808471  A2 00 10     MX
    LDA $05,S                       ; $808474  A3 05        MX
    STA $3C                         ; $808476  85 3C        MX
    BRA L_808429                    ; $808478  80 AF        MX
L_80847A:
    LDA [$30]                       ; $80847A  A7 30        MX
    STA $A2                         ; $80847C  85 A2        MX
    INC $30                         ; $80847E  E6 30        MX
    BNE L_808489                    ; $808480  D0 07        MX
    LDA #$8000                      ; $808482  A9 00 80     MX
    STA $30                         ; $808485  85 30        MX
    INC $32                         ; $808487  E6 32        MX
L_808489:
    SEP #$20                        ; $808489  E2 20        MX
    LDA [$30]                       ; $80848B  A7 30        mX
    STA $A3                         ; $80848D  85 A3        mX
    REP #$20                        ; $80848F  C2 20        mX
    INC $30                         ; $808491  E6 30        MX
    BNE L_80849C                    ; $808493  D0 07        MX
    LDA #$8000                      ; $808495  A9 00 80     MX
    STA $30                         ; $808498  85 30        MX
    INC $32                         ; $80849A  E6 32        MX
L_80849C:
    LDA $A2                         ; $80849C  A5 A2        MX
    AND #$0FFF                      ; $80849E  29 FF 0F     MX
    TAY                             ; $8084A1  A8           MX
    LDA $A2                         ; $8084A2  A5 A2        MX
    AND #$F000                      ; $8084A4  29 00 F0     MX
    ASL                             ; $8084A7  0A           MX
    ROL                             ; $8084A8  2A           MX
    ROL                             ; $8084A9  2A           MX
    ROL                             ; $8084AA  2A           MX
    ROL                             ; $8084AB  2A           MX
    ADC #$0003                      ; $8084AC  69 03 00     MX
    STA $8E                         ; $8084AF  85 8E        MX
L_8084B1:
    SEP #$20                        ; $8084B1  E2 20        MX
    LDA [$40],Y                     ; $8084B3  B7 40        mX
    STA [$3C]                       ; $8084B5  87 3C        mX
    JSR L_8084E0                    ; $8084B7  20 E0 84     mX
    REP #$20                        ; $8084BA  C2 20        mX
    INC $34                         ; $8084BC  E6 34        MX
    BEQ L_808458                    ; $8084BE  F0 98        MX
    INC $3C                         ; $8084C0  E6 3C        MX
    BNE L_8084C6                    ; $8084C2  D0 02        MX
    INC $3E                         ; $8084C4  E6 3E        MX
L_8084C6:
    INY                             ; $8084C6  C8           MX
    CPY #$1000                      ; $8084C7  C0 00 10     MX
    BCC L_8084CF                    ; $8084CA  90 03        MX
    LDY #$0000                      ; $8084CC  A0 00 00     MX
L_8084CF:
    DEX                             ; $8084CF  CA           MX
    BNE L_8084D9                    ; $8084D0  D0 07        MX
    LDX #$1000                      ; $8084D2  A2 00 10     MX
    LDA $05,S                       ; $8084D5  A3 05        MX
    STA $3C                         ; $8084D7  85 3C        MX
L_8084D9:
    DEC $8E                         ; $8084D9  C6 8E        MX
    BNE L_8084B1                    ; $8084DB  D0 D4        MX
    JMP L_808429                    ; $8084DD  4C 29 84     MX
L_8084E0:
    PHA                             ; $8084E0  48           mX
    LDA $02                         ; $8084E1  A5 02        mX
    EOR #$01                        ; $8084E3  49 01        mX
    STA $02                         ; $8084E5  85 02        mX
    BEQ L_8084ED                    ; $8084E7  F0 04        mX
    PLA                             ; $8084E9  68           mX
    STA $03                         ; $8084EA  85 03        mX
    RTS                             ; $8084EC  60           mX
L_8084ED:
    LDA $03                         ; $8084ED  A5 03        mX
    STA $2118                       ; $8084EF  8D 18 21     mX
    PLA                             ; $8084F2  68           mX
    STA $2119                       ; $8084F3  8D 19 21     mX
    RTS                             ; $8084F6  60           mX
L_8084F7:
    LDA $9C                         ; $8084F7  A5 9C        mX
    PHA                             ; $8084F9  48           mX
    LDA $9E                         ; $8084FA  A5 9E        mX
    PHA                             ; $8084FC  48           mX
    LDA $A0                         ; $8084FD  A5 A0        mX
    PHA                             ; $8084FF  48           mX
    LDA $A2                         ; $808500  A5 A2        mX
    PHA                             ; $808502  48           mX
    LDA $A4                         ; $808503  A5 A4        mX
    PHA                             ; $808505  48           mX
    JSR L_80852C                    ; $808506  20 2C 85     mX
    PLA                             ; $808509  68           MX
    PLA                             ; $80850A  68           MX
    PLA                             ; $80850B  68           MX
    PLA                             ; $80850C  68           MX
    PLA                             ; $80850D  68           MX
    RTS                             ; $80850E  60           MX
L_80850F:
    LDA #$007F                      ; $80850F  A9 7F 00     MX
    BRA L_80852F                    ; $808512  80 1B        MX
L_808514:
    PHB                             ; $808514  8B           MX
    PHK                             ; $808515  4B           MX
    PLB                             ; $808516  AB           MX
    PHA                             ; $808517  48           MX
    PHX                             ; $808518  DA           MX
    PEA $3500                       ; $808519  F4 00 35     MX
    PEA $CB00                       ; $80851C  F4 00 CB     MX
    PEA $0800                       ; $80851F  F4 00 08     MX
    JSR L_80852C                    ; $808522  20 2C 85     MX
    PLA                             ; $808525  68           MX
    PLA                             ; $808526  68           MX
    PLA                             ; $808527  68           MX
    PLX                             ; $808528  FA           MX
    PLA                             ; $808529  68           MX
    PLB                             ; $80852A  AB           MX
    RTL                             ; $80852B  6B           MX
L_80852C:
    LDA #$007E                      ; $80852C  A9 7E 00     MX
L_80852F:
    STA $3A                         ; $80852F  85 3A        MX
    LDA $07,S                       ; $808531  A3 07        MX
    STA $38                         ; $808533  85 38        MX
    LDA $09,S                       ; $808535  A3 09        MX
    STA $30                         ; $808537  85 30        MX
    LDA $0B,S                       ; $808539  A3 0B        MX
    STA $32                         ; $80853B  85 32        MX
    LDA $05,S                       ; $80853D  A3 05        MX
    STA $40                         ; $80853F  85 40        MX
    STA $3C                         ; $808541  85 3C        MX
    LDA #$007E                      ; $808543  A9 7E 00     MX
    STA $42                         ; $808546  85 42        MX
    STA $3E                         ; $808548  85 3E        MX
    LDA [$30]                       ; $80854A  A7 30        MX
    INC $30                         ; $80854C  E6 30        MX
    BNE L_808557                    ; $80854E  D0 07        MX
    LDY #$8000                      ; $808550  A0 00 80     MX
    STY $30                         ; $808553  84 30        MX
    INC $32                         ; $808555  E6 32        MX
L_808557:
    STA $34                         ; $808557  85 34        MX
    LDA [$30]                       ; $808559  A7 30        MX
    INC $30                         ; $80855B  E6 30        MX
    BNE L_808566                    ; $80855D  D0 07        MX
    LDY #$8000                      ; $80855F  A0 00 80     MX
    STY $30                         ; $808562  84 30        MX
    INC $32                         ; $808564  E6 32        MX
L_808566:
    SEP #$20                        ; $808566  E2 20        MX
    STA $35                         ; $808568  85 35        mX
    REP #$20                        ; $80856A  C2 20        mX
    LDY #$0FFE                      ; $80856C  A0 FE 0F     MX
    LDA #$0000                      ; $80856F  A9 00 00     MX
L_808572:
    STA [$40],Y                     ; $808572  97 40        MX
    DEY                             ; $808574  88           MX
    DEY                             ; $808575  88           MX
    BPL L_808572                    ; $808576  10 FA        MX
    LDX #$1000                      ; $808578  A2 00 10     MX
    STZ $44                         ; $80857B  64 44        MX
L_80857D:
    LDA $44                         ; $80857D  A5 44        MX
    LSR                             ; $80857F  4A           MX
    STA $44                         ; $808580  85 44        MX
    BIT #$0100                      ; $808582  89 00 01     MX
    BNE L_808599                    ; $808585  D0 12        MX
    LDA [$30]                       ; $808587  A7 30        MX
    INC $30                         ; $808589  E6 30        MX
    BNE L_808594                    ; $80858B  D0 07        MX
    LDY #$8000                      ; $80858D  A0 00 80     MX
    STY $30                         ; $808590  84 30        MX
    INC $32                         ; $808592  E6 32        MX
L_808594:
    ORA #$FF00                      ; $808594  09 00 FF     MX
    STA $44                         ; $808597  85 44        MX
L_808599:
    LSR                             ; $808599  4A           MX
    BCC L_8085CE                    ; $80859A  90 32        MX
    LDA [$30]                       ; $80859C  A7 30        MX
    INC $30                         ; $80859E  E6 30        MX
    BNE L_8085A9                    ; $8085A0  D0 07        MX
    LDY #$8000                      ; $8085A2  A0 00 80     MX
    STY $30                         ; $8085A5  84 30        MX
    INC $32                         ; $8085A7  E6 32        MX
L_8085A9:
    SEP #$20                        ; $8085A9  E2 20        MX
    STA [$38]                       ; $8085AB  87 38        mX
    STA [$3C]                       ; $8085AD  87 3C        mX
    REP #$20                        ; $8085AF  C2 20        mX
    DEC $34                         ; $8085B1  C6 34        MX
    BNE L_8085B6                    ; $8085B3  D0 01        MX
L_8085B5:
    RTS                             ; $8085B5  60           MX
L_8085B6:
    INC $38                         ; $8085B6  E6 38        MX
    BNE L_8085BC                    ; $8085B8  D0 02        MX
    INC $3A                         ; $8085BA  E6 3A        MX
L_8085BC:
    INC $3C                         ; $8085BC  E6 3C        MX
    BNE L_8085C2                    ; $8085BE  D0 02        MX
    INC $3E                         ; $8085C0  E6 3E        MX
L_8085C2:
    DEX                             ; $8085C2  CA           MX
    BNE L_80857D                    ; $8085C3  D0 B8        MX
    LDX #$1000                      ; $8085C5  A2 00 10     MX
    LDA $05,S                       ; $8085C8  A3 05        MX
    STA $3C                         ; $8085CA  85 3C        MX
    BRA L_80857D                    ; $8085CC  80 AF        MX
L_8085CE:
    LDA [$30]                       ; $8085CE  A7 30        MX
    INC $30                         ; $8085D0  E6 30        MX
    BNE L_8085DB                    ; $8085D2  D0 07        MX
    LDY #$8000                      ; $8085D4  A0 00 80     MX
    STY $30                         ; $8085D7  84 30        MX
    INC $32                         ; $8085D9  E6 32        MX
L_8085DB:
    STA $A2                         ; $8085DB  85 A2        MX
    LDA [$30]                       ; $8085DD  A7 30        MX
    INC $30                         ; $8085DF  E6 30        MX
    BNE L_8085EA                    ; $8085E1  D0 07        MX
    LDY #$8000                      ; $8085E3  A0 00 80     MX
    STY $30                         ; $8085E6  84 30        MX
    INC $32                         ; $8085E8  E6 32        MX
L_8085EA:
    SEP #$20                        ; $8085EA  E2 20        MX
    STA $A3                         ; $8085EC  85 A3        mX
    REP #$20                        ; $8085EE  C2 20        mX
    LDA $A2                         ; $8085F0  A5 A2        MX
    AND #$0FFF                      ; $8085F2  29 FF 0F     MX
    TAY                             ; $8085F5  A8           MX
    LDA $A2                         ; $8085F6  A5 A2        MX
    AND #$F000                      ; $8085F8  29 00 F0     MX
    ASL                             ; $8085FB  0A           MX
    ROL                             ; $8085FC  2A           MX
    ROL                             ; $8085FD  2A           MX
    ROL                             ; $8085FE  2A           MX
    ROL                             ; $8085FF  2A           MX
    ADC #$0003                      ; $808600  69 03 00     MX
    STA $8E                         ; $808603  85 8E        MX
L_808605:
    SEP #$20                        ; $808605  E2 20        MX
    LDA [$40],Y                     ; $808607  B7 40        mX
    STA [$38]                       ; $808609  87 38        mX
    STA [$3C]                       ; $80860B  87 3C        mX
    REP #$20                        ; $80860D  C2 20        mX
    DEC $34                         ; $80860F  C6 34        MX
    BEQ L_8085B5                    ; $808611  F0 A2        MX
    INC $38                         ; $808613  E6 38        MX
    BNE L_808619                    ; $808615  D0 02        MX
    INC $3A                         ; $808617  E6 3A        MX
L_808619:
    INC $3C                         ; $808619  E6 3C        MX
    BNE L_80861F                    ; $80861B  D0 02        MX
    INC $3E                         ; $80861D  E6 3E        MX
L_80861F:
    INY                             ; $80861F  C8           MX
    CPY #$1000                      ; $808620  C0 00 10     MX
    BCC L_808628                    ; $808623  90 03        MX
    LDY #$0000                      ; $808625  A0 00 00     MX
L_808628:
    DEX                             ; $808628  CA           MX
    BNE L_808632                    ; $808629  D0 07        MX
    LDX #$1000                      ; $80862B  A2 00 10     MX
    LDA $05,S                       ; $80862E  A3 05        MX
    STA $3C                         ; $808630  85 3C        MX
L_808632:
    DEC $8E                         ; $808632  C6 8E        MX
    BNE L_808605                    ; $808634  D0 CF        MX
    BRL L_80857D                    ; $808636  82 44 FF     MX
    db $C0,$5D,$00,$00,$C0,$89,$00,$00,$00,$00,$00,$00,$00,$35,$00,$00 ; $808639
    db $C0,$5D,$00,$00,$C0,$89,$00,$00,$00,$00,$00,$00,$00,$35,$00,$00 ; $808649
    db $C0,$5D,$00,$00,$C0,$89,$00,$00,$00,$00,$00,$00,$00,$35,$00,$00 ; $808659
    db $C0,$5D,$00,$00,$C0,$89,$00,$00,$00,$00,$00,$00,$00,$35,$00,$00 ; $808669
    db $C0,$5D,$00,$00,$C0,$89,$00,$00,$00,$00,$00,$00,$00,$35,$00,$00 ; $808679
    db $C0,$5D,$00,$00,$C0,$89,$00,$00,$00,$00,$00,$00,$00,$35,$00,$00 ; $808689
    db $00,$40,$01,$00,$00,$00,$00,$00,$00,$0C,$01,$00,$00,$35,$00,$00 ; $808699
    db $00,$22,$00,$00,$00,$22,$00,$00,$00,$30,$01,$00,$00,$22,$00,$00 ; $8086A9
    db $00,$40,$01,$00,$00,$35,$00,$00,$00,$20,$01,$00,$00,$30,$01,$00 ; $8086B9
    db $00,$22,$00,$00,$00,$22,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $8086C9
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$08,$01,$00 ; $8086D9
    db $00,$08,$01,$00,$00,$08,$01,$00,$00,$08,$01,$00,$00,$08,$01,$00 ; $8086E9
    db $00,$30,$01,$00,$00,$30,$01,$00,$00,$58,$01,$00,$00,$58,$01,$00 ; $8086F9
    db $00,$35,$00,$00,$00,$40,$01,$00,$00,$22,$00,$00,$00,$22,$00,$00 ; $808709
    db $00,$40,$01,$00,$00,$00,$01,$00,$00,$35,$00,$00,$00,$00,$01,$00 ; $808719
    db $00,$35,$00,$00,$00,$32,$01,$00,$00,$22,$00,$00,$00,$22,$00,$00 ; $808729
    db $00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00 ; $808739
    db $00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00 ; $808749
    db $00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00 ; $808759
    db $00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00 ; $808769
    db $00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00 ; $808779
    db $00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00 ; $808789
    db $00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00 ; $808799
    db $00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00 ; $8087A9
    db $00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00,$00,$00,$01,$00 ; $8087B9
    db $00,$00,$01,$00,$00,$22,$00,$00,$00,$22,$00,$00,$00,$22,$00,$00 ; $8087C9
    db $00,$22,$00,$00,$00,$40,$01,$00,$00,$00,$01,$00,$00,$35,$00,$00 ; $8087D9
    db $00,$20,$01,$00,$00,$22,$00,$00,$00,$00,$01,$00,$00,$35,$00,$00 ; $8087E9
    db $00,$35,$00,$00,$00,$40,$01,$00,$00,$22,$00,$00,$00,$22,$00,$00 ; $8087F9
    db $00,$22,$00,$00,$00,$40,$01,$00,$00,$00,$01,$00,$00,$35,$00,$00 ; $808809
    db $00,$00,$00,$00,$00,$32,$01,$00,$00,$20,$01,$00,$00,$78,$01,$00 ; $808819
    db $00,$35,$00,$00,$00,$00,$01,$00,$00,$08,$01,$00,$00,$22,$00,$00 ; $808829
    db $00,$34,$01,$00,$00,$22,$00,$00,$00,$2C,$01,$00,$00,$22,$00,$00 ; $808839
    db $00,$00,$01,$00,$00,$40,$01,$00,$00,$00,$01,$00,$00,$60,$01,$00 ; $808849
    db $00,$08,$01,$00,$00,$20,$00,$00,$00,$40,$01,$00,$00,$00,$01,$00 ; $808859
    db $00,$60,$01,$00,$00,$08,$01,$00,$00,$20,$00,$00,$00,$20,$01,$00 ; $808869
    db $00,$21,$00,$00                                                 ; $808879
L_80887D:
    REP #$20                        ; $80887D  C2 20        mx
    STZ $0273                       ; $80887F  9C 73 02     Mx
    STZ $0275                       ; $808882  9C 75 02     Mx
    STZ $0277                       ; $808885  9C 77 02     Mx
    STZ $0279                       ; $808888  9C 79 02     Mx
    STZ $027B                       ; $80888B  9C 7B 02     Mx
    SEP #$20                        ; $80888E  E2 20        Mx
    LDX #$00                        ; $808890  A2 00        mx
    JSR L_808967                    ; $808892  20 67 89     mx
    INX                             ; $808895  E8           mx
    JSR L_808967                    ; $808896  20 67 89     mx
    INX                             ; $808899  E8           mx
    JSR L_808967                    ; $80889A  20 67 89     mx
    INX                             ; $80889D  E8           mx
    JSR L_808967                    ; $80889E  20 67 89     mx
    STZ $0B50                       ; $8088A1  9C 50 0B     mx
    STZ $0B51                       ; $8088A4  9C 51 0B     mx
    REP #$20                        ; $8088A7  C2 20        mx
    STZ $0324                       ; $8088A9  9C 24 03     Mx
    LDA #$0003                      ; $8088AC  A9 03 00     Mx
    STA $0328                       ; $8088AF  8D 28 03     Mx
    STA $0326                       ; $8088B2  8D 26 03     Mx
    SEP #$20                        ; $8088B5  E2 20        Mx
    LDA #$0F                        ; $8088B7  A9 0F        mx
    STA $0BEE                       ; $8088B9  8D EE 0B     mx
    LDX $0255                       ; $8088BC  AE 55 02     mx
    LDA $A1C0,X                     ; $8088BF  BD C0 A1     mx
    STA $0BEF                       ; $8088C2  8D EF 0B     mx
    STZ $0BFE                       ; $8088C5  9C FE 0B     mx
    STZ $0BED                       ; $8088C8  9C ED 0B     mx
    STZ $0B8E                       ; $8088CB  9C 8E 0B     mx
    STZ $0BEB                       ; $8088CE  9C EB 0B     mx
    STZ $0BE8                       ; $8088D1  9C E8 0B     mx
    STZ $1261                       ; $8088D4  9C 61 12     mx
    REP #$30                        ; $8088D7  C2 30        mx
    STZ $0216                       ; $8088D9  9C 16 02     MX
    STZ $0218                       ; $8088DC  9C 18 02     MX
    STZ $021A                       ; $8088DF  9C 1A 02     MX
    STZ $021C                       ; $8088E2  9C 1C 02     MX
    STZ $021E                       ; $8088E5  9C 1E 02     MX
    STZ $0220                       ; $8088E8  9C 20 02     MX
    STZ $0226                       ; $8088EB  9C 26 02     MX
    STZ $0228                       ; $8088EE  9C 28 02     MX
    LDA #$0078                      ; $8088F1  A9 78 00     MX
    STA $0222                       ; $8088F4  8D 22 02     MX
    STA $0224                       ; $8088F7  8D 24 02     MX
    STZ $13C2                       ; $8088FA  9C C2 13     MX
    STZ $13C4                       ; $8088FD  9C C4 13     MX  password_bits
    STZ $0C56                       ; $808900  9C 56 0C     MX
    STZ $0BE9                       ; $808903  9C E9 0B     MX
    STZ $1282                       ; $808906  9C 82 12     MX
    STZ $1325                       ; $808909  9C 25 13     MX
    STZ $0F0F                       ; $80890C  9C 0F 0F     MX
    STZ $125F                       ; $80890F  9C 5F 12     MX
    LDY #$0018                      ; $808912  A0 18 00     MX
    LDX #$0000                      ; $808915  A2 00 00     MX
L_808918:
    STZ $0F11,X                     ; $808918  9E 11 0F     MX
    INX                             ; $80891B  E8           MX
    INX                             ; $80891C  E8           MX
    DEY                             ; $80891D  88           MX
    BPL L_808918                    ; $80891E  10 F8        MX
    LDA $0299                       ; $808920  AD 99 02     MX  planet
    AND #$00FF                      ; $808923  29 FF 00     MX
    ASL                             ; $808926  0A           MX
    ASL                             ; $808927  0A           MX
    TAX                             ; $808928  AA           MX
    LDA $A14C,X                     ; $808929  BD 4C A1     MX
    STA $02E7                       ; $80892C  8D E7 02     MX
    LDA $A14E,X                     ; $80892F  BD 4E A1     MX
    STA $02E9                       ; $808932  8D E9 02     MX
    STZ $030B                       ; $808935  9C 0B 03     MX
    STZ $030D                       ; $808938  9C 0D 03     MX
    STZ $0E1C                       ; $80893B  9C 1C 0E     MX
    LDA #$2800                      ; $80893E  A9 00 28     MX
    STA $1264                       ; $808941  8D 64 12     MX
    LDX #$0000                      ; $808944  A2 00 00     MX
    LDA #$2800                      ; $808947  A9 00 28     MX
    STA $1266                       ; $80894A  8D 66 12     MX
L_80894D:
    STA $7F85C0,X                   ; $80894D  9F C0 85 7F  MX
    CLC                             ; $808951  18           MX
    ADC #$0008                      ; $808952  69 08 00     MX
    INX                             ; $808955  E8           MX
    INX                             ; $808956  E8           MX
    CPX #$0258                      ; $808957  E0 58 02     MX
    BNE L_80894D                    ; $80895A  D0 F1        MX
    SEP #$30                        ; $80895C  E2 30        MX
    STZ $0BEC                       ; $80895E  9C EC 0B     mx
    LDA #$01                        ; $808961  A9 01        mx
    STA $0E1E                       ; $808963  8D 1E 0E     mx
    RTS                             ; $808966  60           mx
L_808967:
    LDY #$00                        ; $808967  A0 00        mx
    LDA $0255                       ; $808969  AD 55 02     mx
    BEQ L_808970                    ; $80896C  F0 02        mx
    LDY #$07                        ; $80896E  A0 07        mx
L_808970:
    TYA                             ; $808970  98           mx
    STA $0E91,X                     ; $808971  9D 91 0E     mx
    STA $0E95,X                     ; $808974  9D 95 0E     mx
    STA $0E9D,X                     ; $808977  9D 9D 0E     mx
    STA $0EA5,X                     ; $80897A  9D A5 0E     mx
    STA $0EA1,X                     ; $80897D  9D A1 0E     mx
    STA $0E99,X                     ; $808980  9D 99 0E     mx
    STA $0EA9,X                     ; $808983  9D A9 0E     mx
    STA $0EAD,X                     ; $808986  9D AD 0E     mx
    LDA #$05                        ; $808989  A9 05        mx
    STA $0EF9,X                     ; $80898B  9D F9 0E     mx
    LDA $1F40                       ; $80898E  AD 40 1F     mx
    STA $0EF1,X                     ; $808991  9D F1 0E     mx
    LDA #$08                        ; $808994  A9 08        mx
    STA $0C21,X                     ; $808996  9D 21 0C     mx
    STA $0EFD,X                     ; $808999  9D FD 0E     mx
    STZ $022A,X                     ; $80899C  9E 2A 02     mx
    STZ $022E,X                     ; $80899F  9E 2E 02     mx
    STZ $0232,X                     ; $8089A2  9E 32 02     mx
    STZ $0F01,X                     ; $8089A5  9E 01 0F     mx
    STZ $0EF5,X                     ; $8089A8  9E F5 0E     mx
    STZ $0C39,X                     ; $8089AB  9E 39 0C     mx
    JSL L_81C585                    ; $8089AE  22 85 C5 81  mx
    STZ $0C41,X                     ; $8089B2  9E 41 0C     mx
    STZ $0C45,X                     ; $8089B5  9E 45 0C     mx
    STZ $0A1A,X                     ; $8089B8  9E 1A 0A     mx
    STZ $0A1E,X                     ; $8089BB  9E 1E 0A     mx
    STZ $0C29,X                     ; $8089BE  9E 29 0C     mx
    STZ $0C2D,X                     ; $8089C1  9E 2D 0C     mx
    STZ $0C72,X                     ; $8089C4  9E 72 0C     mx
    STZ $0C9B,X                     ; $8089C7  9E 9B 0C     mx
    STZ $0C9F,X                     ; $8089CA  9E 9F 0C     mx
    STZ $0CCD,X                     ; $8089CD  9E CD 0C     mx
    STZ $0CD1,X                     ; $8089D0  9E D1 0C     mx
    STZ $0CD5,X                     ; $8089D3  9E D5 0C     mx
    STZ $0CDD,X                     ; $8089D6  9E DD 0C     mx
    STZ $0CE1,X                     ; $8089D9  9E E1 0C     mx
    STZ $0CE5,X                     ; $8089DC  9E E5 0C     mx
    STZ $0A5B,X                     ; $8089DF  9E 5B 0A     mx
    STZ $0C05,X                     ; $8089E2  9E 05 0C     mx
    STZ $0C25,X                     ; $8089E5  9E 25 0C     mx
    STZ $0BAC,X                     ; $8089E8  9E AC 0B     mx
    STZ $0B67,X                     ; $8089EB  9E 67 0B     mx
    STZ $0ED3,X                     ; $8089EE  9E D3 0E     mx
    STZ $0A53,X                     ; $8089F1  9E 53 0A     mx
    STZ $0CC5,X                     ; $8089F4  9E C5 0C     mx
    STZ $0C93,X                     ; $8089F7  9E 93 0C     mx
    STZ $0C8F,X                     ; $8089FA  9E 8F 0C     mx
    STZ $0C7E,X                     ; $8089FD  9E 7E 0C     mx
    STZ $0C82,X                     ; $808A00  9E 82 0C     mx
    STZ $0C86,X                     ; $808A03  9E 86 0C     mx
    STZ $0C8A,X                     ; $808A06  9E 8A 0C     mx
    STZ $0C76,X                     ; $808A09  9E 76 0C     mx
    STZ $0B4C,X                     ; $808A0C  9E 4C 0B     mx
    STZ $0B50,X                     ; $808A0F  9E 50 0B     mx
    STZ $48,X                       ; $808A12  74 48        mx
    STZ $80,X                       ; $808A14  74 80        mx
    STZ $84,X                       ; $808A16  74 84        mx
    STZ $0C97,X                     ; $808A18  9E 97 0C     mx
    STZ $0CB9,X                     ; $808A1B  9E B9 0C     mx
    STZ $0E45,X                     ; $808A1E  9E 45 0E     mx
    STZ $0CBD,X                     ; $808A21  9E BD 0C     mx
    STZ $13AB,X                     ; $808A24  9E AB 13     mx
    STZ $0CC1,X                     ; $808A27  9E C1 0C     mx
    STZ $0E53,X                     ; $808A2A  9E 53 0E     mx
    STZ $0E57,X                     ; $808A2D  9E 57 0E     mx
    STZ $0E5B,X                     ; $808A30  9E 5B 0E     mx
    STZ $0E5F,X                     ; $808A33  9E 5F 0E     mx
    STZ $0E63,X                     ; $808A36  9E 63 0E     mx
    STZ $0E67,X                     ; $808A39  9E 67 0E     mx
    STZ $0E6B,X                     ; $808A3C  9E 6B 0E     mx
    STZ $0A45,X                     ; $808A3F  9E 45 0A     mx
    STZ $0A4B,X                     ; $808A42  9E 4B 0A     mx
    STZ $0A7A,X                     ; $808A45  9E 7A 0A     mx
    STZ $0A7E,X                     ; $808A48  9E 7E 0A     mx
    STZ $0E4F,X                     ; $808A4B  9E 4F 0E     mx
    LDY $0E25,X                     ; $808A4E  BC 25 0E     mx
    BNE L_808A68                    ; $808A51  D0 15        mx
    LDA $02A2,X                     ; $808A53  BD A2 02     mx  car_color
    STA $0E2D,X                     ; $808A56  9D 2D 0E     mx
    JSR L_808ACE                    ; $808A59  20 CE 8A     mx
    STA $0EDF,X                     ; $808A5C  9D DF 0E     mx
    JSL L_92E593                    ; $808A5F  22 93 E5 92  mx
    JSL L_81ABBC                    ; $808A63  22 BC AB 81  mx
    RTS                             ; $808A67  60           mx
L_808A68:
    LDY $0E31                       ; $808A68  AC 31 0E     mx
    LDA $A168,Y                     ; $808A6B  B9 68 A1     mx
    STA $0E2D,X                     ; $808A6E  9D 2D 0E     mx
    INY                             ; $808A71  C8           mx
    STY $0E31                       ; $808A72  8C 31 0E     mx
    LDA $0299                       ; $808A75  AD 99 02     mx  planet
    ASL                             ; $808A78  0A           mx
    ADC $029A                       ; $808A79  6D 9A 02     mx  division
    ASL                             ; $808A7C  0A           mx
    ASL                             ; $808A7D  0A           mx
    ADC $0E32                       ; $808A7E  6D 32 0E     mx
    TAY                             ; $808A81  A8           mx
    LDA $A181,Y                     ; $808A82  B9 81 A1     mx
    STA $0DF2,X                     ; $808A85  9D F2 0D     mx
    TAY                             ; $808A88  A8           mx
    INC $0E32                       ; $808A89  EE 32 0E     mx
    LDA $A1B1,Y                     ; $808A8C  B9 B1 A1     mx
    STA $0E33,X                     ; $808A8F  9D 33 0E     mx
    LDA $A1B6,Y                     ; $808A92  B9 B6 A1     mx
    STA $0E37,X                     ; $808A95  9D 37 0E     mx
    LDA $A1BB,Y                     ; $808A98  B9 BB A1     mx
    STA $0E3B,X                     ; $808A9B  9D 3B 0E     mx
    LDA $0F0E                       ; $808A9E  AD 0E 0F     mx
    BEQ L_808AC3                    ; $808AA1  F0 20        mx
    LDA #$03                        ; $808AA3  A9 03        mx
    STA $0DFE,X                     ; $808AA5  9D FE 0D     mx
    LDA #$2C                        ; $808AA8  A9 2C        mx
    STA $0EE5,X                     ; $808AAA  9D E5 0E     mx
    LDA #$F0                        ; $808AAD  A9 F0        mx
    STA $0EE9,X                     ; $808AAF  9D E9 0E     mx
    LDA #$D0                        ; $808AB2  A9 D0        mx
    STA $0ED7,X                     ; $808AB4  9D D7 0E     mx
    LDA #$08                        ; $808AB7  A9 08        mx
    STA $0EDB,X                     ; $808AB9  9D DB 0E     mx
    LDA #$30                        ; $808ABC  A9 30        mx
    STA $0EED,X                     ; $808ABE  9D ED 0E     mx
    BRA L_808AC7                    ; $808AC1  80 04        mx
L_808AC3:
    JSL L_92E60B                    ; $808AC3  22 0B E6 92  mx
L_808AC7:
    JSR L_808ACE                    ; $808AC7  20 CE 8A     mx
    STA $0EDF,X                     ; $808ACA  9D DF 0E     mx
    RTS                             ; $808ACD  60           mx
L_808ACE:
    LDY $0DFE,X                     ; $808ACE  BC FE 0D     mx
    LDA $A13A,Y                     ; $808AD1  B9 3A A1     mx
    RTS                             ; $808AD4  60           mx
L_808AD5:
    LDA $0BEF                       ; $808AD5  AD EF 0B     mx
    BEQ L_808AFE                    ; $808AD8  F0 24        mx
    DEC $0BEF                       ; $808ADA  CE EF 0B     mx
    BEQ L_808AF3                    ; $808ADD  F0 14        mx
    CMP #$28                        ; $808ADF  C9 28        mx
    BNE L_808AFE                    ; $808AE1  D0 1B        mx
    LDA $1AED                       ; $808AE3  AD ED 1A     mx
    EOR #$01                        ; $808AE6  49 01        mx
    STA $1AED                       ; $808AE8  8D ED 1A     mx
    CLC                             ; $808AEB  18           mx
    ADC #$26                        ; $808AEC  69 26        mx
    JSR L_80F998                    ; $808AEE  20 98 F9     mx
    BRA L_808AFE                    ; $808AF1  80 0B        mx
L_808AF3:
    INC $0BEB                       ; $808AF3  EE EB 0B     mx
    LDX #$0F                        ; $808AF6  A2 0F        mx
L_808AF8:
    STZ $0EB1,X                     ; $808AF8  9E B1 0E     mx
    DEX                             ; $808AFB  CA           mx
    BPL L_808AF8                    ; $808AFC  10 FA        mx
L_808AFE:
    LDX #$00                        ; $808AFE  A2 00        mx
    JSR L_808B0F                    ; $808B00  20 0F 8B     mx
    LDX #$01                        ; $808B03  A2 01        mx
    JSR L_808B0F                    ; $808B05  20 0F 8B     mx
    LDX #$02                        ; $808B08  A2 02        mx
    JSR L_808B0F                    ; $808B0A  20 0F 8B     mx
    LDX #$03                        ; $808B0D  A2 03        mx
L_808B0F:
    STX $0BD0                       ; $808B0F  8E D0 0B     mx
    LDA $0C7E,X                     ; $808B12  BD 7E 0C     mx
    BNE L_808B41                    ; $808B15  D0 2A        mx
    LDA $0A6E,X                     ; $808B17  BD 6E 0A     mx
    STA $0BDA                       ; $808B1A  8D DA 0B     mx
    LDA $0A6A,X                     ; $808B1D  BD 6A 0A     mx
    STA $0BD9                       ; $808B20  8D D9 0B     mx
    LDA $0EF1,X                     ; $808B23  BD F1 0E     mx
    BNE L_808B41                    ; $808B26  D0 19        mx
    LDA $0C21,X                     ; $808B28  BD 21 0C     mx
    CMP #$02                        ; $808B2B  C9 02        mx
    BCS L_808B3E                    ; $808B2D  B0 0F        mx
    INC $0BD9                       ; $808B2F  EE D9 0B     mx
    CMP #$01                        ; $808B32  C9 01        mx
    BNE L_808B41                    ; $808B34  D0 0B        mx
    STZ $0E5B,X                     ; $808B36  9E 5B 0E     mx
    LDA #$01                        ; $808B39  A9 01        mx
    JSR L_80CD91                    ; $808B3B  20 91 CD     mx
L_808B3E:
    DEC $0C21,X                     ; $808B3E  DE 21 0C     mx
L_808B41:
    LDA $0A4F,X                     ; $808B41  BD 4F 0A     mx
    STA $0BCC                       ; $808B44  8D CC 0B     mx
    LDA $48,X                       ; $808B47  B5 48        mx
    STA $0B94                       ; $808B49  8D 94 0B     mx
    LDA $0C7A,X                     ; $808B4C  BD 7A 0C     mx
    STA $0BD8                       ; $808B4F  8D D8 0B     mx
    LDA $0C9F,X                     ; $808B52  BD 9F 0C     mx
    STA $0BCE                       ; $808B55  8D CE 0B     mx
    JSR L_809073                    ; $808B58  20 73 90     mx
    LDA $0BCE                       ; $808B5B  AD CE 0B     mx
    STA $0C9F,X                     ; $808B5E  9D 9F 0C     mx
    LDA $0BD8                       ; $808B61  AD D8 0B     mx
    STA $0C7A,X                     ; $808B64  9D 7A 0C     mx
    LDA $80,X                       ; $808B67  B5 80        mx
    STA $0BC0                       ; $808B69  8D C0 0B     mx
    LDA $84,X                       ; $808B6C  B5 84        mx
    STA $0BC1                       ; $808B6E  8D C1 0B     mx
    LDA $0C35,X                     ; $808B71  BD 35 0C     mx
    STA $0B9E                       ; $808B74  8D 9E 0B     mx
    LDA $0C31,X                     ; $808B77  BD 31 0C     mx
    STA $0B9F                       ; $808B7A  8D 9F 0B     mx
    LDA $0C25,X                     ; $808B7D  BD 25 0C     mx
    STA $0BB6                       ; $808B80  8D B6 0B     mx
    LDA $0C9B,X                     ; $808B83  BD 9B 0C     mx
    STA $0BCF                       ; $808B86  8D CF 0B     mx
    LDA $0C72,X                     ; $808B89  BD 72 0C     mx
    STA $0B8F                       ; $808B8C  8D 8F 0B     mx
    JSR L_80A009                    ; $808B8F  20 09 A0     mx
    LDA $0C97,X                     ; $808B92  BD 97 0C     mx
    STA $0BD3                       ; $808B95  8D D3 0B     mx
    LDA $0C93,X                     ; $808B98  BD 93 0C     mx
    STA $0BDC                       ; $808B9B  8D DC 0B     mx
    LDA $0CBD,X                     ; $808B9E  BD BD 0C     mx
    STA $0BF3                       ; $808BA1  8D F3 0B     mx
    JSR L_808C9A                    ; $808BA4  20 9A 8C     mx
    LDA $0BF3                       ; $808BA7  AD F3 0B     mx
    STA $0CBD,X                     ; $808BAA  9D BD 0C     mx
    LDA $0BD3                       ; $808BAD  AD D3 0B     mx
    STA $0C97,X                     ; $808BB0  9D 97 0C     mx
    LDA $0B8F                       ; $808BB3  AD 8F 0B     mx
    STA $0C72,X                     ; $808BB6  9D 72 0C     mx
    LDA $0BCF                       ; $808BB9  AD CF 0B     mx
    STA $0C9B,X                     ; $808BBC  9D 9B 0C     mx
    LDA $0B94                       ; $808BBF  AD 94 0B     mx
    STA $48,X                       ; $808BC2  95 48        mx
    LDA $0BC0                       ; $808BC4  AD C0 0B     mx
    STA $80,X                       ; $808BC7  95 80        mx
    LDA $0BC1                       ; $808BC9  AD C1 0B     mx
    STA $84,X                       ; $808BCC  95 84        mx
    RTS                             ; $808BCE  60           mx
L_808BCF:
    LDX #$00                        ; $808BCF  A2 00        mx
    JSR L_808BE0                    ; $808BD1  20 E0 8B     mx
    LDX #$01                        ; $808BD4  A2 01        mx
    JSR L_808BE0                    ; $808BD6  20 E0 8B     mx
    LDX #$02                        ; $808BD9  A2 02        mx
    JSR L_808BE0                    ; $808BDB  20 E0 8B     mx
    LDX #$03                        ; $808BDE  A2 03        mx
L_808BE0:
    LDY $0CC1,X                     ; $808BE0  BC C1 0C     mx
    BEQ L_808BF9                    ; $808BE3  F0 14        mx
    LDA $8BEE,Y                     ; $808BE5  B9 EE 8B     mx
    STA $0B33,X                     ; $808BE8  9D 33 0B     mx
    STZ $0B3B,X                     ; $808BEB  9E 3B 0B     mx
    RTS                             ; $808BEE  60           mx
    db $2D,$2D,$2E,$2E,$2F,$2F,$30,$30,$31,$31                         ; $808BEF
L_808BF9:
    LDA $0C7E,X                     ; $808BF9  BD 7E 0C     mx
    BNE L_808C16                    ; $808BFC  D0 18        mx
    LDA $0C25,X                     ; $808BFE  BD 25 0C     mx
    BEQ L_808C06                    ; $808C01  F0 03        mx
    JMP L_808C76                    ; $808C03  4C 76 8C     mx
L_808C06:
    LDY $0C7A,X                     ; $808C06  BC 7A 0C     mx
    LDA $DB4C,Y                     ; $808C09  B9 4C DB     mx
    STA $0B33,X                     ; $808C0C  9D 33 0B     mx
    LDA $DB6C,Y                     ; $808C0F  B9 6C DB     mx
    STA $0B3B,X                     ; $808C12  9D 3B 0B     mx
    RTS                             ; $808C15  60           mx
L_808C16:
    LDA $0C82,X                     ; $808C16  BD 82 0C     mx
    BEQ L_808C1F                    ; $808C19  F0 04        mx
    LDA #$FC                        ; $808C1B  A9 FC        mx
    BRA L_808C66                    ; $808C1D  80 47        mx
L_808C1F:
    LDA $0C76,X                     ; $808C1F  BD 76 0C     mx
    CLC                             ; $808C22  18           mx
    ADC #$80                        ; $808C23  69 80        mx
    CMP #$70                        ; $808C25  C9 70        mx
    BCS L_808C2D                    ; $808C27  B0 04        mx
    LDA #$FC                        ; $808C29  A9 FC        mx
    BRA L_808C66                    ; $808C2B  80 39        mx
L_808C2D:
    CMP #$74                        ; $808C2D  C9 74        mx
    BCS L_808C35                    ; $808C2F  B0 04        mx
    LDA #$FD                        ; $808C31  A9 FD        mx
    BRA L_808C66                    ; $808C33  80 31        mx
L_808C35:
    CMP #$78                        ; $808C35  C9 78        mx
    BCS L_808C3D                    ; $808C37  B0 04        mx
    LDA #$FE                        ; $808C39  A9 FE        mx
    BRA L_808C66                    ; $808C3B  80 29        mx
L_808C3D:
    CMP #$7C                        ; $808C3D  C9 7C        mx
    BCS L_808C45                    ; $808C3F  B0 04        mx
    LDA #$FF                        ; $808C41  A9 FF        mx
    BRA L_808C66                    ; $808C43  80 21        mx
L_808C45:
    CMP #$84                        ; $808C45  C9 84        mx
    BCS L_808C4C                    ; $808C47  B0 03        mx
    JMP L_808C06                    ; $808C49  4C 06 8C     mx
L_808C4C:
    CMP #$88                        ; $808C4C  C9 88        mx
    BCS L_808C54                    ; $808C4E  B0 04        mx
    LDA #$01                        ; $808C50  A9 01        mx
    BRA L_808C66                    ; $808C52  80 12        mx
L_808C54:
    CMP #$8C                        ; $808C54  C9 8C        mx
    BCS L_808C5C                    ; $808C56  B0 04        mx
    LDA #$02                        ; $808C58  A9 02        mx
    BRA L_808C66                    ; $808C5A  80 0A        mx
L_808C5C:
    CMP #$90                        ; $808C5C  C9 90        mx
    BCS L_808C64                    ; $808C5E  B0 04        mx
    LDA #$03                        ; $808C60  A9 03        mx
    BRA L_808C66                    ; $808C62  80 02        mx
L_808C64:
    LDA #$04                        ; $808C64  A9 04        mx
L_808C66:
    LDY $0C7A,X                     ; $808C66  BC 7A 0C     mx
    CPY #$08                        ; $808C69  C0 08        mx
    BCC L_808C77                    ; $808C6B  90 0A        mx
    CPY #$18                        ; $808C6D  C0 18        mx
    BCS L_808C77                    ; $808C6F  B0 06        mx
    EOR #$FF                        ; $808C71  49 FF        mx
    INC                             ; $808C73  1A           mx
    BRA L_808C77                    ; $808C74  80 01        mx
L_808C76:
    ASL                             ; $808C76  0A           mx
L_808C77:
    CLC                             ; $808C77  18           mx
    ADC #$04                        ; $808C78  69 04        mx
    CMP #$05                        ; $808C7A  C9 05        mx
    BCC L_808C7F                    ; $808C7C  90 01        mx
    DEC                             ; $808C7E  3A           mx
L_808C7F:
    ASL                             ; $808C7F  0A           mx
    ASL                             ; $808C80  0A           mx
    ASL                             ; $808C81  0A           mx
    ASL                             ; $808C82  0A           mx
    ASL                             ; $808C83  0A           mx
    ADC $0C7A,X                     ; $808C84  7D 7A 0C     mx
    TAY                             ; $808C87  A8           mx
    LDA $A03A,Y                     ; $808C88  B9 3A A0     mx
    ADC #$0C                        ; $808C8B  69 0C        mx
    STA $0B33,X                     ; $808C8D  9D 33 0B     mx
    LDY $0C7A,X                     ; $808C90  BC 7A 0C     mx
    LDA $DB6C,Y                     ; $808C93  B9 6C DB     mx
    STA $0B3B,X                     ; $808C96  9D 3B 0B     mx
    RTS                             ; $808C99  60           mx
L_808C9A:
    LDA $0BEF                       ; $808C9A  AD EF 0B     mx
    BEQ L_808CA0                    ; $808C9D  F0 01        mx
    RTS                             ; $808C9F  60           mx
L_808CA0:
    LDA $0EDF,X                     ; $808CA0  BD DF 0E     mx
    BNE L_808CA6                    ; $808CA3  D0 01        mx
    RTS                             ; $808CA5  60           mx
L_808CA6:
    LDA $0BD8                       ; $808CA6  AD D8 0B     mx
    LSR                             ; $808CA9  4A           mx
    STA $0BD7                       ; $808CAA  8D D7 0B     mx
    LDA $0BD4                       ; $808CAD  AD D4 0B     mx
    EOR #$FF                        ; $808CB0  49 FF        mx
    INC                             ; $808CB2  1A           mx
    STA $0BD5                       ; $808CB3  8D D5 0B     mx
    LDY $0299                       ; $808CB6  AC 99 02     mx  planet
    LDA $A146,Y                     ; $808CB9  B9 46 A1     mx
    STA $0BDD                       ; $808CBC  8D DD 0B     mx
    LDA $0ED7,X                     ; $808CBF  BD D7 0E     mx
    STA $0B90                       ; $808CC2  8D 90 0B     mx
    LDA $0EDB,X                     ; $808CC5  BD DB 0E     mx
    STA $0B91                       ; $808CC8  8D 91 0B     mx
    LDA $0BF3                       ; $808CCB  AD F3 0B     mx
    BEQ L_808CDD                    ; $808CCE  F0 0D        mx
    LDA #$0A                        ; $808CD0  A9 0A        mx
    STA $0B90                       ; $808CD2  8D 90 0B     mx
    DEC $0BF3                       ; $808CD5  CE F3 0B     mx
    LDA #$FF                        ; $808CD8  A9 FF        mx
    STA $0BDD                       ; $808CDA  8D DD 0B     mx
L_808CDD:
    LDA $0C7E,X                     ; $808CDD  BD 7E 0C     mx
    BNE L_808D51                    ; $808CE0  D0 6F        mx
    LDA $0BB6                       ; $808CE2  AD B6 0B     mx
    AND #$01                        ; $808CE5  29 01        mx
    BEQ L_808D00                    ; $808CE7  F0 17        mx
    LDA $0B8F                       ; $808CE9  AD 8F 0B     mx
    LDY $1F41                       ; $808CEC  AC 41 1F     mx
    CPY #$04                        ; $808CEF  C0 04        mx
    BCC L_808CF8                    ; $808CF1  90 05        mx
    CLC                             ; $808CF3  18           mx
    ADC #$80                        ; $808CF4  69 80        mx
    BRA L_808CFB                    ; $808CF6  80 03        mx
L_808CF8:
    CLC                             ; $808CF8  18           mx
    ADC #$40                        ; $808CF9  69 40        mx
L_808CFB:
    STA $0B8F                       ; $808CFB  8D 8F 0B     mx
    BCC L_808D51                    ; $808CFE  90 51        mx
L_808D00:
    LDA $0B9E                       ; $808D00  AD 9E 0B     mx
    CMP #$04                        ; $808D03  C9 04        mx
    BEQ L_808D0B                    ; $808D05  F0 04        mx
    CMP #$05                        ; $808D07  C9 05        mx
    BNE L_808D51                    ; $808D09  D0 46        mx
L_808D0B:
    SEC                             ; $808D0B  38           mx
    SBC #$04                        ; $808D0C  E9 04        mx
    ASL                             ; $808D0E  0A           mx
    ASL                             ; $808D0F  0A           mx
    ASL                             ; $808D10  0A           mx
    ASL                             ; $808D11  0A           mx
    ASL                             ; $808D12  0A           mx
    ADC $0BD7                       ; $808D13  6D D7 0B     mx
    TAY                             ; $808D16  A8           mx
    PHY                             ; $808D17  5A           mx
    LDA $901E,Y                     ; $808D18  B9 1E 90     mx
    TAY                             ; $808D1B  A8           mx
    LDA $0BB6                       ; $808D1C  AD B6 0B     mx
    EOR #$FF                        ; $808D1F  49 FF        mx
    INC                             ; $808D21  1A           mx
    JSR L_809DE9                    ; $808D22  20 E9 9D     mx
    LDY $1F41                       ; $808D25  AC 41 1F     mx
    CPY #$08                        ; $808D28  C0 08        mx
    BCC L_808D2D                    ; $808D2A  90 01        mx
    ASL                             ; $808D2C  0A           mx
L_808D2D:
    CLC                             ; $808D2D  18           mx
    ADC $0BC0                       ; $808D2E  6D C0 0B     mx
    STA $0BC0                       ; $808D31  8D C0 0B     mx
    PLY                             ; $808D34  7A           mx
    LDA $902E,Y                     ; $808D35  B9 2E 90     mx
    TAY                             ; $808D38  A8           mx
    LDA $0BB6                       ; $808D39  AD B6 0B     mx
    EOR #$FF                        ; $808D3C  49 FF        mx
    INC                             ; $808D3E  1A           mx
    JSR L_809DE9                    ; $808D3F  20 E9 9D     mx
    LDY $1F41                       ; $808D42  AC 41 1F     mx
    CPY #$08                        ; $808D45  C0 08        mx
    BCC L_808D4A                    ; $808D47  90 01        mx
    ASL                             ; $808D49  0A           mx
L_808D4A:
    CLC                             ; $808D4A  18           mx
    ADC $0BC1                       ; $808D4B  6D C1 0B     mx
    STA $0BC1                       ; $808D4E  8D C1 0B     mx
L_808D51:
    LDA $0BD8                       ; $808D51  AD D8 0B     mx
    LSR                             ; $808D54  4A           mx
    CLC                             ; $808D55  18           mx
    ADC #$04                        ; $808D56  69 04        mx
    ASL                             ; $808D58  0A           mx
    TAY                             ; $808D59  A8           mx
    REP #$30                        ; $808D5A  C2 30        mx
    LDA $8FEE,Y                     ; $808D5C  B9 EE 8F     MX
    STA $0B96                       ; $808D5F  8D 96 0B     MX
    SEP #$30                        ; $808D62  E2 30        MX
    LDA $0BC0                       ; $808D64  AD C0 0B     mx
    STA $0B98                       ; $808D67  8D 98 0B     mx
    JSR L_809D9C                    ; $808D6A  20 9C 9D     mx
    REP #$30                        ; $808D6D  C2 30        mx
    LDA $0B9A                       ; $808D6F  AD 9A 0B     MX
    STA $0BB4                       ; $808D72  8D B4 0B     MX
    SEP #$30                        ; $808D75  E2 30        MX
    LDA $0BD8                       ; $808D77  AD D8 0B     mx
    LSR                             ; $808D7A  4A           mx
    CLC                             ; $808D7B  18           mx
    ADC #$08                        ; $808D7C  69 08        mx
    ASL                             ; $808D7E  0A           mx
    TAY                             ; $808D7F  A8           mx
    REP #$30                        ; $808D80  C2 30        mx
    LDA $8FEE,Y                     ; $808D82  B9 EE 8F     MX
    STA $0B96                       ; $808D85  8D 96 0B     MX
    SEP #$30                        ; $808D88  E2 30        MX
    LDA $0BC1                       ; $808D8A  AD C1 0B     mx
    STA $0B98                       ; $808D8D  8D 98 0B     mx
    JSR L_809D9C                    ; $808D90  20 9C 9D     mx
    REP #$30                        ; $808D93  C2 30        mx
    LDA $0BB4                       ; $808D95  AD B4 0B     MX
    CLC                             ; $808D98  18           MX
    ADC $0B9A                       ; $808D99  6D 9A 0B     MX
    ADC #$0080                      ; $808D9C  69 80 00     MX
    STA $0BB4                       ; $808D9F  8D B4 0B     MX
    SEP #$30                        ; $808DA2  E2 30        MX
    LDA $0BB5                       ; $808DA4  AD B5 0B     mx
    STA $0B94                       ; $808DA7  8D 94 0B     mx
    LDA $0C7E,X                     ; $808DAA  BD 7E 0C     mx
    BNE L_808DC1                    ; $808DAD  D0 12        mx
    LDA $0BDC                       ; $808DAF  AD DC 0B     mx
    BNE L_808DC0                    ; $808DB2  D0 0C        mx
    LDA $0B90                       ; $808DB4  AD 90 0B     mx
    CLC                             ; $808DB7  18           mx
    ADC $0BCF                       ; $808DB8  6D CF 0B     mx
    STA $0BCF                       ; $808DBB  8D CF 0B     mx
    BCS L_808DC1                    ; $808DBE  B0 01        mx
L_808DC0:
    RTS                             ; $808DC0  60           mx
L_808DC1:
    LDA $0BD8                       ; $808DC1  AD D8 0B     mx
    AND #$FE                        ; $808DC4  29 FE        mx
    TAY                             ; $808DC6  A8           mx
    REP #$30                        ; $808DC7  C2 30        mx
    LDA $8FEE,Y                     ; $808DC9  B9 EE 8F     MX
    STA $0B96                       ; $808DCC  8D 96 0B     MX
    SEP #$30                        ; $808DCF  E2 30        MX
    LDA $0BC0                       ; $808DD1  AD C0 0B     mx
    STA $0B98                       ; $808DD4  8D 98 0B     mx
    JSR L_809D9C                    ; $808DD7  20 9C 9D     mx
    REP #$30                        ; $808DDA  C2 30        mx
    LDA $0B9A                       ; $808DDC  AD 9A 0B     MX
    STA $0BB4                       ; $808DDF  8D B4 0B     MX
    SEP #$30                        ; $808DE2  E2 30        MX
    LDA $0BD8                       ; $808DE4  AD D8 0B     mx
    LSR                             ; $808DE7  4A           mx
    CLC                             ; $808DE8  18           mx
    ADC #$04                        ; $808DE9  69 04        mx
    ASL                             ; $808DEB  0A           mx
    TAY                             ; $808DEC  A8           mx
    REP #$30                        ; $808DED  C2 30        mx
    LDA $8FEE,Y                     ; $808DEF  B9 EE 8F     MX
    STA $0B96                       ; $808DF2  8D 96 0B     MX
    SEP #$30                        ; $808DF5  E2 30        MX
    LDA $0BC1                       ; $808DF7  AD C1 0B     mx
    STA $0B98                       ; $808DFA  8D 98 0B     mx
    JSR L_809D9C                    ; $808DFD  20 9C 9D     mx
    REP #$30                        ; $808E00  C2 30        mx
    LDA $0BB4                       ; $808E02  AD B4 0B     MX
    CLC                             ; $808E05  18           MX
    ADC $0B9A                       ; $808E06  6D 9A 0B     MX
    ADC #$0080                      ; $808E09  69 80 00     MX
    STA $0BB4                       ; $808E0C  8D B4 0B     MX
    SEP #$30                        ; $808E0F  E2 30        MX
    LDA $0BB5                       ; $808E11  AD B5 0B     mx
    STA $0B95                       ; $808E14  8D 95 0B     mx
    LDA $0C7E,X                     ; $808E17  BD 7E 0C     mx
    BEQ L_808E1F                    ; $808E1A  F0 03        mx
    JMP L_808EF5                    ; $808E1C  4C F5 8E     mx
L_808E1F:
    LDA $0B95                       ; $808E1F  AD 95 0B     mx
    BPL L_808E27                    ; $808E22  10 03        mx
    EOR #$FF                        ; $808E24  49 FF        mx
    INC                             ; $808E26  1A           mx
L_808E27:
    CMP #$05                        ; $808E27  C9 05        mx
    BCS L_808E33                    ; $808E29  B0 08        mx
    STZ $0B93                       ; $808E2B  9C 93 0B     mx
    STZ $0B95                       ; $808E2E  9C 95 0B     mx
    BRA L_808E60                    ; $808E31  80 2D        mx
L_808E33:
    CMP #$19                        ; $808E33  C9 19        mx
    BCC L_808E52                    ; $808E35  90 1B        mx
    LDX $0BD0                       ; $808E37  AE D0 0B     mx
    LDA $0DF2,X                     ; $808E3A  BD F2 0D     mx
    CMP #$00                        ; $808E3D  C9 00        mx
    BEQ L_808E4A                    ; $808E3F  F0 09        mx
    CMP #$01                        ; $808E41  C9 01        mx
    BEQ L_808E4A                    ; $808E43  F0 05        mx
    LDA #$0A                        ; $808E45  A9 0A        mx
    JSR L_80F966                    ; $808E47  20 66 F9     mx
L_808E4A:
    LDX $0BD0                       ; $808E4A  AE D0 0B     mx
    LDA #$01                        ; $808E4D  A9 01        mx
    JSR L_80C7B0                    ; $808E4F  20 B0 C7     mx
L_808E52:
    LDA $0B91                       ; $808E52  AD 91 0B     mx
    LDY $0B95                       ; $808E55  AC 95 0B     mx
    BMI L_808E5D                    ; $808E58  30 03        mx
    EOR #$FF                        ; $808E5A  49 FF        mx
    INC                             ; $808E5C  1A           mx
L_808E5D:
    STA $0B93                       ; $808E5D  8D 93 0B     mx
L_808E60:
    LDA $0E5B,X                     ; $808E60  BD 5B 0E     mx
    BEQ L_808E86                    ; $808E63  F0 21        mx
    CMP #$05                        ; $808E65  C9 05        mx
    BCC L_808E6B                    ; $808E67  90 02        mx
    LDA #$05                        ; $808E69  A9 05        mx
L_808E6B:
    CLC                             ; $808E6B  18           mx
    ADC $0EE5,X                     ; $808E6C  7D E5 0E     mx
    CMP #$30                        ; $808E6F  C9 30        mx
    BCC L_808E75                    ; $808E71  90 02        mx
    LDA #$30                        ; $808E73  A9 30        mx
L_808E75:
    STA $0BD4                       ; $808E75  8D D4 0B     mx
    EOR #$FF                        ; $808E78  49 FF        mx
    INC                             ; $808E7A  1A           mx
    STA $0BD5                       ; $808E7B  8D D5 0B     mx
    LDA #$0C                        ; $808E7E  A9 0C        mx
    STA $0B92                       ; $808E80  8D 92 0B     mx
    JMP L_808F18                    ; $808E83  4C 18 8F     mx
L_808E86:
    LDA $0BD9                       ; $808E86  AD D9 0B     mx
    BEQ L_808EC0                    ; $808E89  F0 35        mx
    LDA $0BD2                       ; $808E8B  AD D2 0B     mx
    CLC                             ; $808E8E  18           mx
    ADC $0BD3                       ; $808E8F  6D D3 0B     mx
    STA $0BD3                       ; $808E92  8D D3 0B     mx
    BCC L_808EA6                    ; $808E95  90 0F        mx
    LDA $0B94                       ; $808E97  AD 94 0B     mx
    BPL L_808E9F                    ; $808E9A  10 03        mx
    EOR #$FF                        ; $808E9C  49 FF        mx
    INC                             ; $808E9E  1A           mx
L_808E9F:
    CMP #$05                        ; $808E9F  C9 05        mx
    BCS L_808EAB                    ; $808EA1  B0 08        mx
    STZ $0B94                       ; $808EA3  9C 94 0B     mx
L_808EA6:
    STZ $0B92                       ; $808EA6  9C 92 0B     mx
    BRA L_808F18                    ; $808EA9  80 6D        mx
L_808EAB:
    LDA #$FA                        ; $808EAB  A9 FA        mx
    STA $0B92                       ; $808EAD  8D 92 0B     mx
    LDA $0B94                       ; $808EB0  AD 94 0B     mx
    BPL L_808F18                    ; $808EB3  10 63        mx
    LDA $0B92                       ; $808EB5  AD 92 0B     mx
    EOR #$FF                        ; $808EB8  49 FF        mx
    INC                             ; $808EBA  1A           mx
    STA $0B92                       ; $808EBB  8D 92 0B     mx
    BRA L_808F18                    ; $808EBE  80 58        mx
L_808EC0:
    LDA $0BDA                       ; $808EC0  AD DA 0B     mx
    BNE L_808F07                    ; $808EC3  D0 42        mx
    LDA $0BB6                       ; $808EC5  AD B6 0B     mx
    BEQ L_808ECB                    ; $808EC8  F0 01        mx
    RTS                             ; $808ECA  60           mx
L_808ECB:
    LDA $0B94                       ; $808ECB  AD 94 0B     mx
    BPL L_808ED3                    ; $808ECE  10 03        mx
    EOR #$FF                        ; $808ED0  49 FF        mx
    INC                             ; $808ED2  1A           mx
L_808ED3:
    CMP #$05                        ; $808ED3  C9 05        mx
    BCS L_808EDF                    ; $808ED5  B0 08        mx
    STZ $0B94                       ; $808ED7  9C 94 0B     mx
    STZ $0B92                       ; $808EDA  9C 92 0B     mx
    BRA L_808F18                    ; $808EDD  80 39        mx
L_808EDF:
    LDA $0BDD                       ; $808EDF  AD DD 0B     mx
    STA $0B92                       ; $808EE2  8D 92 0B     mx
    LDA $0B94                       ; $808EE5  AD 94 0B     mx
    BPL L_808F18                    ; $808EE8  10 2E        mx
    LDA $0B92                       ; $808EEA  AD 92 0B     mx
    EOR #$FF                        ; $808EED  49 FF        mx
    INC                             ; $808EEF  1A           mx
    STA $0B92                       ; $808EF0  8D 92 0B     mx
    BRA L_808F18                    ; $808EF3  80 23        mx
L_808EF5:
    STZ $0B92                       ; $808EF5  9C 92 0B     mx
    STZ $0B93                       ; $808EF8  9C 93 0B     mx
    LDA #$30                        ; $808EFB  A9 30        mx
    STA $0BD4                       ; $808EFD  8D D4 0B     mx
    LDA #$D0                        ; $808F00  A9 D0        mx
    STA $0BD5                       ; $808F02  8D D5 0B     mx
    BRA L_808F18                    ; $808F05  80 11        mx
L_808F07:
    LDA $0BD2                       ; $808F07  AD D2 0B     mx
    CLC                             ; $808F0A  18           mx
    ADC $0BD3                       ; $808F0B  6D D3 0B     mx
    STA $0BD3                       ; $808F0E  8D D3 0B     mx
    BCC L_808EA6                    ; $808F11  90 93        mx
    LDA #$03                        ; $808F13  A9 03        mx
    STA $0B92                       ; $808F15  8D 92 0B     mx
L_808F18:
    CLC                             ; $808F18  18           mx
    LDA $0B95                       ; $808F19  AD 95 0B     mx
    ADC $0B93                       ; $808F1C  6D 93 0B     mx
    STA $0B95                       ; $808F1F  8D 95 0B     mx
    CLC                             ; $808F22  18           mx
    LDA $0B94                       ; $808F23  AD 94 0B     mx
    ADC $0B92                       ; $808F26  6D 92 0B     mx
    STA $0B94                       ; $808F29  8D 94 0B     mx
    LDA $0B94                       ; $808F2C  AD 94 0B     mx
    JSR L_80905E                    ; $808F2F  20 5E 90     mx
    STA $0B94                       ; $808F32  8D 94 0B     mx
    LDA $0B95                       ; $808F35  AD 95 0B     mx
    JSR L_80905E                    ; $808F38  20 5E 90     mx
    STA $0B95                       ; $808F3B  8D 95 0B     mx
    LDA $0BD8                       ; $808F3E  AD D8 0B     mx
    LSR                             ; $808F41  4A           mx
    CLC                             ; $808F42  18           mx
    ADC #$04                        ; $808F43  69 04        mx
    ASL                             ; $808F45  0A           mx
    TAY                             ; $808F46  A8           mx
    REP #$30                        ; $808F47  C2 30        mx
    LDA $8FEE,Y                     ; $808F49  B9 EE 8F     MX
    STA $0B96                       ; $808F4C  8D 96 0B     MX
    SEP #$30                        ; $808F4F  E2 30        MX
    LDA $0B94                       ; $808F51  AD 94 0B     mx
    STA $0B98                       ; $808F54  8D 98 0B     mx
    JSR L_809D9C                    ; $808F57  20 9C 9D     mx
    REP #$30                        ; $808F5A  C2 30        mx
    LDA $0B9A                       ; $808F5C  AD 9A 0B     MX
    STA $0BB4                       ; $808F5F  8D B4 0B     MX
    SEP #$30                        ; $808F62  E2 30        MX
    LDA $0BD8                       ; $808F64  AD D8 0B     mx
    AND #$FE                        ; $808F67  29 FE        mx
    TAY                             ; $808F69  A8           mx
    REP #$30                        ; $808F6A  C2 30        mx
    LDA $8FEE,Y                     ; $808F6C  B9 EE 8F     MX
    STA $0B96                       ; $808F6F  8D 96 0B     MX
    SEP #$30                        ; $808F72  E2 30        MX
    LDA $0B95                       ; $808F74  AD 95 0B     mx
    STA $0B98                       ; $808F77  8D 98 0B     mx
    JSR L_809D9C                    ; $808F7A  20 9C 9D     mx
    REP #$30                        ; $808F7D  C2 30        mx
    LDA $0BB4                       ; $808F7F  AD B4 0B     MX
    CLC                             ; $808F82  18           MX
    ADC $0B9A                       ; $808F83  6D 9A 0B     MX
    ADC #$0080                      ; $808F86  69 80 00     MX
    STA $0BB4                       ; $808F89  8D B4 0B     MX
    SEP #$30                        ; $808F8C  E2 30        MX
    LDA $0BB5                       ; $808F8E  AD B5 0B     mx
    STA $0BC0                       ; $808F91  8D C0 0B     mx
    LDA $0BD8                       ; $808F94  AD D8 0B     mx
    LSR                             ; $808F97  4A           mx
    CLC                             ; $808F98  18           mx
    ADC #$08                        ; $808F99  69 08        mx
    ASL                             ; $808F9B  0A           mx
    TAY                             ; $808F9C  A8           mx
    REP #$30                        ; $808F9D  C2 30        mx
    LDA $8FEE,Y                     ; $808F9F  B9 EE 8F     MX
    STA $0B96                       ; $808FA2  8D 96 0B     MX
    SEP #$30                        ; $808FA5  E2 30        MX
    LDA $0B94                       ; $808FA7  AD 94 0B     mx
    STA $0B98                       ; $808FAA  8D 98 0B     mx
    JSR L_809D9C                    ; $808FAD  20 9C 9D     mx
    REP #$30                        ; $808FB0  C2 30        mx
    LDA $0B9A                       ; $808FB2  AD 9A 0B     MX
    STA $0BB4                       ; $808FB5  8D B4 0B     MX
    SEP #$30                        ; $808FB8  E2 30        MX
    LDA $0BD8                       ; $808FBA  AD D8 0B     mx
    LSR                             ; $808FBD  4A           mx
    CLC                             ; $808FBE  18           mx
    ADC #$04                        ; $808FBF  69 04        mx
    ASL                             ; $808FC1  0A           mx
    TAY                             ; $808FC2  A8           mx
    REP #$30                        ; $808FC3  C2 30        mx
    LDA $8FEE,Y                     ; $808FC5  B9 EE 8F     MX
    STA $0B96                       ; $808FC8  8D 96 0B     MX
    SEP #$30                        ; $808FCB  E2 30        MX
    LDA $0B95                       ; $808FCD  AD 95 0B     mx
    STA $0B98                       ; $808FD0  8D 98 0B     mx
    JSR L_809D9C                    ; $808FD3  20 9C 9D     mx
    REP #$30                        ; $808FD6  C2 30        mx
    LDA $0BB4                       ; $808FD8  AD B4 0B     MX
    CLC                             ; $808FDB  18           MX
    ADC $0B9A                       ; $808FDC  6D 9A 0B     MX
    ADC #$0080                      ; $808FDF  69 80 00     MX
    STA $0BB4                       ; $808FE2  8D B4 0B     MX
    SEP #$30                        ; $808FE5  E2 30        MX
    LDA $0BB5                       ; $808FE7  AD B5 0B     mx
    STA $0BC1                       ; $808FEA  8D C1 0B     mx
    RTS                             ; $808FED  60           mx
    db $00,$00,$62,$00,$B5,$00,$ED,$00,$00,$01,$ED,$00,$B5,$00,$62,$00 ; $808FEE
    db $00,$00,$9E,$FF,$4B,$FF,$13,$FF,$00,$FF,$13,$FF,$4B,$FF,$9E,$FF ; $808FFE
    db $00,$00,$62,$00,$B5,$00,$ED,$00,$00,$01,$ED,$00,$B5,$00,$62,$00 ; $80900E
    db $02,$01,$00,$00,$00,$01,$02,$02,$02,$01,$00,$00,$00,$01,$02,$02 ; $80901E
    db $00,$00,$00,$01,$02,$02,$02,$01,$00,$00,$00,$01,$02,$02,$02,$01 ; $80902E
    db $02,$02,$02,$01,$00,$00,$00,$02,$02,$02,$02,$01,$00,$00,$00,$02 ; $80903E
    db $00,$FF,$FE,$FE,$FE,$FF,$00,$FE,$00,$FF,$FE,$FE,$FE,$FF,$00,$FE ; $80904E
L_80905E:
    CMP $0BD4                       ; $80905E  CD D4 0B     mx
    BCC L_809072                    ; $809061  90 0F        mx
    CMP $0BD5                       ; $809063  CD D5 0B     mx
    BCS L_809072                    ; $809066  B0 0A        mx
    TAY                             ; $809068  A8           mx
    BPL L_80906F                    ; $809069  10 04        mx
    LDA $0BD5                       ; $80906B  AD D5 0B     mx
    RTS                             ; $80906E  60           mx
L_80906F:
    LDA $0BD4                       ; $80906F  AD D4 0B     mx
L_809072:
    RTS                             ; $809072  60           mx
L_809073:
    LDA $0CBD,X                     ; $809073  BD BD 0C     mx
    ORA $0C7E,X                     ; $809076  1D 7E 0C     mx
    BNE L_8090A4                    ; $809079  D0 29        mx
    LDA $0B94                       ; $80907B  AD 94 0B     mx
    BEQ L_8090A4                    ; $80907E  F0 24        mx
    LDA $0E25,X                     ; $809080  BD 25 0E     mx
    BEQ L_8090A5                    ; $809083  F0 20        mx
    LDA $0BCC                       ; $809085  AD CC 0B     mx
    SEC                             ; $809088  38           mx
    SBC $0BD8                       ; $809089  ED D8 0B     mx
    AND #$1F                        ; $80908C  29 1F        mx
    BEQ L_8090A4                    ; $80908E  F0 14        mx
    CMP #$10                        ; $809090  C9 10        mx
    BCC L_809099                    ; $809092  90 05        mx
    DEC $0BD8                       ; $809094  CE D8 0B     mx
    BRA L_80909C                    ; $809097  80 03        mx
L_809099:
    INC $0BD8                       ; $809099  EE D8 0B     mx
L_80909C:
    LDA $0BD8                       ; $80909C  AD D8 0B     mx
    AND #$1F                        ; $80909F  29 1F        mx
    STA $0BD8                       ; $8090A1  8D D8 0B     mx
L_8090A4:
    RTS                             ; $8090A4  60           mx
L_8090A5:
    LDA $0A62,X                     ; $8090A5  BD 62 0A     mx
    ORA $0A66,X                     ; $8090A8  1D 66 0A     mx
    BNE L_8090B3                    ; $8090AB  D0 06        mx
    LDA #$FF                        ; $8090AD  A9 FF        mx
    STA $0BCE                       ; $8090AF  8D CE 0B     mx
    RTS                             ; $8090B2  60           mx
L_8090B3:
    LDY #$80                        ; $8090B3  A0 80        mx
    LDA $0A72,X                     ; $8090B5  BD 72 0A     mx
    BEQ L_8090BC                    ; $8090B8  F0 02        mx
    LDY #$FF                        ; $8090BA  A0 FF        mx
L_8090BC:
    STY $0BF8                       ; $8090BC  8C F8 0B     mx
    LDA $0BCE                       ; $8090BF  AD CE 0B     mx
    CLC                             ; $8090C2  18           mx
    ADC $0BF8                       ; $8090C3  6D F8 0B     mx
    STA $0BCE                       ; $8090C6  8D CE 0B     mx
    BCC L_8090A4                    ; $8090C9  90 D9        mx
    LDA $0A66,X                     ; $8090CB  BD 66 0A     mx
    BNE L_8090FD                    ; $8090CE  D0 2D        mx
    LDA $0A62,X                     ; $8090D0  BD 62 0A     mx
    BEQ L_8090A4                    ; $8090D3  F0 CF        mx
L_8090D5:
    DEC $0BD8                       ; $8090D5  CE D8 0B     mx
    LDA $0BD8                       ; $8090D8  AD D8 0B     mx
    CMP #$01                        ; $8090DB  C9 01        mx
    BEQ L_8090D5                    ; $8090DD  F0 F6        mx
    CMP #$05                        ; $8090DF  C9 05        mx
    BEQ L_8090D5                    ; $8090E1  F0 F2        mx
    CMP #$09                        ; $8090E3  C9 09        mx
    BEQ L_8090D5                    ; $8090E5  F0 EE        mx
    CMP #$0D                        ; $8090E7  C9 0D        mx
    BEQ L_8090D5                    ; $8090E9  F0 EA        mx
    CMP #$11                        ; $8090EB  C9 11        mx
    BEQ L_8090D5                    ; $8090ED  F0 E6        mx
    CMP #$15                        ; $8090EF  C9 15        mx
    BEQ L_8090D5                    ; $8090F1  F0 E2        mx
    CMP #$19                        ; $8090F3  C9 19        mx
    BEQ L_8090D5                    ; $8090F5  F0 DE        mx
    CMP #$1D                        ; $8090F7  C9 1D        mx
    BEQ L_8090D5                    ; $8090F9  F0 DA        mx
    BRA L_809123                    ; $8090FB  80 26        mx
L_8090FD:
    INC $0BD8                       ; $8090FD  EE D8 0B     mx
    LDA $0BD8                       ; $809100  AD D8 0B     mx
    CMP #$01                        ; $809103  C9 01        mx
    BEQ L_8090FD                    ; $809105  F0 F6        mx
    CMP #$05                        ; $809107  C9 05        mx
    BEQ L_8090FD                    ; $809109  F0 F2        mx
    CMP #$09                        ; $80910B  C9 09        mx
    BEQ L_8090FD                    ; $80910D  F0 EE        mx
    CMP #$0D                        ; $80910F  C9 0D        mx
    BEQ L_8090FD                    ; $809111  F0 EA        mx
    CMP #$11                        ; $809113  C9 11        mx
    BEQ L_8090FD                    ; $809115  F0 E6        mx
    CMP #$15                        ; $809117  C9 15        mx
    BEQ L_8090FD                    ; $809119  F0 E2        mx
    CMP #$19                        ; $80911B  C9 19        mx
    BEQ L_8090FD                    ; $80911D  F0 DE        mx
    CMP #$1D                        ; $80911F  C9 1D        mx
    BEQ L_8090FD                    ; $809121  F0 DA        mx
L_809123:
    LDA $0BD8                       ; $809123  AD D8 0B     mx
    AND #$1F                        ; $809126  29 1F        mx
    STA $0BD8                       ; $809128  8D D8 0B     mx
    RTS                             ; $80912B  60           mx
L_80912C:
    LDX #$00                        ; $80912C  A2 00        mx
    JSR L_809144                    ; $80912E  20 44 91     mx
    LDX #$01                        ; $809131  A2 01        mx
    JSR L_809144                    ; $809133  20 44 91     mx
    LDX #$02                        ; $809136  A2 02        mx
    JSR L_809144                    ; $809138  20 44 91     mx
    LDX #$03                        ; $80913B  A2 03        mx
    JSR L_809144                    ; $80913D  20 44 91     mx
    JSR L_80DD5F                    ; $809140  20 5F DD     mx
    RTS                             ; $809143  60           mx
L_809144:
    STX $0BD0                       ; $809144  8E D0 0B     mx
    LDA $0C11,X                     ; $809147  BD 11 0C     mx
    STA $0C1D,X                     ; $80914A  9D 1D 0C     mx
    LDA $0C09,X                     ; $80914D  BD 09 0C     mx
    STA $0C15,X                     ; $809150  9D 15 0C     mx
    LDA $0C0D,X                     ; $809153  BD 0D 0C     mx
    STA $0C19,X                     ; $809156  9D 19 0C     mx
    LDA $0CB1,X                     ; $809159  BD B1 0C     mx
    STA $0C11,X                     ; $80915C  9D 11 0C     mx
    LDA $0CDD,X                     ; $80915F  BD DD 0C     mx
    STA $0C09,X                     ; $809162  9D 09 0C     mx
    LDA $0CE1,X                     ; $809165  BD E1 0C     mx
    STA $0C0D,X                     ; $809168  9D 0D 0C     mx
    JSR L_809365                    ; $80916B  20 65 93     mx
    LDX $0BD0                       ; $80916E  AE D0 0B     mx
    LDA $0C29,X                     ; $809171  BD 29 0C     mx
    STA $0BC5                       ; $809174  8D C5 0B     mx
    LDA $0C2D,X                     ; $809177  BD 2D 0C     mx
    STA $0BC6                       ; $80917A  8D C6 0B     mx
    LDA $0C76,X                     ; $80917D  BD 76 0C     mx
    STA $0BBA                       ; $809180  8D BA 0B     mx
    LDA $0C7E,X                     ; $809183  BD 7E 0C     mx
    STA $0BC2                       ; $809186  8D C2 0B     mx
    LDY $A024,X                     ; $809189  BC 24 A0     mx
    REP #$30                        ; $80918C  C2 30        mx
    LDA $00DD,Y                     ; $80918E  B9 DD 00     MX
    STA $0BB0                       ; $809191  8D B0 0B     MX
    LDA $00EF,Y                     ; $809194  B9 EF 00     MX
    STA $0BB2                       ; $809197  8D B2 0B     MX
    SEP #$30                        ; $80919A  E2 30        MX
    LDA $80,X                       ; $80919C  B5 80        mx
    STA $0BC0                       ; $80919E  8D C0 0B     mx
    LDA $84,X                       ; $8091A1  B5 84        mx
    STA $0BC1                       ; $8091A3  8D C1 0B     mx
    LDA $0C25,X                     ; $8091A6  BD 25 0C     mx
    STA $0BB9                       ; $8091A9  8D B9 0B     mx
    LDA $0C7A,X                     ; $8091AC  BD 7A 0C     mx
    STA $0BD8                       ; $8091AF  8D D8 0B     mx
    LDA $0CC5,X                     ; $8091B2  BD C5 0C     mx
    STA $0B60                       ; $8091B5  8D 60 0B     mx
    LDA $0EDF,X                     ; $8091B8  BD DF 0E     mx
    STA $0B62                       ; $8091BB  8D 62 0B     mx
    LDA $0EED,X                     ; $8091BE  BD ED 0E     mx
    STA $0BF5                       ; $8091C1  8D F5 0B     mx
    JSR L_809ADD                    ; $8091C4  20 DD 9A     mx
    LDA $0BAB                       ; $8091C7  AD AB 0B     mx
    STA $0BAC,X                     ; $8091CA  9D AC 0B     mx
    LDA $0BC0                       ; $8091CD  AD C0 0B     mx
    STA $80,X                       ; $8091D0  95 80        mx
    LDA $0BC1                       ; $8091D2  AD C1 0B     mx
    STA $84,X                       ; $8091D5  95 84        mx
    LDA $0BA3                       ; $8091D7  AD A3 0B     mx
    STA $0CDD,X                     ; $8091DA  9D DD 0C     mx
    LDA $0BA5                       ; $8091DD  AD A5 0B     mx
    STA $0CE1,X                     ; $8091E0  9D E1 0C     mx
    LDA $0BC2                       ; $8091E3  AD C2 0B     mx
    STA $0B61                       ; $8091E6  8D 61 0B     mx
    LDA $0C93,X                     ; $8091E9  BD 93 0C     mx
    STA $0BDC                       ; $8091EC  8D DC 0B     mx
    LDA $0A4F,X                     ; $8091EF  BD 4F 0A     mx
    STA $0BCC                       ; $8091F2  8D CC 0B     mx
    LDY $A01E,X                     ; $8091F5  BC 1E A0     mx
    REP #$30                        ; $8091F8  C2 30        mx
    LDA $0CEB,Y                     ; $8091FA  B9 EB 0C     MX
    STA $0B5C                       ; $8091FD  8D 5C 0B     MX
    SEP #$30                        ; $809200  E2 30        MX
    LDA $0E25,X                     ; $809202  BD 25 0E     mx
    STA $0BCD                       ; $809205  8D CD 0B     mx
    LDA $48,X                       ; $809208  B5 48        mx
    STA $0B94                       ; $80920A  8D 94 0B     mx
    LDA $0CCD,X                     ; $80920D  BD CD 0C     mx
    STA $0B64                       ; $809210  8D 64 0B     mx
    LDA $0CD1,X                     ; $809213  BD D1 0C     mx
    STA $0B65                       ; $809216  8D 65 0B     mx
    LDA $0CD9,X                     ; $809219  BD D9 0C     mx
    STA $0A60                       ; $80921C  8D 60 0A     mx
    JSR L_80F8AD                    ; $80921F  20 AD F8     mx
    LDA $0C8A,X                     ; $809222  BD 8A 0C     mx
    STA $0C8E                       ; $809225  8D 8E 0C     mx
    LDA $0A60                       ; $809228  AD 60 0A     mx
    STA $0CD9,X                     ; $80922B  9D D9 0C     mx
    PHX                             ; $80922E  DA           mx
    JSR L_80A454                    ; $80922F  20 54 A4     mx
    PLX                             ; $809232  FA           mx
    STZ $0C8A,X                     ; $809233  9E 8A 0C     mx
    LDA $0B66                       ; $809236  AD 66 0B     mx
    STA $0CD5,X                     ; $809239  9D D5 0C     mx
    LDA $0B64                       ; $80923C  AD 64 0B     mx
    STA $0CCD,X                     ; $80923F  9D CD 0C     mx
    LDA $0B65                       ; $809242  AD 65 0B     mx
    STA $0CD1,X                     ; $809245  9D D1 0C     mx
    LDA $0BCC                       ; $809248  AD CC 0B     mx
    STA $0A4F,X                     ; $80924B  9D 4F 0A     mx
    LDA $0B62                       ; $80924E  AD 62 0B     mx
    STA $0EDF,X                     ; $809251  9D DF 0E     mx
    LDY $A01E,X                     ; $809254  BC 1E A0     mx
    REP #$30                        ; $809257  C2 30        mx
    LDA $0B5C                       ; $809259  AD 5C 0B     MX
    STA $0CEB,Y                     ; $80925C  99 EB 0C     MX
    SEP #$30                        ; $80925F  E2 30        MX
    LDA $0BF4                       ; $809261  AD F4 0B     mx
    BNE L_80926B                    ; $809264  D0 05        mx
    LDA $0B63                       ; $809266  AD 63 0B     mx
    BEQ L_809272                    ; $809269  F0 07        mx
L_80926B:
    STZ $0A53,X                     ; $80926B  9E 53 0A     mx
    TXA                             ; $80926E  8A           mx
    JSR L_80FF17                    ; $80926F  20 17 FF     mx
L_809272:
    LDA $0B60                       ; $809272  AD 60 0B     mx
    STA $0CC5,X                     ; $809275  9D C5 0C     mx
    LDA $0CA3,X                     ; $809278  BD A3 0C     mx
    STA $0BE0                       ; $80927B  8D E0 0B     mx
    LDA $0EF1,X                     ; $80927E  BD F1 0E     mx
    STA $0BE1                       ; $809281  8D E1 0B     mx
    STA $0C01                       ; $809284  8D 01 0C     mx
    LDA $0CAD,X                     ; $809287  BD AD 0C     mx
    STA $0BE3                       ; $80928A  8D E3 0B     mx
    LDA $0CA7,X                     ; $80928D  BD A7 0C     mx
    STA $0BE2                       ; $809290  8D E2 0B     mx
    LDA $0CB1,X                     ; $809293  BD B1 0C     mx
    STA $0BE4                       ; $809296  8D E4 0B     mx
    LDA $0CB5,X                     ; $809299  BD B5 0C     mx
    STA $0BE5                       ; $80929C  8D E5 0B     mx
    LDA $0CC9,X                     ; $80929F  BD C9 0C     mx
    STA $0BF6                       ; $8092A2  8D F6 0B     mx
    LDA $0CE5,X                     ; $8092A5  BD E5 0C     mx
    STA $0BF7                       ; $8092A8  8D F7 0B     mx
    LDA $0C39,X                     ; $8092AB  BD 39 0C     mx
    STA $0C55                       ; $8092AE  8D 55 0C     mx
    LDA $0CD5,X                     ; $8092B1  BD D5 0C     mx
    STA $0B66                       ; $8092B4  8D 66 0B     mx
    STX $0BD0                       ; $8092B7  8E D0 0B     mx
    JSR L_80B5E0                    ; $8092BA  20 E0 B5     mx
    LDX $0BD0                       ; $8092BD  AE D0 0B     mx
    LDA $0C55                       ; $8092C0  AD 55 0C     mx
    STA $0C39,X                     ; $8092C3  9D 39 0C     mx
    LDA $0BF7                       ; $8092C6  AD F7 0B     mx
    STA $0CE5,X                     ; $8092C9  9D E5 0C     mx
    LDA $0BF6                       ; $8092CC  AD F6 0B     mx
    STA $0CC9,X                     ; $8092CF  9D C9 0C     mx
    LDA $0BE5                       ; $8092D2  AD E5 0B     mx
    STA $0CB5,X                     ; $8092D5  9D B5 0C     mx
    LDA $0BE4                       ; $8092D8  AD E4 0B     mx
    STA $0CB1,X                     ; $8092DB  9D B1 0C     mx
    LDA $0BE2                       ; $8092DE  AD E2 0B     mx
    STA $0CA7,X                     ; $8092E1  9D A7 0C     mx
    LDA $0BE3                       ; $8092E4  AD E3 0B     mx
    STA $0CAD,X                     ; $8092E7  9D AD 0C     mx
    LDA $0BE0                       ; $8092EA  AD E0 0B     mx
    STA $0CA3,X                     ; $8092ED  9D A3 0C     mx
    LDA $0BDC                       ; $8092F0  AD DC 0B     mx
    STA $0C93,X                     ; $8092F3  9D 93 0C     mx
    LDA $0BD8                       ; $8092F6  AD D8 0B     mx
    STA $0C7A,X                     ; $8092F9  9D 7A 0C     mx
    LDA $0BC0                       ; $8092FC  AD C0 0B     mx
    STA $80,X                       ; $8092FF  95 80        mx
    LDA $0BC1                       ; $809301  AD C1 0B     mx
    STA $84,X                       ; $809304  95 84        mx
    LDA $0B9F                       ; $809306  AD 9F 0B     mx
    STA $0C31,X                     ; $809309  9D 31 0C     mx
    LDA $0B9E                       ; $80930C  AD 9E 0B     mx
    STA $0C35,X                     ; $80930F  9D 35 0C     mx
    LDA $0BB6                       ; $809312  AD B6 0B     mx
    STA $0C25,X                     ; $809315  9D 25 0C     mx
    LDA $0BC5                       ; $809318  AD C5 0B     mx
    STA $0C29,X                     ; $80931B  9D 29 0C     mx
    LDA $0BC6                       ; $80931E  AD C6 0B     mx
    STA $0C2D,X                     ; $809321  9D 2D 0C     mx
    LDA $0BBB                       ; $809324  AD BB 0B     mx
    CMP #$21                        ; $809327  C9 21        mx
    BCC L_809339                    ; $809329  90 0E        mx
    CMP #$E0                        ; $80932B  C9 E0        mx
    BCS L_809339                    ; $80932D  B0 0A        mx
    CMP #$80                        ; $80932F  C9 80        mx
    BCC L_809337                    ; $809331  90 04        mx
    LDA #$E0                        ; $809333  A9 E0        mx
    BRA L_809339                    ; $809335  80 02        mx
L_809337:
    LDA #$20                        ; $809337  A9 20        mx
L_809339:
    STA $0C76,X                     ; $809339  9D 76 0C     mx
    LDA $0BC2                       ; $80933C  AD C2 0B     mx
    STA $0C7E,X                     ; $80933F  9D 7E 0C     mx
    LDA $0BC8                       ; $809342  AD C8 0B     mx
    STA $0A4B,X                     ; $809345  9D 4B 0A     mx
    LDA $0BC7                       ; $809348  AD C7 0B     mx
    STA $0A45,X                     ; $80934B  9D 45 0A     mx
    LDA $0BE1                       ; $80934E  AD E1 0B     mx
    STA $0EF1,X                     ; $809351  9D F1 0E     mx
    BNE L_809364                    ; $809354  D0 0E        mx
    CMP $0C01                       ; $809356  CD 01 0C     mx
    BEQ L_809364                    ; $809359  F0 09        mx
    LDA $0B8E                       ; $80935B  AD 8E 0B     mx
    STA $0EFD,X                     ; $80935E  9D FD 0E     mx
    INC $0B8E                       ; $809361  EE 8E 0B     mx
L_809364:
    RTS                             ; $809364  60           mx
L_809365:
    LDA $0BEF                       ; $809365  AD EF 0B     mx
    BNE L_80936F                    ; $809368  D0 05        mx
    LDA $0EF1,X                     ; $80936A  BD F1 0E     mx
    BNE L_809370                    ; $80936D  D0 01        mx
L_80936F:
    RTS                             ; $80936F  60           mx
L_809370:
    LDA $0E5F,X                     ; $809370  BD 5F 0E     mx
    BEQ L_809378                    ; $809373  F0 03        mx
    DEC $0E5F,X                     ; $809375  DE 5F 0E     mx
L_809378:
    LDA $0E63,X                     ; $809378  BD 63 0E     mx
    BEQ L_809380                    ; $80937B  F0 03        mx
    DEC $0E63,X                     ; $80937D  DE 63 0E     mx
L_809380:
    LDA $0E6B,X                     ; $809380  BD 6B 0E     mx
    BEQ L_809388                    ; $809383  F0 03        mx
    DEC $0E6B,X                     ; $809385  DE 6B 0E     mx
L_809388:
    LDA $0E67,X                     ; $809388  BD 67 0E     mx
    BEQ L_809390                    ; $80938B  F0 03        mx
    DEC $0E67,X                     ; $80938D  DE 67 0E     mx
L_809390:
    LDA $0EB5,X                     ; $809390  BD B5 0E     mx
    BEQ L_80939B                    ; $809393  F0 06        mx
    JSR L_8093C5                    ; $809395  20 C5 93     mx
    LDX $0BD0                       ; $809398  AE D0 0B     mx
L_80939B:
    LDA $0EBD,X                     ; $80939B  BD BD 0E     mx
    BEQ L_8093A6                    ; $80939E  F0 06        mx
    JSR L_8094C2                    ; $8093A0  20 C2 94     mx
    LDX $0BD0                       ; $8093A3  AE D0 0B     mx
L_8093A6:
    LDA $0EC5,X                     ; $8093A6  BD C5 0E     mx
    BEQ L_8093B1                    ; $8093A9  F0 06        mx
    JSR L_809543                    ; $8093AB  20 43 95     mx
    LDX $0BD0                       ; $8093AE  AE D0 0B     mx
L_8093B1:
    LDA $0EC1,X                     ; $8093B1  BD C1 0E     mx
    BEQ L_8093BC                    ; $8093B4  F0 06        mx
    JSR L_809446                    ; $8093B6  20 46 94     mx
    LDX $0BD0                       ; $8093B9  AE D0 0B     mx
L_8093BC:
    LDA $0ECD,X                     ; $8093BC  BD CD 0E     mx
    BEQ L_8093C4                    ; $8093BF  F0 03        mx
    JSR L_8098FB                    ; $8093C1  20 FB 98     mx
L_8093C4:
    RTS                             ; $8093C4  60           mx
L_8093C5:
    LDA $0E95,X                     ; $8093C5  BD 95 0E     mx
    BNE L_8093D7                    ; $8093C8  D0 0D        mx
    REP #$30                        ; $8093CA  C2 30        mx
    LDA #$00A3                      ; $8093CC  A9 A3 00     MX
    JSL L_81DE31                    ; $8093CF  22 31 DE 81  MX
    SEP #$30                        ; $8093D3  E2 30        MX
    BRA L_809443                    ; $8093D5  80 6C        mx
L_8093D7:
    LDA $0E5F,X                     ; $8093D7  BD 5F 0E     mx
    BNE L_809443                    ; $8093DA  D0 67        mx
    LDA $0232,X                     ; $8093DC  BD 32 02     mx
    CLC                             ; $8093DF  18           mx
    ADC #$05                        ; $8093E0  69 05        mx
    STA $0232,X                     ; $8093E2  9D 32 02     mx
    REP #$30                        ; $8093E5  C2 30        mx
    JSR L_80D1C7                    ; $8093E7  20 C7 D1     MX
    BCC L_809443                    ; $8093EA  90 57        MX
    STX $1257                       ; $8093EC  8E 57 12     MX
    TXA                             ; $8093EF  8A           MX
    ASL                             ; $8093F0  0A           MX
    STA $1259                       ; $8093F1  8D 59 12     MX
    LDA #$829A                      ; $8093F4  A9 9A 82     MX
    JSR L_8095CC                    ; $8093F7  20 CC 95     MX
    JSR L_80962E                    ; $8093FA  20 2E 96     MX
    LDY $1257                       ; $8093FD  AC 57 12     MX
    LDA $97A1,X                     ; $809400  BD A1 97     MX
    STA $1061,Y                     ; $809403  99 61 10     MX
    LDA $97E1,X                     ; $809406  BD E1 97     MX
    STA $1091,Y                     ; $809409  99 91 10     MX
    JSR L_809655                    ; $80940C  20 55 96     MX
    SEP #$30                        ; $80940F  E2 30        MX
    LDA #$08                        ; $809411  A9 08        mx
    JSR L_80F92A                    ; $809413  20 2A F9     mx
    LDX $0BD0                       ; $809416  AE D0 0B     mx
    LDA $0247                       ; $809419  AD 47 02     mx  infinite_ammo
    BNE L_809421                    ; $80941C  D0 03        mx
    DEC $0E95,X                     ; $80941E  DE 95 0E     mx
L_809421:
    LDA #$04                        ; $809421  A9 04        mx
    STA $0E5F,X                     ; $809423  9D 5F 0E     mx
    LDA $0EB5,X                     ; $809426  BD B5 0E     mx
    JSR L_8095E5                    ; $809429  20 E5 95     mx
    JSR L_8095A7                    ; $80942C  20 A7 95     mx
    LDA $96A0,X                     ; $80942F  BD A0 96     mx
    STA $11B1,Y                     ; $809432  99 B1 11     mx
    LDA #$00                        ; $809435  A9 00        mx
    STA $11B2,Y                     ; $809437  99 B2 11     mx
    LDX $0BD0                       ; $80943A  AE D0 0B     mx
    LDA $0EB5,X                     ; $80943D  BD B5 0E     mx
    JSR L_80966B                    ; $809440  20 6B 96     mx
L_809443:
    SEP #$30                        ; $809443  E2 30        mx
    RTS                             ; $809445  60           mx
L_809446:
    LDA $0EA1,X                     ; $809446  BD A1 0E     mx
    BNE L_809458                    ; $809449  D0 0D        mx
    REP #$30                        ; $80944B  C2 30        mx
    LDA #$00A3                      ; $80944D  A9 A3 00     MX
    JSL L_81DE31                    ; $809450  22 31 DE 81  MX
    SEP #$30                        ; $809454  E2 30        MX
    BRA L_8094BF                    ; $809456  80 67        mx
L_809458:
    LDA $0E67,X                     ; $809458  BD 67 0E     mx
    BNE L_8094BF                    ; $80945B  D0 62        mx
    LDA $0232,X                     ; $80945D  BD 32 02     mx
    CLC                             ; $809460  18           mx
    ADC #$05                        ; $809461  69 05        mx
    STA $0232,X                     ; $809463  9D 32 02     mx
    REP #$30                        ; $809466  C2 30        mx
    JSR L_80D1C7                    ; $809468  20 C7 D1     MX
    BCC L_8094BF                    ; $80946B  90 52        MX
    STX $1257                       ; $80946D  8E 57 12     MX
    TXA                             ; $809470  8A           MX
    ASL                             ; $809471  0A           MX
    STA $1259                       ; $809472  8D 59 12     MX
    LDA #$006C                      ; $809475  A9 6C 00     MX
    STA $11B1,X                     ; $809478  9D B1 11     MX
    LDA #$003D                      ; $80947B  A9 3D 00     MX
    STA $11E1,X                     ; $80947E  9D E1 11     MX
    STZ $1211,X                     ; $809481  9E 11 12     MX
    LDA #$82DF                      ; $809484  A9 DF 82     MX
    JSR L_8095CC                    ; $809487  20 CC 95     MX
    JSR L_80962E                    ; $80948A  20 2E 96     MX
    LDY $1257                       ; $80948D  AC 57 12     MX
    LDA $9821,X                     ; $809490  BD 21 98     MX
    STA $1061,Y                     ; $809493  99 61 10     MX
    LDA $9861,X                     ; $809496  BD 61 98     MX
    STA $1091,Y                     ; $809499  99 91 10     MX
    LDA #$0000                      ; $80949C  A9 00 00     MX
    STA $10C1,Y                     ; $80949F  99 C1 10     MX
    SEP #$30                        ; $8094A2  E2 30        MX
    LDA #$08                        ; $8094A4  A9 08        mx
    JSR L_80F92A                    ; $8094A6  20 2A F9     mx
    LDX $0BD0                       ; $8094A9  AE D0 0B     mx
    LDA $0247                       ; $8094AC  AD 47 02     mx  infinite_ammo
    BNE L_8094B4                    ; $8094AF  D0 03        mx
    DEC $0EA1,X                     ; $8094B1  DE A1 0E     mx
L_8094B4:
    LDA #$04                        ; $8094B4  A9 04        mx
    STA $0E67,X                     ; $8094B6  9D 67 0E     mx
    LDA $0EC1,X                     ; $8094B9  BD C1 0E     mx
    JSR L_8095E5                    ; $8094BC  20 E5 95     mx
L_8094BF:
    SEP #$30                        ; $8094BF  E2 30        mx
    RTS                             ; $8094C1  60           mx
L_8094C2:
    LDA $0E9D,X                     ; $8094C2  BD 9D 0E     mx
    BNE L_8094D4                    ; $8094C5  D0 0D        mx
    REP #$30                        ; $8094C7  C2 30        mx
    LDA #$00A3                      ; $8094C9  A9 A3 00     MX
    JSL L_81DE31                    ; $8094CC  22 31 DE 81  MX
    SEP #$30                        ; $8094D0  E2 30        MX
    BRA L_809540                    ; $8094D2  80 6C        mx
L_8094D4:
    LDA $0E63,X                     ; $8094D4  BD 63 0E     mx
    BNE L_809540                    ; $8094D7  D0 67        mx
    LDA $0232,X                     ; $8094D9  BD 32 02     mx
    CLC                             ; $8094DC  18           mx
    ADC #$05                        ; $8094DD  69 05        mx
    STA $0232,X                     ; $8094DF  9D 32 02     mx
    REP #$30                        ; $8094E2  C2 30        mx
    JSR L_80D1C7                    ; $8094E4  20 C7 D1     MX
    BCC L_809540                    ; $8094E7  90 57        MX
    STX $1257                       ; $8094E9  8E 57 12     MX
    TXA                             ; $8094EC  8A           MX
    ASL                             ; $8094ED  0A           MX
    STA $1259                       ; $8094EE  8D 59 12     MX
    LDA #$8526                      ; $8094F1  A9 26 85     MX
    JSR L_8095CC                    ; $8094F4  20 CC 95     MX
    JSR L_80962E                    ; $8094F7  20 2E 96     MX
    LDY $1257                       ; $8094FA  AC 57 12     MX
    LDA $9821,X                     ; $8094FD  BD 21 98     MX
    STA $1061,Y                     ; $809500  99 61 10     MX
    LDA $9861,X                     ; $809503  BD 61 98     MX
    STA $1091,Y                     ; $809506  99 91 10     MX
    JSR L_809655                    ; $809509  20 55 96     MX
    SEP #$30                        ; $80950C  E2 30        MX
    LDA #$04                        ; $80950E  A9 04        mx
    JSR L_80F92A                    ; $809510  20 2A F9     mx
    LDX $0BD0                       ; $809513  AE D0 0B     mx
    LDA $0247                       ; $809516  AD 47 02     mx  infinite_ammo
    BNE L_80951E                    ; $809519  D0 03        mx
    DEC $0E9D,X                     ; $80951B  DE 9D 0E     mx
L_80951E:
    LDA #$05                        ; $80951E  A9 05        mx
    STA $0E63,X                     ; $809520  9D 63 0E     mx
    LDA $0EBD,X                     ; $809523  BD BD 0E     mx
    JSR L_8095E5                    ; $809526  20 E5 95     mx
    JSR L_8095A7                    ; $809529  20 A7 95     mx
    LDA $96B0,X                     ; $80952C  BD B0 96     mx
    STA $11B1,Y                     ; $80952F  99 B1 11     mx
    LDA #$00                        ; $809532  A9 00        mx
    STA $11B2,Y                     ; $809534  99 B2 11     mx
    LDX $0BD0                       ; $809537  AE D0 0B     mx
    LDA $0EBD,X                     ; $80953A  BD BD 0E     mx
    JSR L_80966B                    ; $80953D  20 6B 96     mx
L_809540:
    SEP #$30                        ; $809540  E2 30        mx
    RTS                             ; $809542  60           mx
L_809543:
    LDA $0EA5,X                     ; $809543  BD A5 0E     mx
    BNE L_809555                    ; $809546  D0 0D        mx
    REP #$30                        ; $809548  C2 30        mx
    LDA #$00A3                      ; $80954A  A9 A3 00     MX
    JSL L_81DE31                    ; $80954D  22 31 DE 81  MX
    SEP #$30                        ; $809551  E2 30        MX
    BRA L_8095A4                    ; $809553  80 4F        mx
L_809555:
    LDA $0E6B,X                     ; $809555  BD 6B 0E     mx
    BNE L_8095A4                    ; $809558  D0 4A        mx
    REP #$30                        ; $80955A  C2 30        mx
    JSR L_80D1C7                    ; $80955C  20 C7 D1     MX
    BCC L_8095A4                    ; $80955F  90 43        MX
    STX $1257                       ; $809561  8E 57 12     MX
    TXA                             ; $809564  8A           MX
    ASL                             ; $809565  0A           MX
    STA $1259                       ; $809566  8D 59 12     MX
    STZ $1061,X                     ; $809569  9E 61 10     MX
    STZ $1091,X                     ; $80956C  9E 91 10     MX
    STZ $10C1,X                     ; $80956F  9E C1 10     MX
    LDA #$006E                      ; $809572  A9 6E 00     MX
    STA $11B1,X                     ; $809575  9D B1 11     MX
    LDA #$003D                      ; $809578  A9 3D 00     MX
    STA $11E1,X                     ; $80957B  9D E1 11     MX
    STZ $1211,X                     ; $80957E  9E 11 12     MX
    LDA #$85E5                      ; $809581  A9 E5 85     MX
    JSR L_8095CC                    ; $809584  20 CC 95     MX
    SEP #$30                        ; $809587  E2 30        MX
    LDA #$07                        ; $809589  A9 07        mx
    JSR L_80F92A                    ; $80958B  20 2A F9     mx
    LDX $0BD0                       ; $80958E  AE D0 0B     mx
    LDA $0247                       ; $809591  AD 47 02     mx  infinite_ammo
    BNE L_809599                    ; $809594  D0 03        mx
    DEC $0EA5,X                     ; $809596  DE A5 0E     mx
L_809599:
    LDA #$04                        ; $809599  A9 04        mx
    STA $0E6B,X                     ; $80959B  9D 6B 0E     mx
    LDA $0EC5,X                     ; $80959E  BD C5 0E     mx
    JSR L_8095E5                    ; $8095A1  20 E5 95     mx
L_8095A4:
    SEP #$30                        ; $8095A4  E2 30        mx
    RTS                             ; $8095A6  60           mx
L_8095A7:
    LDX $0BD0                       ; $8095A7  AE D0 0B     mx
    LDY $0B33,X                     ; $8095AA  BC 33 0B     mx
    LDA $0C7A,X                     ; $8095AD  BD 7A 0C     mx
    CMP #$08                        ; $8095B0  C9 08        mx
    BCC L_8095BD                    ; $8095B2  90 09        mx
    CMP #$18                        ; $8095B4  C9 18        mx
    BCS L_8095BD                    ; $8095B6  B0 05        mx
    LDA $9747,Y                     ; $8095B8  B9 47 97     mx
    BRA L_8095C2                    ; $8095BB  80 05        mx
L_8095BD:
    LDA $9747,Y                     ; $8095BD  B9 47 97     mx
    EOR #$40                        ; $8095C0  49 40        mx
L_8095C2:
    LDX $9774,Y                     ; $8095C2  BE 74 97     mx
    LDY $1257                       ; $8095C5  AC 57 12     mx
    STA $11E1,Y                     ; $8095C8  99 E1 11     mx
    RTS                             ; $8095CB  60           mx
L_8095CC:
    INC $0F0F                       ; $8095CC  EE 0F 0F     MX
    STA $0F41,X                     ; $8095CF  9D 41 0F     MX
    LDA #$0001                      ; $8095D2  A9 01 00     MX
    STA $0F11,X                     ; $8095D5  9D 11 0F     MX
    LDA $0BD0                       ; $8095D8  AD D0 0B     MX
    AND #$00FF                      ; $8095DB  29 FF 00     MX
    STA $1151,X                     ; $8095DE  9D 51 11     MX
    STZ $1211,X                     ; $8095E1  9E 11 12     MX
    RTS                             ; $8095E4  60           MX
L_8095E5:
    CMP #$01                        ; $8095E5  C9 01        mx
    BEQ L_8095ED                    ; $8095E7  F0 04        mx
    LDA #$01                        ; $8095E9  A9 01        mx
    BRA L_8095EF                    ; $8095EB  80 02        mx
L_8095ED:
    LDA #$00                        ; $8095ED  A9 00        mx
L_8095EF:
    JSR L_80969D                    ; $8095EF  20 9D 96     mx
    REP #$30                        ; $8095F2  C2 30        mx
    LDY $1257                       ; $8095F4  AC 57 12     MX
    LDA $0A45,X                     ; $8095F7  BD 45 0A     MX
    AND #$00FF                      ; $8095FA  29 FF 00     MX
    INC                             ; $8095FD  1A           MX
    STA $1031,Y                     ; $8095FE  99 31 10     MX
    LDA $A024,X                     ; $809601  BD 24 A0     MX
    AND #$00FF                      ; $809604  29 FF 00     MX
    TAX                             ; $809607  AA           MX
    LDY $1259                       ; $809608  AC 59 12     MX
    LDA $DB,X                       ; $80960B  B5 DB        MX
    AND #$FF00                      ; $80960D  29 00 FF     MX
    STA $0F71,Y                     ; $809610  99 71 0F     MX
    LDA $ED,X                       ; $809613  B5 ED        MX
    AND #$FF00                      ; $809615  29 00 FF     MX
    STA $0FD1,Y                     ; $809618  99 D1 0F     MX
    LDA $DD,X                       ; $80961B  B5 DD        MX
    CLC                             ; $80961D  18           MX
    ADC $9C                         ; $80961E  65 9C        MX
    STA $0F73,Y                     ; $809620  99 73 0F     MX
    LDA $EF,X                       ; $809623  B5 EF        MX
    CLC                             ; $809625  18           MX
    ADC $9E                         ; $809626  65 9E        MX
    STA $0FD3,Y                     ; $809628  99 D3 0F     MX
    SEP #$30                        ; $80962B  E2 30        MX
    RTS                             ; $80962D  60           mx
L_80962E:
    SEP #$30                        ; $80962E  E2 30        MX
    LDX $0BD0                       ; $809630  AE D0 0B     mx
    LDA $0C7A,X                     ; $809633  BD 7A 0C     mx
    CMP #$08                        ; $809636  C9 08        mx
    BCC L_809649                    ; $809638  90 0F        mx
    CMP #$18                        ; $80963A  C9 18        mx
    BCS L_809649                    ; $80963C  B0 0B        mx
    LDA $0B33,X                     ; $80963E  BD 33 0B     mx
    TAX                             ; $809641  AA           mx
    LDA $96C0,X                     ; $809642  BD C0 96     mx
    ASL                             ; $809645  0A           mx
    TAX                             ; $809646  AA           mx
    BRA L_809652                    ; $809647  80 09        mx
L_809649:
    LDA $0B33,X                     ; $809649  BD 33 0B     mx
    TAX                             ; $80964C  AA           mx
    LDA $96ED,X                     ; $80964D  BD ED 96     mx
    ASL                             ; $809650  0A           mx
    TAX                             ; $809651  AA           mx
L_809652:
    REP #$30                        ; $809652  C2 30        mx
    RTS                             ; $809654  60           MX
L_809655:
    LDA $0BD0                       ; $809655  AD D0 0B     MX
    AND #$00FF                      ; $809658  29 FF 00     MX
    TAX                             ; $80965B  AA           MX
    LDA $0B33,X                     ; $80965C  BD 33 0B     MX
    AND #$00FF                      ; $80965F  29 FF 00     MX
    ASL                             ; $809662  0A           MX
    TAX                             ; $809663  AA           MX
    LDA $98A1,X                     ; $809664  BD A1 98     MX
    STA $10C1,Y                     ; $809667  99 C1 10     MX
    RTS                             ; $80966A  60           MX
L_80966B:
    CMP #$01                        ; $80966B  C9 01        mx
    BEQ L_80969C                    ; $80966D  F0 2D        mx
    REP #$30                        ; $80966F  C2 30        mx
    LDA $1061,Y                     ; $809671  B9 61 10     MX
    EOR #$FFFF                      ; $809674  49 FF FF     MX
    INC                             ; $809677  1A           MX
    STA $1061,Y                     ; $809678  99 61 10     MX
    LDX $1259                       ; $80967B  AE 59 12     MX
    LDA $1091,X                     ; $80967E  BD 91 10     MX
    EOR #$FFFF                      ; $809681  49 FF FF     MX
    INC                             ; $809684  1A           MX
    STA $1091,X                     ; $809685  9D 91 10     MX
    LDA $10C1,X                     ; $809688  BD C1 10     MX
    EOR #$FFFF                      ; $80968B  49 FF FF     MX
    INC                             ; $80968E  1A           MX
    STA $10C1,X                     ; $80968F  9D C1 10     MX
    SEP #$30                        ; $809692  E2 30        MX
    LDA $11E1,Y                     ; $809694  B9 E1 11     mx
    EOR #$C0                        ; $809697  49 C0        mx
    STA $11E1,Y                     ; $809699  99 E1 11     mx
L_80969C:
    RTS                             ; $80969C  60           mx
L_80969D:
    JMP L_80C7E7                    ; $80969D  4C E7 C7     mx
    db $62,$60,$4E,$4C,$4A,$4C,$4E,$60,$62,$60,$4E,$4C,$4A,$4C,$4E,$60 ; $8096A0
    db $48,$46,$44,$42,$40,$42,$44,$46,$48,$46,$44,$42,$40,$42,$44,$46 ; $8096B0
    db $18,$17,$15,$14,$13,$11,$10,$0F,$0D,$0C,$0B,$09,$08,$0D,$0D,$0D ; $8096C0
    db $0D,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0B,$0B,$0B,$0B,$15,$15,$15 ; $8096D0
    db $15,$14,$14,$14,$14,$14,$14,$14,$14,$13,$13,$13,$13,$18,$19,$1B ; $8096E0
    db $1C,$1D,$1F,$00,$02,$03,$04,$05,$07,$08,$03,$03,$03,$03,$04,$04 ; $8096F0
    db $04,$04,$04,$04,$04,$04,$05,$05,$05,$05,$1B,$1B,$1B,$1B,$1C,$1C ; $809700
    db $1C,$1C,$1C,$1C,$1C,$1C,$1D,$1D,$1D,$1D,$ED,$ED,$ED,$ED,$ED,$6D ; $809710
    db $6D,$6D,$6D,$6D,$6D,$6D,$6D,$ED,$ED,$6D,$6D,$ED,$ED,$ED,$6D,$6D ; $809720
    db $6D,$6D,$6D,$ED,$ED,$6D,$6D,$ED,$ED,$6D,$6D,$ED,$ED,$ED,$ED,$6D ; $809730
    db $6D,$6D,$6D,$ED,$ED,$6D,$6D,$ED,$ED,$ED,$ED,$ED,$6D,$6D,$6D,$6D ; $809740
    db $6D,$6D,$6D,$6D,$6D,$6D,$6D,$6D,$6D,$6D,$6D,$6D,$6D,$6D,$6D,$6D ; $809750
    db $6D,$6D,$6D,$6D,$ED,$ED,$ED,$ED,$ED,$ED,$ED,$ED,$ED,$ED,$ED,$ED ; $809760
    db $ED,$ED,$ED,$ED,$0C,$0B,$0A,$09,$09,$08,$08,$08,$07,$07,$06,$05 ; $809770
    db $04,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$06,$06,$06 ; $809780
    db $06,$0A,$0A,$0A,$0A,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09 ; $809790
    db $09,$94,$11,$94,$11,$7B,$11,$E5,$10,$EE,$0F,$55,$0A,$55,$0A,$A7 ; $8097A0
    db $03,$00,$00,$59,$FC,$59,$FC,$AB,$F5,$12,$F0,$1B,$EF,$1B,$EF,$85 ; $8097B0
    db $EE,$6C,$EE,$85,$EE,$85,$EE,$1B,$EF,$12,$F0,$AB,$F5,$AB,$F5,$59 ; $8097C0
    db $FC,$00,$00,$A7,$03,$A7,$03,$55,$0A,$EE,$0F,$E5,$10,$E5,$10,$7B ; $8097D0
    db $11,$00,$00,$00,$00,$2A,$FE,$28,$FB,$93,$F8,$C8,$F1,$C8,$F1,$CF ; $8097E0
    db $EE,$6C,$EE,$CF,$EE,$CF,$EE,$C8,$F1,$93,$F8,$28,$FB,$28,$FB,$2A ; $8097F0
    db $FE,$00,$00,$D6,$01,$D6,$01,$D8,$04,$6D,$07,$38,$0E,$38,$0E,$31 ; $809800
    db $11,$94,$11,$31,$11,$31,$11,$38,$0E,$6D,$07,$D8,$04,$D8,$04,$D6 ; $809810
    db $01,$B8,$0B,$B8,$0B,$A7,$0B,$43,$0B,$9E,$0A,$E3,$06,$E3,$06,$6F ; $809820
    db $02,$00,$00,$91,$FD,$91,$FD,$1D,$F9,$62,$F5,$BD,$F4,$BD,$F4,$59 ; $809830
    db $F4,$48,$F4,$59,$F4,$59,$F4,$BD,$F4,$62,$F5,$1D,$F9,$1D,$F9,$91 ; $809840
    db $FD,$00,$00,$6F,$02,$6F,$02,$E3,$06,$9E,$0A,$43,$0B,$43,$0B,$A7 ; $809850
    db $0B,$00,$00,$00,$00,$C7,$FE,$C6,$FC,$0D,$FB,$85,$F6,$85,$F6,$8A ; $809860
    db $F4,$48,$F4,$8A,$F4,$8A,$F4,$85,$F6,$0D,$FB,$C6,$FC,$C6,$FC,$C7 ; $809870
    db $FE,$00,$00,$39,$01,$39,$01,$3A,$03,$F3,$04,$7B,$09,$7B,$09,$76 ; $809880
    db $0B,$B8,$0B,$76,$0B,$76,$0B,$7B,$09,$F3,$04,$3A,$03,$3A,$03,$39 ; $809890
    db $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $8098A0
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$F0,$FF,$F8,$FF,$08 ; $8098B0
    db $00,$10,$00,$F0,$FF,$F4,$FF,$F8,$FF,$FC,$FF,$04,$00,$08,$00,$0C ; $8098C0
    db $00,$10,$00,$F0,$FF,$F8,$FF,$08,$00,$10,$00,$F0,$FF,$F8,$FF,$08 ; $8098D0
    db $00,$10,$00,$F0,$FF,$F4,$FF,$F8,$FF,$FC,$FF,$04,$00,$08,$00,$0C ; $8098E0
    db $00,$10,$00,$F0,$FF,$F8,$FF,$08,$00,$10,$00                     ; $8098F0
L_8098FB:
    LDA $0C7E,X                     ; $8098FB  BD 7E 0C     mx
    BNE L_809923                    ; $8098FE  D0 23        mx
    LDA $0EAD,X                     ; $809900  BD AD 0E     mx
    BNE L_809912                    ; $809903  D0 0D        mx
    REP #$30                        ; $809905  C2 30        mx
    LDA #$00A3                      ; $809907  A9 A3 00     MX
    JSL L_81DE31                    ; $80990A  22 31 DE 81  MX
    SEP #$30                        ; $80990E  E2 30        MX
    BRA L_809923                    ; $809910  80 11        mx
L_809912:
    LDA #$0F                        ; $809912  A9 0F        mx
    JSR L_80F92A                    ; $809914  20 2A F9     mx
    DEC $0EAD,X                     ; $809917  DE AD 0E     mx
    LDA $0C76,X                     ; $80991A  BD 76 0C     mx
    CLC                             ; $80991D  18           mx
    ADC #$64                        ; $80991E  69 64        mx
    STA $0C76,X                     ; $809920  9D 76 0C     mx
L_809923:
    RTS                             ; $809923  60           mx
L_809924:
    LDX #$00                        ; $809924  A2 00        mx
    JSR L_809935                    ; $809926  20 35 99     mx
    LDX #$01                        ; $809929  A2 01        mx
    JSR L_809935                    ; $80992B  20 35 99     mx
    LDX #$02                        ; $80992E  A2 02        mx
    JSR L_809935                    ; $809930  20 35 99     mx
    LDX #$03                        ; $809933  A2 03        mx
L_809935:
    LDA $0A1A,X                     ; $809935  BD 1A 0A     mx
    BNE L_80994E                    ; $809938  D0 14        mx
    LDA $0EF1,X                     ; $80993A  BD F1 0E     mx
    BEQ L_80994E                    ; $80993D  F0 0F        mx
    LDA $0ED3,X                     ; $80993F  BD D3 0E     mx
    BEQ L_80994E                    ; $809942  F0 0A        mx
    DEC                             ; $809944  3A           mx
    STA $0ED3,X                     ; $809945  9D D3 0E     mx
    BEQ L_809955                    ; $809948  F0 0B        mx
    CMP #$03                        ; $80994A  C9 03        mx
    BEQ L_80994F                    ; $80994C  F0 01        mx
L_80994E:
    RTS                             ; $80994E  60           mx
L_80994F:
    LDA #$00                        ; $80994F  A9 00        mx
    JSR L_80CD91                    ; $809951  20 91 CD     mx
    RTS                             ; $809954  60           mx
L_809955:
    JSR L_808ACE                    ; $809955  20 CE 8A     mx
    STA $0EDF,X                     ; $809958  9D DF 0E     mx
    STZ $0E5B,X                     ; $80995B  9E 5B 0E     mx
    STZ $80,X                       ; $80995E  74 80        mx
    STZ $84,X                       ; $809960  74 84        mx
    STZ $0B67,X                     ; $809962  9E 67 0B     mx
    LDA $0A1E,X                     ; $809965  BD 1E 0A     mx
    BEQ L_80999D                    ; $809968  F0 33        mx
    STZ $0A1E,X                     ; $80996A  9E 1E 0A     mx
    STZ $0C8A,X                     ; $80996D  9E 8A 0C     mx
    STZ $0CC5,X                     ; $809970  9E C5 0C     mx
    LDA $0A4B,X                     ; $809973  BD 4B 0A     mx
    STA $0BAC,X                     ; $809976  9D AC 0B     mx
    CLC                             ; $809979  18           mx
    ADC #$10                        ; $80997A  69 10        mx
    STA $0A45,X                     ; $80997C  9D 45 0A     mx
    STA $0C29,X                     ; $80997F  9D 29 0C     mx
    STZ $0C2D,X                     ; $809982  9E 2D 0C     mx
    LDA #$05                        ; $809985  A9 05        mx
    STA $0C76,X                     ; $809987  9D 76 0C     mx
    LDA #$01                        ; $80998A  A9 01        mx
    STA $0C7E,X                     ; $80998C  9D 7E 0C     mx
    LDA #$58                        ; $80998F  A9 58        mx
    STA $0220                       ; $809991  8D 20 02     mx
    LDA #$02                        ; $809994  A9 02        mx
    STA $0221                       ; $809996  8D 21 02     mx
    LDA #$08                        ; $809999  A9 08        mx
    BRA L_8099B2                    ; $80999B  80 15        mx
L_80999D:
    LDA $0A4B,X                     ; $80999D  BD 4B 0A     mx
    STA $0BAC,X                     ; $8099A0  9D AC 0B     mx
    STA $0A45,X                     ; $8099A3  9D 45 0A     mx
    STA $0C29,X                     ; $8099A6  9D 29 0C     mx
    STZ $0C2D,X                     ; $8099A9  9E 2D 0C     mx
    STZ $0C76,X                     ; $8099AC  9E 76 0C     mx
    STZ $0C7E,X                     ; $8099AF  9E 7E 0C     mx
L_8099B2:
    LDA $0C31,X                     ; $8099B2  BD 31 0C     mx
    TAY                             ; $8099B5  A8           mx
    LDA $0A99,Y                     ; $8099B6  B9 99 0A     mx
    SEC                             ; $8099B9  38           mx
    SBC $0C31,X                     ; $8099BA  FD 31 0C     mx
    CLC                             ; $8099BD  18           mx
    ADC #$08                        ; $8099BE  69 08        mx
    LSR                             ; $8099C0  4A           mx
    TAY                             ; $8099C1  A8           mx
    LDA $99C9,Y                     ; $8099C2  B9 C9 99     mx
    STA $0C7A,X                     ; $8099C5  9D 7A 0C     mx
    RTS                             ; $8099C8  60           mx
    db $04,$00,$00,$0C,$1C,$00,$00,$00,$14                             ; $8099C9
L_8099D2:
    LDX #$00                        ; $8099D2  A2 00        mx
    JSR L_8099E3                    ; $8099D4  20 E3 99     mx
    LDX #$01                        ; $8099D7  A2 01        mx
    JSR L_8099E3                    ; $8099D9  20 E3 99     mx
    LDX #$02                        ; $8099DC  A2 02        mx
    JSR L_8099E3                    ; $8099DE  20 E3 99     mx
    LDX #$03                        ; $8099E1  A2 03        mx
L_8099E3:
    LDA $0CC1,X                     ; $8099E3  BD C1 0C     mx
    BEQ L_809A04                    ; $8099E6  F0 1C        mx
    DEC $0CC1,X                     ; $8099E8  DE C1 0C     mx
    BNE L_809A6C                    ; $8099EB  D0 7F        mx
    LDA #$05                        ; $8099ED  A9 05        mx
    STA $0B2D,X                     ; $8099EF  9D 2D 0B     mx
    LDA #$01                        ; $8099F2  A9 01        mx
    STA $0B0F,X                     ; $8099F4  9D 0F 0B     mx
    LDA #$80                        ; $8099F7  A9 80        mx
    STA $0B09,X                     ; $8099F9  9D 09 0B     mx
    LDA #$28                        ; $8099FC  A9 28        mx
    STA $0ED3,X                     ; $8099FE  9D D3 0E     mx
    STZ $0C86,X                     ; $809A01  9E 86 0C     mx
L_809A04:
    LDA $0ED3,X                     ; $809A04  BD D3 0E     mx
    BNE L_809A6C                    ; $809A07  D0 63        mx
    LDA $0B4B                       ; $809A09  AD 4B 0B     mx  falling_enabled
    BEQ L_809A34                    ; $809A0C  F0 26        mx
    LDA $0C82,X                     ; $809A0E  BD 82 0C     mx
    BNE L_809A21                    ; $809A11  D0 0E        mx
    LDA $0C7E,X                     ; $809A13  BD 7E 0C     mx
    BNE L_809A34                    ; $809A16  D0 1C        mx
    LDA $0C35,X                     ; $809A18  BD 35 0C     mx
    CMP #$17                        ; $809A1B  C9 17        mx
    BNE L_809A34                    ; $809A1D  D0 15        mx
    LDA #$0B                        ; $809A1F  A9 0B        mx
L_809A21:
    JSR L_809F07                    ; $809A21  20 07 9F     mx
    LDA $0C82,X                     ; $809A24  BD 82 0C     mx
    BNE L_809A34                    ; $809A27  D0 0B        mx
    LDA #$01                        ; $809A29  A9 01        mx
    STA $0A1A,X                     ; $809A2B  9D 1A 0A     mx
    STA $0A1E,X                     ; $809A2E  9D 1E 0A     mx
    STA $0CC5,X                     ; $809A31  9D C5 0C     mx
L_809A34:
    LDA $0CC5,X                     ; $809A34  BD C5 0C     mx
    BNE L_809A3E                    ; $809A37  D0 05        mx
    LDA $0EDF,X                     ; $809A39  BD DF 0E     mx
    BNE L_809A6C                    ; $809A3C  D0 2E        mx
L_809A3E:
    JSR L_809F36                    ; $809A3E  20 36 9F     mx
    LDA #$0A                        ; $809A41  A9 0A        mx
    STA $0CC1,X                     ; $809A43  9D C1 0C     mx
    STZ $0EDF,X                     ; $809A46  9E DF 0E     mx
    STZ $0CC5,X                     ; $809A49  9E C5 0C     mx
    STZ $80,X                       ; $809A4C  74 80        mx
    STZ $84,X                       ; $809A4E  74 84        mx
    STZ $48,X                       ; $809A50  74 48        mx
    LDA $1AEE                       ; $809A52  AD EE 1A     mx
    INC                             ; $809A55  1A           mx
    AND #$03                        ; $809A56  29 03        mx
    STA $1AEE                       ; $809A58  8D EE 1A     mx
    TAY                             ; $809A5B  A8           mx
    LDA $A164,Y                     ; $809A5C  B9 64 A1     mx
    JSR L_80F9AD                    ; $809A5F  20 AD F9     mx
    LDA #$02                        ; $809A62  A9 02        mx
    JSR L_80CD91                    ; $809A64  20 91 CD     mx
    LDA #$09                        ; $809A67  A9 09        mx
    JSR L_80F92A                    ; $809A69  20 2A F9     mx
L_809A6C:
    RTS                             ; $809A6C  60           mx
L_809A6D:
    LDA $0BFE                       ; $809A6D  AD FE 0B     mx
    BEQ L_809A8C                    ; $809A70  F0 1A        mx
    LDA $1AE6                       ; $809A72  AD E6 1A     mx
    ORA $1AE4                       ; $809A75  0D E4 1A     mx
    ORA $1AE5                       ; $809A78  0D E5 1A     mx
    BNE L_809A8C                    ; $809A7B  D0 0F        mx
    DEC $0BEE                       ; $809A7D  CE EE 0B     mx
    BNE L_809A6C                    ; $809A80  D0 EA        mx
    LDA $0E1E                       ; $809A82  AD 1E 0E     mx
    CMP #$01                        ; $809A85  C9 01        mx
    BNE L_809A89                    ; $809A87  D0 00        mx
L_809A89:
    JMP L_80BD13                    ; $809A89  4C 13 BD     mx
L_809A8C:
    LDA $0BFF                       ; $809A8C  AD FF 0B     mx
    BEQ L_809AB0                    ; $809A8F  F0 1F        mx
    CMP #$02                        ; $809A91  C9 02        mx
    BEQ L_809AA1                    ; $809A93  F0 0C        mx
    LDA $0EF1                       ; $809A95  AD F1 0E     mx
    BNE L_809ABA                    ; $809A98  D0 20        mx
    LDA #$01                        ; $809A9A  A9 01        mx
    STA $0BFE                       ; $809A9C  8D FE 0B     mx
    BRA L_809ABA                    ; $809A9F  80 19        mx
L_809AA1:
    LDA $0EF1                       ; $809AA1  AD F1 0E     mx
    ORA $0EF2                       ; $809AA4  0D F2 0E     mx
    BNE L_809ABA                    ; $809AA7  D0 11        mx
    LDA #$01                        ; $809AA9  A9 01        mx
    STA $0BFE                       ; $809AAB  8D FE 0B     mx
    BRA L_809ABA                    ; $809AAE  80 0A        mx
L_809AB0:
    LDA $0BED                       ; $809AB0  AD ED 0B     mx
    BEQ L_809ABA                    ; $809AB3  F0 05        mx
    LDA #$01                        ; $809AB5  A9 01        mx
    STA $0BFE                       ; $809AB7  8D FE 0B     mx
L_809ABA:
    LDA $0BED                       ; $809ABA  AD ED 0B     mx
    BNE L_809ADC                    ; $809ABD  D0 1D        mx
    LDX #$00                        ; $809ABF  A2 00        mx
    LDY #$01                        ; $809AC1  A0 01        mx
L_809AC3:
    LDA $0EF1,X                     ; $809AC3  BD F1 0E     mx
    BNE L_809AD4                    ; $809AC6  D0 0C        mx
    LDA $0EDF,X                     ; $809AC8  BD DF 0E     mx
    BEQ L_809AD4                    ; $809ACB  F0 07        mx
    TYA                             ; $809ACD  98           mx
    ORA $0BED                       ; $809ACE  0D ED 0B     mx
    STA $0BED                       ; $809AD1  8D ED 0B     mx
L_809AD4:
    TYA                             ; $809AD4  98           mx
    ASL                             ; $809AD5  0A           mx
    TAY                             ; $809AD6  A8           mx
    INX                             ; $809AD7  E8           mx
    CPX #$04                        ; $809AD8  E0 04        mx
    BCC L_809AC3                    ; $809ADA  90 E7        mx
L_809ADC:
    RTS                             ; $809ADC  60           mx
L_809ADD:
    STZ $0BF4                       ; $809ADD  9C F4 0B     mx
    STX $0BD0                       ; $809AE0  8E D0 0B     mx
    JSR L_809BD2                    ; $809AE3  20 D2 9B     mx
    LDX $0BD0                       ; $809AE6  AE D0 0B     mx
    LDA $0BC2                       ; $809AE9  AD C2 0B     mx
    BNE L_809B3A                    ; $809AEC  D0 4C        mx
    LDA $0BBB                       ; $809AEE  AD BB 0B     mx
    SEC                             ; $809AF1  38           mx
    SBC $0BBA                       ; $809AF2  ED BA 0B     mx
    CLC                             ; $809AF5  18           mx
    ADC #$08                        ; $809AF6  69 08        mx
    BMI L_809B07                    ; $809AF8  30 0D        mx
L_809AFA:
    LDA $0BAB                       ; $809AFA  AD AB 0B     mx
    STA $0BC7                       ; $809AFD  8D C7 0B     mx
L_809B00:
    LDA $0BAB                       ; $809B00  AD AB 0B     mx
    STA $0BC8                       ; $809B03  8D C8 0B     mx
    RTS                             ; $809B06  60           mx
L_809B07:
    INC $0B67,X                     ; $809B07  FE 67 0B     mx
    LDA #$01                        ; $809B0A  A9 01        mx
    STA $0BC2                       ; $809B0C  8D C2 0B     mx
    LDA #$FF                        ; $809B0F  A9 FF        mx
    STA $0BC6                       ; $809B11  8D C6 0B     mx
    LDA $0BAB                       ; $809B14  AD AB 0B     mx
    CMP $0BAC,X                     ; $809B17  DD AC 0B     mx
    BCS L_809B1F                    ; $809B1A  B0 03        mx
    LDA $0BAC,X                     ; $809B1C  BD AC 0B     mx
L_809B1F:
    STA $0BC5                       ; $809B1F  8D C5 0B     mx
    LDA $0A4F,X                     ; $809B22  BD 4F 0A     mx
    STA $0BFC                       ; $809B25  8D FC 0B     mx
    LDA $0C15,X                     ; $809B28  BD 15 0C     mx
    STA $0BFA                       ; $809B2B  8D FA 0B     mx
    LDA $0C19,X                     ; $809B2E  BD 19 0C     mx
    STA $0BFB                       ; $809B31  8D FB 0B     mx
    LDA $0C1D,X                     ; $809B34  BD 1D 0C     mx
    STA $0BF9                       ; $809B37  8D F9 0B     mx
L_809B3A:
    LDA $0BBB                       ; $809B3A  AD BB 0B     mx
    STA $0BCB                       ; $809B3D  8D CB 0B     mx
    LDA $0BBA                       ; $809B40  AD BA 0B     mx
    STA $0BBB                       ; $809B43  8D BB 0B     mx
    JSR L_809D53                    ; $809B46  20 53 9D     mx
    LDA $0BBB                       ; $809B49  AD BB 0B     mx
    SEC                             ; $809B4C  38           mx
    SBC $1F41                       ; $809B4D  ED 41 1F     mx
    STA $0BBB                       ; $809B50  8D BB 0B     mx
    LDA $0BC5                       ; $809B53  AD C5 0B     mx
    SEC                             ; $809B56  38           mx
    SBC $0BAB                       ; $809B57  ED AB 0B     mx
    CMP #$F0                        ; $809B5A  C9 F0        mx
    BCS L_809B67                    ; $809B5C  B0 09        mx
    LDA $0BC5                       ; $809B5E  AD C5 0B     mx
    STA $0BC7                       ; $809B61  8D C7 0B     mx
    JMP L_809B00                    ; $809B64  4C 00 9B     mx
L_809B67:
    STZ $0B67,X                     ; $809B67  9E 67 0B     mx
    INC $0C8A,X                     ; $809B6A  FE 8A 0C     mx
    STZ $0BC2                       ; $809B6D  9C C2 0B     mx
    LDA $0CB1,X                     ; $809B70  BD B1 0C     mx
    STA $0BFD                       ; $809B73  8D FD 0B     mx
    LDA $0BCB                       ; $809B76  AD CB 0B     mx
    SEC                             ; $809B79  38           mx
    SBC $0BBB                       ; $809B7A  ED BB 0B     mx
    CMP $0BF5                       ; $809B7D  CD F5 0B     mx
    BCC L_809BC7                    ; $809B80  90 45        mx
    CMP #$E0                        ; $809B82  C9 E0        mx
    BCS L_809BC7                    ; $809B84  B0 41        mx
    LDA $0C35,X                     ; $809B86  BD 35 0C     mx
    CMP #$17                        ; $809B89  C9 17        mx
    BEQ L_809BC2                    ; $809B8B  F0 35        mx
    LDA #$0A                        ; $809B8D  A9 0A        mx
    STA $0BBB                       ; $809B8F  8D BB 0B     mx
    LDA $0BC0                       ; $809B92  AD C0 0B     mx
    JSR L_809D4B                    ; $809B95  20 4B 9D     mx
    STA $0BC0                       ; $809B98  8D C0 0B     mx
    JSR L_809D4B                    ; $809B9B  20 4B 9D     mx
    CLC                             ; $809B9E  18           mx
    ADC $0BC0                       ; $809B9F  6D C0 0B     mx
    STA $0BC0                       ; $809BA2  8D C0 0B     mx
    LDA $0BC1                       ; $809BA5  AD C1 0B     mx
    JSR L_809D4B                    ; $809BA8  20 4B 9D     mx
    STA $0BC1                       ; $809BAB  8D C1 0B     mx
    JSR L_809D4B                    ; $809BAE  20 4B 9D     mx
    CLC                             ; $809BB1  18           mx
    ADC $0BC1                       ; $809BB2  6D C1 0B     mx
    STA $0BC1                       ; $809BB5  8D C1 0B     mx
    LDA #$05                        ; $809BB8  A9 05        mx
    JSR L_80F966                    ; $809BBA  20 66 F9     mx
    LDA #$00                        ; $809BBD  A9 00        mx
    JSR L_80C7B0                    ; $809BBF  20 B0 C7     mx
L_809BC2:
    LDA #$01                        ; $809BC2  A9 01        mx
    STA $0BF4                       ; $809BC4  8D F4 0B     mx
L_809BC7:
    JMP L_809AFA                    ; $809BC7  4C FA 9A     mx
L_809BCA:
    PHB                             ; $809BCA  8B           mx
    PHK                             ; $809BCB  4B           mx
    PLB                             ; $809BCC  AB           mx
    JSR L_809BD2                    ; $809BCD  20 D2 9B     mx
    PLB                             ; $809BD0  AB           mx
    RTL                             ; $809BD1  6B           mx
L_809BD2:
    REP #$30                        ; $809BD2  C2 30        mx
    LDA $0BB2                       ; $809BD4  AD B2 0B     MX
    ASL                             ; $809BD7  0A           MX
    SEC                             ; $809BD8  38           MX
    SBC $0BB0                       ; $809BD9  ED B0 0B     MX
    CLC                             ; $809BDC  18           MX
    ADC #$0471                      ; $809BDD  69 71 04     MX
    STA $0BA5                       ; $809BE0  8D A5 0B     MX
    ASL                             ; $809BE3  0A           MX
    ASL                             ; $809BE4  0A           MX
    STA $0BA0                       ; $809BE5  8D A0 0B     MX
    SEP #$30                        ; $809BE8  E2 30        MX
    LDA $0BA1                       ; $809BEA  AD A1 0B     mx
    CLC                             ; $809BED  18           mx
    ADC #$0C                        ; $809BEE  69 0C        mx
    TAY                             ; $809BF0  A8           mx
    LDA $A1C2,Y                     ; $809BF1  B9 C2 A1     mx
    PHA                             ; $809BF4  48           mx
    STA $0BA8                       ; $809BF5  8D A8 0B     mx
    ASL                             ; $809BF8  0A           mx
    CLC                             ; $809BF9  18           mx
    ADC $0BA8                       ; $809BFA  6D A8 0B     mx
    STA $0BA8                       ; $809BFD  8D A8 0B     mx
    STZ $0BA7                       ; $809C00  9C A7 0B     mx
    REP #$30                        ; $809C03  C2 30        mx
    LSR $0BA7                       ; $809C05  4E A7 0B     MX
    LSR $0BA7                       ; $809C08  4E A7 0B     MX
    SEP #$30                        ; $809C0B  E2 30        MX
    SEC                             ; $809C0D  38           mx
    LDA $0BA5                       ; $809C0E  AD A5 0B     mx
    SBC $0BA7                       ; $809C11  ED A7 0B     mx
    STA $0BA5                       ; $809C14  8D A5 0B     mx
    PLA                             ; $809C17  68           mx
    CMP #$08                        ; $809C18  C9 08        mx
    BCC L_809C1E                    ; $809C1A  90 02        mx
    BRA L_809C96                    ; $809C1C  80 78        mx
L_809C1E:
    ASL                             ; $809C1E  0A           mx
    ASL                             ; $809C1F  0A           mx
    ASL                             ; $809C20  0A           mx
    STA $0B9F                       ; $809C21  8D 9F 0B     mx
    REP #$30                        ; $809C24  C2 30        mx
    LDA $0BB2                       ; $809C26  AD B2 0B     MX
    ASL                             ; $809C29  0A           MX
    CLC                             ; $809C2A  18           MX
    ADC $0BB0                       ; $809C2B  6D B0 0B     MX
    ADC #$005E                      ; $809C2E  69 5E 00     MX
    STA $0BA3                       ; $809C31  8D A3 0B     MX
    ASL                             ; $809C34  0A           MX
    ASL                             ; $809C35  0A           MX
    STA $0BA0                       ; $809C36  8D A0 0B     MX
    SEP #$30                        ; $809C39  E2 30        MX
    LDA $0BA1                       ; $809C3B  AD A1 0B     mx
    CLC                             ; $809C3E  18           mx
    ADC #$0C                        ; $809C3F  69 0C        mx
    TAY                             ; $809C41  A8           mx
    LDA $A1C2,Y                     ; $809C42  B9 C2 A1     mx
    PHA                             ; $809C45  48           mx
    STA $0BA8                       ; $809C46  8D A8 0B     mx
    ASL                             ; $809C49  0A           mx
    CLC                             ; $809C4A  18           mx
    ADC $0BA8                       ; $809C4B  6D A8 0B     mx
    STA $0BA8                       ; $809C4E  8D A8 0B     mx
    STZ $0BA7                       ; $809C51  9C A7 0B     mx
    REP #$30                        ; $809C54  C2 30        mx
    LSR $0BA7                       ; $809C56  4E A7 0B     MX
    LSR $0BA7                       ; $809C59  4E A7 0B     MX
    SEP #$30                        ; $809C5C  E2 30        MX
    SEC                             ; $809C5E  38           mx
    LDA $0BA3                       ; $809C5F  AD A3 0B     mx
    SBC $0BA7                       ; $809C62  ED A7 0B     mx
    STA $0BA3                       ; $809C65  8D A3 0B     mx
    PLA                             ; $809C68  68           mx
    CMP #$08                        ; $809C69  C9 08        mx
    BCC L_809C6F                    ; $809C6B  90 02        mx
    BRA L_809C96                    ; $809C6D  80 27        mx
L_809C6F:
    CLC                             ; $809C6F  18           mx
    ADC $0B9F                       ; $809C70  6D 9F 0B     mx
    STA $0B9F                       ; $809C73  8D 9F 0B     mx
    REP #$30                        ; $809C76  C2 30        mx
    LDA $0B9F                       ; $809C78  AD 9F 0B     MX
    AND #$00FF                      ; $809C7B  29 FF 00     MX
    ASL                             ; $809C7E  0A           MX
    ASL                             ; $809C7F  0A           MX
    ASL                             ; $809C80  0A           MX
    ASL                             ; $809C81  0A           MX
    ADC #$1B00                      ; $809C82  69 00 1B     MX
    STA $5A                         ; $809C85  85 5A        MX
    SEP #$30                        ; $809C87  E2 30        MX
    LDY #$00                        ; $809C89  A0 00        mx
    LDA ($5A),Y                     ; $809C8B  B1 5A        mx
    STA $0B9E                       ; $809C8D  8D 9E 0B     mx
    TAY                             ; $809C90  A8           mx
    LDA $9D7C,Y                     ; $809C91  B9 7C 9D     mx
    BNE L_809CA5                    ; $809C94  D0 0F        mx
L_809C96:
    LDA #$17                        ; $809C96  A9 17        mx
    STA $0B9E                       ; $809C98  8D 9E 0B     mx
    STZ $0BAB                       ; $809C9B  9C AB 0B     mx
L_809C9E:
    STZ $0BB6                       ; $809C9E  9C B6 0B     mx
    STZ $0BBB                       ; $809CA1  9C BB 0B     mx
    RTS                             ; $809CA4  60           mx
L_809CA5:
    CMP #$10                        ; $809CA5  C9 10        mx
    BEQ L_809CB8                    ; $809CA7  F0 0F        mx
    CMP #$11                        ; $809CA9  C9 11        mx
    BEQ L_809CC0                    ; $809CAB  F0 13        mx
    TAY                             ; $809CAD  A8           mx
    LDA ($5A),Y                     ; $809CAE  B1 5A        mx
    ASL                             ; $809CB0  0A           mx
    ASL                             ; $809CB1  0A           mx
    ASL                             ; $809CB2  0A           mx
    STA $0BAB                       ; $809CB3  8D AB 0B     mx
    BRA L_809C9E                    ; $809CB6  80 E6        mx
L_809CB8:
    LDA $0BA3                       ; $809CB8  AD A3 0B     mx
    STA $0BA9                       ; $809CBB  8D A9 0B     mx
    BRA L_809CC9                    ; $809CBE  80 09        mx
L_809CC0:
    LDA #$BF                        ; $809CC0  A9 BF        mx
    SEC                             ; $809CC2  38           mx
    SBC $0BA5                       ; $809CC3  ED A5 0B     mx
    STA $0BA9                       ; $809CC6  8D A9 0B     mx
L_809CC9:
    LDA $0BA9                       ; $809CC9  AD A9 0B     mx
    LSR                             ; $809CCC  4A           mx
    LSR                             ; $809CCD  4A           mx
    LSR                             ; $809CCE  4A           mx
    LSR                             ; $809CCF  4A           mx
    LSR                             ; $809CD0  4A           mx
    CLC                             ; $809CD1  18           mx
    ADC #$04                        ; $809CD2  69 04        mx
    TAY                             ; $809CD4  A8           mx
    LDA ($5A),Y                     ; $809CD5  B1 5A        mx
    DEY                             ; $809CD7  88           mx
    SEC                             ; $809CD8  38           mx
    SBC ($5A),Y                     ; $809CD9  F1 5A        mx
    STA $0BB6                       ; $809CDB  8D B6 0B     mx
    TAX                             ; $809CDE  AA           mx
    LDA $0BA9                       ; $809CDF  AD A9 0B     mx
    AND #$1F                        ; $809CE2  29 1F        mx
    CPX #$02                        ; $809CE4  E0 02        mx
    BEQ L_809CED                    ; $809CE6  F0 05        mx
    CPX #$01                        ; $809CE8  E0 01        mx
    BNE L_809CF0                    ; $809CEA  D0 04        mx
    LSR                             ; $809CEC  4A           mx
L_809CED:
    LSR                             ; $809CED  4A           mx
    BRA L_809D01                    ; $809CEE  80 11        mx
L_809CF0:
    CPX #$00                        ; $809CF0  E0 00        mx
    BNE L_809CF8                    ; $809CF2  D0 04        mx
    LDA #$00                        ; $809CF4  A9 00        mx
    BRA L_809D01                    ; $809CF6  80 09        mx
L_809CF8:
    CPX #$FF                        ; $809CF8  E0 FF        mx
    BNE L_809CFD                    ; $809CFA  D0 01        mx
    LSR                             ; $809CFC  4A           mx
L_809CFD:
    LSR                             ; $809CFD  4A           mx
    EOR #$FF                        ; $809CFE  49 FF        mx
    INC                             ; $809D00  1A           mx
L_809D01:
    STA $0BAA                       ; $809D01  8D AA 0B     mx
    LDA ($5A),Y                     ; $809D04  B1 5A        mx
    ASL                             ; $809D06  0A           mx
    ASL                             ; $809D07  0A           mx
    ASL                             ; $809D08  0A           mx
    ADC $0BAA                       ; $809D09  6D AA 0B     mx
    STA $0BAB                       ; $809D0C  8D AB 0B     mx
    LDA $0B9E                       ; $809D0F  AD 9E 0B     mx
    CMP #$04                        ; $809D12  C9 04        mx
    BNE L_809D38                    ; $809D14  D0 22        mx
    LDA $0BC0                       ; $809D16  AD C0 0B     mx
    JSR L_809D4B                    ; $809D19  20 4B 9D     mx
    JSR L_809D4B                    ; $809D1C  20 4B 9D     mx
    STA $88                         ; $809D1F  85 88        mx
    LDA $0BC1                       ; $809D21  AD C1 0B     mx
L_809D24:
    JSR L_809D4B                    ; $809D24  20 4B 9D     mx
    JSR L_809D4B                    ; $809D27  20 4B 9D     mx
    CLC                             ; $809D2A  18           mx
    ADC $88                         ; $809D2B  65 88        mx
    TAX                             ; $809D2D  AA           mx
    LDY $0BB6                       ; $809D2E  AC B6 0B     mx
    JSR L_809DC8                    ; $809D31  20 C8 9D     mx
    STA $0BBB                       ; $809D34  8D BB 0B     mx
    RTS                             ; $809D37  60           mx
L_809D38:
    LDA $0BC1                       ; $809D38  AD C1 0B     mx
    EOR #$FF                        ; $809D3B  49 FF        mx
    INC                             ; $809D3D  1A           mx
    JSR L_809D4B                    ; $809D3E  20 4B 9D     mx
    JSR L_809D4B                    ; $809D41  20 4B 9D     mx
    STA $88                         ; $809D44  85 88        mx
    LDA $0BC0                       ; $809D46  AD C0 0B     mx
    BRA L_809D24                    ; $809D49  80 D9        mx
L_809D4B:
    LSR                             ; $809D4B  4A           mx
    CMP #$40                        ; $809D4C  C9 40        mx
    BCC L_809D52                    ; $809D4E  90 02        mx
    EOR #$80                        ; $809D50  49 80        mx
L_809D52:
    RTS                             ; $809D52  60           mx
L_809D53:
    STZ $0BC3                       ; $809D53  9C C3 0B     mx
    LDA $0BBB                       ; $809D56  AD BB 0B     mx
    STA $0BC4                       ; $809D59  8D C4 0B     mx
    BPL L_809D61                    ; $809D5C  10 03        mx
    DEC $0BC3                       ; $809D5E  CE C3 0B     mx
L_809D61:
    LDY #$05                        ; $809D61  A0 05        mx
L_809D63:
    ASL $0BC4                       ; $809D63  0E C4 0B     mx
    ROL $0BC3                       ; $809D66  2E C3 0B     mx
    DEY                             ; $809D69  88           mx
    BNE L_809D63                    ; $809D6A  D0 F7        mx
    LDA $0BC6                       ; $809D6C  AD C6 0B     mx
    CLC                             ; $809D6F  18           mx
    ADC $0BC4                       ; $809D70  6D C4 0B     mx
    STA $0BC6                       ; $809D73  8D C6 0B     mx
    LDA $0BC5                       ; $809D76  AD C5 0B     mx
    ADC $0BC3                       ; $809D79  6D C3 0B     mx
    STA $0BC5                       ; $809D7C  8D C5 0B     mx
    RTS                             ; $809D7F  60           mx
    db $10,$11,$0F,$0F,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 ; $809D80
    db $05,$03,$03,$00                                                 ; $809D90
L_809D94:
    STZ $0B97                       ; $809D94  9C 97 0B     mx
    STZ $0B99                       ; $809D97  9C 99 0B     mx
    BRA L_809DA7                    ; $809D9A  80 0B        mx
L_809D9C:
    STZ $0B99                       ; $809D9C  9C 99 0B     mx
    LDA $0B98                       ; $809D9F  AD 98 0B     mx
    BPL L_809DA7                    ; $809DA2  10 03        mx
    DEC $0B99                       ; $809DA4  CE 99 0B     mx
L_809DA7:
    REP #$30                        ; $809DA7  C2 30        mx
    LDA $0B96                       ; $809DA9  AD 96 0B     MX
    STA $0B9C                       ; $809DAC  8D 9C 0B     MX
    LDA #$0000                      ; $809DAF  A9 00 00     MX
    LDY #$0010                      ; $809DB2  A0 10 00     MX
L_809DB5:
    ASL                             ; $809DB5  0A           MX
    ASL $0B9C                       ; $809DB6  0E 9C 0B     MX
    BCC L_809DBF                    ; $809DB9  90 04        MX
    CLC                             ; $809DBB  18           MX
    ADC $0B98                       ; $809DBC  6D 98 0B     MX
L_809DBF:
    DEY                             ; $809DBF  88           MX
    BNE L_809DB5                    ; $809DC0  D0 F3        MX
    STA $0B9A                       ; $809DC2  8D 9A 0B     MX
    SEP #$30                        ; $809DC5  E2 30        MX
    RTS                             ; $809DC7  60           mx
L_809DC8:
    STX $0BBC                       ; $809DC8  8E BC 0B     mx
    STX $0BBF                       ; $809DCB  8E BF 0B     mx
    STY $0BBD                       ; $809DCE  8C BD 0B     mx
    LDA #$00                        ; $809DD1  A9 00        mx
    LDX #$08                        ; $809DD3  A2 08        mx
L_809DD5:
    ASL                             ; $809DD5  0A           mx
    ASL $0BBF                       ; $809DD6  0E BF 0B     mx
    BCC L_809DDF                    ; $809DD9  90 04        mx
    CLC                             ; $809DDB  18           mx
    ADC $0BBD                       ; $809DDC  6D BD 0B     mx
L_809DDF:
    DEX                             ; $809DDF  CA           mx
    BNE L_809DD5                    ; $809DE0  D0 F3        mx
    LDX $0BBC                       ; $809DE2  AE BC 0B     mx
    LDY $0BBD                       ; $809DE5  AC BD 0B     mx
    RTS                             ; $809DE8  60           mx
L_809DE9:
    AND #$FF                        ; $809DE9  29 FF        mx
    BEQ L_809DF3                    ; $809DEB  F0 06        mx
    BPL L_809DF4                    ; $809DED  10 05        mx
    TYA                             ; $809DEF  98           mx
    EOR #$FF                        ; $809DF0  49 FF        mx
    INC                             ; $809DF2  1A           mx
L_809DF3:
    RTS                             ; $809DF3  60           mx
L_809DF4:
    TYA                             ; $809DF4  98           mx
    RTS                             ; $809DF5  60           mx
L_809DF6:
    PHX                             ; $809DF6  DA           mx
    PHY                             ; $809DF7  5A           mx
    LDY #$00                        ; $809DF8  A0 00        mx
    LDA $0B83                       ; $809DFA  AD 83 0B     mx
    BPL L_809E03                    ; $809DFD  10 04        mx
    INY                             ; $809DFF  C8           mx
    EOR #$FF                        ; $809E00  49 FF        mx
    INC                             ; $809E02  1A           mx
L_809E03:
    STA $0B85                       ; $809E03  8D 85 0B     mx
    LDA $0B84                       ; $809E06  AD 84 0B     mx
    BPL L_809E0F                    ; $809E09  10 04        mx
    INY                             ; $809E0B  C8           mx
    EOR #$FF                        ; $809E0C  49 FF        mx
    INC                             ; $809E0E  1A           mx
L_809E0F:
    STA $0B86                       ; $809E0F  8D 86 0B     mx
    LDX #$08                        ; $809E12  A2 08        mx
    STZ $0B9A                       ; $809E14  9C 9A 0B     mx
    STZ $0B9B                       ; $809E17  9C 9B 0B     mx
L_809E1A:
    ASL $0B9A                       ; $809E1A  0E 9A 0B     mx
    ROL $0B9B                       ; $809E1D  2E 9B 0B     mx
    ASL $0B85                       ; $809E20  0E 85 0B     mx
    BCC L_809E37                    ; $809E23  90 12        mx
    CLC                             ; $809E25  18           mx
    LDA $0B9A                       ; $809E26  AD 9A 0B     mx
    ADC $0B86                       ; $809E29  6D 86 0B     mx
    STA $0B9A                       ; $809E2C  8D 9A 0B     mx
    LDA $0B9B                       ; $809E2F  AD 9B 0B     mx
    ADC #$00                        ; $809E32  69 00        mx
    STA $0B9B                       ; $809E34  8D 9B 0B     mx
L_809E37:
    DEX                             ; $809E37  CA           mx
    BNE L_809E1A                    ; $809E38  D0 E0        mx
    TYA                             ; $809E3A  98           mx
    AND #$01                        ; $809E3B  29 01        mx
    BEQ L_809E4D                    ; $809E3D  F0 0E        mx
    REP #$30                        ; $809E3F  C2 30        mx
    LDA $0B9A                       ; $809E41  AD 9A 0B     MX
    EOR #$FFFF                      ; $809E44  49 FF FF     MX
    INC                             ; $809E47  1A           MX
    STA $0B9A                       ; $809E48  8D 9A 0B     MX
    SEP #$30                        ; $809E4B  E2 30        MX
L_809E4D:
    PLY                             ; $809E4D  7A           mx
    PLX                             ; $809E4E  FA           mx
    RTS                             ; $809E4F  60           mx
L_809E50:
    STZ $0B7B                       ; $809E50  9C 7B 0B     mx
    LDA $0B77                       ; $809E53  AD 77 0B     mx
    BNE L_809E61                    ; $809E56  D0 09        mx
    LDA #$FF                        ; $809E58  A9 FF        mx
    STA $0B75                       ; $809E5A  8D 75 0B     mx
    STA $0B76                       ; $809E5D  8D 76 0B     mx
    RTS                             ; $809E60  60           mx
L_809E61:
    LDA $0B9A                       ; $809E61  AD 9A 0B     mx
    STA $0B73                       ; $809E64  8D 73 0B     mx
    LDA $0B9B                       ; $809E67  AD 9B 0B     mx
    STA $0B74                       ; $809E6A  8D 74 0B     mx
    BPL L_809E83                    ; $809E6D  10 14        mx
    INC $0B7B                       ; $809E6F  EE 7B 0B     mx
    LDA #$00                        ; $809E72  A9 00        mx
    SEC                             ; $809E74  38           mx
    SBC $0B73                       ; $809E75  ED 73 0B     mx
    STA $0B73                       ; $809E78  8D 73 0B     mx
    LDA $0B74                       ; $809E7B  AD 74 0B     mx
    SBC #$00                        ; $809E7E  E9 00        mx
    STA $0B74                       ; $809E80  8D 74 0B     mx
L_809E83:
    LDA $0B77                       ; $809E83  AD 77 0B     mx
    STA $0B79                       ; $809E86  8D 79 0B     mx
    LDA $0B78                       ; $809E89  AD 78 0B     mx
    STA $0B7A                       ; $809E8C  8D 7A 0B     mx
    STZ $0B78                       ; $809E8F  9C 78 0B     mx
    LDY #$00                        ; $809E92  A0 00        mx
L_809E94:
    INY                             ; $809E94  C8           mx
    ASL $0B79                       ; $809E95  0E 79 0B     mx
    ROL $0B7A                       ; $809E98  2E 7A 0B     mx
    BPL L_809E94                    ; $809E9B  10 F7        mx
    PHX                             ; $809E9D  DA           mx
    LDX #$00                        ; $809E9E  A2 00        mx
L_809EA0:
    SEC                             ; $809EA0  38           mx
    LDA $0B73                       ; $809EA1  AD 73 0B     mx
    SBC $0B79                       ; $809EA4  ED 79 0B     mx
    STA $0B73                       ; $809EA7  8D 73 0B     mx
    LDA $0B74                       ; $809EAA  AD 74 0B     mx
    SBC $0B7A                       ; $809EAD  ED 7A 0B     mx
    STA $0B74                       ; $809EB0  8D 74 0B     mx
    BCS L_809EC9                    ; $809EB3  B0 14        mx
    CLC                             ; $809EB5  18           mx
    LDA $0B73                       ; $809EB6  AD 73 0B     mx
    ADC $0B79                       ; $809EB9  6D 79 0B     mx
    STA $0B73                       ; $809EBC  8D 73 0B     mx
    LDA $0B74                       ; $809EBF  AD 74 0B     mx
    ADC $0B7A                       ; $809EC2  6D 7A 0B     mx
    STA $0B74                       ; $809EC5  8D 74 0B     mx
    CLC                             ; $809EC8  18           mx
L_809EC9:
    ROL $0B75                       ; $809EC9  2E 75 0B     mx
    ROL $0B76                       ; $809ECC  2E 76 0B     mx
    LSR $0B7A                       ; $809ECF  4E 7A 0B     mx
    ROR $0B79                       ; $809ED2  6E 79 0B     mx
    INX                             ; $809ED5  E8           mx
    CPX #$10                        ; $809ED6  E0 10        mx
    BNE L_809EA0                    ; $809ED8  D0 C6        mx
    PLX                             ; $809EDA  FA           mx
    LDA #$0F                        ; $809EDB  A9 0F        mx
    SEC                             ; $809EDD  38           mx
    STY $0B73                       ; $809EDE  8C 73 0B     mx
    SBC $0B73                       ; $809EE1  ED 73 0B     mx
    TAY                             ; $809EE4  A8           mx
L_809EE5:
    BEQ L_809EF0                    ; $809EE5  F0 09        mx
    LSR $0B76                       ; $809EE7  4E 76 0B     mx
    ROR $0B75                       ; $809EEA  6E 75 0B     mx
    DEY                             ; $809EED  88           mx
    BNE L_809EE5                    ; $809EEE  D0 F5        mx
L_809EF0:
    LDA $0B7B                       ; $809EF0  AD 7B 0B     mx
    BEQ L_809F06                    ; $809EF3  F0 11        mx
    LDA #$00                        ; $809EF5  A9 00        mx
    SEC                             ; $809EF7  38           mx
    SBC $0B75                       ; $809EF8  ED 75 0B     mx
    STA $0B75                       ; $809EFB  8D 75 0B     mx
    LDA #$00                        ; $809EFE  A9 00        mx
    SBC $0B76                       ; $809F00  ED 76 0B     mx
    STA $0B76                       ; $809F03  8D 76 0B     mx
L_809F06:
    RTS                             ; $809F06  60           mx
L_809F07:
    DEC                             ; $809F07  3A           mx
    STA $0C82,X                     ; $809F08  9D 82 0C     mx
    LDA #$01                        ; $809F0B  A9 01        mx
    STA $0C7E,X                     ; $809F0D  9D 7E 0C     mx
    LDA #$05                        ; $809F10  A9 05        mx
    STA $0C8F,X                     ; $809F12  9D 8F 0C     mx
    LDA $80,X                       ; $809F15  B5 80        mx
    BMI L_809F22                    ; $809F17  30 09        mx
    SEC                             ; $809F19  38           mx
    SBC #$02                        ; $809F1A  E9 02        mx
    BPL L_809F29                    ; $809F1C  10 0B        mx
    LDA #$00                        ; $809F1E  A9 00        mx
    BRA L_809F29                    ; $809F20  80 07        mx
L_809F22:
    CLC                             ; $809F22  18           mx
    ADC #$02                        ; $809F23  69 02        mx
    BMI L_809F29                    ; $809F25  30 02        mx
    LDA #$00                        ; $809F27  A9 00        mx
L_809F29:
    STA $80,X                       ; $809F29  95 80        mx
    LDA $84,X                       ; $809F2B  B5 84        mx
    CLC                             ; $809F2D  18           mx
    ADC #$04                        ; $809F2E  69 04        mx
    STA $84,X                       ; $809F30  95 84        mx
    STZ $0C76,X                     ; $809F32  9E 76 0C     mx
    RTS                             ; $809F35  60           mx
L_809F36:
    LDA $0C35,X                     ; $809F36  BD 35 0C     mx
    CMP #$17                        ; $809F39  C9 17        mx
    BNE L_809F45                    ; $809F3B  D0 08        mx
    LDA #$01                        ; $809F3D  A9 01        mx
    STA $0A1A,X                     ; $809F3F  9D 1A 0A     mx
    STA $0A1E,X                     ; $809F42  9D 1E 0A     mx
L_809F45:
    LDA $0C86,X                     ; $809F45  BD 86 0C     mx
    BEQ L_809F4B                    ; $809F48  F0 01        mx
    RTS                             ; $809F4A  60           mx
L_809F4B:
    JSR L_80DC26                    ; $809F4B  20 26 DC     mx
    AND #$07                        ; $809F4E  29 07        mx
    LDY $0DF2,X                     ; $809F50  BC F2 0D     mx
    CPY #$00                        ; $809F53  C0 00        mx
    BEQ L_809F5B                    ; $809F55  F0 04        mx
    CPY #$01                        ; $809F57  C0 01        mx
    BNE L_809F5D                    ; $809F59  D0 02        mx
L_809F5B:
    AND #$03                        ; $809F5B  29 03        mx
L_809F5D:
    ASL                             ; $809F5D  0A           mx
    ASL                             ; $809F5E  0A           mx
    TAY                             ; $809F5F  A8           mx
    LDA $9F78,Y                     ; $809F60  B9 78 9F     mx
    JSR L_809F98                    ; $809F63  20 98 9F     mx
    LDA $9F79,Y                     ; $809F66  B9 79 9F     mx
    JSR L_809F98                    ; $809F69  20 98 9F     mx
    LDA $9F7A,Y                     ; $809F6C  B9 7A 9F     mx
    JSR L_809F98                    ; $809F6F  20 98 9F     mx
    LDA $9F7B,Y                     ; $809F72  B9 7B 9F     mx
    JMP L_809F98                    ; $809F75  4C 98 9F     mx
    db $08,$02,$04,$06,$08,$04,$06,$0A,$08,$06,$0A,$0C,$08,$0A,$0C,$02 ; $809F78
    db $00,$00,$00,$00,$08,$00,$02,$04,$08,$00,$04,$06,$08,$00,$06,$0A ; $809F88
L_809F98:
    STA $88                         ; $809F98  85 88        mx
    PHY                             ; $809F9A  5A           mx
    STX $0BD0                       ; $809F9B  8E D0 0B     mx
    REP #$30                        ; $809F9E  C2 30        mx
    LDA $0F0F                       ; $809FA0  AD 0F 0F     MX
    CMP #$0013                      ; $809FA3  C9 13 00     MX
    BCS L_80A005                    ; $809FA6  B0 5D        MX
    JSR L_80D1C7                    ; $809FA8  20 C7 D1     MX
    STX $1257                       ; $809FAB  8E 57 12     MX
    TXA                             ; $809FAE  8A           MX
    ASL                             ; $809FAF  0A           MX
    STA $1259                       ; $809FB0  8D 59 12     MX
    LDX $1257                       ; $809FB3  AE 57 12     MX
    INC $0F0F                       ; $809FB6  EE 0F 0F     MX
    LDA #$0001                      ; $809FB9  A9 01 00     MX
    STA $0F11,X                     ; $809FBC  9D 11 0F     MX
    LDA #$8905                      ; $809FBF  A9 05 89     MX
    STA $0F41,X                     ; $809FC2  9D 41 0F     MX
    JSR L_80DC26                    ; $809FC5  20 26 DC     MX
    AND #$0007                      ; $809FC8  29 07 00     MX
    XBA                             ; $809FCB  EB           MX
    SEC                             ; $809FCC  38           MX
    SBC #$0300                      ; $809FCD  E9 00 03     MX
    STA $1061,X                     ; $809FD0  9D 61 10     MX
    STZ $1091,X                     ; $809FD3  9E 91 10     MX
    JSR L_80DC26                    ; $809FD6  20 26 DC     MX
    AND #$0007                      ; $809FD9  29 07 00     MX
    CLC                             ; $809FDC  18           MX
    ADC #$000F                      ; $809FDD  69 0F 00     MX
    STA $10C1,X                     ; $809FE0  9D C1 10     MX
    LDA $88                         ; $809FE3  A5 88        MX
    AND #$00FF                      ; $809FE5  29 FF 00     MX
    CLC                             ; $809FE8  18           MX
    ADC #$0080                      ; $809FE9  69 80 00     MX
    STA $11B1,X                     ; $809FEC  9D B1 11     MX
    LDA #$003D                      ; $809FEF  A9 3D 00     MX
    STA $11E1,X                     ; $809FF2  9D E1 11     MX
    STZ $1211,X                     ; $809FF5  9E 11 12     MX
    SEP #$30                        ; $809FF8  E2 30        MX
    LDX $0BD0                       ; $809FFA  AE D0 0B     mx
    LDA #$01                        ; $809FFD  A9 01        mx
    JSR L_8095E5                    ; $809FFF  20 E5 95     mx
    LDX $0BD0                       ; $80A002  AE D0 0B     mx
L_80A005:
    SEP #$30                        ; $80A005  E2 30        mx
    PLY                             ; $80A007  7A           mx
    RTS                             ; $80A008  60           mx
L_80A009:
    LDA $0EE9,X                     ; $80A009  BD E9 0E     mx
    STA $0BD2                       ; $80A00C  8D D2 0B     mx
    LDA $0C4D,X                     ; $80A00F  BD 4D 0C     mx
    TAY                             ; $80A012  A8           mx
    LDA $0EE5,X                     ; $80A013  BD E5 0E     mx
    CLC                             ; $80A016  18           mx
    ADC $A13E,Y                     ; $80A017  79 3E A1     mx
    STA $0BD4                       ; $80A01A  8D D4 0B     mx
    RTS                             ; $80A01D  60           mx
    db $00,$02,$04,$06,$08,$0A,$00,$03,$06,$09,$0C,$0F,$12,$15,$18,$1B ; $80A01E
    db $1E,$21,$24,$27,$2A,$2D,$00,$04,$08,$0C,$10,$14,$01,$01,$01,$05 ; $80A02E
    db $05,$05,$0D,$0D,$10,$10,$10,$0C,$0C,$0C,$04,$04,$20,$20,$20,$1C ; $80A03E
    db $1C,$1C,$14,$14,$11,$11,$11,$15,$15,$15,$1D,$1D,$06,$06,$06,$06 ; $80A04E
    db $06,$06,$06,$06,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$1B,$1B,$1B,$1B ; $80A05E
    db $1B,$1B,$1B,$1B,$16,$16,$16,$16,$16,$16,$16,$16,$02,$02,$02,$07 ; $80A06E
    db $07,$07,$0E,$0E,$0F,$0F,$0F,$0A,$0A,$0A,$03,$03,$1F,$1F,$1F,$1A ; $80A07E
    db $1A,$1A,$13,$13,$12,$12,$12,$17,$17,$17,$1E,$1E,$08,$08,$08,$08 ; $80A08E
    db $08,$08,$08,$08,$09,$09,$09,$09,$09,$09,$09,$09,$19,$19,$19,$19 ; $80A09E
    db $19,$19,$19,$19,$18,$18,$18,$18,$18,$18,$18,$18,$09,$09,$09,$09 ; $80A0AE
    db $09,$09,$09,$09,$08,$08,$08,$08,$08,$08,$08,$08,$18,$18,$18,$18 ; $80A0BE
    db $18,$18,$18,$18,$19,$19,$19,$19,$19,$19,$19,$19,$03,$03,$03,$0A ; $80A0CE
    db $0A,$0A,$0F,$0F,$0E,$0E,$0E,$07,$07,$07,$02,$02,$1E,$1E,$1E,$17 ; $80A0DE
    db $17,$17,$12,$12,$13,$13,$13,$1A,$1A,$1A,$1F,$1F,$0B,$0B,$0B,$0B ; $80A0EE
    db $0B,$0B,$0B,$0B,$06,$06,$06,$06,$06,$06,$06,$06,$16,$16,$16,$16 ; $80A0FE
    db $16,$16,$16,$16,$1B,$1B,$1B,$1B,$1B,$1B,$1B,$1B,$04,$04,$04,$0C ; $80A10E
    db $0C,$0C,$10,$10,$0D,$0D,$0D,$05,$05,$05,$01,$01,$1D,$1D,$1D,$15 ; $80A11E
    db $15,$15,$11,$11,$14,$14,$14,$1C,$1C,$1C,$20,$20,$06,$08,$0A,$0C ; $80A12E
    db $FE,$00,$01,$02,$1E,$22,$26,$32,$FD,$FD,$FD,$FD,$FF,$FD,$01,$02 ; $80A13E
    db $03,$FF,$03,$FF,$FF,$FF,$00,$03,$FF,$FF,$03,$FF,$FF,$FF,$03,$FF ; $80A14E
    db $FF,$FF,$03,$04,$05,$06,$00,$01,$02,$08,$04,$00,$05,$06,$08,$07 ; $80A15E
    db $01,$04,$04,$00,$00,$01,$01,$03,$03,$04,$04,$00,$00,$02,$02,$03 ; $80A16E
    db $03,$04,$04,$03,$02,$03,$02,$03,$02,$03,$02,$04,$04,$03,$03,$04 ; $80A17E
    db $03,$02,$04,$00,$04,$04,$00,$00,$04,$04,$00,$00,$00,$00,$00,$00 ; $80A18E
    db $04,$00,$04,$01,$01,$00,$00,$01,$00,$00,$01,$01,$01,$01,$01,$01 ; $80A19E
    db $01,$01,$01,$03,$04,$01,$01,$03,$05,$05,$02,$02,$00,$00,$00,$01 ; $80A1AE
    db $01,$00,$32,$01,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09 ; $80A1BE
    db $00,$00,$00,$01,$01,$01,$02,$02,$02,$03,$03,$03,$04,$04,$04,$05 ; $80A1CE
    db $05,$05,$06,$06,$06,$07,$07,$07,$09,$09,$09,$09,$09,$09,$09,$09 ; $80A1DE
    db $09,$09,$09,$09                                                 ; $80A1EE
L_80A1F2:
    PHB                             ; $80A1F2  8B           mx
    PHK                             ; $80A1F3  4B           mx
    PLB                             ; $80A1F4  AB           mx
    JSR L_80A1FA                    ; $80A1F5  20 FA A1     mx
    PLB                             ; $80A1F8  AB           mx
    RTL                             ; $80A1F9  6B           mx
L_80A1FA:
    REP #$30                        ; $80A1FA  C2 30        mx
    LDA #$0080                      ; $80A1FC  A9 80 00     MX
    STA $2115                       ; $80A1FF  8D 15 21     MX
    LDA $035B                       ; $80A202  AD 5B 03     MX
    STA $2116                       ; $80A205  8D 16 21     MX
    LDY #$1000                      ; $80A208  A0 00 10     MX
    LDA #$2000                      ; $80A20B  A9 00 20     MX
    ORA #$0000                      ; $80A20E  09 00 00     MX
L_80A211:
    STA $2118                       ; $80A211  8D 18 21     MX
    DEY                             ; $80A214  88           MX
    BNE L_80A211                    ; $80A215  D0 FA        MX
    SEP #$30                        ; $80A217  E2 30        MX
    RTS                             ; $80A219  60           mx
L_80A21A:
    PHB                             ; $80A21A  8B           MX
    PHK                             ; $80A21B  4B           MX
    PLB                             ; $80A21C  AB           MX
    PHA                             ; $80A21D  48           MX
    PHX                             ; $80A21E  DA           MX
    JSR L_80A226                    ; $80A21F  20 26 A2     MX
    PLX                             ; $80A222  FA           MX
    PLA                             ; $80A223  68           MX
    PLB                             ; $80A224  AB           MX
    RTL                             ; $80A225  6B           MX
L_80A226:
    LDA #$0080                      ; $80A226  A9 80 00     MX
    STA $2115                       ; $80A229  8D 15 21     MX
    LDA $03,S                       ; $80A22C  A3 03        MX
    ASL                             ; $80A22E  0A           MX
    ASL                             ; $80A22F  0A           MX
    ASL                             ; $80A230  0A           MX
    ASL                             ; $80A231  0A           MX
    CLC                             ; $80A232  18           MX
    ADC #$2000                      ; $80A233  69 00 20     MX
    STA $68                         ; $80A236  85 68        MX
    LDA $05,S                       ; $80A238  A3 05        MX
    STA $6A                         ; $80A23A  85 6A        MX
    SEP #$30                        ; $80A23C  E2 30        MX
    LDX #$00                        ; $80A23E  A2 00        mx
L_80A240:
    LDA $68                         ; $80A240  A5 68        mx
    STA $2116                       ; $80A242  8D 16 21     mx
    LDA $69                         ; $80A245  A5 69        mx
    STA $2117                       ; $80A247  8D 17 21     mx
    LDA #$01                        ; $80A24A  A9 01        mx
    STA $4300                       ; $80A24C  8D 00 43     mx
    LDA #$18                        ; $80A24F  A9 18        mx
    STA $4301                       ; $80A251  8D 01 43     mx
    LDA $6A                         ; $80A254  A5 6A        mx
    STA $4302                       ; $80A256  8D 02 43     mx
    LDA $6B                         ; $80A259  A5 6B        mx
    STA $4303                       ; $80A25B  8D 03 43     mx
    LDA #$7E                        ; $80A25E  A9 7E        mx
    STA $4304                       ; $80A260  8D 04 43     mx
    LDA #$00                        ; $80A263  A9 00        mx
    STA $4305                       ; $80A265  8D 05 43     mx
    LDA #$01                        ; $80A268  A9 01        mx
    STA $4306                       ; $80A26A  8D 06 43     mx
    LDA #$01                        ; $80A26D  A9 01        mx
    STA $420B                       ; $80A26F  8D 0B 42     mx
    INC $69                         ; $80A272  E6 69        mx
    INC $6B                         ; $80A274  E6 6B        mx
    INX                             ; $80A276  E8           mx
    CPX #$08                        ; $80A277  E0 08        mx
    BCC L_80A240                    ; $80A279  90 C5        mx
    REP #$30                        ; $80A27B  C2 30        mx
    RTS                             ; $80A27D  60           MX
L_80A27E:
    PHB                             ; $80A27E  8B           MX
    PHK                             ; $80A27F  4B           MX
    PLB                             ; $80A280  AB           MX
    PHA                             ; $80A281  48           MX
    PHX                             ; $80A282  DA           MX
    JSR L_80A28A                    ; $80A283  20 8A A2     MX
    PLX                             ; $80A286  FA           MX
    PLA                             ; $80A287  68           MX
    PLB                             ; $80A288  AB           MX
    RTL                             ; $80A289  6B           MX
L_80A28A:
    LDA $03,S                       ; $80A28A  A3 03        MX
    ASL                             ; $80A28C  0A           MX
    ASL                             ; $80A28D  0A           MX
    ASL                             ; $80A28E  0A           MX
    ASL                             ; $80A28F  0A           MX
    ADC #$2000                      ; $80A290  69 00 20     MX
    STA $68                         ; $80A293  85 68        MX
    LDA $05,S                       ; $80A295  A3 05        MX
    STA $6A                         ; $80A297  85 6A        MX
    SEP #$30                        ; $80A299  E2 30        MX
    LDA #$80                        ; $80A29B  A9 80        mx
    STA $2115                       ; $80A29D  8D 15 21     mx
    LDA #$01                        ; $80A2A0  A9 01        mx
    STA $4300                       ; $80A2A2  8D 00 43     mx
    LDA #$18                        ; $80A2A5  A9 18        mx
    STA $4301                       ; $80A2A7  8D 01 43     mx
    LDA #$7E                        ; $80A2AA  A9 7E        mx
    STA $4304                       ; $80A2AC  8D 04 43     mx
    REP #$30                        ; $80A2AF  C2 30        mx
    LDX #$0006                      ; $80A2B1  A2 06 00     MX
L_80A2B4:
    LDA $68                         ; $80A2B4  A5 68        MX
    STA $2116                       ; $80A2B6  8D 16 21     MX
    LDA $6A                         ; $80A2B9  A5 6A        MX
    STA $4302                       ; $80A2BB  8D 02 43     MX
    LDA #$00C0                      ; $80A2BE  A9 C0 00     MX
    STA $4305                       ; $80A2C1  8D 05 43     MX
    SEP #$30                        ; $80A2C4  E2 30        MX
    LDA #$01                        ; $80A2C6  A9 01        mx
    STA $420B                       ; $80A2C8  8D 0B 42     mx
    REP #$30                        ; $80A2CB  C2 30        mx
    LDA $6A                         ; $80A2CD  A5 6A        MX
    CLC                             ; $80A2CF  18           MX
    ADC #$00C0                      ; $80A2D0  69 C0 00     MX
    STA $6A                         ; $80A2D3  85 6A        MX
    INC $69                         ; $80A2D5  E6 69        MX
    DEX                             ; $80A2D7  CA           MX
    BNE L_80A2B4                    ; $80A2D8  D0 DA        MX
    RTS                             ; $80A2DA  60           MX
L_80A2DB:
    PHB                             ; $80A2DB  8B           MX
    PHK                             ; $80A2DC  4B           MX
    PLB                             ; $80A2DD  AB           MX
    PHA                             ; $80A2DE  48           MX
    PHX                             ; $80A2DF  DA           MX
    JSR L_80A2E7                    ; $80A2E0  20 E7 A2     MX
    PLX                             ; $80A2E3  FA           MX
    PLA                             ; $80A2E4  68           MX
    PLB                             ; $80A2E5  AB           MX
    RTL                             ; $80A2E6  6B           MX
L_80A2E7:
    LDA $03,S                       ; $80A2E7  A3 03        MX
    ASL                             ; $80A2E9  0A           MX
    ASL                             ; $80A2EA  0A           MX
    ASL                             ; $80A2EB  0A           MX
    ASL                             ; $80A2EC  0A           MX
    ADC #$2000                      ; $80A2ED  69 00 20     MX
    STA $68                         ; $80A2F0  85 68        MX
    LDA $05,S                       ; $80A2F2  A3 05        MX
    STA $6A                         ; $80A2F4  85 6A        MX
    SEP #$30                        ; $80A2F6  E2 30        MX
    LDA #$80                        ; $80A2F8  A9 80        mx
    STA $2115                       ; $80A2FA  8D 15 21     mx
    LDA #$01                        ; $80A2FD  A9 01        mx
    STA $4300                       ; $80A2FF  8D 00 43     mx
    LDA #$18                        ; $80A302  A9 18        mx
    STA $4301                       ; $80A304  8D 01 43     mx
    LDA #$7E                        ; $80A307  A9 7E        mx
    STA $4304                       ; $80A309  8D 04 43     mx
    REP #$30                        ; $80A30C  C2 30        mx
    LDX #$0004                      ; $80A30E  A2 04 00     MX
L_80A311:
    LDA $68                         ; $80A311  A5 68        MX
    STA $2116                       ; $80A313  8D 16 21     MX
    LDA $6A                         ; $80A316  A5 6A        MX
    STA $4302                       ; $80A318  8D 02 43     MX
    LDA #$0080                      ; $80A31B  A9 80 00     MX
    STA $4305                       ; $80A31E  8D 05 43     MX
    SEP #$30                        ; $80A321  E2 30        MX
    LDA #$01                        ; $80A323  A9 01        mx
    STA $420B                       ; $80A325  8D 0B 42     mx
    REP #$30                        ; $80A328  C2 30        mx
    LDA $6A                         ; $80A32A  A5 6A        MX
    CLC                             ; $80A32C  18           MX
    ADC #$0080                      ; $80A32D  69 80 00     MX
    STA $6A                         ; $80A330  85 6A        MX
    INC $69                         ; $80A332  E6 69        MX
    DEX                             ; $80A334  CA           MX
    BNE L_80A311                    ; $80A335  D0 DA        MX
    RTS                             ; $80A337  60           MX
L_80A338:
    PHB                             ; $80A338  8B           MX
    PHK                             ; $80A339  4B           MX
    PLB                             ; $80A33A  AB           MX
    PHA                             ; $80A33B  48           MX
    PHX                             ; $80A33C  DA           MX
    JSR L_80A344                    ; $80A33D  20 44 A3     MX
    PLX                             ; $80A340  FA           MX
    PLA                             ; $80A341  68           MX
    PLB                             ; $80A342  AB           MX
    RTL                             ; $80A343  6B           MX
L_80A344:
    LDA $03,S                       ; $80A344  A3 03        MX
    ASL                             ; $80A346  0A           MX
    ASL                             ; $80A347  0A           MX
    ASL                             ; $80A348  0A           MX
    ASL                             ; $80A349  0A           MX
    ADC #$2000                      ; $80A34A  69 00 20     MX
    STA $68                         ; $80A34D  85 68        MX
    LDA $05,S                       ; $80A34F  A3 05        MX
    STA $6A                         ; $80A351  85 6A        MX
    SEP #$30                        ; $80A353  E2 30        MX
    LDA #$80                        ; $80A355  A9 80        mx
    STA $2115                       ; $80A357  8D 15 21     mx
    LDA #$01                        ; $80A35A  A9 01        mx
    STA $4300                       ; $80A35C  8D 00 43     mx
    LDA #$18                        ; $80A35F  A9 18        mx
    STA $4301                       ; $80A361  8D 01 43     mx
    LDA #$7E                        ; $80A364  A9 7E        mx
    STA $4304                       ; $80A366  8D 04 43     mx
    REP #$30                        ; $80A369  C2 30        mx
    LDX #$0002                      ; $80A36B  A2 02 00     MX
L_80A36E:
    LDA $68                         ; $80A36E  A5 68        MX
    STA $2116                       ; $80A370  8D 16 21     MX
    LDA $6A                         ; $80A373  A5 6A        MX
    STA $4302                       ; $80A375  8D 02 43     MX
    LDA #$0040                      ; $80A378  A9 40 00     MX
    STA $4305                       ; $80A37B  8D 05 43     MX
    SEP #$30                        ; $80A37E  E2 30        MX
    LDA #$01                        ; $80A380  A9 01        mx
    STA $420B                       ; $80A382  8D 0B 42     mx
    REP #$30                        ; $80A385  C2 30        mx
    LDA $6A                         ; $80A387  A5 6A        MX
    CLC                             ; $80A389  18           MX
    ADC #$0040                      ; $80A38A  69 40 00     MX
    STA $6A                         ; $80A38D  85 6A        MX
    INC $69                         ; $80A38F  E6 69        MX
    DEX                             ; $80A391  CA           MX
    BNE L_80A36E                    ; $80A392  D0 DA        MX
    RTS                             ; $80A394  60           MX
L_80A395:
    REP #$30                        ; $80A395  C2 30        mx
    LDA #$0030                      ; $80A397  A9 30 00     MX
    JSR L_8083A3                    ; $80A39A  20 A3 83     MX
    SEP #$30                        ; $80A39D  E2 30        MX
    RTS                             ; $80A39F  60           mx
L_80A3A0:
    PHB                             ; $80A3A0  8B           mx
    PHK                             ; $80A3A1  4B           mx
    PLB                             ; $80A3A2  AB           mx
    JSR L_80A3A8                    ; $80A3A3  20 A8 A3     mx
    PLB                             ; $80A3A6  AB           mx
    RTL                             ; $80A3A7  6B           mx
L_80A3A8:
    LDA #$00                        ; $80A3A8  A9 00        mx
L_80A3AA:
    PHA                             ; $80A3AA  48           mx
    JSR L_80A444                    ; $80A3AB  20 44 A4     mx
    PLA                             ; $80A3AE  68           mx
    STA $035F                       ; $80A3AF  8D 5F 03     mx
    STA $2100                       ; $80A3B2  8D 00 21     mx
    LDY #$20                        ; $80A3B5  A0 20        mx
    LDX #$00                        ; $80A3B7  A2 00        mx
L_80A3B9:
    DEX                             ; $80A3B9  CA           mx
    BNE L_80A3B9                    ; $80A3BA  D0 FD        mx
    DEY                             ; $80A3BC  88           mx
    BNE L_80A3B9                    ; $80A3BD  D0 FA        mx
    LDA $035F                       ; $80A3BF  AD 5F 03     mx
    INC                             ; $80A3C2  1A           mx
    CMP #$10                        ; $80A3C3  C9 10        mx
    BCC L_80A3AA                    ; $80A3C5  90 E3        mx
    RTS                             ; $80A3C7  60           mx
L_80A3C8:
    PHA                             ; $80A3C8  48           mx
    PHX                             ; $80A3C9  DA           mx
    PHY                             ; $80A3CA  5A           mx
    PHP                             ; $80A3CB  08           mx
    SEP #$30                        ; $80A3CC  E2 30        mx
    JSR L_80A3F2                    ; $80A3CE  20 F2 A3     mx
    JSR L_80A3A8                    ; $80A3D1  20 A8 A3     mx
    PLP                             ; $80A3D4  28           mx
    PLY                             ; $80A3D5  7A           mx
    PLX                             ; $80A3D6  FA           mx
    PLA                             ; $80A3D7  68           mx
    RTS                             ; $80A3D8  60           mx
L_80A3D9:
    PHA                             ; $80A3D9  48           mx
    PHX                             ; $80A3DA  DA           mx
    PHY                             ; $80A3DB  5A           mx
    PHP                             ; $80A3DC  08           mx
    SEP #$30                        ; $80A3DD  E2 30        mx
    JSR L_80A3A8                    ; $80A3DF  20 A8 A3     mx
    JSR L_80A3F2                    ; $80A3E2  20 F2 A3     mx
    PLP                             ; $80A3E5  28           mx
    PLY                             ; $80A3E6  7A           mx
    PLX                             ; $80A3E7  FA           mx
    PLA                             ; $80A3E8  68           mx
    RTS                             ; $80A3E9  60           mx
L_80A3EA:
    PHB                             ; $80A3EA  8B           mx
    PHK                             ; $80A3EB  4B           mx
    PLB                             ; $80A3EC  AB           mx
    JSR L_80A3F2                    ; $80A3ED  20 F2 A3     mx
    PLB                             ; $80A3F0  AB           mx
    RTL                             ; $80A3F1  6B           mx
L_80A3F2:
    LDA #$0F                        ; $80A3F2  A9 0F        mx
    STA $035F                       ; $80A3F4  8D 5F 03     mx
L_80A3F7:
    JSR L_80A444                    ; $80A3F7  20 44 A4     mx
    LDA $035F                       ; $80A3FA  AD 5F 03     mx
    STA $2100                       ; $80A3FD  8D 00 21     mx
    LDY #$20                        ; $80A400  A0 20        mx
    LDX #$00                        ; $80A402  A2 00        mx
L_80A404:
    DEX                             ; $80A404  CA           mx
    BNE L_80A404                    ; $80A405  D0 FD        mx
    DEY                             ; $80A407  88           mx
    BNE L_80A404                    ; $80A408  D0 FA        mx
    DEC $035F                       ; $80A40A  CE 5F 03     mx
    BNE L_80A3F7                    ; $80A40D  D0 E8        mx
    LDA #$8F                        ; $80A40F  A9 8F        mx
    STA $2100                       ; $80A411  8D 00 21     mx
    RTS                             ; $80A414  60           mx
L_80A415:
    PHB                             ; $80A415  8B           mx
    PHK                             ; $80A416  4B           mx
    PLB                             ; $80A417  AB           mx
    JSR L_80A41D                    ; $80A418  20 1D A4     mx
    PLB                             ; $80A41B  AB           mx
    RTL                             ; $80A41C  6B           mx
L_80A41D:
    REP #$30                        ; $80A41D  C2 30        mx
    STZ $2102                       ; $80A41F  9C 02 21     MX
    SEP #$30                        ; $80A422  E2 30        MX
    LDX #$80                        ; $80A424  A2 80        mx
L_80A426:
    LDA #$0A                        ; $80A426  A9 0A        mx
    STA $2104                       ; $80A428  8D 04 21     mx
    LDA #$F0                        ; $80A42B  A9 F0        mx
    STA $2104                       ; $80A42D  8D 04 21     mx
    STZ $2104                       ; $80A430  9C 04 21     mx
    STZ $2104                       ; $80A433  9C 04 21     mx
    DEX                             ; $80A436  CA           mx
    BNE L_80A426                    ; $80A437  D0 ED        mx
    LDX #$20                        ; $80A439  A2 20        mx
    LDA #$55                        ; $80A43B  A9 55        mx
L_80A43D:
    STA $2104                       ; $80A43D  8D 04 21     mx
    DEX                             ; $80A440  CA           mx
    BNE L_80A43D                    ; $80A441  D0 FA        mx
    RTS                             ; $80A443  60           mx
L_80A444:
    LDA $4212                       ; $80A444  AD 12 42     mx
    AND #$80                        ; $80A447  29 80        mx
    BEQ L_80A444                    ; $80A449  F0 F9        mx
    RTS                             ; $80A44B  60           mx
L_80A44C:
    LDA $4212                       ; $80A44C  AD 12 42     mx
    AND #$80                        ; $80A44F  29 80        mx
    BNE L_80A44C                    ; $80A451  D0 F9        mx
    RTS                             ; $80A453  60           mx
L_80A454:
    LDA $0C82,X                     ; $80A454  BD 82 0C     mx
    BNE L_80A4B4                    ; $80A457  D0 5B        mx
    LDA $0EDF,X                     ; $80A459  BD DF 0E     mx
    BEQ L_80A4B4                    ; $80A45C  F0 56        mx
    LDA $0B4B                       ; $80A45E  AD 4B 0B     mx  falling_enabled
    BNE L_80A468                    ; $80A461  D0 05        mx
    LDA $0E25,X                     ; $80A463  BD 25 0E     mx
    BEQ L_80A4B4                    ; $80A466  F0 4C        mx
L_80A468:
    JSR L_80A4B5                    ; $80A468  20 B5 A4     mx
    LDA $0BC7                       ; $80A46B  AD C7 0B     mx
    BPL L_80A473                    ; $80A46E  10 03        mx
    JMP L_80ABC2                    ; $80A470  4C C2 AB     mx
L_80A473:
    LDX $0BD0                       ; $80A473  AE D0 0B     mx
    LDA $0BC7                       ; $80A476  AD C7 0B     mx
    SEC                             ; $80A479  38           mx
    SBC $0BC8                       ; $80A47A  ED C8 0B     mx
    BMI L_80A484                    ; $80A47D  30 05        mx
    CMP #$13                        ; $80A47F  C9 13        mx
    BCC L_80A484                    ; $80A481  90 01        mx
    RTS                             ; $80A483  60           mx
L_80A484:
    LDA $0B9E                       ; $80A484  AD 9E 0B     mx
    ASL                             ; $80A487  0A           mx
    TAX                             ; $80A488  AA           mx
    JMP ($A484,X)                   ; $80A489  7C 84 A4     mx
    db $32,$A6,$68,$A6,$B4,$A4,$B4,$A4,$77,$A8,$31,$A9,$EB,$A9,$9B,$AA ; $80A48C
    db $9E,$A6,$F8,$A6,$51,$A7,$AB,$A7,$51,$A7,$9E,$A6,$AB,$A7,$F8,$A6 ; $80A49C
    db $04,$A8,$32,$A6,$68,$A6,$B4,$A4                                 ; $80A4AC
L_80A4B4:
    RTS                             ; $80A4B4  60           mx
L_80A4B5:
    JSR L_80A540                    ; $80A4B5  20 40 A5     mx
    STZ $0B66                       ; $80A4B8  9C 66 0B     mx
    STZ $0B63                       ; $80A4BB  9C 63 0B     mx
    LDA $0B94                       ; $80A4BE  AD 94 0B     mx
    BMI L_80A4C5                    ; $80A4C1  30 02        mx
    BRA L_80A4C8                    ; $80A4C3  80 03        mx
L_80A4C5:
    EOR #$FF                        ; $80A4C5  49 FF        mx
    INC                             ; $80A4C7  1A           mx
L_80A4C8:
    STA $0B6B                       ; $80A4C8  8D 6B 0B     mx
    LDA $0BC0                       ; $80A4CB  AD C0 0B     mx
    BMI L_80A4DB                    ; $80A4CE  30 0B        mx
    BEQ L_80A4E4                    ; $80A4D0  F0 12        mx
    LDA $0BC1                       ; $80A4D2  AD C1 0B     mx
    BMI L_80A513                    ; $80A4D5  30 3C        mx
    BEQ L_80A4F7                    ; $80A4D7  F0 1E        mx
    BRA L_80A50B                    ; $80A4D9  80 30        mx
L_80A4DB:
    LDA $0BC1                       ; $80A4DB  AD C1 0B     mx
    BMI L_80A503                    ; $80A4DE  30 23        mx
    BEQ L_80A4F3                    ; $80A4E0  F0 11        mx
    BRA L_80A4FB                    ; $80A4E2  80 17        mx
L_80A4E4:
    LDA $0BC1                       ; $80A4E4  AD C1 0B     mx
    BMI L_80A4EF                    ; $80A4E7  30 06        mx
    BEQ L_80A4F7                    ; $80A4E9  F0 0C        mx
    LDA #$0C                        ; $80A4EB  A9 0C        mx
    BRA L_80A53C                    ; $80A4ED  80 4D        mx
L_80A4EF:
    LDA #$04                        ; $80A4EF  A9 04        mx
    BRA L_80A53C                    ; $80A4F1  80 49        mx
L_80A4F3:
    LDA #$08                        ; $80A4F3  A9 08        mx
    BRA L_80A53C                    ; $80A4F5  80 45        mx
L_80A4F7:
    LDA #$00                        ; $80A4F7  A9 00        mx
    BRA L_80A53C                    ; $80A4F9  80 41        mx
L_80A4FB:
    LDX #$09                        ; $80A4FB  A2 09        mx
    LDA #$0A                        ; $80A4FD  A9 0A        mx
    LDY #$0B                        ; $80A4FF  A0 0B        mx
    BRA L_80A519                    ; $80A501  80 16        mx
L_80A503:
    LDX #$07                        ; $80A503  A2 07        mx
    LDA #$06                        ; $80A505  A9 06        mx
    LDY #$05                        ; $80A507  A0 05        mx
    BRA L_80A519                    ; $80A509  80 0E        mx
L_80A50B:
    LDX #$0F                        ; $80A50B  A2 0F        mx
    LDA #$0E                        ; $80A50D  A9 0E        mx
    LDY #$0D                        ; $80A50F  A0 0D        mx
    BRA L_80A519                    ; $80A511  80 06        mx
L_80A513:
    LDX #$01                        ; $80A513  A2 01        mx
    LDA #$02                        ; $80A515  A9 02        mx
    LDY #$03                        ; $80A517  A0 03        mx
L_80A519:
    STA $0B6C                       ; $80A519  8D 6C 0B     mx
    LDA $0BC1                       ; $80A51C  AD C1 0B     mx
    BPL L_80A524                    ; $80A51F  10 03        mx
    EOR #$FF                        ; $80A521  49 FF        mx
    INC                             ; $80A523  1A           mx
L_80A524:
    STA $88                         ; $80A524  85 88        mx
    LDA $0BC0                       ; $80A526  AD C0 0B     mx
    BPL L_80A52E                    ; $80A529  10 03        mx
    EOR #$FF                        ; $80A52B  49 FF        mx
    INC                             ; $80A52D  1A           mx
L_80A52E:
    CMP $88                         ; $80A52E  C5 88        mx
    BEQ L_80A53B                    ; $80A530  F0 09        mx
    BCS L_80A538                    ; $80A532  B0 04        mx
    STY $0B6C                       ; $80A534  8C 6C 0B     mx
    RTS                             ; $80A537  60           mx
L_80A538:
    STX $0B6C                       ; $80A538  8E 6C 0B     mx
L_80A53B:
    RTS                             ; $80A53B  60           mx
L_80A53C:
    STA $0B6C                       ; $80A53C  8D 6C 0B     mx
    RTS                             ; $80A53F  60           mx
L_80A540:
    LDA $0BA3                       ; $80A540  AD A3 0B     mx
    STA $0B5A                       ; $80A543  8D 5A 0B     mx
    LDA $0BA5                       ; $80A546  AD A5 0B     mx
    STA $0B5B                       ; $80A549  8D 5B 0B     mx
    LDY $0B9E                       ; $80A54C  AC 9E 0B     mx
    LDA $A570,Y                     ; $80A54F  B9 70 A5     mx
    BEQ L_80A557                    ; $80A552  F0 03        mx
    JSR L_80A5AD                    ; $80A554  20 AD A5     mx
L_80A557:
    LDA $A583,Y                     ; $80A557  B9 83 A5     mx
    BEQ L_80A55F                    ; $80A55A  F0 03        mx
    JSR L_80A5BC                    ; $80A55C  20 BC A5     mx
L_80A55F:
    LDA $A596,Y                     ; $80A55F  B9 96 A5     mx
    BEQ L_80A567                    ; $80A562  F0 03        mx
    JSR L_80A5C6                    ; $80A564  20 C6 A5     mx
L_80A567:
    LDA $0B5A                       ; $80A567  AD 5A 0B     mx
    STA $0B64                       ; $80A56A  8D 64 0B     mx
    LDA $0B5B                       ; $80A56D  AD 5B 0B     mx
    STA $0B65                       ; $80A570  8D 65 0B     mx
    RTS                             ; $80A573  60           mx
    db $00,$01,$00,$01,$00,$00,$00,$00,$00,$01,$01,$00,$01,$00,$00,$01 ; $80A574
    db $00,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01 ; $80A584
    db $01,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01,$00,$01,$00,$01,$00 ; $80A594
    db $01,$00,$01,$01,$00,$00,$00,$00,$00                             ; $80A5A4
L_80A5AD:
    LDA $0B5B                       ; $80A5AD  AD 5B 0B     mx
    XBA                             ; $80A5B0  EB           mx
    LDA $0B5A                       ; $80A5B1  AD 5A 0B     mx
    STA $0B5B                       ; $80A5B4  8D 5B 0B     mx
    XBA                             ; $80A5B7  EB           mx
    STA $0B5A                       ; $80A5B8  8D 5A 0B     mx
    RTS                             ; $80A5BB  60           mx
L_80A5BC:
    LDA #$BF                        ; $80A5BC  A9 BF        mx
    SEC                             ; $80A5BE  38           mx
    SBC $0B5A                       ; $80A5BF  ED 5A 0B     mx
    STA $0B5A                       ; $80A5C2  8D 5A 0B     mx
    RTS                             ; $80A5C5  60           mx
L_80A5C6:
    LDA #$BF                        ; $80A5C6  A9 BF        mx
    SEC                             ; $80A5C8  38           mx
    SBC $0B5B                       ; $80A5C9  ED 5B 0B     mx
    STA $0B5B                       ; $80A5CC  8D 5B 0B     mx
    RTS                             ; $80A5CF  60           mx
L_80A5D0:
    INC $0B63                       ; $80A5D0  EE 63 0B     mx
    STA $0B6C                       ; $80A5D3  8D 6C 0B     mx
    LDA $0B6B                       ; $80A5D6  AD 6B 0B     mx
    STA $0B96                       ; $80A5D9  8D 96 0B     mx
    LDA $AF27,X                     ; $80A5DC  BD 27 AF     mx
    STA $0B98                       ; $80A5DF  8D 98 0B     mx
    JSR L_809D94                    ; $80A5E2  20 94 9D     mx
    LDA $0B9B                       ; $80A5E5  AD 9B 0B     mx
    CMP #$0A                        ; $80A5E8  C9 0A        mx
    BCS L_80A5EE                    ; $80A5EA  B0 02        mx
    LDA #$0A                        ; $80A5EC  A9 0A        mx
L_80A5EE:
    STA $0B6B                       ; $80A5EE  8D 6B 0B     mx
    LDY $0B6C                       ; $80A5F1  AC 6C 0B     mx
    LDA $AF2C,Y                     ; $80A5F4  B9 2C AF     mx
    STA $0B83                       ; $80A5F7  8D 83 0B     mx
    LDA $0B6B                       ; $80A5FA  AD 6B 0B     mx
    ASL                             ; $80A5FD  0A           mx
    STA $0B84                       ; $80A5FE  8D 84 0B     mx
    JSR L_80ABD1                    ; $80A601  20 D1 AB     mx
    LDA $0B9B                       ; $80A604  AD 9B 0B     mx
    STA $0BC0                       ; $80A607  8D C0 0B     mx
    LDY $0B6C                       ; $80A60A  AC 6C 0B     mx
    LDA $AF3C,Y                     ; $80A60D  B9 3C AF     mx
    STA $0B83                       ; $80A610  8D 83 0B     mx
    LDA $0B6B                       ; $80A613  AD 6B 0B     mx
    ASL                             ; $80A616  0A           mx
    STA $0B84                       ; $80A617  8D 84 0B     mx
    JSR L_80ABD1                    ; $80A61A  20 D1 AB     mx
    LDA $0B9B                       ; $80A61D  AD 9B 0B     mx
    STA $0BC1                       ; $80A620  8D C1 0B     mx
    LDX $0BD0                       ; $80A623  AE D0 0B     mx
    STZ $13AB,X                     ; $80A626  9E AB 13     mx
    STZ $0CBD,X                     ; $80A629  9E BD 0C     mx
    LDA #$05                        ; $80A62C  A9 05        mx
    JSR L_80F966                    ; $80A62E  20 66 F9     mx
    RTS                             ; $80A631  60           mx
L_80A632:
    LDA $0BA5                       ; $80A632  AD A5 0B     mx
    CMP #$14                        ; $80A635  C9 14        mx
    BCC L_80A653                    ; $80A637  90 1A        mx
    CMP #$9A                        ; $80A639  C9 9A        mx
    BCS L_80A63E                    ; $80A63B  B0 01        mx
    RTS                             ; $80A63D  60           mx
L_80A63E:
    LDY $0BD8                       ; $80A63E  AC D8 0B     mx
    LDA $ACE7,Y                     ; $80A641  B9 E7 AC     mx
    STA $0BD8                       ; $80A644  8D D8 0B     mx
    LDY $0B6C                       ; $80A647  AC 6C 0B     mx
    LDX $AEF7,Y                     ; $80A64A  BE F7 AE     mx
    LDA $ADF7,Y                     ; $80A64D  B9 F7 AD     mx
    BRL L_80A5D0                    ; $80A650  82 7D FF     mx
L_80A653:
    LDY $0BD8                       ; $80A653  AC D8 0B     mx
    LDA $ACE7,Y                     ; $80A656  B9 E7 AC     mx
    STA $0BD8                       ; $80A659  8D D8 0B     mx
    LDY $0B6C                       ; $80A65C  AC 6C 0B     mx
    LDX $AEE7,Y                     ; $80A65F  BE E7 AE     mx
    LDA $ADE7,Y                     ; $80A662  B9 E7 AD     mx
    BRL L_80A5D0                    ; $80A665  82 68 FF     mx
L_80A668:
    LDA $0BA3                       ; $80A668  AD A3 0B     mx
    CMP #$14                        ; $80A66B  C9 14        mx
    BCC L_80A689                    ; $80A66D  90 1A        mx
    CMP #$9A                        ; $80A66F  C9 9A        mx
    BCS L_80A674                    ; $80A671  B0 01        mx
    RTS                             ; $80A673  60           mx
L_80A674:
    LDY $0BD8                       ; $80A674  AC D8 0B     mx
    LDA $AC67,Y                     ; $80A677  B9 67 AC     mx
    STA $0BD8                       ; $80A67A  8D D8 0B     mx
    LDY $0B6C                       ; $80A67D  AC 6C 0B     mx
    LDX $AE67,Y                     ; $80A680  BE 67 AE     mx
    LDA $AD67,Y                     ; $80A683  B9 67 AD     mx
    BRL L_80A5D0                    ; $80A686  82 47 FF     mx
L_80A689:
    LDY $0BD8                       ; $80A689  AC D8 0B     mx
    LDA $AC67,Y                     ; $80A68C  B9 67 AC     mx
    STA $0BD8                       ; $80A68F  8D D8 0B     mx
    LDY $0B6C                       ; $80A692  AC 6C 0B     mx
    LDX $AE77,Y                     ; $80A695  BE 77 AE     mx
    LDA $AD77,Y                     ; $80A698  B9 77 AD     mx
    BRL L_80A5D0                    ; $80A69B  82 32 FF     mx
L_80A69E:
    LDX $0BA3                       ; $80A69E  AE A3 0B     mx
    LDY $0BA5                       ; $80A6A1  AC A5 0B     mx
    CPY #$14                        ; $80A6A4  C0 14        mx
    BCC L_80A6E3                    ; $80A6A6  90 3B        mx
    CPY #$A0                        ; $80A6A8  C0 A0        mx
    BCC L_80A6B7                    ; $80A6AA  90 0B        mx
    INC $0B66                       ; $80A6AC  EE 66 0B     mx
    CPX #$08                        ; $80A6AF  E0 08        mx
    BCC L_80A6B8                    ; $80A6B1  90 05        mx
    CPX #$A0                        ; $80A6B3  E0 A0        mx
    BCS L_80A6CD                    ; $80A6B5  B0 16        mx
L_80A6B7:
    RTS                             ; $80A6B7  60           mx
L_80A6B8:
    LDY $0BD8                       ; $80A6B8  AC D8 0B     mx
    LDA $ACA7,Y                     ; $80A6BB  B9 A7 AC     mx
    STA $0BD8                       ; $80A6BE  8D D8 0B     mx
    LDY $0B6C                       ; $80A6C1  AC 6C 0B     mx
    LDX $AEB7,Y                     ; $80A6C4  BE B7 AE     mx
    LDA $ADB7,Y                     ; $80A6C7  B9 B7 AD     mx
    BRL L_80A5D0                    ; $80A6CA  82 03 FF     mx
L_80A6CD:
    LDY $0BD8                       ; $80A6CD  AC D8 0B     mx
    LDA $AC27,Y                     ; $80A6D0  B9 27 AC     mx
    STA $0BD8                       ; $80A6D3  8D D8 0B     mx
    LDY $0B6C                       ; $80A6D6  AC 6C 0B     mx
    LDX $AE27,Y                     ; $80A6D9  BE 27 AE     mx
    LDA $AD27,Y                     ; $80A6DC  B9 27 AD     mx
    BRL L_80A5D0                    ; $80A6DF  82 EE FE     mx
L_80A6E2:
    RTS                             ; $80A6E2  60           mx
L_80A6E3:
    LDY $0BD8                       ; $80A6E3  AC D8 0B     mx
    LDA $ACE7,Y                     ; $80A6E6  B9 E7 AC     mx
    STA $0BD8                       ; $80A6E9  8D D8 0B     mx
    LDY $0B6C                       ; $80A6EC  AC 6C 0B     mx
    LDX $AEE7,Y                     ; $80A6EF  BE E7 AE     mx
    LDA $ADE7,Y                     ; $80A6F2  B9 E7 AD     mx
    BRL L_80A5D0                    ; $80A6F5  82 D8 FE     mx
L_80A6F8:
    LDX $0BA3                       ; $80A6F8  AE A3 0B     mx
    LDY $0BA5                       ; $80A6FB  AC A5 0B     mx
    CPX #$A0                        ; $80A6FE  E0 A0        mx
    BCS L_80A73C                    ; $80A700  B0 3A        mx
    CPX #$14                        ; $80A702  E0 14        mx
    BCS L_80A711                    ; $80A704  B0 0B        mx
    INC $0B66                       ; $80A706  EE 66 0B     mx
    CPY #$14                        ; $80A709  C0 14        mx
    BCC L_80A712                    ; $80A70B  90 05        mx
    CPY #$B0                        ; $80A70D  C0 B0        mx
    BCS L_80A727                    ; $80A70F  B0 16        mx
L_80A711:
    RTS                             ; $80A711  60           mx
L_80A712:
    LDY $0BD8                       ; $80A712  AC D8 0B     mx
    LDA $AC27,Y                     ; $80A715  B9 27 AC     mx
    STA $0BD8                       ; $80A718  8D D8 0B     mx
    LDY $0B6C                       ; $80A71B  AC 6C 0B     mx
    LDX $AE37,Y                     ; $80A71E  BE 37 AE     mx
    LDA $AD37,Y                     ; $80A721  B9 37 AD     mx
    BRL L_80A5D0                    ; $80A724  82 A9 FE     mx
L_80A727:
    LDY $0BD8                       ; $80A727  AC D8 0B     mx
    LDA $ACA7,Y                     ; $80A72A  B9 A7 AC     mx
    STA $0BD8                       ; $80A72D  8D D8 0B     mx
    LDY $0B6C                       ; $80A730  AC 6C 0B     mx
    LDX $AEB7,Y                     ; $80A733  BE B7 AE     mx
    LDA $ADB7,Y                     ; $80A736  B9 B7 AD     mx
    BRL L_80A5D0                    ; $80A739  82 94 FE     mx
L_80A73C:
    LDY $0BD8                       ; $80A73C  AC D8 0B     mx
    LDA $AC67,Y                     ; $80A73F  B9 67 AC     mx
    STA $0BD8                       ; $80A742  8D D8 0B     mx
    LDY $0B6C                       ; $80A745  AC 6C 0B     mx
    LDX $AE67,Y                     ; $80A748  BE 67 AE     mx
    LDA $AD67,Y                     ; $80A74B  B9 67 AD     mx
    BRL L_80A5D0                    ; $80A74E  82 7F FE     mx
L_80A751:
    LDX $0BA3                       ; $80A751  AE A3 0B     mx
    LDY $0BA5                       ; $80A754  AC A5 0B     mx
    CPX #$14                        ; $80A757  E0 14        mx
    BCC L_80A796                    ; $80A759  90 3B        mx
    CPX #$A0                        ; $80A75B  E0 A0        mx
    BCC L_80A76A                    ; $80A75D  90 0B        mx
    INC $0B66                       ; $80A75F  EE 66 0B     mx
    CPY #$08                        ; $80A762  C0 08        mx
    BCC L_80A780                    ; $80A764  90 1A        mx
    CPY #$A0                        ; $80A766  C0 A0        mx
    BCS L_80A76B                    ; $80A768  B0 01        mx
L_80A76A:
    RTS                             ; $80A76A  60           mx
L_80A76B:
    LDY $0BD8                       ; $80A76B  AC D8 0B     mx
    LDA $AC27,Y                     ; $80A76E  B9 27 AC     mx
    STA $0BD8                       ; $80A771  8D D8 0B     mx
    LDY $0B6C                       ; $80A774  AC 6C 0B     mx
    LDX $AE27,Y                     ; $80A777  BE 27 AE     mx
    LDA $AD27,Y                     ; $80A77A  B9 27 AD     mx
    BRL L_80A5D0                    ; $80A77D  82 50 FE     mx
L_80A780:
    LDY $0BD8                       ; $80A780  AC D8 0B     mx
    LDA $ACA7,Y                     ; $80A783  B9 A7 AC     mx
    STA $0BD8                       ; $80A786  8D D8 0B     mx
    LDY $0B6C                       ; $80A789  AC 6C 0B     mx
    LDX $AEA7,Y                     ; $80A78C  BE A7 AE     mx
    LDA $ADA7,Y                     ; $80A78F  B9 A7 AD     mx
    BRL L_80A5D0                    ; $80A792  82 3B FE     mx
L_80A795:
    RTS                             ; $80A795  60           mx
L_80A796:
    LDY $0BD8                       ; $80A796  AC D8 0B     mx
    LDA $AC67,Y                     ; $80A799  B9 67 AC     mx
    STA $0BD8                       ; $80A79C  8D D8 0B     mx
    LDY $0B6C                       ; $80A79F  AC 6C 0B     mx
    LDX $AE77,Y                     ; $80A7A2  BE 77 AE     mx
    LDA $AD77,Y                     ; $80A7A5  B9 77 AD     mx
    BRL L_80A5D0                    ; $80A7A8  82 25 FE     mx
L_80A7AB:
    LDX $0BA3                       ; $80A7AB  AE A3 0B     mx
    LDY $0BA5                       ; $80A7AE  AC A5 0B     mx
    CPY #$A0                        ; $80A7B1  C0 A0        mx
    BCS L_80A7EF                    ; $80A7B3  B0 3A        mx
    CPY #$14                        ; $80A7B5  C0 14        mx
    BCS L_80A7C4                    ; $80A7B7  B0 0B        mx
    INC $0B66                       ; $80A7B9  EE 66 0B     mx
    CPX #$14                        ; $80A7BC  E0 14        mx
    BCC L_80A7C5                    ; $80A7BE  90 05        mx
    CPX #$B0                        ; $80A7C0  E0 B0        mx
    BCS L_80A7DA                    ; $80A7C2  B0 16        mx
L_80A7C4:
    RTS                             ; $80A7C4  60           mx
L_80A7C5:
    LDY $0BD8                       ; $80A7C5  AC D8 0B     mx
    LDA $AC27,Y                     ; $80A7C8  B9 27 AC     mx
    STA $0BD8                       ; $80A7CB  8D D8 0B     mx
    LDY $0B6C                       ; $80A7CE  AC 6C 0B     mx
    LDX $AE37,Y                     ; $80A7D1  BE 37 AE     mx
    LDA $AD37,Y                     ; $80A7D4  B9 37 AD     mx
    BRL L_80A5D0                    ; $80A7D7  82 F6 FD     mx
L_80A7DA:
    LDY $0BD8                       ; $80A7DA  AC D8 0B     mx
    LDA $ACA7,Y                     ; $80A7DD  B9 A7 AC     mx
    STA $0BD8                       ; $80A7E0  8D D8 0B     mx
    LDY $0B6C                       ; $80A7E3  AC 6C 0B     mx
    LDX $AEA7,Y                     ; $80A7E6  BE A7 AE     mx
    LDA $ADA7,Y                     ; $80A7E9  B9 A7 AD     mx
    BRL L_80A5D0                    ; $80A7EC  82 E1 FD     mx
L_80A7EF:
    LDY $0BD8                       ; $80A7EF  AC D8 0B     mx
    LDA $ACE7,Y                     ; $80A7F2  B9 E7 AC     mx
    STA $0BD8                       ; $80A7F5  8D D8 0B     mx
    LDY $0B6C                       ; $80A7F8  AC 6C 0B     mx
    LDX $AEF7,Y                     ; $80A7FB  BE F7 AE     mx
    LDA $ADF7,Y                     ; $80A7FE  B9 F7 AD     mx
    BRL L_80A5D0                    ; $80A801  82 CC FD     mx
L_80A804:
    LDX $0BA3                       ; $80A804  AE A3 0B     mx
    LDY $0BA5                       ; $80A807  AC A5 0B     mx
    CPX #$14                        ; $80A80A  E0 14        mx
    BCC L_80A813                    ; $80A80C  90 05        mx
    CPX #$A0                        ; $80A80E  E0 A0        mx
    BCS L_80A845                    ; $80A810  B0 33        mx
L_80A812:
    RTS                             ; $80A812  60           mx
L_80A813:
    CPY #$14                        ; $80A813  C0 14        mx
    BCC L_80A830                    ; $80A815  90 19        mx
    CPY #$B0                        ; $80A817  C0 B0        mx
    BCC L_80A812                    ; $80A819  90 F7        mx
    LDY $0BD8                       ; $80A81B  AC D8 0B     mx
    LDA $ACA7,Y                     ; $80A81E  B9 A7 AC     mx
    STA $0BD8                       ; $80A821  8D D8 0B     mx
    LDY $0B6C                       ; $80A824  AC 6C 0B     mx
    LDX $AEB7,Y                     ; $80A827  BE B7 AE     mx
    LDA $ADB7,Y                     ; $80A82A  B9 B7 AD     mx
    BRL L_80A5D0                    ; $80A82D  82 A0 FD     mx
L_80A830:
    LDY $0BD8                       ; $80A830  AC D8 0B     mx
    LDA $AC27,Y                     ; $80A833  B9 27 AC     mx
    STA $0BD8                       ; $80A836  8D D8 0B     mx
    LDY $0B6C                       ; $80A839  AC 6C 0B     mx
    LDX $AE37,Y                     ; $80A83C  BE 37 AE     mx
    LDA $AD37,Y                     ; $80A83F  B9 37 AD     mx
    BRL L_80A5D0                    ; $80A842  82 8B FD     mx
L_80A845:
    CPY #$08                        ; $80A845  C0 08        mx
    BCC L_80A862                    ; $80A847  90 19        mx
    CPY #$A0                        ; $80A849  C0 A0        mx
    BCC L_80A812                    ; $80A84B  90 C5        mx
    LDY $0BD8                       ; $80A84D  AC D8 0B     mx
    LDA $AC27,Y                     ; $80A850  B9 27 AC     mx
    STA $0BD8                       ; $80A853  8D D8 0B     mx
    LDY $0B6C                       ; $80A856  AC 6C 0B     mx
    LDX $AE27,Y                     ; $80A859  BE 27 AE     mx
    LDA $AD27,Y                     ; $80A85C  B9 27 AD     mx
    BRL L_80A5D0                    ; $80A85F  82 6E FD     mx
L_80A862:
    LDY $0BD8                       ; $80A862  AC D8 0B     mx
    LDA $ACA7,Y                     ; $80A865  B9 A7 AC     mx
    STA $0BD8                       ; $80A868  8D D8 0B     mx
    LDY $0B6C                       ; $80A86B  AC 6C 0B     mx
    LDX $AEA7,Y                     ; $80A86E  BE A7 AE     mx
    LDA $ADA7,Y                     ; $80A871  B9 A7 AD     mx
    BRL L_80A5D0                    ; $80A874  82 59 FD     mx
L_80A877:
    LDX $0B5A                       ; $80A877  AE 5A 0B     mx
    LDY $0B5B                       ; $80A87A  AC 5B 0B     mx
    JSR L_80AB4B                    ; $80A87D  20 4B AB     mx
    REP #$20                        ; $80A880  C2 20        mx
    LDA $0B5C                       ; $80A882  AD 5C 0B     Mx
    CMP #$0169                      ; $80A885  C9 69 01     Mx
    BCC L_80A89C                    ; $80A888  90 12        Mx
    CMP #$7900                      ; $80A88A  C9 00 79     Mx
    BCS L_80A897                    ; $80A88D  B0 08        Mx
    CMP #$5CA4                      ; $80A88F  C9 A4 5C     Mx
    BCS L_80A8B3                    ; $80A892  B0 1F        Mx
    SEP #$20                        ; $80A894  E2 20        Mx
    RTS                             ; $80A896  60           mx
L_80A897:
    SEP #$20                        ; $80A897  E2 20        Mx
    BRL L_80ABC2                    ; $80A899  82 26 03     mx
L_80A89C:
    SEP #$20                        ; $80A89C  E2 20        Mx
    LDY $0BD8                       ; $80A89E  AC D8 0B     mx
    LDA $ACA7,Y                     ; $80A8A1  B9 A7 AC     mx
    STA $0BD8                       ; $80A8A4  8D D8 0B     mx
    LDY $0B6C                       ; $80A8A7  AC 6C 0B     mx
    LDX $AEB7,Y                     ; $80A8AA  BE B7 AE     mx
    LDA $ADB7,Y                     ; $80A8AD  B9 B7 AD     mx
    BRL L_80A5D0                    ; $80A8B0  82 1D FD     mx
L_80A8B3:
    SEP #$20                        ; $80A8B3  E2 20        Mx
    JSR L_80AB7F                    ; $80A8B5  20 7F AB     mx
    TYA                             ; $80A8B8  98           mx
    ASL                             ; $80A8B9  0A           mx
    TAX                             ; $80A8BA  AA           mx
    JMP ($A8BE,X)                   ; $80A8BB  7C BE A8     mx
    db $C8,$A8,$DD,$A8,$F2,$A8,$07,$A9,$1C,$A9                         ; $80A8BE
L_80A8C8:
    LDY $0BD8                       ; $80A8C8  AC D8 0B     mx
    LDA $AC67,Y                     ; $80A8CB  B9 67 AC     mx
    STA $0BD8                       ; $80A8CE  8D D8 0B     mx
    LDY $0B6C                       ; $80A8D1  AC 6C 0B     mx
    LDX $AE67,Y                     ; $80A8D4  BE 67 AE     mx
    LDA $AD67,Y                     ; $80A8D7  B9 67 AD     mx
    BRL L_80A5D0                    ; $80A8DA  82 F3 FC     mx
L_80A8DD:
    LDY $0BD8                       ; $80A8DD  AC D8 0B     mx
    LDA $AC87,Y                     ; $80A8E0  B9 87 AC     mx
    STA $0BD8                       ; $80A8E3  8D D8 0B     mx
    LDY $0B6C                       ; $80A8E6  AC 6C 0B     mx
    LDX $AE87,Y                     ; $80A8E9  BE 87 AE     mx
    LDA $AD87,Y                     ; $80A8EC  B9 87 AD     mx
    BRL L_80A5D0                    ; $80A8EF  82 DE FC     mx
L_80A8F2:
    LDY $0BD8                       ; $80A8F2  AC D8 0B     mx
    LDA $ACA7,Y                     ; $80A8F5  B9 A7 AC     mx
    STA $0BD8                       ; $80A8F8  8D D8 0B     mx
    LDY $0B6C                       ; $80A8FB  AC 6C 0B     mx
    LDX $AEA7,Y                     ; $80A8FE  BE A7 AE     mx
    LDA $ADA7,Y                     ; $80A901  B9 A7 AD     mx
    BRL L_80A5D0                    ; $80A904  82 C9 FC     mx
L_80A907:
    LDY $0BD8                       ; $80A907  AC D8 0B     mx
    LDA $ACC7,Y                     ; $80A90A  B9 C7 AC     mx
    STA $0BD8                       ; $80A90D  8D D8 0B     mx
    LDY $0B6C                       ; $80A910  AC 6C 0B     mx
    LDX $AEC7,Y                     ; $80A913  BE C7 AE     mx
    LDA $ADC7,Y                     ; $80A916  B9 C7 AD     mx
    BRL L_80A5D0                    ; $80A919  82 B4 FC     mx
L_80A91C:
    LDY $0BD8                       ; $80A91C  AC D8 0B     mx
    LDA $ACE7,Y                     ; $80A91F  B9 E7 AC     mx
    STA $0BD8                       ; $80A922  8D D8 0B     mx
    LDY $0B6C                       ; $80A925  AC 6C 0B     mx
    LDX $AEE7,Y                     ; $80A928  BE E7 AE     mx
    LDA $ADE7,Y                     ; $80A92B  B9 E7 AD     mx
    BRL L_80A5D0                    ; $80A92E  82 9F FC     mx
L_80A931:
    LDX $0B5A                       ; $80A931  AE 5A 0B     mx
    LDY $0B5B                       ; $80A934  AC 5B 0B     mx
    JSR L_80AB4B                    ; $80A937  20 4B AB     mx
    REP #$20                        ; $80A93A  C2 20        mx
    LDA $0B5C                       ; $80A93C  AD 5C 0B     Mx
    CMP #$0169                      ; $80A93F  C9 69 01     Mx
    BCC L_80A956                    ; $80A942  90 12        Mx
    CMP #$7900                      ; $80A944  C9 00 79     Mx
    BCS L_80A951                    ; $80A947  B0 08        Mx
    CMP #$5CA4                      ; $80A949  C9 A4 5C     Mx
    BCS L_80A96D                    ; $80A94C  B0 1F        Mx
    SEP #$20                        ; $80A94E  E2 20        Mx
    RTS                             ; $80A950  60           mx
L_80A951:
    SEP #$20                        ; $80A951  E2 20        Mx
    BRL L_80ABC2                    ; $80A953  82 6C 02     mx
L_80A956:
    SEP #$20                        ; $80A956  E2 20        Mx
    LDY $0BD8                       ; $80A958  AC D8 0B     mx
    LDA $ACA7,Y                     ; $80A95B  B9 A7 AC     mx
    STA $0BD8                       ; $80A95E  8D D8 0B     mx
    LDY $0B6C                       ; $80A961  AC 6C 0B     mx
    LDX $AEA7,Y                     ; $80A964  BE A7 AE     mx
    LDA $ADA7,Y                     ; $80A967  B9 A7 AD     mx
    BRL L_80A5D0                    ; $80A96A  82 63 FC     mx
L_80A96D:
    SEP #$20                        ; $80A96D  E2 20        Mx
    JSR L_80AB7F                    ; $80A96F  20 7F AB     mx
    TYA                             ; $80A972  98           mx
    ASL                             ; $80A973  0A           mx
    TAX                             ; $80A974  AA           mx
    JMP ($A978,X)                   ; $80A975  7C 78 A9     mx
    db $82,$A9,$97,$A9,$AC,$A9,$C1,$A9,$D6,$A9                         ; $80A978
L_80A982:
    LDY $0BD8                       ; $80A982  AC D8 0B     mx
    LDA $AC67,Y                     ; $80A985  B9 67 AC     mx
    STA $0BD8                       ; $80A988  8D D8 0B     mx
    LDY $0B6C                       ; $80A98B  AC 6C 0B     mx
    LDX $AE77,Y                     ; $80A98E  BE 77 AE     mx
    LDA $AD77,Y                     ; $80A991  B9 77 AD     mx
    BRL L_80A5D0                    ; $80A994  82 39 FC     mx
L_80A997:
    LDY $0BD8                       ; $80A997  AC D8 0B     mx
    LDA $AC87,Y                     ; $80A99A  B9 87 AC     mx
    STA $0BD8                       ; $80A99D  8D D8 0B     mx
    LDY $0B6C                       ; $80A9A0  AC 6C 0B     mx
    LDX $AE97,Y                     ; $80A9A3  BE 97 AE     mx
    LDA $AD97,Y                     ; $80A9A6  B9 97 AD     mx
    BRL L_80A5D0                    ; $80A9A9  82 24 FC     mx
L_80A9AC:
    LDY $0BD8                       ; $80A9AC  AC D8 0B     mx
    LDA $ACA7,Y                     ; $80A9AF  B9 A7 AC     mx
    STA $0BD8                       ; $80A9B2  8D D8 0B     mx
    LDY $0B6C                       ; $80A9B5  AC 6C 0B     mx
    LDX $AEB7,Y                     ; $80A9B8  BE B7 AE     mx
    LDA $ADB7,Y                     ; $80A9BB  B9 B7 AD     mx
    BRL L_80A5D0                    ; $80A9BE  82 0F FC     mx
L_80A9C1:
    LDY $0BD8                       ; $80A9C1  AC D8 0B     mx
    LDA $ACC7,Y                     ; $80A9C4  B9 C7 AC     mx
    STA $0BD8                       ; $80A9C7  8D D8 0B     mx
    LDY $0B6C                       ; $80A9CA  AC 6C 0B     mx
    LDX $AED7,Y                     ; $80A9CD  BE D7 AE     mx
    LDA $ADD7,Y                     ; $80A9D0  B9 D7 AD     mx
    BRL L_80A5D0                    ; $80A9D3  82 FA FB     mx
L_80A9D6:
    LDY $0BD8                       ; $80A9D6  AC D8 0B     mx
    LDA $ACE7,Y                     ; $80A9D9  B9 E7 AC     mx
    STA $0BD8                       ; $80A9DC  8D D8 0B     mx
    LDY $0B6C                       ; $80A9DF  AC 6C 0B     mx
    LDX $AEF7,Y                     ; $80A9E2  BE F7 AE     mx
    LDA $ADF7,Y                     ; $80A9E5  B9 F7 AD     mx
    BRL L_80A5D0                    ; $80A9E8  82 E5 FB     mx
L_80A9EB:
    LDX $0B5A                       ; $80A9EB  AE 5A 0B     mx
    LDY $0B5B                       ; $80A9EE  AC 5B 0B     mx
    JSR L_80AB4B                    ; $80A9F1  20 4B AB     mx
    REP #$20                        ; $80A9F4  C2 20        mx
    LDA $0B5C                       ; $80A9F6  AD 5C 0B     Mx
    CMP #$0400                      ; $80A9F9  C9 00 04     Mx
    BCC L_80AA06                    ; $80A9FC  90 08        Mx
    CMP #$74E9                      ; $80A9FE  C9 E9 74     Mx
    BCS L_80AA1D                    ; $80AA01  B0 1A        Mx
    SEP #$20                        ; $80AA03  E2 20        Mx
    RTS                             ; $80AA05  60           mx
L_80AA06:
    SEP #$20                        ; $80AA06  E2 20        Mx
    LDY $0BD8                       ; $80AA08  AC D8 0B     mx
    LDA $AC27,Y                     ; $80AA0B  B9 27 AC     mx
    STA $0BD8                       ; $80AA0E  8D D8 0B     mx
    LDY $0B6C                       ; $80AA11  AC 6C 0B     mx
    LDX $AE27,Y                     ; $80AA14  BE 27 AE     mx
    LDA $AD27,Y                     ; $80AA17  B9 27 AD     mx
    BRL L_80A5D0                    ; $80AA1A  82 B3 FB     mx
L_80AA1D:
    SEP #$20                        ; $80AA1D  E2 20        Mx
    JSR L_80AB7F                    ; $80AA1F  20 7F AB     mx
    TYA                             ; $80AA22  98           mx
    ASL                             ; $80AA23  0A           mx
    TAX                             ; $80AA24  AA           mx
    JMP ($AA28,X)                   ; $80AA25  7C 28 AA     mx
    db $32,$AA,$47,$AA,$5C,$AA,$71,$AA,$86,$AA                         ; $80AA28
L_80AA32:
    LDY $0BD8                       ; $80AA32  AC D8 0B     mx
    LDA $AC67,Y                     ; $80AA35  B9 67 AC     mx
    STA $0BD8                       ; $80AA38  8D D8 0B     mx
    LDY $0B6C                       ; $80AA3B  AC 6C 0B     mx
    LDX $AE77,Y                     ; $80AA3E  BE 77 AE     mx
    LDA $AD77,Y                     ; $80AA41  B9 77 AD     mx
    BRL L_80A5D0                    ; $80AA44  82 89 FB     mx
L_80AA47:
    LDY $0BD8                       ; $80AA47  AC D8 0B     mx
    LDA $AC47,Y                     ; $80AA4A  B9 47 AC     mx
    STA $0BD8                       ; $80AA4D  8D D8 0B     mx
    LDY $0B6C                       ; $80AA50  AC 6C 0B     mx
    LDX $AE57,Y                     ; $80AA53  BE 57 AE     mx
    LDA $AD57,Y                     ; $80AA56  B9 57 AD     mx
    BRL L_80A5D0                    ; $80AA59  82 74 FB     mx
L_80AA5C:
    LDY $0BD8                       ; $80AA5C  AC D8 0B     mx
    LDA $AC27,Y                     ; $80AA5F  B9 27 AC     mx
    STA $0BD8                       ; $80AA62  8D D8 0B     mx
    LDY $0B6C                       ; $80AA65  AC 6C 0B     mx
    LDX $AE37,Y                     ; $80AA68  BE 37 AE     mx
    LDA $AD37,Y                     ; $80AA6B  B9 37 AD     mx
    BRL L_80A5D0                    ; $80AA6E  82 5F FB     mx
L_80AA71:
    LDY $0BD8                       ; $80AA71  AC D8 0B     mx
    LDA $AD07,Y                     ; $80AA74  B9 07 AD     mx
    STA $0BD8                       ; $80AA77  8D D8 0B     mx
    LDY $0B6C                       ; $80AA7A  AC 6C 0B     mx
    LDX $AF07,Y                     ; $80AA7D  BE 07 AF     mx
    LDA $AE07,Y                     ; $80AA80  B9 07 AE     mx
    BRL L_80A5D0                    ; $80AA83  82 4A FB     mx
L_80AA86:
    LDY $0BD8                       ; $80AA86  AC D8 0B     mx
    LDA $ACE7,Y                     ; $80AA89  B9 E7 AC     mx
    STA $0BD8                       ; $80AA8C  8D D8 0B     mx
    LDY $0B6C                       ; $80AA8F  AC 6C 0B     mx
    LDX $AEE7,Y                     ; $80AA92  BE E7 AE     mx
    LDA $ADE7,Y                     ; $80AA95  B9 E7 AD     mx
    BRL L_80A5D0                    ; $80AA98  82 35 FB     mx
L_80AA9B:
    LDX $0B5A                       ; $80AA9B  AE 5A 0B     mx
    LDY $0B5B                       ; $80AA9E  AC 5B 0B     mx
    JSR L_80AB4B                    ; $80AAA1  20 4B AB     mx
    REP #$20                        ; $80AAA4  C2 20        mx
    LDA $0B5C                       ; $80AAA6  AD 5C 0B     Mx
    CMP #$0169                      ; $80AAA9  C9 69 01     Mx
    BCC L_80AAB6                    ; $80AAAC  90 08        Mx
    CMP #$5CA4                      ; $80AAAE  C9 A4 5C     Mx
    BCS L_80AACD                    ; $80AAB1  B0 1A        Mx
    SEP #$20                        ; $80AAB3  E2 20        Mx
    RTS                             ; $80AAB5  60           mx
L_80AAB6:
    SEP #$20                        ; $80AAB6  E2 20        Mx
    LDY $0BD8                       ; $80AAB8  AC D8 0B     mx
    LDA $AC27,Y                     ; $80AABB  B9 27 AC     mx
    STA $0BD8                       ; $80AABE  8D D8 0B     mx
    LDY $0B6C                       ; $80AAC1  AC 6C 0B     mx
    LDX $AE37,Y                     ; $80AAC4  BE 37 AE     mx
    LDA $AD37,Y                     ; $80AAC7  B9 37 AD     mx
    BRL L_80A5D0                    ; $80AACA  82 03 FB     mx
L_80AACD:
    SEP #$20                        ; $80AACD  E2 20        Mx
    JSR L_80AB7F                    ; $80AACF  20 7F AB     mx
    TYA                             ; $80AAD2  98           mx
    ASL                             ; $80AAD3  0A           mx
    TAX                             ; $80AAD4  AA           mx
    JMP ($AAD8,X)                   ; $80AAD5  7C D8 AA     mx
    db $E2,$AA,$F7,$AA,$0C,$AB,$21,$AB,$36,$AB                         ; $80AAD8
L_80AAE2:
    LDY $0BD8                       ; $80AAE2  AC D8 0B     mx
    LDA $AC67,Y                     ; $80AAE5  B9 67 AC     mx
    STA $0BD8                       ; $80AAE8  8D D8 0B     mx
    LDY $0B6C                       ; $80AAEB  AC 6C 0B     mx
    LDX $AE67,Y                     ; $80AAEE  BE 67 AE     mx
    LDA $AD67,Y                     ; $80AAF1  B9 67 AD     mx
    BRL L_80A5D0                    ; $80AAF4  82 D9 FA     mx
L_80AAF7:
    LDY $0BD8                       ; $80AAF7  AC D8 0B     mx
    LDA $AC47,Y                     ; $80AAFA  B9 47 AC     mx
    STA $0BD8                       ; $80AAFD  8D D8 0B     mx
    LDY $0B6C                       ; $80AB00  AC 6C 0B     mx
    LDX $AE47,Y                     ; $80AB03  BE 47 AE     mx
    LDA $AD47,Y                     ; $80AB06  B9 47 AD     mx
    BRL L_80A5D0                    ; $80AB09  82 C4 FA     mx
L_80AB0C:
    LDY $0BD8                       ; $80AB0C  AC D8 0B     mx
    LDA $AC27,Y                     ; $80AB0F  B9 27 AC     mx
    STA $0BD8                       ; $80AB12  8D D8 0B     mx
    LDY $0B6C                       ; $80AB15  AC 6C 0B     mx
    LDX $AE27,Y                     ; $80AB18  BE 27 AE     mx
    LDA $AD27,Y                     ; $80AB1B  B9 27 AD     mx
    BRL L_80A5D0                    ; $80AB1E  82 AF FA     mx
L_80AB21:
    LDY $0BD8                       ; $80AB21  AC D8 0B     mx
    LDA $AD07,Y                     ; $80AB24  B9 07 AD     mx
    STA $0BD8                       ; $80AB27  8D D8 0B     mx
    LDY $0B6C                       ; $80AB2A  AC 6C 0B     mx
    LDX $AF17,Y                     ; $80AB2D  BE 17 AF     mx
    LDA $AE17,Y                     ; $80AB30  B9 17 AE     mx
    BRL L_80A5D0                    ; $80AB33  82 9A FA     mx
L_80AB36:
    LDY $0BD8                       ; $80AB36  AC D8 0B     mx
    LDA $ACE7,Y                     ; $80AB39  B9 E7 AC     mx
    STA $0BD8                       ; $80AB3C  8D D8 0B     mx
    LDY $0B6C                       ; $80AB3F  AC 6C 0B     mx
    LDX $AEF7,Y                     ; $80AB42  BE F7 AE     mx
    LDA $ADF7,Y                     ; $80AB45  B9 F7 AD     mx
    BRL L_80A5D0                    ; $80AB48  82 85 FA     mx
L_80AB4B:
    PHY                             ; $80AB4B  5A           mx
    STX $0B96                       ; $80AB4C  8E 96 0B     mx
    STX $0B98                       ; $80AB4F  8E 98 0B     mx
    JSR L_809D94                    ; $80AB52  20 94 9D     mx
    LDA $0B9A                       ; $80AB55  AD 9A 0B     mx
    STA $0B5C                       ; $80AB58  8D 5C 0B     mx
    LDA $0B9B                       ; $80AB5B  AD 9B 0B     mx
    STA $0B5D                       ; $80AB5E  8D 5D 0B     mx
    PLY                             ; $80AB61  7A           mx
    STY $0B96                       ; $80AB62  8C 96 0B     mx
    STY $0B98                       ; $80AB65  8C 98 0B     mx
    JSR L_809D94                    ; $80AB68  20 94 9D     mx
    LDA $0B9A                       ; $80AB6B  AD 9A 0B     mx
    CLC                             ; $80AB6E  18           mx
    ADC $0B5C                       ; $80AB6F  6D 5C 0B     mx
    STA $0B5C                       ; $80AB72  8D 5C 0B     mx
    LDA $0B9B                       ; $80AB75  AD 9B 0B     mx
    ADC $0B5D                       ; $80AB78  6D 5D 0B     mx
    STA $0B5D                       ; $80AB7B  8D 5D 0B     mx
    RTS                             ; $80AB7E  60           mx
L_80AB7F:
    REP #$20                        ; $80AB7F  C2 20        mx
    LDA $0B5B                       ; $80AB81  AD 5B 0B     Mx
    AND #$00FF                      ; $80AB84  29 FF 00     Mx
    STA $0A42                       ; $80AB87  8D 42 0A     Mx
    ASL                             ; $80AB8A  0A           Mx
    ASL                             ; $80AB8B  0A           Mx
    ASL                             ; $80AB8C  0A           Mx
    ASL                             ; $80AB8D  0A           Mx
    SEC                             ; $80AB8E  38           Mx
    SBC $0A42                       ; $80AB8F  ED 42 0A     Mx
    ASL                             ; $80AB92  0A           Mx
    STA $0B9A                       ; $80AB93  8D 9A 0B     Mx
    SEP #$20                        ; $80AB96  E2 20        Mx
    LDA $0B5A                       ; $80AB98  AD 5A 0B     mx
    STA $0B77                       ; $80AB9B  8D 77 0B     mx
    JSR L_809E50                    ; $80AB9E  20 50 9E     mx
    LDY #$00                        ; $80ABA1  A0 00        mx
    LDA $0B76                       ; $80ABA3  AD 76 0B     mx
    BNE L_80ABBD                    ; $80ABA6  D0 15        mx
    LDA $0B75                       ; $80ABA8  AD 75 0B     mx
    CMP #$96                        ; $80ABAB  C9 96        mx
    BCS L_80ABBD                    ; $80ABAD  B0 0E        mx
    CMP #$2D                        ; $80ABAF  C9 2D        mx
    BCS L_80ABBE                    ; $80ABB1  B0 0B        mx
    CMP #$14                        ; $80ABB3  C9 14        mx
    BCS L_80ABBF                    ; $80ABB5  B0 08        mx
    CMP #$06                        ; $80ABB7  C9 06        mx
    BCS L_80ABC0                    ; $80ABB9  B0 05        mx
    BCC L_80ABC1                    ; $80ABBB  90 04        mx
L_80ABBD:
    INY                             ; $80ABBD  C8           mx
L_80ABBE:
    INY                             ; $80ABBE  C8           mx
L_80ABBF:
    INY                             ; $80ABBF  C8           mx
L_80ABC0:
    INY                             ; $80ABC0  C8           mx
L_80ABC1:
    RTS                             ; $80ABC1  60           mx
L_80ABC2:
    LDA #$01                        ; $80ABC2  A9 01        mx
    STA $0B60                       ; $80ABC4  8D 60 0B     mx
    LDX $0BD0                       ; $80ABC7  AE D0 0B     mx
    STA $0A1A,X                     ; $80ABCA  9D 1A 0A     mx
    STA $0A1E,X                     ; $80ABCD  9D 1E 0A     mx
    RTS                             ; $80ABD0  60           mx
L_80ABD1:
    LDY #$00                        ; $80ABD1  A0 00        mx
    LDA $0B83                       ; $80ABD3  AD 83 0B     mx
    BPL L_80ABDC                    ; $80ABD6  10 04        mx
    INY                             ; $80ABD8  C8           mx
    EOR #$FF                        ; $80ABD9  49 FF        mx
    INC                             ; $80ABDB  1A           mx
L_80ABDC:
    STA $0B85                       ; $80ABDC  8D 85 0B     mx
    LDA $0B84                       ; $80ABDF  AD 84 0B     mx
    BPL L_80ABE8                    ; $80ABE2  10 04        mx
    INY                             ; $80ABE4  C8           mx
    EOR #$FF                        ; $80ABE5  49 FF        mx
    INC                             ; $80ABE7  1A           mx
L_80ABE8:
    STA $0B86                       ; $80ABE8  8D 86 0B     mx
    LDX #$08                        ; $80ABEB  A2 08        mx
    STZ $0B9A                       ; $80ABED  9C 9A 0B     mx
    STZ $0B9B                       ; $80ABF0  9C 9B 0B     mx
L_80ABF3:
    ASL $0B9A                       ; $80ABF3  0E 9A 0B     mx
    ROL $0B9B                       ; $80ABF6  2E 9B 0B     mx
    ASL $0B85                       ; $80ABF9  0E 85 0B     mx
    BCC L_80AC10                    ; $80ABFC  90 12        mx
    LDA $0B9A                       ; $80ABFE  AD 9A 0B     mx
    CLC                             ; $80AC01  18           mx
    ADC $0B86                       ; $80AC02  6D 86 0B     mx
    STA $0B9A                       ; $80AC05  8D 9A 0B     mx
    LDA $0B9B                       ; $80AC08  AD 9B 0B     mx
    ADC #$00                        ; $80AC0B  69 00        mx
    STA $0B9B                       ; $80AC0D  8D 9B 0B     mx
L_80AC10:
    DEX                             ; $80AC10  CA           mx
    BNE L_80ABF3                    ; $80AC11  D0 E0        mx
    TYA                             ; $80AC13  98           mx
    AND #$01                        ; $80AC14  29 01        mx
    BEQ L_80AC26                    ; $80AC16  F0 0E        mx
    REP #$20                        ; $80AC18  C2 20        mx
    LDA $0B9A                       ; $80AC1A  AD 9A 0B     Mx
    EOR #$FFFF                      ; $80AC1D  49 FF FF     Mx
    INC                             ; $80AC20  1A           Mx
    STA $0B9A                       ; $80AC21  8D 9A 0B     Mx
    SEP #$20                        ; $80AC24  E2 20        Mx
L_80AC26:
    RTS                             ; $80AC26  60           mx
    db $00,$00,$01,$02,$03,$04,$05,$06,$08,$0A,$0B,$0C,$0D,$0E,$0F,$10 ; $80AC27
    db $10,$10,$11,$12,$13,$14,$15,$16,$18,$1A,$1B,$1C,$1D,$1E,$1F,$00 ; $80AC37
    db $01,$02,$02,$02,$03,$04,$05,$06,$07,$08,$0A,$0C,$0D,$0E,$0F,$10 ; $80AC47
    db $11,$12,$12,$12,$13,$14,$15,$16,$17,$18,$1A,$1C,$1D,$1E,$1F,$00 ; $80AC57
    db $01,$02,$03,$04,$04,$04,$05,$06,$07,$08,$09,$0A,$0C,$0E,$0F,$10 ; $80AC67
    db $11,$12,$13,$14,$14,$14,$15,$16,$17,$18,$19,$1A,$1C,$1E,$1F,$00 ; $80AC77
    db $01,$02,$03,$04,$05,$06,$06,$06,$07,$08,$09,$0A,$0B,$0C,$0E,$10 ; $80AC87
    db $11,$12,$13,$14,$15,$16,$16,$16,$17,$18,$19,$1A,$1B,$1C,$1E,$00 ; $80AC97
    db $00,$02,$03,$04,$05,$06,$07,$08,$08,$08,$09,$0A,$0B,$0C,$0D,$0E ; $80ACA7
    db $10,$12,$13,$14,$15,$16,$17,$18,$18,$18,$19,$1A,$1B,$1C,$1D,$1E ; $80ACB7
    db $1F,$00,$02,$04,$05,$06,$07,$08,$09,$0A,$0A,$0A,$0B,$0C,$0D,$0E ; $80ACC7
    db $0F,$10,$12,$14,$15,$16,$17,$18,$19,$1A,$1A,$1A,$1B,$1C,$1D,$1E ; $80ACD7
    db $1F,$00,$01,$02,$04,$06,$07,$08,$09,$0A,$0B,$0C,$0C,$0C,$0D,$0E ; $80ACE7
    db $0F,$10,$11,$12,$14,$16,$17,$18,$19,$1A,$1B,$1C,$1C,$1C,$1D,$1E ; $80ACF7
    db $1F,$00,$01,$02,$03,$04,$06,$07,$09,$0A,$0B,$0C,$0D,$0E,$0E,$0E ; $80AD07
    db $0F,$10,$11,$12,$13,$14,$16,$18,$19,$1A,$1B,$1C,$1D,$1E,$1E,$1E ; $80AD17
    db $01,$01,$02,$03,$04,$05,$06,$07,$07,$07,$06,$05,$04,$03,$02,$01 ; $80AD27
    db $0F,$0F,$0E,$0D,$0C,$0B,$0A,$09,$09,$09,$0A,$0B,$0C,$0D,$0E,$0F ; $80AD37
    db $02,$02,$02,$03,$04,$05,$06,$07,$08,$08,$08,$07,$06,$05,$04,$03 ; $80AD47
    db $00,$00,$00,$0F,$0E,$0D,$0C,$0B,$0A,$0A,$0A,$0B,$0C,$0D,$0E,$0F ; $80AD57
    db $04,$03,$03,$03,$04,$05,$06,$07,$08,$09,$09,$09,$08,$07,$06,$05 ; $80AD67
    db $00,$01,$01,$01,$00,$0F,$0E,$0D,$0C,$0B,$0B,$0B,$0C,$0D,$0E,$0F ; $80AD77
    db $06,$05,$04,$04,$04,$05,$06,$07,$08,$09,$0A,$0A,$0A,$09,$08,$07 ; $80AD87
    db $00,$01,$02,$02,$02,$01,$00,$0F,$0E,$0D,$0C,$0C,$0C,$0D,$0E,$0F ; $80AD97
    db $08,$07,$06,$05,$05,$05,$06,$07,$08,$09,$0A,$0B,$0B,$0B,$0A,$09 ; $80ADA7
    db $00,$01,$02,$03,$03,$03,$02,$01,$00,$0F,$0E,$0D,$0D,$0D,$0E,$0F ; $80ADB7
    db $0A,$09,$08,$07,$06,$06,$06,$07,$08,$09,$0A,$0B,$0C,$0C,$0C,$0B ; $80ADC7
    db $00,$01,$02,$03,$04,$04,$04,$03,$02,$01,$00,$0F,$0E,$0E,$0E,$0F ; $80ADD7
    db $0C,$0B,$0A,$09,$08,$07,$07,$07,$08,$09,$0A,$0B,$0C,$0D,$0D,$0D ; $80ADE7
    db $00,$01,$02,$03,$04,$05,$05,$05,$04,$03,$02,$01,$00,$0F,$0F,$0F ; $80ADF7
    db $0E,$0D,$0C,$0B,$0A,$09,$08,$08,$08,$09,$0A,$0B,$0C,$0D,$0E,$0E ; $80AE07
    db $00,$01,$02,$03,$04,$05,$06,$06,$06,$05,$04,$03,$02,$01,$00,$00 ; $80AE17
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$04,$03,$02,$01 ; $80AE27
    db $00,$01,$02,$03,$04,$03,$02,$01,$00,$00,$00,$00,$00,$00,$00,$00 ; $80AE37
    db $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$04,$03,$02 ; $80AE47
    db $00,$00,$01,$02,$03,$04,$03,$02,$01,$00,$00,$00,$00,$00,$00,$00 ; $80AE57
    db $02,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$04,$03 ; $80AE67
    db $00,$00,$00,$01,$02,$03,$04,$03,$02,$01,$00,$00,$00,$00,$00,$00 ; $80AE77
    db $03,$02,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$04 ; $80AE87
    db $00,$00,$00,$00,$01,$02,$03,$04,$03,$02,$01,$00,$00,$00,$00,$00 ; $80AE97
    db $04,$03,$02,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03 ; $80AEA7
    db $00,$00,$00,$00,$00,$01,$02,$03,$04,$03,$02,$01,$00,$00,$00,$00 ; $80AEB7
    db $03,$04,$03,$02,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02 ; $80AEC7
    db $00,$00,$00,$00,$00,$00,$01,$02,$03,$04,$03,$02,$01,$00,$00,$00 ; $80AED7
    db $02,$03,$04,$03,$02,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01 ; $80AEE7
    db $00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$04,$03,$02,$01,$00,$00 ; $80AEF7
    db $01,$02,$03,$04,$03,$02,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $80AF07
    db $00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$04,$03,$02,$01,$00 ; $80AF17
    db $FF,$E0,$C0,$A0,$80,$7F,$76,$5A,$30,$00,$D0,$A6,$8A,$80,$8A,$A6 ; $80AF27
    db $D0,$00,$30,$5A,$76,$00,$D0,$A6,$8A,$80,$8A,$A6,$D0,$00,$30,$5A ; $80AF37
    db $76,$7F,$76,$5A,$30                                             ; $80AF47
L_80AF4C:
    JSR L_80B05A                    ; $80AF4C  20 5A B0     mx
    LDX #$00                        ; $80AF4F  A2 00        mx
    JSR L_80AF60                    ; $80AF51  20 60 AF     mx
    LDX #$01                        ; $80AF54  A2 01        mx
    JSR L_80AF60                    ; $80AF56  20 60 AF     mx
    LDX #$02                        ; $80AF59  A2 02        mx
    JSR L_80AF60                    ; $80AF5B  20 60 AF     mx
    LDX #$03                        ; $80AF5E  A2 03        mx
L_80AF60:
    LDA $0E25,X                     ; $80AF60  BD 25 0E     mx
    BEQ L_80AF68                    ; $80AF63  F0 03        mx
    BRL L_80B115                    ; $80AF65  82 AD 01     mx
L_80AF68:
    LDA $033B                       ; $80AF68  AD 3B 03     mx
    BNE L_80AF91                    ; $80AF6B  D0 24        mx
    CPX #$01                        ; $80AF6D  E0 01        mx
    BEQ L_80AF91                    ; $80AF6F  F0 20        mx
    CPX #$02                        ; $80AF71  E0 02        mx
    BEQ L_80AFAD                    ; $80AF73  F0 38        mx
    JSR L_80B0ED                    ; $80AF75  20 ED B0     mx
    LDY $033D                       ; $80AF78  AC 3D 03     mx  pad1_held
    LDA $033E                       ; $80AF7B  AD 3E 03     mx
    JSR L_80AFC9                    ; $80AF7E  20 C9 AF     mx
    LDY $034D                       ; $80AF81  AC 4D 03     mx  pad1_pressed
    LDA $034E                       ; $80AF84  AD 4E 03     mx
    JSR L_80B029                    ; $80AF87  20 29 B0     mx
    STZ $034D                       ; $80AF8A  9C 4D 03     mx  pad1_pressed
    STZ $034E                       ; $80AF8D  9C 4E 03     mx
    RTS                             ; $80AF90  60           mx
L_80AF91:
    JSR L_80B0ED                    ; $80AF91  20 ED B0     mx
    LDY $033F                       ; $80AF94  AC 3F 03     mx  pad2_held
    LDA $0340                       ; $80AF97  AD 40 03     mx
    JSR L_80AFC9                    ; $80AF9A  20 C9 AF     mx
    LDY $034F                       ; $80AF9D  AC 4F 03     mx  pad2_pressed
    LDA $0350                       ; $80AFA0  AD 50 03     mx
    JSR L_80B029                    ; $80AFA3  20 29 B0     mx
    STZ $034F                       ; $80AFA6  9C 4F 03     mx  pad2_pressed
    STZ $0350                       ; $80AFA9  9C 50 03     mx
    RTS                             ; $80AFAC  60           mx
L_80AFAD:
    JSR L_80B0ED                    ; $80AFAD  20 ED B0     mx
    LDY $0341                       ; $80AFB0  AC 41 03     mx
    LDA $0342                       ; $80AFB3  AD 42 03     mx
    JSR L_80AFC9                    ; $80AFB6  20 C9 AF     mx
    LDY $0351                       ; $80AFB9  AC 51 03     mx
    LDA $0352                       ; $80AFBC  AD 52 03     mx
    JSR L_80B029                    ; $80AFBF  20 29 B0     mx
    STZ $0351                       ; $80AFC2  9C 51 03     mx
    STZ $0352                       ; $80AFC5  9C 52 03     mx
    RTS                             ; $80AFC8  60           mx
L_80AFC9:
    STA $88                         ; $80AFC9  85 88        mx
    LDA $0EDF,X                     ; $80AFCB  BD DF 0E     mx
    BEQ L_80B028                    ; $80AFCE  F0 58        mx
    LDA $88                         ; $80AFD0  A5 88        mx
    BIT #$80                        ; $80AFD2  89 80        mx
    BEQ L_80AFD9                    ; $80AFD4  F0 03        mx
    INC $0A6E,X                     ; $80AFD6  FE 6E 0A     mx
L_80AFD9:
    BIT #$02                        ; $80AFD9  89 02        mx
    BEQ L_80AFE0                    ; $80AFDB  F0 03        mx
    INC $0A66,X                     ; $80AFDD  FE 66 0A     mx
L_80AFE0:
    BIT #$01                        ; $80AFE0  89 01        mx
    BEQ L_80AFE7                    ; $80AFE2  F0 03        mx
    INC $0A62,X                     ; $80AFE4  FE 62 0A     mx
L_80AFE7:
    BIT #$04                        ; $80AFE7  89 04        mx
    BEQ L_80AFF6                    ; $80AFE9  F0 0B        mx
    LDA $0A66,X                     ; $80AFEB  BD 66 0A     mx
    ORA $0A62,X                     ; $80AFEE  1D 62 0A     mx
    BNE L_80AFF6                    ; $80AFF1  D0 03        mx
    INC $0A6A,X                     ; $80AFF3  FE 6A 0A     mx
L_80AFF6:
    LDA $0E37,X                     ; $80AFF6  BD 37 0E     mx
    CMP #$02                        ; $80AFF9  C9 02        mx
    BNE L_80B005                    ; $80AFFB  D0 08        mx
    TYA                             ; $80AFFD  98           mx
    BIT #$80                        ; $80AFFE  89 80        mx
    BEQ L_80B005                    ; $80B000  F0 03        mx
    JSR L_80B0BE                    ; $80B002  20 BE B0     mx
L_80B005:
    TYA                             ; $80B005  98           mx
    BIT #$20                        ; $80B006  89 20        mx
    BEQ L_80B017                    ; $80B008  F0 0D        mx
    INC $0A66,X                     ; $80B00A  FE 66 0A     mx
    LDY $0A66,X                     ; $80B00D  BC 66 0A     mx
    CPY #$02                        ; $80B010  C0 02        mx
    BNE L_80B017                    ; $80B012  D0 03        mx
    INC $0A72,X                     ; $80B014  FE 72 0A     mx
L_80B017:
    BIT #$10                        ; $80B017  89 10        mx
    BEQ L_80B028                    ; $80B019  F0 0D        mx
    INC $0A62,X                     ; $80B01B  FE 62 0A     mx
    LDY $0A62,X                     ; $80B01E  BC 62 0A     mx
    CPY #$02                        ; $80B021  C0 02        mx
    BNE L_80B028                    ; $80B023  D0 03        mx
    INC $0A72,X                     ; $80B025  FE 72 0A     mx
L_80B028:
    RTS                             ; $80B028  60           mx
L_80B029:
    STA $88                         ; $80B029  85 88        mx
    BIT #$10                        ; $80B02B  89 10        mx
    BEQ L_80B034                    ; $80B02D  F0 05        mx
    LDA #$01                        ; $80B02F  A9 01        mx
    STA $028A,X                     ; $80B031  9D 8A 02     mx
L_80B034:
    LDA $0EDF,X                     ; $80B034  BD DF 0E     mx
    BEQ L_80B059                    ; $80B037  F0 20        mx
    LDA $88                         ; $80B039  A5 88        mx
    BIT #$40                        ; $80B03B  89 40        mx
    BEQ L_80B042                    ; $80B03D  F0 03        mx
    JSR L_80B0B1                    ; $80B03F  20 B1 B0     mx
L_80B042:
    LDA $0E37,X                     ; $80B042  BD 37 0E     mx
    CMP #$02                        ; $80B045  C9 02        mx
    BEQ L_80B051                    ; $80B047  F0 08        mx
    TYA                             ; $80B049  98           mx
    BIT #$80                        ; $80B04A  89 80        mx
    BEQ L_80B051                    ; $80B04C  F0 03        mx
    JSR L_80B0BE                    ; $80B04E  20 BE B0     mx
L_80B051:
    TYA                             ; $80B051  98           mx
    BIT #$40                        ; $80B052  89 40        mx
    BEQ L_80B059                    ; $80B054  F0 03        mx
    JSR L_80B0CB                    ; $80B056  20 CB B0     mx
L_80B059:
    RTS                             ; $80B059  60           mx
L_80B05A:
    LDA $0255                       ; $80B05A  AD 55 02     mx
    BEQ L_80B06E                    ; $80B05D  F0 0F        mx
    LDY #$00                        ; $80B05F  A0 00        mx
    JSR L_80B06F                    ; $80B061  20 6F B0     mx
    LDY #$02                        ; $80B064  A0 02        mx
    JSR L_80B06F                    ; $80B066  20 6F B0     mx
    LDY #$04                        ; $80B069  A0 04        mx
    JSR L_80B06F                    ; $80B06B  20 6F B0     mx
L_80B06E:
    RTS                             ; $80B06E  60           mx
L_80B06F:
    REP #$30                        ; $80B06F  C2 30        mx
    LDA $0257,Y                     ; $80B071  B9 57 02     MX
    BNE L_80B092                    ; $80B074  D0 1C        MX
    LDX $0267,Y                     ; $80B076  BE 67 02     MX
    LDA $7EF000,X                   ; $80B079  BF 00 F0 7E  MX
    INX                             ; $80B07D  E8           MX
    INX                             ; $80B07E  E8           MX
    STA $025F,Y                     ; $80B07F  99 5F 02     MX
    LDA $7EF000,X                   ; $80B082  BF 00 F0 7E  MX
    INX                             ; $80B086  E8           MX
    INX                             ; $80B087  E8           MX
    STA $0257,Y                     ; $80B088  99 57 02     MX
    TXA                             ; $80B08B  8A           MX
    STA $0267,Y                     ; $80B08C  99 67 02     MX
    LDA $0257,Y                     ; $80B08F  B9 57 02     MX
L_80B092:
    DEC                             ; $80B092  3A           MX
    STA $0257,Y                     ; $80B093  99 57 02     MX
    LDA $033D,Y                     ; $80B096  B9 3D 03     MX  pad1_held
    STA $0345,Y                     ; $80B099  99 45 03     MX
    LDA $025F,Y                     ; $80B09C  B9 5F 02     MX
    STA $033D,Y                     ; $80B09F  99 3D 03     MX  pad1_held
    EOR $0345,Y                     ; $80B0A2  59 45 03     MX
    AND $033D,Y                     ; $80B0A5  39 3D 03     MX  pad1_held
    ORA $034D,Y                     ; $80B0A8  19 4D 03     MX  pad1_pressed
    STA $034D,Y                     ; $80B0AB  99 4D 03     MX  pad1_pressed
    SEP #$30                        ; $80B0AE  E2 30        MX
    RTS                             ; $80B0B0  60           mx
L_80B0B1:
    PHA                             ; $80B0B1  48           mx
    PHY                             ; $80B0B2  5A           mx
    LDA $0E33,X                     ; $80B0B3  BD 33 0E     mx
    LDY #$01                        ; $80B0B6  A0 01        mx
    JSR L_80B0DB                    ; $80B0B8  20 DB B0     mx
    PLY                             ; $80B0BB  7A           mx
    PLA                             ; $80B0BC  68           mx
    RTS                             ; $80B0BD  60           mx
L_80B0BE:
    PHA                             ; $80B0BE  48           mx
    PHY                             ; $80B0BF  5A           mx
    LDA $0E37,X                     ; $80B0C0  BD 37 0E     mx
    LDY #$02                        ; $80B0C3  A0 02        mx
    JSR L_80B0DB                    ; $80B0C5  20 DB B0     mx
    PLY                             ; $80B0C8  7A           mx
    PLA                             ; $80B0C9  68           mx
    RTS                             ; $80B0CA  60           mx
L_80B0CB:
    PHA                             ; $80B0CB  48           mx
    PHY                             ; $80B0CC  5A           mx
    LDA $0E3B,X                     ; $80B0CD  BD 3B 0E     mx
    CLC                             ; $80B0D0  18           mx
    ADC #$06                        ; $80B0D1  69 06        mx
    LDY #$03                        ; $80B0D3  A0 03        mx
    JSR L_80B0DB                    ; $80B0D5  20 DB B0     mx
    PLY                             ; $80B0D8  7A           mx
    PLA                             ; $80B0D9  68           mx
    RTS                             ; $80B0DA  60           mx
L_80B0DB:
    PHX                             ; $80B0DB  DA           mx
    ASL                             ; $80B0DC  0A           mx
    ASL                             ; $80B0DD  0A           mx
    STA $0A42                       ; $80B0DE  8D 42 0A     mx
    TXA                             ; $80B0E1  8A           mx
    CLC                             ; $80B0E2  18           mx
    ADC $0A42                       ; $80B0E3  6D 42 0A     mx
    TAX                             ; $80B0E6  AA           mx
    TYA                             ; $80B0E7  98           mx
    STA $0EB1,X                     ; $80B0E8  9D B1 0E     mx
    PLX                             ; $80B0EB  FA           mx
    RTS                             ; $80B0EC  60           mx
L_80B0ED:
    STZ $0A6E,X                     ; $80B0ED  9E 6E 0A     mx
    STZ $0A6A,X                     ; $80B0F0  9E 6A 0A     mx
    STZ $0A66,X                     ; $80B0F3  9E 66 0A     mx
    STZ $0A62,X                     ; $80B0F6  9E 62 0A     mx
    STZ $0A72,X                     ; $80B0F9  9E 72 0A     mx
    STZ $0EB1,X                     ; $80B0FC  9E B1 0E     mx
    STZ $0EB9,X                     ; $80B0FF  9E B9 0E     mx
    STZ $0EB5,X                     ; $80B102  9E B5 0E     mx
    STZ $0EC5,X                     ; $80B105  9E C5 0E     mx
    STZ $0EC1,X                     ; $80B108  9E C1 0E     mx
    STZ $0EBD,X                     ; $80B10B  9E BD 0E     mx
    STZ $0EC9,X                     ; $80B10E  9E C9 0E     mx
    STZ $0ECD,X                     ; $80B111  9E CD 0E     mx
    RTS                             ; $80B114  60           mx
L_80B115:
    JSR L_80B0ED                    ; $80B115  20 ED B0     mx
    LDA $0EDF,X                     ; $80B118  BD DF 0E     mx
    BNE L_80B11E                    ; $80B11B  D0 01        mx
    RTS                             ; $80B11D  60           mx
L_80B11E:
    LDA #$40                        ; $80B11E  A9 40        mx
    STA $0A76,X                     ; $80B120  9D 76 0A     mx
    STZ $0A8C                       ; $80B123  9C 8C 0A     mx
    LDA $0C35,X                     ; $80B126  BD 35 0C     mx
    CMP #$08                        ; $80B129  C9 08        mx
    BCC L_80B157                    ; $80B12B  90 2A        mx
    CMP #$0C                        ; $80B12D  C9 0C        mx
    BCS L_80B136                    ; $80B12F  B0 05        mx
    INC $0A8C                       ; $80B131  EE 8C 0A     mx
    BRA L_80B151                    ; $80B134  80 1B        mx
L_80B136:
    CMP #$14                        ; $80B136  C9 14        mx
    BCS L_80B157                    ; $80B138  B0 1D        mx
    LDA $0CA7,X                     ; $80B13A  BD A7 0C     mx
    CMP #$80                        ; $80B13D  C9 80        mx
    BEQ L_80B151                    ; $80B13F  F0 10        mx
    LDA $0CAD,X                     ; $80B141  BD AD 0C     mx
    CMP #$80                        ; $80B144  C9 80        mx
    BEQ L_80B157                    ; $80B146  F0 0F        mx
    LDA $0CB1,X                     ; $80B148  BD B1 0C     mx
    TAY                             ; $80B14B  A8           mx
    JSR L_80B33E                    ; $80B14C  20 3E B3     mx
    BEQ L_80B157                    ; $80B14F  F0 06        mx
L_80B151:
    LDY #$2C                        ; $80B151  A0 2C        mx
    TYA                             ; $80B153  98           mx
    STA $0A76,X                     ; $80B154  9D 76 0A     mx
L_80B157:
    LDA $0A7A,X                     ; $80B157  BD 7A 0A     mx
    BEQ L_80B172                    ; $80B15A  F0 16        mx
    DEC $0A7A,X                     ; $80B15C  DE 7A 0A     mx
    BEQ L_80B179                    ; $80B15F  F0 18        mx
    LDA $48,X                       ; $80B161  B5 48        mx
    BMI L_80B16A                    ; $80B163  30 05        mx
    STZ $0A7A,X                     ; $80B165  9E 7A 0A     mx
    BRA L_80B194                    ; $80B168  80 2A        mx
L_80B16A:
    STZ $0A6A,X                     ; $80B16A  9E 6A 0A     mx
    STZ $0A6E,X                     ; $80B16D  9E 6E 0A     mx
    BRA L_80B1AC                    ; $80B170  80 3A        mx
L_80B172:
    LDA $0A7E,X                     ; $80B172  BD 7E 0A     mx
    BEQ L_80B194                    ; $80B175  F0 1D        mx
    BRA L_80B17E                    ; $80B177  80 05        mx
L_80B179:
    LDA #$1E                        ; $80B179  A9 1E        mx
    STA $0A7E,X                     ; $80B17B  9D 7E 0A     mx
L_80B17E:
    LDA $48,X                       ; $80B17E  B5 48        mx
    BMI L_80B187                    ; $80B180  30 05        mx
    LDA #$01                        ; $80B182  A9 01        mx
    STA $0A7E,X                     ; $80B184  9D 7E 0A     mx
L_80B187:
    DEC $0A7E,X                     ; $80B187  DE 7E 0A     mx
L_80B18A:
    STZ $0A6A,X                     ; $80B18A  9E 6A 0A     mx
    LDA #$01                        ; $80B18D  A9 01        mx
    STA $0A6E,X                     ; $80B18F  9D 6E 0A     mx
    BRA L_80B1AC                    ; $80B192  80 18        mx
L_80B194:
    LDA $48,X                       ; $80B194  B5 48        mx
    BPL L_80B19F                    ; $80B196  10 07        mx
    LDA #$5A                        ; $80B198  A9 5A        mx
    STA $0A7A,X                     ; $80B19A  9D 7A 0A     mx
    BRA L_80B157                    ; $80B19D  80 B8        mx
L_80B19F:
    CMP $0A76,X                     ; $80B19F  DD 76 0A     mx
    BCC L_80B18A                    ; $80B1A2  90 E6        mx
    STZ $0A6E,X                     ; $80B1A4  9E 6E 0A     mx
    LDA #$01                        ; $80B1A7  A9 01        mx
    STA $0A6A,X                     ; $80B1A9  9D 6A 0A     mx
L_80B1AC:
    LDA $0A57,X                     ; $80B1AC  BD 57 0A     mx
    CMP #$80                        ; $80B1AF  C9 80        mx
    BEQ L_80B1B9                    ; $80B1B1  F0 06        mx
    AND #$FE                        ; $80B1B3  29 FE        mx
    CMP #$02                        ; $80B1B5  C9 02        mx
    BNE L_80B1BE                    ; $80B1B7  D0 05        mx
L_80B1B9:
    LDA #$01                        ; $80B1B9  A9 01        mx
    STA $0A82,X                     ; $80B1BB  9D 82 0A     mx
L_80B1BE:
    CMP #$FC                        ; $80B1BE  C9 FC        mx
    BEQ L_80B1B9                    ; $80B1C0  F0 F7        mx
    LDA $0C35,X                     ; $80B1C2  BD 35 0C     mx
    CMP #$08                        ; $80B1C5  C9 08        mx
    BCC L_80B1CD                    ; $80B1C7  90 04        mx
    CMP #$14                        ; $80B1C9  C9 14        mx
    BCC L_80B1D0                    ; $80B1CB  90 03        mx
L_80B1CD:
    JMP L_80B265                    ; $80B1CD  4C 65 B2     mx
L_80B1D0:
    LDA $0A8C                       ; $80B1D0  AD 8C 0A     mx
    BNE L_80B1FC                    ; $80B1D3  D0 27        mx
    LDA $0CB1,X                     ; $80B1D5  BD B1 0C     mx
    TAY                             ; $80B1D8  A8           mx
    LDA $0CA7,X                     ; $80B1D9  BD A7 0C     mx
    CMP #$80                        ; $80B1DC  C9 80        mx
    BEQ L_80B1FC                    ; $80B1DE  F0 1C        mx
    LDA $0CAD,X                     ; $80B1E0  BD AD 0C     mx
    CMP #$80                        ; $80B1E3  C9 80        mx
    BEQ L_80B1CD                    ; $80B1E5  F0 E6        mx
    JSR L_80B33E                    ; $80B1E7  20 3E B3     mx
    BEQ L_80B255                    ; $80B1EA  F0 69        mx
    LDA $0C35,X                     ; $80B1EC  BD 35 0C     mx
    TAY                             ; $80B1EF  A8           mx
    LDA $B59F,Y                     ; $80B1F0  B9 9F B5     mx
L_80B1F3:
    STA $0A62,X                     ; $80B1F3  9D 62 0A     mx
    EOR #$01                        ; $80B1F6  49 01        mx
    STA $0A66,X                     ; $80B1F8  9D 66 0A     mx
    RTS                             ; $80B1FB  60           mx
L_80B1FC:
    LDA $0A57,X                     ; $80B1FC  BD 57 0A     mx
    BNE L_80B204                    ; $80B1FF  D0 03        mx
    JMP L_80B2E5                    ; $80B201  4C E5 B2     mx
L_80B204:
    TXA                             ; $80B204  8A           mx
    ASL                             ; $80B205  0A           mx
    TAY                             ; $80B206  A8           mx
    LDA $0CEC,Y                     ; $80B207  B9 EC 0C     mx
    CMP #$19                        ; $80B20A  C9 19        mx
    BCC L_80B255                    ; $80B20C  90 47        mx
    LDA $0A57,X                     ; $80B20E  BD 57 0A     mx
    CMP #$80                        ; $80B211  C9 80        mx
    BEQ L_80B21F                    ; $80B213  F0 0A        mx
    CMP #$00                        ; $80B215  C9 00        mx
    BMI L_80B21C                    ; $80B217  30 03        mx
    JMP L_80B2C1                    ; $80B219  4C C1 B2     mx
L_80B21C:
    JMP L_80B2CE                    ; $80B21C  4C CE B2     mx
L_80B21F:
    LDA $0CA7,X                     ; $80B21F  BD A7 0C     mx
    CMP #$80                        ; $80B222  C9 80        mx
    BNE L_80B229                    ; $80B224  D0 03        mx
    LDA $0CAD,X                     ; $80B226  BD AD 0C     mx
L_80B229:
    STA $0A8A                       ; $80B229  8D 8A 0A     mx
    LDA $0CB1,X                     ; $80B22C  BD B1 0C     mx
    SEC                             ; $80B22F  38           mx
    SBC $0A8A                       ; $80B230  ED 8A 0A     mx
    AND #$01                        ; $80B233  29 01        mx
    STA $0A8D                       ; $80B235  8D 8D 0A     mx
    LDA $0C35,X                     ; $80B238  BD 35 0C     mx
    CMP #$0C                        ; $80B23B  C9 0C        mx
    BCC L_80B243                    ; $80B23D  90 04        mx
    CLC                             ; $80B23F  18           mx
    ADC #$04                        ; $80B240  69 04        mx
    LSR                             ; $80B242  4A           mx
L_80B243:
    AND #$02                        ; $80B243  29 02        mx
    ORA $0A8D                       ; $80B245  0D 8D 0A     mx
    BEQ L_80B25B                    ; $80B248  F0 11        mx
    CMP #$03                        ; $80B24A  C9 03        mx
    BEQ L_80B25B                    ; $80B24C  F0 0D        mx
    LDA $0CEC,Y                     ; $80B24E  B9 EC 0C     mx
    CMP #$19                        ; $80B251  C9 19        mx
    BCS L_80B258                    ; $80B253  B0 03        mx
L_80B255:
    JMP L_80B2DE                    ; $80B255  4C DE B2     mx
L_80B258:
    JMP L_80B2CA                    ; $80B258  4C CA B2     mx
L_80B25B:
    LDA $0CEC,Y                     ; $80B25B  B9 EC 0C     mx
    CMP #$19                        ; $80B25E  C9 19        mx
    BCC L_80B255                    ; $80B260  90 F3        mx
    JMP L_80B2BD                    ; $80B262  4C BD B2     mx
L_80B265:
    STZ $0A8B                       ; $80B265  9C 8B 0A     mx
    STZ $0A8F                       ; $80B268  9C 8F 0A     mx
    LDA $0CB1,X                     ; $80B26B  BD B1 0C     mx
    SEC                             ; $80B26E  38           mx
    SBC $0CA7,X                     ; $80B26F  FD A7 0C     mx
    BMI L_80B277                    ; $80B272  30 03        mx
    INC $0A8F                       ; $80B274  EE 8F 0A     mx
L_80B277:
    CMP #$01                        ; $80B277  C9 01        mx
    BEQ L_80B27F                    ; $80B279  F0 04        mx
    CMP #$F8                        ; $80B27B  C9 F8        mx
    BNE L_80B282                    ; $80B27D  D0 03        mx
L_80B27F:
    INC $0A8B                       ; $80B27F  EE 8B 0A     mx
L_80B282:
    AND #$01                        ; $80B282  29 01        mx
    BNE L_80B291                    ; $80B284  D0 0B        mx
    LDA $0CE1,X                     ; $80B286  BD E1 0C     mx
    STA $0A8E                       ; $80B289  8D 8E 0A     mx
    LDY $0CDD,X                     ; $80B28C  BC DD 0C     mx
    BRA L_80B29A                    ; $80B28F  80 09        mx
L_80B291:
    LDA $0CDD,X                     ; $80B291  BD DD 0C     mx
    STA $0A8E                       ; $80B294  8D 8E 0A     mx
    LDY $0CE1,X                     ; $80B297  BC E1 0C     mx
L_80B29A:
    LDA $0A8F                       ; $80B29A  AD 8F 0A     mx
    BNE L_80B2A8                    ; $80B29D  D0 09        mx
    LDA #$BF                        ; $80B29F  A9 BF        mx
    SEC                             ; $80B2A1  38           mx
    SBC $0A8E                       ; $80B2A2  ED 8E 0A     mx
    STA $0A8E                       ; $80B2A5  8D 8E 0A     mx
L_80B2A8:
    LDA $0A8E                       ; $80B2A8  AD 8E 0A     mx
    CMP #$50                        ; $80B2AB  C9 50        mx
    BCC L_80B2EB                    ; $80B2AD  90 3C        mx
    TYA                             ; $80B2AF  98           mx
    CMP #$50                        ; $80B2B0  C9 50        mx
    BCC L_80B2D7                    ; $80B2B2  90 23        mx
    CMP #$70                        ; $80B2B4  C9 70        mx
    BCC L_80B2DE                    ; $80B2B6  90 26        mx
    LDA $0A8B                       ; $80B2B8  AD 8B 0A     mx
    BEQ L_80B2CA                    ; $80B2BB  F0 0D        mx
L_80B2BD:
    LDA $48,X                       ; $80B2BD  B5 48        mx
    BMI L_80B2CE                    ; $80B2BF  30 0D        mx
L_80B2C1:
    STZ $0A66,X                     ; $80B2C1  9E 66 0A     mx
    LDA #$01                        ; $80B2C4  A9 01        mx
    STA $0A62,X                     ; $80B2C6  9D 62 0A     mx
    RTS                             ; $80B2C9  60           mx
L_80B2CA:
    LDA $48,X                       ; $80B2CA  B5 48        mx
    BMI L_80B2C1                    ; $80B2CC  30 F3        mx
L_80B2CE:
    LDA #$01                        ; $80B2CE  A9 01        mx
    STA $0A66,X                     ; $80B2D0  9D 66 0A     mx
    STZ $0A62,X                     ; $80B2D3  9E 62 0A     mx
    RTS                             ; $80B2D6  60           mx
L_80B2D7:
    LDA $0A8B                       ; $80B2D7  AD 8B 0A     mx
    BNE L_80B2CA                    ; $80B2DA  D0 EE        mx
    BEQ L_80B2BD                    ; $80B2DC  F0 DF        mx
L_80B2DE:
    STZ $0A62,X                     ; $80B2DE  9E 62 0A     mx
    STZ $0A66,X                     ; $80B2E1  9E 66 0A     mx
    RTS                             ; $80B2E4  60           mx
L_80B2E5:
    LDA $0A82,X                     ; $80B2E5  BD 82 0A     mx
    BNE L_80B2EB                    ; $80B2E8  D0 01        mx
    RTS                             ; $80B2EA  60           mx
L_80B2EB:
    STZ $0A82,X                     ; $80B2EB  9E 82 0A     mx
    LDA $0CA7,X                     ; $80B2EE  BD A7 0C     mx
    CMP #$80                        ; $80B2F1  C9 80        mx
    BNE L_80B2F8                    ; $80B2F3  D0 03        mx
    LDA $0CAD,X                     ; $80B2F5  BD AD 0C     mx
L_80B2F8:
    STA $0A8A                       ; $80B2F8  8D 8A 0A     mx
    TAY                             ; $80B2FB  A8           mx
    LDA $0D35,Y                     ; $80B2FC  B9 35 0D     mx
    STA $0A8D                       ; $80B2FF  8D 8D 0A     mx
    CMP #$08                        ; $80B302  C9 08        mx
    BCC L_80B2DE                    ; $80B304  90 D8        mx
    CMP #$14                        ; $80B306  C9 14        mx
    BCS L_80B2DE                    ; $80B308  B0 D4        mx
    LDA $0CB1,X                     ; $80B30A  BD B1 0C     mx
    SEC                             ; $80B30D  38           mx
    SBC $0A8A                       ; $80B30E  ED 8A 0A     mx
    CLC                             ; $80B311  18           mx
    ADC #$08                        ; $80B312  69 08        mx
    TAY                             ; $80B314  A8           mx
    LDA $B59A,Y                     ; $80B315  B9 9A B5     mx
    CLC                             ; $80B318  18           mx
    ADC $0A8D                       ; $80B319  6D 8D 0A     mx
    TAY                             ; $80B31C  A8           mx
    LDA $B562,Y                     ; $80B31D  B9 62 B5     mx
    CMP #$04                        ; $80B320  C9 04        mx
    BEQ L_80B2DE                    ; $80B322  F0 BA        mx
    CMP #$02                        ; $80B324  C9 02        mx
    BCS L_80B32B                    ; $80B326  B0 03        mx
    JMP L_80B1F3                    ; $80B328  4C F3 B1     mx
L_80B32B:
    LDY $0A8A                       ; $80B32B  AC 8A 0A     mx
    STA $0A8D                       ; $80B32E  8D 8D 0A     mx
    JSR L_80B33E                    ; $80B331  20 3E B3     mx
    BEQ L_80B2DE                    ; $80B334  F0 A8        mx
    LDA $0A8D                       ; $80B336  AD 8D 0A     mx
    AND #$01                        ; $80B339  29 01        mx
    JMP L_80B1F3                    ; $80B33B  4C F3 B1     mx
L_80B33E:
    TYA                             ; $80B33E  98           mx
    CLC                             ; $80B33F  18           mx
    ADC $B342,Y                     ; $80B340  79 42 B3     mx
    CMP $0A99,Y                     ; $80B343  D9 99 0A     mx
    BNE L_80B34B                    ; $80B346  D0 03        mx
    LDA #$01                        ; $80B348  A9 01        mx
    RTS                             ; $80B34A  60           mx
L_80B34B:
    LDA #$00                        ; $80B34B  A9 00        mx
    RTS                             ; $80B34D  60           mx
    db $08,$FF,$01,$F8,$01,$08,$F8,$FF                                 ; $80B34E
L_80B356:
    LDX #$00                        ; $80B356  A2 00        mx
    JSR L_80B4FE                    ; $80B358  20 FE B4     mx
    INX                             ; $80B35B  E8           mx
    JSR L_80B4FE                    ; $80B35C  20 FE B4     mx
    INX                             ; $80B35F  E8           mx
    JSR L_80B4FE                    ; $80B360  20 FE B4     mx
    INX                             ; $80B363  E8           mx
    JSR L_80B4FE                    ; $80B364  20 FE B4     mx
    LDX #$00                        ; $80B367  A2 00        mx
    LDY #$01                        ; $80B369  A0 01        mx
    JSR L_80B3B8                    ; $80B36B  20 B8 B3     mx
    LDX #$00                        ; $80B36E  A2 00        mx
    LDY #$02                        ; $80B370  A0 02        mx
    JSR L_80B3B8                    ; $80B372  20 B8 B3     mx
    LDX #$00                        ; $80B375  A2 00        mx
    LDY #$03                        ; $80B377  A0 03        mx
    JSR L_80B3B8                    ; $80B379  20 B8 B3     mx
    LDX #$01                        ; $80B37C  A2 01        mx
    LDY #$00                        ; $80B37E  A0 00        mx
    JSR L_80B3B8                    ; $80B380  20 B8 B3     mx
    LDX #$01                        ; $80B383  A2 01        mx
    LDY #$02                        ; $80B385  A0 02        mx
    JSR L_80B3B8                    ; $80B387  20 B8 B3     mx
    LDX #$01                        ; $80B38A  A2 01        mx
    LDY #$03                        ; $80B38C  A0 03        mx
    JSR L_80B3B8                    ; $80B38E  20 B8 B3     mx
    LDX #$02                        ; $80B391  A2 02        mx
    LDY #$00                        ; $80B393  A0 00        mx
    JSR L_80B3B8                    ; $80B395  20 B8 B3     mx
    LDX #$02                        ; $80B398  A2 02        mx
    LDY #$01                        ; $80B39A  A0 01        mx
    JSR L_80B3B8                    ; $80B39C  20 B8 B3     mx
    LDX #$02                        ; $80B39F  A2 02        mx
    LDY #$03                        ; $80B3A1  A0 03        mx
    JSR L_80B3B8                    ; $80B3A3  20 B8 B3     mx
    LDX #$03                        ; $80B3A6  A2 03        mx
    LDY #$00                        ; $80B3A8  A0 00        mx
    JSR L_80B3B8                    ; $80B3AA  20 B8 B3     mx
    LDX #$03                        ; $80B3AD  A2 03        mx
    LDY #$01                        ; $80B3AF  A0 01        mx
    JSR L_80B3B8                    ; $80B3B1  20 B8 B3     mx
    LDX #$03                        ; $80B3B4  A2 03        mx
    LDY #$02                        ; $80B3B6  A0 02        mx
L_80B3B8:
    LDA $0E25,X                     ; $80B3B8  BD 25 0E     mx
    BEQ L_80B3CC                    ; $80B3BB  F0 0F        mx
    LDA $0EDF,X                     ; $80B3BD  BD DF 0E     mx
    BEQ L_80B3CC                    ; $80B3C0  F0 0A        mx
    LDA $0EF1,Y                     ; $80B3C2  B9 F1 0E     mx
    BEQ L_80B3CC                    ; $80B3C5  F0 05        mx
    LDA $0EDF,Y                     ; $80B3C7  B9 DF 0E     mx
    BNE L_80B3CD                    ; $80B3CA  D0 01        mx
L_80B3CC:
    RTS                             ; $80B3CC  60           mx
L_80B3CD:
    LDA $0C35,X                     ; $80B3CD  BD 35 0C     mx
    CMP #$15                        ; $80B3D0  C9 15        mx
    BCS L_80B3CC                    ; $80B3D2  B0 F8        mx
    LDA $0C35,Y                     ; $80B3D4  B9 35 0C     mx
    CMP #$15                        ; $80B3D7  C9 15        mx
    BCS L_80B3CC                    ; $80B3D9  B0 F1        mx
    LDA $0CE1,Y                     ; $80B3DB  B9 E1 0C     mx
    STA $0A91                       ; $80B3DE  8D 91 0A     mx
    LDA $0CE1,X                     ; $80B3E1  BD E1 0C     mx
    STA $0A92                       ; $80B3E4  8D 92 0A     mx
    LDA $0CA7,X                     ; $80B3E7  BD A7 0C     mx
    SEC                             ; $80B3EA  38           mx
    SBC $0CB1,X                     ; $80B3EB  FD B1 0C     mx
    STA $0A94                       ; $80B3EE  8D 94 0A     mx
    AND #$01                        ; $80B3F1  29 01        mx
    BNE L_80B401                    ; $80B3F3  D0 0C        mx
    LDA $0CDD,Y                     ; $80B3F5  B9 DD 0C     mx
    STA $0A91                       ; $80B3F8  8D 91 0A     mx
    LDA $0CDD,X                     ; $80B3FB  BD DD 0C     mx
    STA $0A92                       ; $80B3FE  8D 92 0A     mx
L_80B401:
    LDA $0A4F,Y                     ; $80B401  B9 4F 0A     mx
    LSR                             ; $80B404  4A           mx
    CLC                             ; $80B405  18           mx
    ADC #$04                        ; $80B406  69 04        mx
    AND #$08                        ; $80B408  29 08        mx
    STA $0A86                       ; $80B40A  8D 86 0A     mx
    LDA $0A4F,X                     ; $80B40D  BD 4F 0A     mx
    LSR                             ; $80B410  4A           mx
    CLC                             ; $80B411  18           mx
    ADC #$04                        ; $80B412  69 04        mx
    AND #$08                        ; $80B414  29 08        mx
    STA $0A87                       ; $80B416  8D 87 0A     mx
    BEQ L_80B42D                    ; $80B419  F0 12        mx
    LDA #$C0                        ; $80B41B  A9 C0        mx
    SEC                             ; $80B41D  38           mx
    SBC $0A91                       ; $80B41E  ED 91 0A     mx
    STA $0A91                       ; $80B421  8D 91 0A     mx
    LDA #$C0                        ; $80B424  A9 C0        mx
    SEC                             ; $80B426  38           mx
    SBC $0A92                       ; $80B427  ED 92 0A     mx
    STA $0A92                       ; $80B42A  8D 92 0A     mx
L_80B42D:
    LDA $0CB1,Y                     ; $80B42D  B9 B1 0C     mx
    SEC                             ; $80B430  38           mx
    SBC $0CB1,X                     ; $80B431  FD B1 0C     mx
    STA $0A93                       ; $80B434  8D 93 0A     mx
    LDA $0C35,Y                     ; $80B437  B9 35 0C     mx
    CMP #$14                        ; $80B43A  C9 14        mx
    BCS L_80B442                    ; $80B43C  B0 04        mx
    CMP #$08                        ; $80B43E  C9 08        mx
    BCS L_80B463                    ; $80B440  B0 21        mx
L_80B442:
    STZ $0A90                       ; $80B442  9C 90 0A     mx
    LDA $0A94                       ; $80B445  AD 94 0A     mx
    AND #$01                        ; $80B448  29 01        mx
    BNE L_80B464                    ; $80B44A  D0 18        mx
    LDA $0A93                       ; $80B44C  AD 93 0A     mx
    BEQ L_80B459                    ; $80B44F  F0 08        mx
    CMP #$08                        ; $80B451  C9 08        mx
    BEQ L_80B459                    ; $80B453  F0 04        mx
    CMP #$F8                        ; $80B455  C9 F8        mx
    BNE L_80B463                    ; $80B457  D0 0A        mx
L_80B459:
    LDA $0CE1,Y                     ; $80B459  B9 E1 0C     mx
    SEC                             ; $80B45C  38           mx
    SBC $0CE1,X                     ; $80B45D  FD E1 0C     mx
    JMP L_80B478                    ; $80B460  4C 78 B4     mx
L_80B463:
    RTS                             ; $80B463  60           mx
L_80B464:
    LDA $0A93                       ; $80B464  AD 93 0A     mx
    BEQ L_80B471                    ; $80B467  F0 08        mx
    CMP #$01                        ; $80B469  C9 01        mx
    BEQ L_80B471                    ; $80B46B  F0 04        mx
    CMP #$FF                        ; $80B46D  C9 FF        mx
    BNE L_80B463                    ; $80B46F  D0 F2        mx
L_80B471:
    LDA $0CDD,X                     ; $80B471  BD DD 0C     mx
    SEC                             ; $80B474  38           mx
    SBC $0CDD,Y                     ; $80B475  F9 DD 0C     mx
L_80B478:
    LDA $0A93                       ; $80B478  AD 93 0A     mx
    BNE L_80B485                    ; $80B47B  D0 08        mx
    LDA #$00                        ; $80B47D  A9 00        mx
    ROL                             ; $80B47F  2A           mx
    STA $0A90                       ; $80B480  8D 90 0A     mx
    BPL L_80B495                    ; $80B483  10 10        mx
L_80B485:
    LDA $0A93                       ; $80B485  AD 93 0A     mx
    CMP #$01                        ; $80B488  C9 01        mx
    BEQ L_80B495                    ; $80B48A  F0 09        mx
    CMP #$F8                        ; $80B48C  C9 F8        mx
    BEQ L_80B495                    ; $80B48E  F0 05        mx
    LDA #$01                        ; $80B490  A9 01        mx
    STA $0A90                       ; $80B492  8D 90 0A     mx
L_80B495:
    LDA $0A87                       ; $80B495  AD 87 0A     mx
    CLC                             ; $80B498  18           mx
    ADC $0A86                       ; $80B499  6D 86 0A     mx
    CMP #$08                        ; $80B49C  C9 08        mx
    BEQ L_80B463                    ; $80B49E  F0 C3        mx
    CMP #$00                        ; $80B4A0  C9 00        mx
    BEQ L_80B4AC                    ; $80B4A2  F0 08        mx
    LDA $0A90                       ; $80B4A4  AD 90 0A     mx
    EOR #$01                        ; $80B4A7  49 01        mx
    STA $0A90                       ; $80B4A9  8D 90 0A     mx
L_80B4AC:
    LDA $0A90                       ; $80B4AC  AD 90 0A     mx
    BEQ L_80B4CD                    ; $80B4AF  F0 1C        mx
    LDA $0A91                       ; $80B4B1  AD 91 0A     mx
    SEC                             ; $80B4B4  38           mx
    SBC $0A92                       ; $80B4B5  ED 92 0A     mx
    BMI L_80B4C8                    ; $80B4B8  30 0E        mx
    CMP #$0A                        ; $80B4BA  C9 0A        mx
    BCS L_80B4CC                    ; $80B4BC  B0 0E        mx
L_80B4BE:
    JSR L_80DC26                    ; $80B4BE  20 26 DC     mx
    AND #$0F                        ; $80B4C1  29 0F        mx
    BNE L_80B4CC                    ; $80B4C3  D0 07        mx
    JMP L_80B0BE                    ; $80B4C5  4C BE B0     mx
L_80B4C8:
    CMP #$F5                        ; $80B4C8  C9 F5        mx
    BCS L_80B4BE                    ; $80B4CA  B0 F2        mx
L_80B4CC:
    RTS                             ; $80B4CC  60           mx
L_80B4CD:
    LDA $0C4D,Y                     ; $80B4CD  B9 4D 0C     mx
    BNE L_80B4EF                    ; $80B4D0  D0 1D        mx
    LDA $0C7A,X                     ; $80B4D2  BD 7A 0C     mx
    CMP #$04                        ; $80B4D5  C9 04        mx
    BEQ L_80B4E5                    ; $80B4D7  F0 0C        mx
    CMP #$0C                        ; $80B4D9  C9 0C        mx
    BEQ L_80B4E5                    ; $80B4DB  F0 08        mx
    CMP #$14                        ; $80B4DD  C9 14        mx
    BEQ L_80B4E5                    ; $80B4DF  F0 04        mx
    CMP #$1C                        ; $80B4E1  C9 1C        mx
    BNE L_80B4EF                    ; $80B4E3  D0 0A        mx
L_80B4E5:
    JSR L_80DC26                    ; $80B4E5  20 26 DC     mx
    AND #$0F                        ; $80B4E8  29 0F        mx
    BNE L_80B4EF                    ; $80B4EA  D0 03        mx
    JMP L_80B0B1                    ; $80B4EC  4C B1 B0     mx
L_80B4EF:
    LDA $0E3B,X                     ; $80B4EF  BD 3B 0E     mx
    BEQ L_80B4CC                    ; $80B4F2  F0 D8        mx
    JSR L_80DC26                    ; $80B4F4  20 26 DC     mx
    AND #$03                        ; $80B4F7  29 03        mx
    BNE L_80B4CC                    ; $80B4F9  D0 D1        mx
    LDA #$01                        ; $80B4FB  A9 01        mx
    RTS                             ; $80B4FD  60           mx
L_80B4FE:
    LDA $0E25,X                     ; $80B4FE  BD 25 0E     mx
    BEQ L_80B559                    ; $80B501  F0 56        mx
    LDA $0E3B,X                     ; $80B503  BD 3B 0E     mx
    BNE L_80B559                    ; $80B506  D0 51        mx
    LDA $0EA9,X                     ; $80B508  BD A9 0E     mx
    BEQ L_80B559                    ; $80B50B  F0 4C        mx
    LDA $0C35,X                     ; $80B50D  BD 35 0C     mx
    JSR L_80B55A                    ; $80B510  20 5A B5     mx
    BCC L_80B559                    ; $80B513  90 44        mx
    REP #$30                        ; $80B515  C2 30        mx
    LDA $0CA7,X                     ; $80B517  BD A7 0C     MX
    AND #$00FF                      ; $80B51A  29 FF 00     MX
    ASL                             ; $80B51D  0A           MX
    ASL                             ; $80B51E  0A           MX
    ASL                             ; $80B51F  0A           MX
    ASL                             ; $80B520  0A           MX
    TAY                             ; $80B521  A8           MX
    LDA $1B00,Y                     ; $80B522  B9 00 1B     MX
    SEP #$30                        ; $80B525  E2 30        MX
    JSR L_80B55A                    ; $80B527  20 5A B5     mx
    BCC L_80B559                    ; $80B52A  90 2D        mx
    LDA $0CA7,X                     ; $80B52C  BD A7 0C     mx
    SEC                             ; $80B52F  38           mx
    SBC $0C31,X                     ; $80B530  FD 31 0C     mx
    CLC                             ; $80B533  18           mx
    ADC $0CA7,X                     ; $80B534  7D A7 0C     mx
    REP #$30                        ; $80B537  C2 30        mx
    AND #$00FF                      ; $80B539  29 FF 00     MX
    ASL                             ; $80B53C  0A           MX
    ASL                             ; $80B53D  0A           MX
    ASL                             ; $80B53E  0A           MX
    ASL                             ; $80B53F  0A           MX
    TAY                             ; $80B540  A8           MX
    LDA $1B00,Y                     ; $80B541  B9 00 1B     MX
    SEP #$30                        ; $80B544  E2 30        MX
    JSR L_80B55A                    ; $80B546  20 5A B5     mx
    BCC L_80B559                    ; $80B549  90 0E        mx
    JSR L_80DC26                    ; $80B54B  20 26 DC     mx
    AND #$03                        ; $80B54E  29 03        mx
    CMP #$03                        ; $80B550  C9 03        mx
    BNE L_80B559                    ; $80B552  D0 05        mx
    LDA #$01                        ; $80B554  A9 01        mx
    STA $0EC9,X                     ; $80B556  9D C9 0E     mx
L_80B559:
    RTS                             ; $80B559  60           mx
L_80B55A:
    CMP #$08                        ; $80B55A  C9 08        mx
    BCC L_80B568                    ; $80B55C  90 0A        mx
    CMP #$17                        ; $80B55E  C9 17        mx
    BEQ L_80B566                    ; $80B560  F0 04        mx
    CMP #$14                        ; $80B562  C9 14        mx
    BCS L_80B568                    ; $80B564  B0 02        mx
L_80B566:
    CLC                             ; $80B566  18           mx
    RTS                             ; $80B567  60           mx
L_80B568:
    SEC                             ; $80B568  38           mx
    RTS                             ; $80B569  60           mx
    db $00,$01,$01,$01,$00,$02,$04,$01,$03,$01,$01,$04,$01,$00,$01,$01 ; $80B56A
    db $01,$04,$02,$00,$04,$01,$01,$03,$01,$01,$00,$01,$04,$01,$01,$03 ; $80B57A
    db $00,$02,$04,$01,$01,$01,$01,$00,$03,$01,$01,$04,$01,$04,$02,$00 ; $80B58A
    db $0C,$00,$00,$00,$00,$00,$00,$24,$00,$18,$00,$00,$00,$00,$00,$00 ; $80B59A
    db $00,$01,$00,$00,$01,$01,$00,$00,$01,$A0,$78,$50,$28,$00,$00,$00 ; $80B5AA
    db $00,$01,$01,$01,$02,$02,$02,$03,$03,$03,$04,$04,$04,$05,$05,$05 ; $80B5BA
    db $06,$06,$06,$07,$07,$07,$00,$80,$3C,$00,$00,$81,$05,$00,$00,$80 ; $80B5CA
    db $A0,$00,$00,$00,$60,$EA                                         ; $80B5DA
L_80B5E0:
    LDA $0EDF,X                     ; $80B5E0  BD DF 0E     mx
    BEQ L_80B65C                    ; $80B5E3  F0 77        mx
    LDA $0C82,X                     ; $80B5E5  BD 82 0C     mx
    BNE L_80B65C                    ; $80B5E8  D0 72        mx
    LDA $0BE1                       ; $80B5EA  AD E1 0B     mx
    BEQ L_80B65C                    ; $80B5ED  F0 6D        mx
    STX $0BD0                       ; $80B5EF  8E D0 0B     mx
    JSR L_80B695                    ; $80B5F2  20 95 B6     mx
    JSR L_80B70C                    ; $80B5F5  20 0C B7     mx
    JSR L_80B767                    ; $80B5F8  20 67 B7     mx
    LDX $0BD0                       ; $80B5FB  AE D0 0B     mx
    LDA $0C55                       ; $80B5FE  AD 55 0C     mx
    CMP #$0F                        ; $80B601  C9 0F        mx
    BNE L_80B657                    ; $80B603  D0 52        mx
    LDA $0C35,X                     ; $80B605  BD 35 0C     mx
    CMP #$15                        ; $80B608  C9 15        mx
    BEQ L_80B61F                    ; $80B60A  F0 13        mx
    CMP #$16                        ; $80B60C  C9 16        mx
    BEQ L_80B612                    ; $80B60E  F0 02        mx
    BRA L_80B657                    ; $80B610  80 45        mx
L_80B612:
    LDA $0CE1,X                     ; $80B612  BD E1 0C     mx
    CMP #$29                        ; $80B615  C9 29        mx
    BCC L_80B657                    ; $80B617  90 3E        mx
    CMP #$61                        ; $80B619  C9 61        mx
    BCS L_80B657                    ; $80B61B  B0 3A        mx
    BRA L_80B62A                    ; $80B61D  80 0B        mx
L_80B61F:
    LDA $0CDD,X                     ; $80B61F  BD DD 0C     mx
    CMP #$4F                        ; $80B622  C9 4F        mx
    BCC L_80B657                    ; $80B624  90 31        mx
    CMP #$87                        ; $80B626  C9 87        mx
    BCS L_80B657                    ; $80B628  B0 2D        mx
L_80B62A:
    STZ $0C55                       ; $80B62A  9C 55 0C     mx
    JSL L_81C585                    ; $80B62D  22 85 C5 81  mx
    LDA $0BE1                       ; $80B631  AD E1 0B     mx
    DEC                             ; $80B634  3A           mx
    STA $0BE1                       ; $80B635  8D E1 0B     mx
    CMP #$01                        ; $80B638  C9 01        mx
    BNE L_80B64E                    ; $80B63A  D0 12        mx
    LDA #$24                        ; $80B63C  A9 24        mx
    JSR L_80F9AD                    ; $80B63E  20 AD F9     mx
    REP #$30                        ; $80B641  C2 30        mx
    PHX                             ; $80B643  DA           MX
    LDA #$009E                      ; $80B644  A9 9E 00     MX
    JSL L_81DE31                    ; $80B647  22 31 DE 81  MX
    PLX                             ; $80B64B  FA           MX
    SEP #$30                        ; $80B64C  E2 30        MX
L_80B64E:
    STZ $0C05,X                     ; $80B64E  9E 05 0C     mx
    INC $0C41,X                     ; $80B651  FE 41 0C     mx
    STZ $0C45,X                     ; $80B654  9E 45 0C     mx
L_80B657:
    LDA $0E25,X                     ; $80B657  BD 25 0E     mx
    BNE L_80B65D                    ; $80B65A  D0 01        mx
L_80B65C:
    RTS                             ; $80B65C  60           mx
L_80B65D:
    LDA $0BE4                       ; $80B65D  AD E4 0B     mx
    CMP $0B9F                       ; $80B660  CD 9F 0B     mx
    BEQ L_80B668                    ; $80B663  F0 03        mx
    STA $0BE5                       ; $80B665  8D E5 0B     mx
L_80B668:
    LDA $0B9F                       ; $80B668  AD 9F 0B     mx
    STA $0BE4                       ; $80B66B  8D E4 0B     mx
    LDA $0B9E                       ; $80B66E  AD 9E 0B     mx
    CMP #$14                        ; $80B671  C9 14        mx
    BEQ L_80B684                    ; $80B673  F0 0F        mx
    LDX $0B9F                       ; $80B675  AE 9F 0B     mx
    LDA $0A99,X                     ; $80B678  BD 99 0A     mx
    STA $0BE2                       ; $80B67B  8D E2 0B     mx
    LDA #$80                        ; $80B67E  A9 80        mx
    STA $0BE3                       ; $80B680  8D E3 0B     mx
    RTS                             ; $80B683  60           mx
L_80B684:
    LDA $0B9F                       ; $80B684  AD 9F 0B     mx
    ASL                             ; $80B687  0A           mx
    SEC                             ; $80B688  38           mx
    SBC $0BE5                       ; $80B689  ED E5 0B     mx
    STA $0BE2                       ; $80B68C  8D E2 0B     mx
    LDA #$80                        ; $80B68F  A9 80        mx
    STA $0BE3                       ; $80B691  8D E3 0B     mx
    RTS                             ; $80B694  60           mx
L_80B695:
    LDA $0E25,X                     ; $80B695  BD 25 0E     mx
    BNE L_80B70B                    ; $80B698  D0 71        mx
    LDA $0EF5,X                     ; $80B69A  BD F5 0E     mx
    BNE L_80B70B                    ; $80B69D  D0 6C        mx
    LDA $0C41,X                     ; $80B69F  BD 41 0C     mx
    SEC                             ; $80B6A2  38           mx
    SBC $0C41                       ; $80B6A3  ED 41 0C     mx
    BMI L_80B6AE                    ; $80B6A6  30 06        mx
    CMP #$10                        ; $80B6A8  C9 10        mx
    BCC L_80B6AE                    ; $80B6AA  90 02        mx
    BRA L_80B6D9                    ; $80B6AC  80 2B        mx
L_80B6AE:
    LDA $0C41,X                     ; $80B6AE  BD 41 0C     mx
    SEC                             ; $80B6B1  38           mx
    SBC $0C42                       ; $80B6B2  ED 42 0C     mx
    BMI L_80B6BD                    ; $80B6B5  30 06        mx
    CMP #$10                        ; $80B6B7  C9 10        mx
    BCC L_80B6BD                    ; $80B6B9  90 02        mx
    BRA L_80B6D9                    ; $80B6BB  80 1C        mx
L_80B6BD:
    LDA $0C41,X                     ; $80B6BD  BD 41 0C     mx
    SEC                             ; $80B6C0  38           mx
    SBC $0C43                       ; $80B6C1  ED 43 0C     mx
    BMI L_80B6CC                    ; $80B6C4  30 06        mx
    CMP #$10                        ; $80B6C6  C9 10        mx
    BCC L_80B6CC                    ; $80B6C8  90 02        mx
    BRA L_80B6D9                    ; $80B6CA  80 0D        mx
L_80B6CC:
    LDA $0C41,X                     ; $80B6CC  BD 41 0C     mx
    SEC                             ; $80B6CF  38           mx
    SBC $0C44                       ; $80B6D0  ED 44 0C     mx
    BMI L_80B70B                    ; $80B6D3  30 36        mx
    CMP #$10                        ; $80B6D5  C9 10        mx
    BCC L_80B70B                    ; $80B6D7  90 32        mx
L_80B6D9:
    INC $0EF5,X                     ; $80B6D9  FE F5 0E     mx
    REP #$30                        ; $80B6DC  C2 30        mx
    CPX #$0002                      ; $80B6DE  E0 02 00     MX
    BCS L_80B6EC                    ; $80B6E1  B0 09        MX
    PHX                             ; $80B6E3  DA           MX
    LDA #$009D                      ; $80B6E4  A9 9D 00     MX
    JSL L_81DE31                    ; $80B6E7  22 31 DE 81  MX
    PLX                             ; $80B6EB  FA           MX
L_80B6EC:
    SEP #$30                        ; $80B6EC  E2 30        MX
    TXA                             ; $80B6EE  8A           mx
    ASL                             ; $80B6EF  0A           mx
    ASL                             ; $80B6F0  0A           mx
    TAX                             ; $80B6F1  AA           mx
    REP #$20                        ; $80B6F2  C2 20        mx
    SED                             ; $80B6F4  F8           Mx
    LDA $0E06,X                     ; $80B6F5  BD 06 0E     Mx
    CLC                             ; $80B6F8  18           Mx
    ADC #$5000                      ; $80B6F9  69 00 50     Mx
    STA $0E06,X                     ; $80B6FC  9D 06 0E     Mx
    LDA $0E08,X                     ; $80B6FF  BD 08 0E     Mx
    ADC #$0000                      ; $80B702  69 00 00     Mx
    STA $0E08,X                     ; $80B705  9D 08 0E     Mx
    CLD                             ; $80B708  D8           Mx
    SEP #$20                        ; $80B709  E2 20        Mx
L_80B70B:
    RTS                             ; $80B70B  60           mx
L_80B70C:
    LDX $0BD0                       ; $80B70C  AE D0 0B     mx
    LDA $0C7E,X                     ; $80B70F  BD 7E 0C     mx
    BNE L_80B75A                    ; $80B712  D0 46        mx
    LDA $0B9E                       ; $80B714  AD 9E 0B     mx
    CMP #$0C                        ; $80B717  C9 0C        mx
    BCC L_80B723                    ; $80B719  90 08        mx
    CMP #$15                        ; $80B71B  C9 15        mx
    BEQ L_80B723                    ; $80B71D  F0 04        mx
    CMP #$16                        ; $80B71F  C9 16        mx
    BNE L_80B75A                    ; $80B721  D0 37        mx
L_80B723:
    REP #$30                        ; $80B723  C2 30        mx
    LDA $0B9F                       ; $80B725  AD 9F 0B     MX
    AND #$00FF                      ; $80B728  29 FF 00     MX
    ASL                             ; $80B72B  0A           MX
    ASL                             ; $80B72C  0A           MX
    ASL                             ; $80B72D  0A           MX
    ASL                             ; $80B72E  0A           MX
    TAX                             ; $80B72F  AA           MX
    LDA $1B0D,X                     ; $80B730  BD 0D 1B     MX
    SEP #$30                        ; $80B733  E2 30        MX
    BNE L_80B75A                    ; $80B735  D0 23        mx
    LDX $0BD0                       ; $80B737  AE D0 0B     mx
    LDY $A024,X                     ; $80B73A  BC 24 A0     mx
    LDA $0B9F                       ; $80B73D  AD 9F 0B     mx
    ASL                             ; $80B740  0A           mx
    TAX                             ; $80B741  AA           mx
    REP #$20                        ; $80B742  C2 20        mx
    LDA $B7B0,X                     ; $80B744  BD B0 B7     Mx
    STA $0C5B,Y                     ; $80B747  99 5B 0C     Mx
    LDA $B830,X                     ; $80B74A  BD 30 B8     Mx
    STA $0C67,Y                     ; $80B74D  99 67 0C     Mx
    SEP #$20                        ; $80B750  E2 20        Mx
    LDA #$00                        ; $80B752  A9 00        mx
    STA $0C5A,Y                     ; $80B754  99 5A 0C     mx
    STA $0C66,Y                     ; $80B757  99 66 0C     mx
L_80B75A:
    LDX $0BD0                       ; $80B75A  AE D0 0B     mx
    LDA $0C45,X                     ; $80B75D  BD 45 0C     mx
    BMI L_80B766                    ; $80B760  30 04        mx
    INC                             ; $80B762  1A           mx
    STA $0C45,X                     ; $80B763  9D 45 0C     mx
L_80B766:
    RTS                             ; $80B766  60           mx
L_80B767:
    LDY $0C55                       ; $80B767  AC 55 0C     mx
    CPY #$0F                        ; $80B76A  C0 0F        mx
    BEQ L_80B79D                    ; $80B76C  F0 2F        mx
    LDA $0DB5,Y                     ; $80B76E  B9 B5 0D     mx
    CMP #$FF                        ; $80B771  C9 FF        mx
    BNE L_80B77B                    ; $80B773  D0 06        mx
L_80B775:
    LDY #$0F                        ; $80B775  A0 0F        mx
    STY $0C55                       ; $80B777  8C 55 0C     mx
    RTS                             ; $80B77A  60           mx
L_80B77B:
    CMP $0B9F                       ; $80B77B  CD 9F 0B     mx
    BEQ L_80B790                    ; $80B77E  F0 10        mx
    LDA $0DB6,Y                     ; $80B780  B9 B6 0D     mx
    CMP #$FF                        ; $80B783  C9 FF        mx
    BEQ L_80B775                    ; $80B785  F0 EE        mx
    CMP $0B9F                       ; $80B787  CD 9F 0B     mx
    BNE L_80B79D                    ; $80B78A  D0 11        mx
    INC $0C41,X                     ; $80B78C  FE 41 0C     mx
    INY                             ; $80B78F  C8           mx
L_80B790:
    INC $0C41,X                     ; $80B790  FE 41 0C     mx
    INY                             ; $80B793  C8           mx
    STZ $0C45,X                     ; $80B794  9E 45 0C     mx
    STY $0C55                       ; $80B797  8C 55 0C     mx
    JSR L_80B79E                    ; $80B79A  20 9E B7     mx
L_80B79D:
    RTS                             ; $80B79D  60           mx
L_80B79E:
    LDA $0C55                       ; $80B79E  AD 55 0C     mx
    CMP #$02                        ; $80B7A1  C9 02        mx
    BCC L_80B7AB                    ; $80B7A3  90 06        mx
    DEC                             ; $80B7A5  3A           mx
    DEC                             ; $80B7A6  3A           mx
    STA $0C3D,X                     ; $80B7A7  9D 3D 0C     mx
    RTS                             ; $80B7AA  60           mx
L_80B7AB:
    JSL L_81C585                    ; $80B7AB  22 85 C5 81  mx
    RTS                             ; $80B7AF  60           mx
    db $09,$02,$69,$02,$C9,$02,$29,$03,$89,$03,$E9,$03,$39,$04,$99,$04 ; $80B7B0
    db $A9,$01,$09,$02,$69,$02,$C9,$02,$29,$03,$89,$03,$E9,$03,$39,$04 ; $80B7C0
    db $49,$01,$A9,$01,$09,$02,$69,$02,$C9,$02,$29,$03,$89,$03,$E9,$03 ; $80B7D0
    db $E9,$00,$49,$01,$A9,$01,$09,$02,$69,$02,$C9,$02,$29,$03,$89,$03 ; $80B7E0
    db $89,$00,$E9,$00,$49,$01,$A9,$01,$09,$02,$69,$02,$C9,$02,$29,$03 ; $80B7F0
    db $29,$00,$89,$00,$E9,$00,$49,$01,$A9,$01,$09,$02,$69,$02,$C9,$02 ; $80B800
    db $C9,$FF,$29,$00,$89,$00,$E9,$00,$49,$01,$A9,$01,$09,$02,$69,$02 ; $80B810
    db $69,$FF,$C9,$FF,$29,$00,$89,$00,$E9,$00,$49,$01,$A9,$01,$09,$02 ; $80B820
    db $FC,$FE,$2C,$FF,$5C,$FF,$8C,$FF,$BC,$FF,$EC,$FF,$1C,$00,$4C,$00 ; $80B830
    db $2C,$FF,$5C,$FF,$8C,$FF,$BC,$FF,$EC,$FF,$1C,$00,$4C,$00,$7C,$00 ; $80B840
    db $5C,$FF,$8C,$FF,$BC,$FF,$EC,$FF,$1C,$00,$4C,$00,$7C,$00,$AC,$00 ; $80B850
    db $8C,$FF,$BC,$FF,$EC,$FF,$1C,$00,$4C,$00,$7C,$00,$AC,$00,$DC,$00 ; $80B860
    db $BC,$FF,$EC,$FF,$1C,$00,$4C,$00,$7C,$00,$AC,$00,$DC,$00,$0C,$01 ; $80B870
    db $EC,$FF,$1C,$00,$4C,$00,$7C,$00,$AC,$00,$DC,$00,$0C,$01,$3C,$01 ; $80B880
    db $1C,$00,$4C,$00,$7C,$00,$AC,$00,$DC,$00,$0C,$01,$3C,$01,$6C,$01 ; $80B890
    db $4C,$00,$7C,$00,$AC,$00,$DC,$00,$0C,$01,$3C,$01,$6C,$01,$9C,$01 ; $80B8A0
    db $02,$00,$00,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$00,$00 ; $80B8B0
    db $06,$FF,$80,$00,$00,$01,$80,$00,$00,$00,$00,$F8,$80,$00,$00,$08 ; $80B8C0
    db $80,$FF,$80,$00,$00,$01,$80,$00,$00,$00,$00,$F8,$80,$00,$00,$08 ; $80B8D0
    db $80,$F8,$80,$00,$00,$00,$00,$01,$80,$00,$00,$FF,$80,$08,$80,$00 ; $80B8E0
    db $00,$00,$00,$00,$00,$F8,$80,$FF,$80,$08,$80,$01,$80,$00,$00,$00 ; $80B8F0
    db $00,$FF,$F8,$00,$00,$01,$80,$80,$01,$80,$F8,$F8,$80,$00,$00,$08 ; $80B900
    db $01,$00,$00,$F8,$FF,$80,$08,$08,$80,$FF,$80,$80,$FF,$01,$08,$00 ; $80B910
    db $00,$00,$00,$F8,$80,$80,$F8,$08,$FF,$FF,$80,$00,$00,$01,$F8,$80 ; $80B920
    db $FF,$FF,$08,$80,$01,$01,$80,$00,$00,$80,$08,$F8,$01,$00,$00,$08 ; $80B930
    db $80,$FF,$80,$F8,$80,$01,$80,$08,$80,$FF,$80,$00,$00,$01,$80,$00 ; $80B940
    db $00,$00,$00,$F8,$80,$00,$00,$08,$80,$FF,$80,$F8,$80,$01,$80,$08 ; $80B950
    db $80                                                             ; $80B960
L_80B961:
    PHB                             ; $80B961  8B           mx
    PHK                             ; $80B962  4B           mx
    PLB                             ; $80B963  AB           mx
    JSR L_80B969                    ; $80B964  20 69 B9     mx
    PLB                             ; $80B967  AB           mx
    RTL                             ; $80B968  6B           mx
L_80B969:
    LDA #$00                        ; $80B969  A9 00        mx
    STA $035B                       ; $80B96B  8D 5B 03     mx
    LDA #$3C                        ; $80B96E  A9 3C        mx
    STA $035C                       ; $80B970  8D 5C 03     mx
    REP #$30                        ; $80B973  C2 30        mx
    TSX                             ; $80B975  BA           MX
    STX $035D                       ; $80B976  8E 5D 03     MX
    SEP #$30                        ; $80B979  E2 30        MX
    JSR L_80C6EC                    ; $80B97B  20 EC C6     mx
    JSR L_80C2AF                    ; $80B97E  20 AF C2     mx
    JSR L_80C70C                    ; $80B981  20 0C C7     mx
    JSR L_80C197                    ; $80B984  20 97 C1     mx
    JSR L_80CB53                    ; $80B987  20 53 CB     mx
    JSR L_80CD68                    ; $80B98A  20 68 CD     mx
    JSR L_80C1F2                    ; $80B98D  20 F2 C1     mx
    JSR L_80CD60                    ; $80B990  20 60 CD     mx
    JSR L_80887D                    ; $80B993  20 7D 88     mx
    JSR L_80C9C0                    ; $80B996  20 C0 C9     mx
    JSR L_80DCBF                    ; $80B999  20 BF DC     mx
    LDA #$01                        ; $80B99C  A9 01        mx
    JSL L_818000                    ; $80B99E  22 00 80 81  mx
    LDA $0F0E                       ; $80B9A2  AD 0E 0F     mx
    BEQ L_80B9B5                    ; $80B9A5  F0 0E        mx
    LDA #$01                        ; $80B9A7  A9 01        mx
    STA $0EF1                       ; $80B9A9  8D F1 0E     mx
    STA $0EF2                       ; $80B9AC  8D F2 0E     mx
    STA $0EF3                       ; $80B9AF  8D F3 0E     mx
    STA $0EF4                       ; $80B9B2  8D F4 0E     mx
L_80B9B5:
    LDA $0255                       ; $80B9B5  AD 55 02     mx
    BNE L_80B9C1                    ; $80B9B8  D0 07        mx
    LDA #$0F                        ; $80B9BA  A9 0F        mx
    JSR L_80C364                    ; $80B9BC  20 64 C3     mx
    BRA L_80B9C9                    ; $80B9BF  80 08        mx
L_80B9C1:
    JSL L_92F151                    ; $80B9C1  22 51 F1 92  mx
    JSL L_92F267                    ; $80B9C5  22 67 F2 92  mx
L_80B9C9:
    JSR L_80CE10                    ; $80B9C9  20 10 CE     mx
    JSR L_80D420                    ; $80B9CC  20 20 D4     mx
    JSR L_80C039                    ; $80B9CF  20 39 C0     mx
    JSR L_80D420                    ; $80B9D2  20 20 D4     mx
    JSR L_80CB97                    ; $80B9D5  20 97 CB     mx
    JSR L_80C039                    ; $80B9D8  20 39 C0     mx
    JSR L_80AF4C                    ; $80B9DB  20 4C AF     mx
    JSR L_808AD5                    ; $80B9DE  20 D5 8A     mx
    JSR L_80912C                    ; $80B9E1  20 2C 91     mx
    JSR L_80E3B9                    ; $80B9E4  20 B9 E3     mx
    JSR L_808BCF                    ; $80B9E7  20 CF 8B     mx
    JSR L_80D420                    ; $80B9EA  20 20 D4     mx
    JSR L_80CE7F                    ; $80B9ED  20 7F CE     mx
    JSR L_80C039                    ; $80B9F0  20 39 C0     mx
    JSR L_80D420                    ; $80B9F3  20 20 D4     mx
    JSR L_80C2FC                    ; $80B9F6  20 FC C2     mx
    JSR L_80C039                    ; $80B9F9  20 39 C0     mx
    JSR L_80C06E                    ; $80B9FC  20 6E C0     mx
    REP #$30                        ; $80B9FF  C2 30        mx
    JSR L_80C077                    ; $80BA01  20 77 C0     MX
    JSR L_80C08B                    ; $80BA04  20 8B C0     MX
    JSR L_80C0CF                    ; $80BA07  20 CF C0     MX
    JSR L_80C142                    ; $80BA0A  20 42 C1     MX
    JSR L_80C143                    ; $80BA0D  20 43 C1     MX
    JSR L_80C168                    ; $80BA10  20 68 C1     MX
    JSR L_80E6D7                    ; $80BA13  20 D7 E6     MX
    JSR L_80F131                    ; $80BA16  20 31 F1     MX
    SEP #$30                        ; $80BA19  E2 30        MX
    JSR L_80C866                    ; $80BA1B  20 66 C8     mx
    JSR L_80C74F                    ; $80BA1E  20 4F C7     mx
    JSR L_80BD36                    ; $80BA21  20 36 BD     mx
    LDA $032E                       ; $80BA24  AD 2E 03     mx
    BEQ L_80BA2C                    ; $80BA27  F0 03        mx
    STZ $0356                       ; $80BA29  9C 56 03     mx
L_80BA2C:
    JSR L_80A3A8                    ; $80BA2C  20 A8 A3     mx
    LDA #$00                        ; $80BA2F  A9 00        mx
    JSL L_818A7A                    ; $80BA31  22 7A 8A 81  mx
    LDA #$01                        ; $80BA35  A9 01        mx
    JSL L_818A7A                    ; $80BA37  22 7A 8A 81  mx
    LDA #$01                        ; $80BA3B  A9 01        mx
    STA $0328                       ; $80BA3D  8D 28 03     mx
L_80BA40:
    INC $0C56                       ; $80BA40  EE 56 0C     mx
    LDA #$03                        ; $80BA43  A9 03        mx
    JSL L_92FB3A                    ; $80BA45  22 3A FB 92  mx
    JSL L_80FCC0                    ; $80BA49  22 C0 FC 80  mx
    JSR L_80AF4C                    ; $80BA4D  20 4C AF     mx
    JSR L_80B356                    ; $80BA50  20 56 B3     mx
    JSR L_808AD5                    ; $80BA53  20 D5 8A     mx
    JSR L_80912C                    ; $80BA56  20 2C 91     mx
    JSL L_818B48                    ; $80BA59  22 48 8B 81  mx
    JSR L_80BAEC                    ; $80BA5D  20 EC BA     mx
    JSR L_80C74F                    ; $80BA60  20 4F C7     mx
    REP #$30                        ; $80BA63  C2 30        mx
    JSL L_81DE00                    ; $80BA65  22 00 DE 81  MX
    SEP #$30                        ; $80BA69  E2 30        MX
    JSR L_80BD06                    ; $80BA6B  20 06 BD     mx
    LDA #$1A                        ; $80BA6E  A9 1A        mx
    STA $0355                       ; $80BA70  8D 55 03     mx  screen_id
    JSL L_80FCC0                    ; $80BA73  22 C0 FC 80  mx
    JSR L_80C662                    ; $80BA77  20 62 C6     mx
    JSR L_80E3B9                    ; $80BA7A  20 B9 E3     mx
    JSR L_80FCFF                    ; $80BA7D  20 FF FC     mx
    JSR L_8099D2                    ; $80BA80  20 D2 99     mx
    JSR L_809924                    ; $80BA83  20 24 99     mx
    JSR L_808BCF                    ; $80BA86  20 CF 8B     mx
    JSR L_809A6D                    ; $80BA89  20 6D 9A     mx
    REP #$30                        ; $80BA8C  C2 30        mx
    JSR L_80E5BA                    ; $80BA8E  20 BA E5     MX
    JSR L_80F014                    ; $80BA91  20 14 F0     MX
    JSR L_80EC10                    ; $80BA94  20 10 EC     MX
    JSR L_80F439                    ; $80BA97  20 39 F4     MX
    JSL L_81DE00                    ; $80BA9A  22 00 DE 81  MX
    SEP #$30                        ; $80BA9E  E2 30        MX
    JSR L_80C74F                    ; $80BAA0  20 4F C7     mx
    JSR L_80BD06                    ; $80BAA3  20 06 BD     mx
    LDA #$1C                        ; $80BAA6  A9 1C        mx
    STA $0355                       ; $80BAA8  8D 55 03     mx  screen_id
    JSL L_80FCC0                    ; $80BAAB  22 C0 FC 80  mx
    JSR L_80BBE5                    ; $80BAAF  20 E5 BB     mx
    JSR L_80D420                    ; $80BAB2  20 20 D4     mx
    JSR L_80CB97                    ; $80BAB5  20 97 CB     mx
    JSR L_80CE7F                    ; $80BAB8  20 7F CE     mx
    LDA #$00                        ; $80BABB  A9 00        mx
    JSL L_818000                    ; $80BABD  22 00 80 81  mx
    JSR L_80C866                    ; $80BAC1  20 66 C8     mx
    JSL L_81C595                    ; $80BAC4  22 95 C5 81  mx
    JSL L_818A01                    ; $80BAC8  22 01 8A 81  mx
    JSL L_81806D                    ; $80BACC  22 6D 80 81  mx
    JSR L_80D216                    ; $80BAD0  20 16 D2     mx
    JSR L_80C2FC                    ; $80BAD3  20 FC C2     mx
    JSR L_80C74F                    ; $80BAD6  20 4F C7     mx
    REP #$30                        ; $80BAD9  C2 30        mx
    JSL L_81DE00                    ; $80BADB  22 00 DE 81  MX
    SEP #$30                        ; $80BADF  E2 30        MX
    JSR L_80BD06                    ; $80BAE1  20 06 BD     mx
    LDA #$1E                        ; $80BAE4  A9 1E        mx
    STA $0355                       ; $80BAE6  8D 55 03     mx  screen_id
    JMP L_80BA40                    ; $80BAE9  4C 40 BA     mx
L_80BAEC:
    LDX #$03                        ; $80BAEC  A2 03        mx
L_80BAEE:
    LDA $0F01,X                     ; $80BAEE  BD 01 0F     mx
    BEQ L_80BAF7                    ; $80BAF1  F0 04        mx
    DEC                             ; $80BAF3  3A           mx
    STA $0F01,X                     ; $80BAF4  9D 01 0F     mx
L_80BAF7:
    DEX                             ; $80BAF7  CA           mx
    BPL L_80BAEE                    ; $80BAF8  10 F4        mx
    LDX #$00                        ; $80BAFA  A2 00        mx
L_80BAFC:
    LDA $0EF1,X                     ; $80BAFC  BD F1 0E     mx
    BEQ L_80BB3C                    ; $80BAFF  F0 3B        mx
    LDA $0EDF,X                     ; $80BB01  BD DF 0E     mx
    BEQ L_80BB3C                    ; $80BB04  F0 36        mx
    CMP #$04                        ; $80BB06  C9 04        mx
    BCS L_80BB3C                    ; $80BB08  B0 32        mx
    LDA $0F01,X                     ; $80BB0A  BD 01 0F     mx
    BNE L_80BB3C                    ; $80BB0D  D0 2D        mx
    LDA $0C82,X                     ; $80BB0F  BD 82 0C     mx
    BNE L_80BB3C                    ; $80BB12  D0 28        mx
    STX $0BD0                       ; $80BB14  8E D0 0B     mx
    REP #$30                        ; $80BB17  C2 30        mx
    LDA $0F0F                       ; $80BB19  AD 0F 0F     MX
    CMP #$0011                      ; $80BB1C  C9 11 00     MX
    BCS L_80BB41                    ; $80BB1F  B0 20        MX
    JSR L_80D1C7                    ; $80BB21  20 C7 D1     MX
    STX $1257                       ; $80BB24  8E 57 12     MX
    TXA                             ; $80BB27  8A           MX
    ASL                             ; $80BB28  0A           MX
    STA $1259                       ; $80BB29  8D 59 12     MX
    SEP #$30                        ; $80BB2C  E2 30        MX
    LDA #$02                        ; $80BB2E  A9 02        mx
    LDX $0BD0                       ; $80BB30  AE D0 0B     mx
    JSR L_80C7E7                    ; $80BB33  20 E7 C7     mx
    JSR L_80BB44                    ; $80BB36  20 44 BB     mx
    LDX $0BD0                       ; $80BB39  AE D0 0B     mx
L_80BB3C:
    INX                             ; $80BB3C  E8           mx
    CPX #$04                        ; $80BB3D  E0 04        mx
    BNE L_80BAFC                    ; $80BB3F  D0 BB        mx
L_80BB41:
    SEP #$30                        ; $80BB41  E2 30        mx
    RTS                             ; $80BB43  60           mx
L_80BB44:
    JSL L_92FB1B                    ; $80BB44  22 1B FB 92  mx
    LDA #$02                        ; $80BB48  A9 02        mx
    STA $0F01,X                     ; $80BB4A  9D 01 0F     mx
    LDA $127E                       ; $80BB4D  AD 7E 12     mx
    AND #$07                        ; $80BB50  29 07        mx
    SEC                             ; $80BB52  38           mx
    SBC #$03                        ; $80BB53  E9 03        mx
    CLC                             ; $80BB55  18           mx
    ADC $80,X                       ; $80BB56  75 80        mx
    STA $A1                         ; $80BB58  85 A1        mx
    LDA $84,X                       ; $80BB5A  B5 84        mx
    STA $A3                         ; $80BB5C  85 A3        mx
L_80BB5E:
    LDY $A024,X                     ; $80BB5E  BC 24 A0     mx
    LDA $0A45,X                     ; $80BB61  BD 45 0A     mx
    REP #$30                        ; $80BB64  C2 30        mx
    AND #$00FF                      ; $80BB66  29 FF 00     MX
    INC                             ; $80BB69  1A           MX
    PHA                             ; $80BB6A  48           MX
    LDX $1259                       ; $80BB6B  AE 59 12     MX
    STZ $0F71,X                     ; $80BB6E  9E 71 0F     MX
    LDA $00DD,Y                     ; $80BB71  B9 DD 00     MX
    CLC                             ; $80BB74  18           MX
    ADC $9C                         ; $80BB75  65 9C        MX
    STA $0F73,X                     ; $80BB77  9D 73 0F     MX
    STZ $0FD1,X                     ; $80BB7A  9E D1 0F     MX
    LDA $00EF,Y                     ; $80BB7D  B9 EF 00     MX
    CLC                             ; $80BB80  18           MX
    ADC $9E                         ; $80BB81  65 9E        MX
    STA $0FD3,X                     ; $80BB83  9D D3 0F     MX
    LDX $1257                       ; $80BB86  AE 57 12     MX
    INC $0F0F                       ; $80BB89  EE 0F 0F     MX
    INC $0F11,X                     ; $80BB8C  FE 11 0F     MX
    LDA #$8768                      ; $80BB8F  A9 68 87     MX
    STA $0F41,X                     ; $80BB92  9D 41 0F     MX
    PLA                             ; $80BB95  68           MX
    STA $1031,X                     ; $80BB96  9D 31 10     MX
    LDA $A0                         ; $80BB99  A5 A0        MX
    AND #$FF00                      ; $80BB9B  29 00 FF     MX
    CMP #$8000                      ; $80BB9E  C9 00 80     MX
    ROR                             ; $80BBA1  6A           MX
    CMP #$8000                      ; $80BBA2  C9 00 80     MX
    ROR                             ; $80BBA5  6A           MX
    CMP #$8000                      ; $80BBA6  C9 00 80     MX
    ROR                             ; $80BBA9  6A           MX
    STA $88                         ; $80BBAA  85 88        MX
    CMP #$8000                      ; $80BBAC  C9 00 80     MX
    ROR                             ; $80BBAF  6A           MX
    ADC $88                         ; $80BBB0  65 88        MX
    STA $1061,X                     ; $80BBB2  9D 61 10     MX
    LDA $A2                         ; $80BBB5  A5 A2        MX
    AND #$FF00                      ; $80BBB7  29 00 FF     MX
    CMP #$8000                      ; $80BBBA  C9 00 80     MX
    ROR                             ; $80BBBD  6A           MX
    CMP #$8000                      ; $80BBBE  C9 00 80     MX
    ROR                             ; $80BBC1  6A           MX
    CMP #$8000                      ; $80BBC2  C9 00 80     MX
    ROR                             ; $80BBC5  6A           MX
    CMP #$8000                      ; $80BBC6  C9 00 80     MX
    ROR                             ; $80BBC9  6A           MX
    STA $1091,X                     ; $80BBCA  9D 91 10     MX
    LDA #$0003                      ; $80BBCD  A9 03 00     MX
    STA $10C1,X                     ; $80BBD0  9D C1 10     MX
    LDA #$0064                      ; $80BBD3  A9 64 00     MX
    STA $11B1,X                     ; $80BBD6  9D B1 11     MX
    LDA #$003B                      ; $80BBD9  A9 3B 00     MX
    STA $11E1,X                     ; $80BBDC  9D E1 11     MX
    STZ $1211,X                     ; $80BBDF  9E 11 12     MX
    SEP #$30                        ; $80BBE2  E2 30        MX
    RTS                             ; $80BBE4  60           mx
L_80BBE5:
    LDA $0255                       ; $80BBE5  AD 55 02     mx
    BNE L_80BC22                    ; $80BBE8  D0 38        mx
    LDA $0F0E                       ; $80BBEA  AD 0E 0F     mx
    BEQ L_80BC04                    ; $80BBED  F0 15        mx
    REP #$30                        ; $80BBEF  C2 30        mx
    LDA $033D                       ; $80BBF1  AD 3D 03     MX  pad1_held
    ORA $033F                       ; $80BBF4  0D 3F 03     MX  pad2_held
    SEP #$30                        ; $80BBF7  E2 30        MX
    BEQ L_80BC22                    ; $80BBF9  F0 27        mx
    JSR L_80BD06                    ; $80BBFB  20 06 BD     mx
    STZ $0F0E                       ; $80BBFE  9C 0E 0F     mx
    JMP L_809A89                    ; $80BC01  4C 89 9A     mx
L_80BC04:
    STZ $033C                       ; $80BC04  9C 3C 03     mx
    LDA $0EF1                       ; $80BC07  AD F1 0E     mx
    BEQ L_80BC11                    ; $80BC0A  F0 05        mx
    LDA $028A                       ; $80BC0C  AD 8A 02     mx
    BNE L_80BC26                    ; $80BC0F  D0 15        mx
L_80BC11:
    LDA $0BFF                       ; $80BC11  AD FF 0B     mx
    CMP #$02                        ; $80BC14  C9 02        mx
    BNE L_80BC22                    ; $80BC16  D0 0A        mx
    LDA $0EF2                       ; $80BC18  AD F2 0E     mx
    BEQ L_80BC22                    ; $80BC1B  F0 05        mx
    LDA $028B                       ; $80BC1D  AD 8B 02     mx
    BNE L_80BC23                    ; $80BC20  D0 01        mx
L_80BC22:
    RTS                             ; $80BC22  60           mx
L_80BC23:
    INC $033C                       ; $80BC23  EE 3C 03     mx
L_80BC26:
    JSR L_80BD06                    ; $80BC26  20 06 BD     mx
    STZ $028A                       ; $80BC29  9C 8A 02     mx
    STZ $028B                       ; $80BC2C  9C 8B 02     mx
    LDA $0BEB                       ; $80BC2F  AD EB 0B     mx
    PHA                             ; $80BC32  48           mx
    STZ $0BEB                       ; $80BC33  9C EB 0B     mx
    LDA #$30                        ; $80BC36  A9 30        mx
    JSR L_80F97B                    ; $80BC38  20 7B F9     mx
    JSR L_80FB42                    ; $80BC3B  20 42 FB     mx
    LDA #$01                        ; $80BC3E  A9 01        mx
    STA $0BEC                       ; $80BC40  8D EC 0B     mx
    LDA #$20                        ; $80BC43  A9 20        mx
    STA $0355                       ; $80BC45  8D 55 03     mx  screen_id
L_80BC48:
    LDA $0BEC                       ; $80BC48  AD EC 0B     mx
    CMP #$01                        ; $80BC4B  C9 01        mx
    BEQ L_80BC48                    ; $80BC4D  F0 F9        mx
    JSR L_80F986                    ; $80BC4F  20 86 F9     mx
    JSR L_80BC99                    ; $80BC52  20 99 BC     mx
    LDA $13B8                       ; $80BC55  AD B8 13     mx
    BEQ L_80BC80                    ; $80BC58  F0 26        mx
    LDX $033C                       ; $80BC5A  AE 3C 03     mx
    STZ $0EF1,X                     ; $80BC5D  9E F1 0E     mx
    LDA #$01                        ; $80BC60  A9 01        mx
    STA $0CC5,X                     ; $80BC62  9D C5 0C     mx
    LDY $0E1E                       ; $80BC65  AC 1E 0E     mx
    CPY #$01                        ; $80BC68  C0 01        mx
    BEQ L_80BC73                    ; $80BC6A  F0 07        mx
    LDA #$02                        ; $80BC6C  A9 02        mx
    STA $0EFD,X                     ; $80BC6E  9D FD 0E     mx
    BRA L_80BC78                    ; $80BC71  80 05        mx
L_80BC73:
    LDA #$03                        ; $80BC73  A9 03        mx
    STA $0EFD,X                     ; $80BC75  9D FD 0E     mx
L_80BC78:
    TYA                             ; $80BC78  98           mx
    STA $0E1C,X                     ; $80BC79  9D 1C 0E     mx
    INC                             ; $80BC7C  1A           mx
    STA $0E1E                       ; $80BC7D  8D 1E 0E     mx
L_80BC80:
    JSR L_80F986                    ; $80BC80  20 86 F9     mx
    LDA #$B0                        ; $80BC83  A9 B0        mx
    JSR L_80F97B                    ; $80BC85  20 7B F9     mx
    LDA #$05                        ; $80BC88  A9 05        mx
    STA $0BEC                       ; $80BC8A  8D EC 0B     mx
    JSR L_80FB42                    ; $80BC8D  20 42 FB     mx
    PLA                             ; $80BC90  68           mx
    STA $0BEB                       ; $80BC91  8D EB 0B     mx
    JSL L_819F58                    ; $80BC94  22 58 9F 81  mx
    RTS                             ; $80BC98  60           mx
L_80BC99:
    JSL L_819F58                    ; $80BC99  22 58 9F 81  mx
    REP #$10                        ; $80BC9D  C2 10        mx
    STZ $13B8                       ; $80BC9F  9C B8 13     mX
    LDX #$003C                      ; $80BCA2  A2 3C 00     mX
L_80BCA5:
    JSR L_80F9F6                    ; $80BCA5  20 F6 F9     mX
    JSR L_80BCEA                    ; $80BCA8  20 EA BC     mX
    LDA $028C                       ; $80BCAB  AD 8C 02     mX
    BEQ L_80BCC1                    ; $80BCAE  F0 11        mX
    STZ $028C                       ; $80BCB0  9C 8C 02     mX
    LDX #$000F                      ; $80BCB3  A2 0F 00     mX
    LDA $13B8                       ; $80BCB6  AD B8 13     mX
    EOR #$01                        ; $80BCB9  49 01        mX
    STA $13B8                       ; $80BCBB  8D B8 13     mX
    JSR L_80FB56                    ; $80BCBE  20 56 FB     mX
L_80BCC1:
    LDA $028D                       ; $80BCC1  AD 8D 02     mX
    BEQ L_80BCD7                    ; $80BCC4  F0 11        mX
    STZ $028D                       ; $80BCC6  9C 8D 02     mX
    LDX #$000F                      ; $80BCC9  A2 0F 00     mX
    LDA $13B8                       ; $80BCCC  AD B8 13     mX
    EOR #$01                        ; $80BCCF  49 01        mX
    STA $13B8                       ; $80BCD1  8D B8 13     mX
    JSR L_80FB56                    ; $80BCD4  20 56 FB     mX
L_80BCD7:
    LDA $127E                       ; $80BCD7  AD 7E 12     mX
L_80BCDA:
    CMP $127E                       ; $80BCDA  CD 7E 12     mX
    BEQ L_80BCDA                    ; $80BCDD  F0 FB        mX
    LDA $0289                       ; $80BCDF  AD 89 02     mX
    BEQ L_80BCA5                    ; $80BCE2  F0 C1        mX
    STZ $0289                       ; $80BCE4  9C 89 02     mX
    SEP #$10                        ; $80BCE7  E2 10        mX
    RTS                             ; $80BCE9  60           mx
L_80BCEA:
    CPX #$001E                      ; $80BCEA  E0 1E 00     mX
    BCS L_80BCFA                    ; $80BCED  B0 0B        mX
    LDA $13B8                       ; $80BCEF  AD B8 13     mX
    CLC                             ; $80BCF2  18           mX
    ADC #$03                        ; $80BCF3  69 03        mX
    STA $0BEC                       ; $80BCF5  8D EC 0B     mX
    BRA L_80BCFF                    ; $80BCF8  80 05        mX
L_80BCFA:
    LDA #$02                        ; $80BCFA  A9 02        mX
    STA $0BEC                       ; $80BCFC  8D EC 0B     mX
L_80BCFF:
    DEX                             ; $80BCFF  CA           mX
    BNE L_80BD05                    ; $80BD00  D0 03        mX
    LDX #$003C                      ; $80BD02  A2 3C 00     mX
L_80BD05:
    RTS                             ; $80BD05  60           mX
L_80BD06:
    LDA $0355                       ; $80BD06  AD 55 03     mx  screen_id
    CMP #$02                        ; $80BD09  C9 02        mx
    BEQ L_80BD12                    ; $80BD0B  F0 05        mx
    JSR L_80F9F6                    ; $80BD0D  20 F6 F9     mx
    BRA L_80BD06                    ; $80BD10  80 F4        mx
L_80BD12:
    RTS                             ; $80BD12  60           mx
L_80BD13:
    LDA #$03                        ; $80BD13  A9 03        mx
    STA $0328                       ; $80BD15  8D 28 03     mx
    JSR L_80F986                    ; $80BD18  20 86 F9     mx
L_80BD1B:
    LDA $1AE6                       ; $80BD1B  AD E6 1A     mx
    BNE L_80BD1B                    ; $80BD1E  D0 FB        mx
    REP #$30                        ; $80BD20  C2 30        mx
    LDX $035D                       ; $80BD22  AE 5D 03     MX
    TXS                             ; $80BD25  9A           MX
    SEP #$30                        ; $80BD26  E2 30        MX
    JSR L_80A3F2                    ; $80BD28  20 F2 A3     mx
    STZ $0355                       ; $80BD2B  9C 55 03     mx  screen_id
    STZ $0356                       ; $80BD2E  9C 56 03     mx
    STZ $4200                       ; $80BD31  9C 00 42     mx
    SEI                             ; $80BD34  78           mx
    RTS                             ; $80BD35  60           mx
L_80BD36:
    LDA #$02                        ; $80BD36  A9 02        mx
    STA $0355                       ; $80BD38  8D 55 03     mx  screen_id
    LDA #$02                        ; $80BD3B  A9 02        mx
    STA $0356                       ; $80BD3D  8D 56 03     mx
    LDA #$6E                        ; $80BD40  A9 6E        mx
    STA $4209                       ; $80BD42  8D 09 42     mx
    STZ $420A                       ; $80BD45  9C 0A 42     mx
    STZ $1325                       ; $80BD48  9C 25 13     mx
    STZ $1326                       ; $80BD4B  9C 26 13     mx
    LDA #$A1                        ; $80BD4E  A9 A1        mx
    STA $4200                       ; $80BD50  8D 00 42     mx
    CLI                             ; $80BD53  58           mx
    RTS                             ; $80BD54  60           mx
L_80BD55:
    LDA #$80                        ; $80BD55  A9 80        mx
    STA $2115                       ; $80BD57  8D 15 21     mx
    STZ $0BEC                       ; $80BD5A  9C EC 0B     mx
    REP #$30                        ; $80BD5D  C2 30        mx
    LDX #$3CCC                      ; $80BD5F  A2 CC 3C     MX
    LDA $033C                       ; $80BD62  AD 3C 03     MX
    AND #$00FF                      ; $80BD65  29 FF 00     MX
    BEQ L_80BD6D                    ; $80BD68  F0 03        MX
    LDX #$3E8C                      ; $80BD6A  A2 8C 3E     MX
L_80BD6D:
    STX $2116                       ; $80BD6D  8E 16 21     MX
    LDA #$2027                      ; $80BD70  A9 27 20     MX
    STA $2118                       ; $80BD73  8D 18 21     MX
    LDA #$2029                      ; $80BD76  A9 29 20     MX
    STA $2118                       ; $80BD79  8D 18 21     MX
    LDA #$2036                      ; $80BD7C  A9 36 20     MX
    STA $2118                       ; $80BD7F  8D 18 21     MX
    LDA #$2025                      ; $80BD82  A9 25 20     MX
    STA $2118                       ; $80BD85  8D 18 21     MX
    LDA #$2000                      ; $80BD88  A9 00 20     MX
    STA $2118                       ; $80BD8B  8D 18 21     MX
    LDA #$2035                      ; $80BD8E  A9 35 20     MX
    STA $2118                       ; $80BD91  8D 18 21     MX
    LDA #$2030                      ; $80BD94  A9 30 20     MX
    STA $2118                       ; $80BD97  8D 18 21     MX
    LDA #$201F                      ; $80BD9A  A9 1F 20     MX
    STA $2118                       ; $80BD9D  8D 18 21     MX
    SEP #$30                        ; $80BDA0  E2 30        MX
    RTS                             ; $80BDA2  60           mx
L_80BDA3:
    REP #$30                        ; $80BDA3  C2 30        mx
    LDX #$3CCC                      ; $80BDA5  A2 CC 3C     MX
    LDA $033C                       ; $80BDA8  AD 3C 03     MX
    AND #$00FF                      ; $80BDAB  29 FF 00     MX
    BEQ L_80BDB3                    ; $80BDAE  F0 03        MX
    LDX #$3E8C                      ; $80BDB0  A2 8C 3E     MX
L_80BDB3:
    CPY #$0000                      ; $80BDB3  C0 00 00     MX
    BEQ L_80BDBE                    ; $80BDB6  F0 06        MX
    TXA                             ; $80BDB8  8A           MX
    CLC                             ; $80BDB9  18           MX
    ADC #$0040                      ; $80BDBA  69 40 00     MX
    TAX                             ; $80BDBD  AA           MX
L_80BDBE:
    STX $2116                       ; $80BDBE  8E 16 21     MX
    LDA #$2000                      ; $80BDC1  A9 00 20     MX
    LDY #$0008                      ; $80BDC4  A0 08 00     MX
L_80BDC7:
    STA $2118                       ; $80BDC7  8D 18 21     MX
    DEY                             ; $80BDCA  88           MX
    BNE L_80BDC7                    ; $80BDCB  D0 FA        MX
    SEP #$30                        ; $80BDCD  E2 30        MX
    RTS                             ; $80BDCF  60           mx
L_80BDD0:
    REP #$30                        ; $80BDD0  C2 30        mx
    LDX #$3D0D                      ; $80BDD2  A2 0D 3D     MX
    LDA $033C                       ; $80BDD5  AD 3C 03     MX
    AND #$00FF                      ; $80BDD8  29 FF 00     MX
    BEQ L_80BDE0                    ; $80BDDB  F0 03        MX
    LDX #$3ECD                      ; $80BDDD  A2 CD 3E     MX
L_80BDE0:
    STX $2116                       ; $80BDE0  8E 16 21     MX
    LDA #$2039                      ; $80BDE3  A9 39 20     MX
    STA $2118                       ; $80BDE6  8D 18 21     MX
    LDA #$2025                      ; $80BDE9  A9 25 20     MX
    STA $2118                       ; $80BDEC  8D 18 21     MX
    LDA #$2033                      ; $80BDEF  A9 33 20     MX
    STA $2118                       ; $80BDF2  8D 18 21     MX
    SEP #$30                        ; $80BDF5  E2 30        MX
    RTS                             ; $80BDF7  60           mx
L_80BDF8:
    REP #$30                        ; $80BDF8  C2 30        mx
    LDX #$3D11                      ; $80BDFA  A2 11 3D     MX
    LDA $033C                       ; $80BDFD  AD 3C 03     MX
    AND #$00FF                      ; $80BE00  29 FF 00     MX
    BEQ L_80BE08                    ; $80BE03  F0 03        MX
    LDX #$3ED1                      ; $80BE05  A2 D1 3E     MX
L_80BE08:
    STX $2116                       ; $80BE08  8E 16 21     MX
    LDA #$202E                      ; $80BE0B  A9 2E 20     MX
    STA $2118                       ; $80BE0E  8D 18 21     MX
    LDA #$202F                      ; $80BE11  A9 2F 20     MX
    STA $2118                       ; $80BE14  8D 18 21     MX
    SEP #$30                        ; $80BE17  E2 30        MX
    RTS                             ; $80BE19  60           mx
L_80BE1A:
    LDA #$02                        ; $80BE1A  A9 02        mx
    STA $0355                       ; $80BE1C  8D 55 03     mx  screen_id
    JSR L_80BECE                    ; $80BE1F  20 CE BE     mx
    REP #$30                        ; $80BE22  C2 30        mx
    JSL L_81DEF9                    ; $80BE24  22 F9 DE 81  MX
    JSL L_92F4DA                    ; $80BE28  22 DA F4 92  MX
    SEP #$30                        ; $80BE2C  E2 30        MX
    JMP L_80BE79                    ; $80BE2E  4C 79 BE     mx
L_80BE31:
    LDA #$02                        ; $80BE31  A9 02        mx
    STA $0355                       ; $80BE33  8D 55 03     mx  screen_id
    REP #$30                        ; $80BE36  C2 30        mx
    JSR L_80E574                    ; $80BE38  20 74 E5     MX
    JSR L_80EFCE                    ; $80BE3B  20 CE EF     MX
    JSL L_81DEF9                    ; $80BE3E  22 F9 DE 81  MX
    SEP #$30                        ; $80BE42  E2 30        MX
    JSR L_80BECE                    ; $80BE44  20 CE BE     mx
    JMP L_80BE79                    ; $80BE47  4C 79 BE     mx
L_80BE4A:
    LDA #$02                        ; $80BE4A  A9 02        mx
    STA $0355                       ; $80BE4C  8D 55 03     mx  screen_id
    JSR L_80BECE                    ; $80BE4F  20 CE BE     mx
    JSR L_80C039                    ; $80BE52  20 39 C0     mx
    JSR L_80C06E                    ; $80BE55  20 6E C0     mx
    REP #$30                        ; $80BE58  C2 30        mx
    JSR L_80C077                    ; $80BE5A  20 77 C0     MX
    JSR L_80C08B                    ; $80BE5D  20 8B C0     MX
    JSR L_80C0CF                    ; $80BE60  20 CF C0     MX
    JSR L_80C142                    ; $80BE63  20 42 C1     MX
    JSR L_80C143                    ; $80BE66  20 43 C1     MX
    JSR L_80C168                    ; $80BE69  20 68 C1     MX
    JSL L_81DEF9                    ; $80BE6C  22 F9 DE 81  MX
    SEP #$30                        ; $80BE70  E2 30        MX
    JSL L_819342                    ; $80BE72  22 42 93 81  mx
    JMP L_80BE79                    ; $80BE76  4C 79 BE     mx
L_80BE79:
    LDA $0BEB                       ; $80BE79  AD EB 0B     mx
    BEQ L_80BEC2                    ; $80BE7C  F0 44        mx
    LDA $0BEA                       ; $80BE7E  AD EA 0B     mx
    CMP #$09                        ; $80BE81  C9 09        mx
    BNE L_80BE93                    ; $80BE83  D0 0E        mx
    LDA $0BE9                       ; $80BE85  AD E9 0B     mx
    CMP #$59                        ; $80BE88  C9 59        mx
    BNE L_80BE93                    ; $80BE8A  D0 07        mx
    LDA $0BE8                       ; $80BE8C  AD E8 0B     mx
    CMP #$99                        ; $80BE8F  C9 99        mx
    BEQ L_80BEC2                    ; $80BE91  F0 2F        mx
L_80BE93:
    SED                             ; $80BE93  F8           mx
    LDA $0BE8                       ; $80BE94  AD E8 0B     mx
    AND #$0F                        ; $80BE97  29 0F        mx
    TAY                             ; $80BE99  A8           mx
    LDA $BEC4,Y                     ; $80BE9A  B9 C4 BE     mx
    CLC                             ; $80BE9D  18           mx
    ADC $0BE8                       ; $80BE9E  6D E8 0B     mx
    STA $0BE8                       ; $80BEA1  8D E8 0B     mx
    BNE L_80BEC2                    ; $80BEA4  D0 1C        mx
    STZ $0BE8                       ; $80BEA6  9C E8 0B     mx
    LDA $0BE9                       ; $80BEA9  AD E9 0B     mx
    CLC                             ; $80BEAC  18           mx
    ADC #$01                        ; $80BEAD  69 01        mx
    STA $0BE9                       ; $80BEAF  8D E9 0B     mx
    CMP #$60                        ; $80BEB2  C9 60        mx
    BNE L_80BEC2                    ; $80BEB4  D0 0C        mx
    STZ $0BE9                       ; $80BEB6  9C E9 0B     mx
    LDA $0BEA                       ; $80BEB9  AD EA 0B     mx
    CLC                             ; $80BEBC  18           mx
    ADC #$01                        ; $80BEBD  69 01        mx
    STA $0BEA                       ; $80BEBF  8D EA 0B     mx
L_80BEC2:
    CLD                             ; $80BEC2  D8           mx
    RTS                             ; $80BEC3  60           mx
    db $02,$00,$02,$00,$01,$02,$00,$02,$00,$01                         ; $80BEC4
L_80BECE:
    LDA #$01                        ; $80BECE  A9 01        mx
    STA $2107                       ; $80BED0  8D 07 21     mx
    LDA #$11                        ; $80BED3  A9 11        mx
    STA $2108                       ; $80BED5  8D 08 21     mx
    LDA $18                         ; $80BED8  A5 18        mx
    STA $210D                       ; $80BEDA  8D 0D 21     mx
    LDA $19                         ; $80BEDD  A5 19        mx
    STA $210D                       ; $80BEDF  8D 0D 21     mx
    LDA $1A                         ; $80BEE2  A5 1A        mx
    STA $210E                       ; $80BEE4  8D 0E 21     mx
    LDA $1B                         ; $80BEE7  A5 1B        mx
    STA $210E                       ; $80BEE9  8D 0E 21     mx
    LDA $0382                       ; $80BEEC  AD 82 03     mx
    STA $210F                       ; $80BEEF  8D 0F 21     mx
    LDA $0383                       ; $80BEF2  AD 83 03     mx
    STA $210F                       ; $80BEF5  8D 0F 21     mx
    LDA $0384                       ; $80BEF8  AD 84 03     mx
    STA $2110                       ; $80BEFB  8D 10 21     mx
    LDA $0385                       ; $80BEFE  AD 85 03     mx
    STA $2110                       ; $80BF01  8D 10 21     mx
    REP #$30                        ; $80BF04  C2 30        mx
    STZ $2102                       ; $80BF06  9C 02 21     MX
    LDY $13F6                       ; $80BF09  AC F6 13     MX
    LDA $BF3E,Y                     ; $80BF0C  B9 3E BF     MX
    STA $4342                       ; $80BF0F  8D 42 43     MX
    LDA #$0100                      ; $80BF12  A9 00 01     MX
    STA $4345                       ; $80BF15  8D 45 43     MX
    SEP #$30                        ; $80BF18  E2 30        MX
    LDA #$10                        ; $80BF1A  A9 10        mx
    STA $420B                       ; $80BF1C  8D 0B 42     mx
    REP #$30                        ; $80BF1F  C2 30        mx
    LDA #$0100                      ; $80BF21  A9 00 01     MX
    STA $2102                       ; $80BF24  8D 02 21     MX
    LDY $13F6                       ; $80BF27  AC F6 13     MX
    LDA $BF46,Y                     ; $80BF2A  B9 46 BF     MX
    STA $4342                       ; $80BF2D  8D 42 43     MX
    LDA #$0010                      ; $80BF30  A9 10 00     MX
    STA $4345                       ; $80BF33  8D 45 43     MX
    SEP #$30                        ; $80BF36  E2 30        MX
    LDA #$10                        ; $80BF38  A9 10        mx
    STA $420B                       ; $80BF3A  8D 0B 42     mx
    RTS                             ; $80BF3D  60           mx
    db $1A,$16,$2A,$17,$3A,$18,$4A,$19,$1A,$17,$2A,$18,$3A,$19,$4A,$1A ; $80BF3E
    db $20,$CE,$BE,$22,$D7,$9E,$81,$AD,$EC,$0B,$0A,$AA,$7C,$5D,$BF,$97 ; $80BF4E
    db $BF,$8E,$BF,$91,$BF,$7C,$BF,$85,$BF,$69,$BF,$A0,$00,$20,$A3,$BD ; $80BF5E
    db $A0,$01,$20,$A3,$BD,$9C,$EC,$0B,$A9,$02,$8D,$55,$03,$60,$A0,$01 ; $80BF6E
    db $20,$A3,$BD,$20,$D0,$BD,$60,$A0,$01,$20,$A3,$BD,$20,$F8,$BD,$60 ; $80BF7E
    db $20,$55,$BD,$20,$D0,$BD,$20,$F8,$BD,$60,$AD,$12,$42,$29,$40,$F0 ; $80BF8E
    db $F9,$A9,$80,$8D,$00,$21,$A9,$09,$8D,$07,$21,$A9,$19,$8D,$08,$21 ; $80BF9E
    db $A5,$1C,$8D,$0D,$21,$A5,$1D,$8D,$0D,$21,$A5,$1E,$38,$E9,$71,$8D ; $80BFAE
    db $0E,$21,$A5,$1F,$E9,$00,$8D,$0E,$21,$AD,$86,$03,$8D,$0F,$21,$AD ; $80BFBE
    db $87,$03,$8D,$0F,$21,$AD,$88,$03,$38,$E9,$71,$8D,$10,$21,$AD,$89 ; $80BFCE
    db $03,$E9,$00,$8D,$10,$21,$C2,$30,$9C,$02,$21,$AC,$F6,$13,$B9,$42 ; $80BFDE
    db $BF,$8D,$42,$43,$A9,$00,$01,$8D,$45,$43,$E2,$30,$A9,$10,$8D,$0B ; $80BFEE
    db $42,$C2,$30,$A9,$00,$01,$8D,$02,$21,$AC,$F6,$13,$B9,$4A,$BF,$8D ; $80BFFE
    db $42,$43,$A9,$10,$00,$8D,$45,$43,$E2,$30,$A9,$10,$8D,$0B,$42,$AD ; $80C00E
    db $12,$42,$29,$40,$F0,$F9,$AD,$12,$42,$29,$40,$D0,$F9,$AD,$12,$42 ; $80C01E
    db $29,$40,$F0,$F9,$AD,$5F,$03,$8D,$00,$21,$60                     ; $80C02E
L_80C039:
    REP #$30                        ; $80C039  C2 30        mx
    LDA $0A36                       ; $80C03B  AD 36 0A     MX
    BMI L_80C063                    ; $80C03E  30 23        MX
    PEA $2200                       ; $80C040  F4 00 22     MX
    PHA                             ; $80C043  48           MX
    JSR L_80A28A                    ; $80C044  20 8A A2     MX
    PLA                             ; $80C047  68           MX
    PLA                             ; $80C048  68           MX
    LDA #$FFFF                      ; $80C049  A9 FF FF     MX
    STA $0A36                       ; $80C04C  8D 36 0A     MX
    LDA $0A38                       ; $80C04F  AD 38 0A     MX
    BMI L_80C063                    ; $80C052  30 0F        MX
    PEA $2A00                       ; $80C054  F4 00 2A     MX
    PHA                             ; $80C057  48           MX
    JSR L_80A28A                    ; $80C058  20 8A A2     MX
    PLA                             ; $80C05B  68           MX
    PLA                             ; $80C05C  68           MX
    LDA #$FFFF                      ; $80C05D  A9 FF FF     MX
    STA $0A38                       ; $80C060  8D 38 0A     MX
L_80C063:
    SEP #$30                        ; $80C063  E2 30        MX
    RTS                             ; $80C065  60           mx
L_80C066:
    PHB                             ; $80C066  8B           mx
    PHK                             ; $80C067  4B           mx
    PLB                             ; $80C068  AB           mx
    JSR L_80C06E                    ; $80C069  20 6E C0     mx
    PLB                             ; $80C06C  AB           mx
    RTL                             ; $80C06D  6B           mx
L_80C06E:
    STZ $2121                       ; $80C06E  9C 21 21     mx
    LDA #$08                        ; $80C071  A9 08        mx
    STA $420B                       ; $80C073  8D 0B 42     mx
    RTS                             ; $80C076  60           mx
L_80C077:
    LDA $0A3A                       ; $80C077  AD 3A 0A     MX
    BEQ L_80C08A                    ; $80C07A  F0 0E        MX
    PEA $3300                       ; $80C07C  F4 00 33     MX
    PEA $000C                       ; $80C07F  F4 0C 00     MX
    JSR L_80A2E7                    ; $80C082  20 E7 A2     MX
    PLA                             ; $80C085  68           MX
    PLA                             ; $80C086  68           MX
    STZ $0A3A                       ; $80C087  9C 3A 0A     MX
L_80C08A:
    RTS                             ; $80C08A  60           MX
L_80C08B:
    LDA #$3C58                      ; $80C08B  A9 58 3C     MX
    STA $2116                       ; $80C08E  8D 16 21     MX
    SEP #$20                        ; $80C091  E2 20        MX
    LDA #$80                        ; $80C093  A9 80        mX
    STA $2115                       ; $80C095  8D 15 21     mX
    LDA #$02                        ; $80C098  A9 02        mX
    STA $420B                       ; $80C09A  8D 0B 42     mX
    REP #$20                        ; $80C09D  C2 20        mX
    LDA $032E                       ; $80C09F  AD 2E 03     MX
    BNE L_80C0CE                    ; $80C0A2  D0 2A        MX
    LDA #$3E18                      ; $80C0A4  A9 18 3E     MX
    STA $2116                       ; $80C0A7  8D 16 21     MX
    LDA #$0AFD                      ; $80C0AA  A9 FD 0A     MX
    STA $4312                       ; $80C0AD  8D 12 43     MX
    LDA #$000C                      ; $80C0B0  A9 0C 00     MX
    STA $4315                       ; $80C0B3  8D 15 43     MX
    SEP #$20                        ; $80C0B6  E2 20        MX
    LDA #$01                        ; $80C0B8  A9 01        mX
    STA $4310                       ; $80C0BA  8D 10 43     mX
    LDA #$18                        ; $80C0BD  A9 18        mX
    STA $4311                       ; $80C0BF  8D 11 43     mX
    LDA #$7E                        ; $80C0C2  A9 7E        mX
    STA $4314                       ; $80C0C4  8D 14 43     mX
    LDA #$02                        ; $80C0C7  A9 02        mX
    STA $420B                       ; $80C0C9  8D 0B 42     mX
    REP #$20                        ; $80C0CC  C2 20        mX
L_80C0CE:
    RTS                             ; $80C0CE  60           MX
L_80C0CF:
    LDA #$3C4D                      ; $80C0CF  A9 4D 3C     MX
    STA $2116                       ; $80C0D2  8D 16 21     MX
    LDA $0E3F                       ; $80C0D5  AD 3F 0E     MX
    AND #$00FF                      ; $80C0D8  29 FF 00     MX
    CLC                             ; $80C0DB  18           MX
    ADC #$2010                      ; $80C0DC  69 10 20     MX
    STA $2118                       ; $80C0DF  8D 18 21     MX
    LDA #$3C51                      ; $80C0E2  A9 51 3C     MX
    STA $2116                       ; $80C0E5  8D 16 21     MX
    LDA $0E40                       ; $80C0E8  AD 40 0E     MX
    AND #$00FF                      ; $80C0EB  29 FF 00     MX
    ADC #$2010                      ; $80C0EE  69 10 20     MX
    STA $2118                       ; $80C0F1  8D 18 21     MX
    LDA #$3C55                      ; $80C0F4  A9 55 3C     MX
    STA $2116                       ; $80C0F7  8D 16 21     MX
    LDA $0E41                       ; $80C0FA  AD 41 0E     MX
    AND #$00FF                      ; $80C0FD  29 FF 00     MX
    ADC #$2010                      ; $80C100  69 10 20     MX
    STA $2118                       ; $80C103  8D 18 21     MX
    LDA $032E                       ; $80C106  AD 2E 03     MX
    BNE L_80C141                    ; $80C109  D0 36        MX
    LDA #$3E0D                      ; $80C10B  A9 0D 3E     MX
    STA $2116                       ; $80C10E  8D 16 21     MX
    LDA $0E42                       ; $80C111  AD 42 0E     MX
    AND #$00FF                      ; $80C114  29 FF 00     MX
    ADC #$2010                      ; $80C117  69 10 20     MX
    STA $2118                       ; $80C11A  8D 18 21     MX
    LDA #$3E11                      ; $80C11D  A9 11 3E     MX
    STA $2116                       ; $80C120  8D 16 21     MX
    LDA $0E43                       ; $80C123  AD 43 0E     MX
    AND #$00FF                      ; $80C126  29 FF 00     MX
    ADC #$2010                      ; $80C129  69 10 20     MX
    STA $2118                       ; $80C12C  8D 18 21     MX
    LDA #$3E15                      ; $80C12F  A9 15 3E     MX
    STA $2116                       ; $80C132  8D 16 21     MX
    LDA $0E44                       ; $80C135  AD 44 0E     MX
    AND #$00FF                      ; $80C138  29 FF 00     MX
    ADC #$2010                      ; $80C13B  69 10 20     MX
    STA $2118                       ; $80C13E  8D 18 21     MX
L_80C141:
    RTS                             ; $80C141  60           MX
L_80C142:
    RTS                             ; $80C142  60           MX
L_80C143:
    SEP #$20                        ; $80C143  E2 20        MX
    LDA #$80                        ; $80C145  A9 80        mX
    STA $2115                       ; $80C147  8D 15 21     mX
    REP #$20                        ; $80C14A  C2 20        mX
    LDA #$3C3D                      ; $80C14C  A9 3D 3C     MX
    STA $2116                       ; $80C14F  8D 16 21     MX
    LDA $78                         ; $80C152  A5 78        MX
    STA $2118                       ; $80C154  8D 18 21     MX
    LDA $032E                       ; $80C157  AD 2E 03     MX
    BNE L_80C167                    ; $80C15A  D0 0B        MX
    LDA #$3DFD                      ; $80C15C  A9 FD 3D     MX
    STA $2116                       ; $80C15F  8D 16 21     MX
    LDA $7C                         ; $80C162  A5 7C        MX
    STA $2118                       ; $80C164  8D 18 21     MX
L_80C167:
    RTS                             ; $80C167  60           MX
L_80C168:
    LDA $1325                       ; $80C168  AD 25 13     MX
    BEQ L_80C196                    ; $80C16B  F0 29        MX
    SEP #$30                        ; $80C16D  E2 30        MX
    LDA #$80                        ; $80C16F  A9 80        mx
    STA $2115                       ; $80C171  8D 15 21     mx
    REP #$30                        ; $80C174  C2 30        mx
    LDA $1325                       ; $80C176  AD 25 13     MX
    ASL                             ; $80C179  0A           MX
    STA $68                         ; $80C17A  85 68        MX
    LDY #$0000                      ; $80C17C  A0 00 00     MX
L_80C17F:
    CPY $68                         ; $80C17F  C4 68        MX
    BEQ L_80C193                    ; $80C181  F0 10        MX
    LDA $1327,Y                     ; $80C183  B9 27 13     MX
    STA $2116                       ; $80C186  8D 16 21     MX
    LDA $1367,Y                     ; $80C189  B9 67 13     MX
    STA $2118                       ; $80C18C  8D 18 21     MX
    INY                             ; $80C18F  C8           MX
    INY                             ; $80C190  C8           MX
    BRA L_80C17F                    ; $80C191  80 EC        MX
L_80C193:
    STZ $1325                       ; $80C193  9C 25 13     MX
L_80C196:
    RTS                             ; $80C196  60           MX
L_80C197:
    LDA $0255                       ; $80C197  AD 55 02     mx
    BNE L_80C1F1                    ; $80C19A  D0 55        mx
    LDY #$00                        ; $80C19C  A0 00        mx
    LDA #$01                        ; $80C19E  A9 01        mx
    STA $0E25                       ; $80C1A0  8D 25 0E     mx
    STA $0E26                       ; $80C1A3  8D 26 0E     mx
    STA $0E27                       ; $80C1A6  8D 27 0E     mx
    STA $0E28                       ; $80C1A9  8D 28 0E     mx
    LDA #$11                        ; $80C1AC  A9 11        mx
    STA $020C                       ; $80C1AE  8D 0C 02     mx
    LDX $0299                       ; $80C1B1  AE 99 02     mx  planet
    LDA $C356,X                     ; $80C1B4  BD 56 C3     mx
    STA $020D                       ; $80C1B7  8D 0D 02     mx
    LDA #$19                        ; $80C1BA  A9 19        mx
    STA $020E                       ; $80C1BC  8D 0E 02     mx
    LDA #$1A                        ; $80C1BF  A9 1A        mx
    STA $020F                       ; $80C1C1  8D 0F 02     mx
    LDA $0BFF                       ; $80C1C4  AD FF 0B     mx
    BEQ L_80C1EB                    ; $80C1C7  F0 22        mx
    LDY #$04                        ; $80C1C9  A0 04        mx
    DEC                             ; $80C1CB  3A           mx
    BEQ L_80C1E2                    ; $80C1CC  F0 14        mx
    LDA #$19                        ; $80C1CE  A9 19        mx
    STA $020F                       ; $80C1D0  8D 0F 02     mx
    LDA $020D                       ; $80C1D3  AD 0D 02     mx
    STA $020E                       ; $80C1D6  8D 0E 02     mx
    LDA $0213                       ; $80C1D9  AD 13 02     mx
    STA $020D                       ; $80C1DC  8D 0D 02     mx
    DEC $0E26                       ; $80C1DF  CE 26 0E     mx
L_80C1E2:
    LDA $0212                       ; $80C1E2  AD 12 02     mx
    STA $020C                       ; $80C1E5  8D 0C 02     mx
    DEC $0E25                       ; $80C1E8  CE 25 0E     mx
L_80C1EB:
    STY $0E31                       ; $80C1EB  8C 31 0E     mx
    STZ $0E32                       ; $80C1EE  9C 32 0E     mx
L_80C1F1:
    RTS                             ; $80C1F1  60           mx
L_80C1F2:
    LDA $13BF                       ; $80C1F2  AD BF 13     mx
    STA $1F45                       ; $80C1F5  8D 45 1F     mx
    LDX $0299                       ; $80C1F8  AE 99 02     mx  planet
    LDA $C320,X                     ; $80C1FB  BD 20 C3     mx
    STA $1F44                       ; $80C1FE  8D 44 1F     mx
    LDA $0299                       ; $80C201  AD 99 02     mx  planet
    ASL                             ; $80C204  0A           mx
    TAX                             ; $80C205  AA           mx
    REP #$30                        ; $80C206  C2 30        mx
    PHX                             ; $80C208  DA           MX
    LDA $C326,X                     ; $80C209  BD 26 C3     MX
    JSR L_80837A                    ; $80C20C  20 7A 83     MX
    LDA #$007F                      ; $80C20F  A9 7F 00     MX
    STA $24                         ; $80C212  85 24        MX
    LDA #$89C0                      ; $80C214  A9 C0 89     MX
    STA $22                         ; $80C217  85 22        MX
    PLX                             ; $80C219  FA           MX
    PHX                             ; $80C21A  DA           MX
    LDA $C332,X                     ; $80C21B  BD 32 C3     MX
    JSR L_80837A                    ; $80C21E  20 7A 83     MX
    LDA #$007F                      ; $80C221  A9 7F 00     MX
    STA $28                         ; $80C224  85 28        MX
    LDA #$5DC0                      ; $80C226  A9 C0 5D     MX
    STA $26                         ; $80C229  85 26        MX
    PLX                             ; $80C22B  FA           MX
    PHX                             ; $80C22C  DA           MX
    LDA $C33E,X                     ; $80C22D  BD 3E C3     MX
    LDX #$2000                      ; $80C230  A2 00 20     MX
    JSR L_8082FF                    ; $80C233  20 FF 82     MX
    LDA #$0000                      ; $80C236  A9 00 00     MX
    STA $7E2000                     ; $80C239  8F 00 20 7E  MX
    PLX                             ; $80C23D  FA           MX
    PHX                             ; $80C23E  DA           MX
    LDA $C34A,X                     ; $80C23F  BD 4A C3     MX
    LDY #$4000                      ; $80C242  A0 00 40     MX
    JSR L_808363                    ; $80C245  20 63 83     MX
    PLX                             ; $80C248  FA           MX
    LDA #$0078                      ; $80C249  A9 78 00     MX
    LDY #$7F60                      ; $80C24C  A0 60 7F     MX
    JSR L_808363                    ; $80C24F  20 63 83     MX
    SEP #$30                        ; $80C252  E2 30        MX
    JSL L_928B00                    ; $80C254  22 00 8B 92  mx
    LDX $0299                       ; $80C258  AE 99 02     mx  planet
    LDA $C31A,X                     ; $80C25B  BD 1A C3     mx
    STA $88                         ; $80C25E  85 88        mx
    REP #$10                        ; $80C260  C2 10        mx
    LDX #$0000                      ; $80C262  A2 00 00     mX
    LDY #$0040                      ; $80C265  A0 40 00     mX
L_80C268:
    LDA $1B00,X                     ; $80C268  BD 00 1B     mX
    CMP #$02                        ; $80C26B  C9 02        mX
    BEQ L_80C28B                    ; $80C26D  F0 1C        mX
    CMP #$03                        ; $80C26F  C9 03        mX
    BEQ L_80C28B                    ; $80C271  F0 18        mX
    CMP #$06                        ; $80C273  C9 06        mX
    BEQ L_80C27D                    ; $80C275  F0 06        mX
    CMP #$07                        ; $80C277  C9 07        mX
    BEQ L_80C284                    ; $80C279  F0 09        mX
    BRA L_80C28D                    ; $80C27B  80 10        mX
L_80C27D:
    INC $1B0D,X                     ; $80C27D  FE 0D 1B     mX
    LDA #$04                        ; $80C280  A9 04        mX
    BRA L_80C28D                    ; $80C282  80 09        mX
L_80C284:
    INC $1B0D,X                     ; $80C284  FE 0D 1B     mX
    LDA #$05                        ; $80C287  A9 05        mX
    BRA L_80C28D                    ; $80C289  80 02        mX
L_80C28B:
    LDA #$17                        ; $80C28B  A9 17        mX
L_80C28D:
    STA $1B00,X                     ; $80C28D  9D 00 1B     mX
    LDA $1B0F,X                     ; $80C290  BD 0F 1B     mX
    CMP #$01                        ; $80C293  C9 01        mX
    BNE L_80C29F                    ; $80C295  D0 08        mX
    LDA $88                         ; $80C297  A5 88        mX
    STA $1B0F,X                     ; $80C299  9D 0F 1B     mX
    INC $1B0D,X                     ; $80C29C  FE 0D 1B     mX
L_80C29F:
    REP #$20                        ; $80C29F  C2 20        mX
    TXA                             ; $80C2A1  8A           MX
    CLC                             ; $80C2A2  18           MX
    ADC #$0010                      ; $80C2A3  69 10 00     MX
    TAX                             ; $80C2A6  AA           MX
    SEP #$20                        ; $80C2A7  E2 20        MX
    DEY                             ; $80C2A9  88           mX
    BNE L_80C268                    ; $80C2AA  D0 BC        mX
    SEP #$10                        ; $80C2AC  E2 10        mX
    RTS                             ; $80C2AE  60           mx
L_80C2AF:
    STZ $033D                       ; $80C2AF  9C 3D 03     mx  pad1_held
    STZ $033E                       ; $80C2B2  9C 3E 03     mx
    STZ $033F                       ; $80C2B5  9C 3F 03     mx  pad2_held
    STZ $0340                       ; $80C2B8  9C 40 03     mx
    LDA #$01                        ; $80C2BB  A9 01        mx
    STA $2107                       ; $80C2BD  8D 07 21     mx
    LDA #$11                        ; $80C2C0  A9 11        mx
    STA $2108                       ; $80C2C2  8D 08 21     mx
    LDA #$44                        ; $80C2C5  A9 44        mx
    STA $210B                       ; $80C2C7  8D 0B 21     mx
    STZ $2133                       ; $80C2CA  9C 33 21     mx
    LDX #$17                        ; $80C2CD  A2 17        mx
    LDA $0255                       ; $80C2CF  AD 55 02     mx
    BEQ L_80C2D6                    ; $80C2D2  F0 02        mx
    LDX #$13                        ; $80C2D4  A2 13        mx
L_80C2D6:
    STX $212C                       ; $80C2D6  8E 2C 21     mx
    STZ $212D                       ; $80C2D9  9C 2D 21     mx
    LDA #$09                        ; $80C2DC  A9 09        mx
    STA $2105                       ; $80C2DE  8D 05 21     mx
    REP #$20                        ; $80C2E1  C2 20        mx
    LDA #$3C00                      ; $80C2E3  A9 00 3C     Mx
    STA $035B                       ; $80C2E6  8D 5B 03     Mx
    SEP #$20                        ; $80C2E9  E2 20        Mx
    JSR L_80A41D                    ; $80C2EB  20 1D A4     mx
    JSR L_80A1FA                    ; $80C2EE  20 FA A1     mx
    JMP L_80A395                    ; $80C2F1  4C 95 A3     mx
L_80C2F4:
    PHB                             ; $80C2F4  8B           mx
    PHK                             ; $80C2F5  4B           mx
    PLB                             ; $80C2F6  AB           mx
    JSR L_80C2FC                    ; $80C2F7  20 FC C2     mx
    PLB                             ; $80C2FA  AB           mx
    RTL                             ; $80C2FB  6B           mx
L_80C2FC:
    STZ $4330                       ; $80C2FC  9C 30 43     mx
    LDA #$22                        ; $80C2FF  A9 22        mx
    STA $4331                       ; $80C301  8D 31 43     mx
    LDA #$7E                        ; $80C304  A9 7E        mx
    STA $4334                       ; $80C306  8D 34 43     mx
    REP #$30                        ; $80C309  C2 30        mx
    LDA #$2000                      ; $80C30B  A9 00 20     MX
    STA $4332                       ; $80C30E  8D 32 43     MX
    LDA #$0200                      ; $80C311  A9 00 02     MX
    STA $4335                       ; $80C314  8D 35 43     MX
    SEP #$30                        ; $80C317  E2 30        MX
    RTS                             ; $80C319  60           mx
    db $01,$02,$01,$01,$02,$07,$02,$03,$01,$05,$04,$06,$05,$00,$0D,$00 ; $80C31A
    db $01,$00,$11,$00,$09,$00,$15,$00,$04,$00,$0C,$00,$00,$00,$10,$00 ; $80C32A
    db $08,$00,$14,$00,$07,$00,$0F,$00,$03,$00,$13,$00,$0B,$00,$17,$00 ; $80C33A
    db $06,$00,$0E,$00,$02,$00,$12,$00,$0A,$00,$16,$00,$18,$17,$15,$12 ; $80C34A
    db $13,$14                                                         ; $80C35A
L_80C35C:
    PHB                             ; $80C35C  8B           mx
    PHK                             ; $80C35D  4B           mx
    PLB                             ; $80C35E  AB           mx
    JSR L_80C364                    ; $80C35F  20 64 C3     mx
    PLB                             ; $80C362  AB           mx
    RTL                             ; $80C363  6B           mx
L_80C364:
    STA $027D                       ; $80C364  8D 7D 02     mx
    LDX #$03                        ; $80C367  A2 03        mx
L_80C369:
    LDA $C65E,X                     ; $80C369  BD 5E C6     mx
    BIT $027D                       ; $80C36C  2C 7D 02     mx
    BEQ L_80C380                    ; $80C36F  F0 0F        mx
    LDA $1F42                       ; $80C371  AD 42 1F     mx
    STA $0CB5,X                     ; $80C374  9D B5 0C     mx
    STA $0CB1,X                     ; $80C377  9D B1 0C     mx
    STA $0C31,X                     ; $80C37A  9D 31 0C     mx
    STZ $0CA3,X                     ; $80C37D  9E A3 0C     mx
L_80C380:
    DEX                             ; $80C380  CA           mx
    BPL L_80C369                    ; $80C381  10 E6        mx
    LDA $1F42                       ; $80C383  AD 42 1F     mx
    STA $04                         ; $80C386  85 04        mx
    PHA                             ; $80C388  48           mx
    AND #$07                        ; $80C389  29 07        mx
    STA $0B87                       ; $80C38B  8D 87 0B     mx
    PLA                             ; $80C38E  68           mx
    LSR                             ; $80C38F  4A           mx
    LSR                             ; $80C390  4A           mx
    LSR                             ; $80C391  4A           mx
    STA $0B88                       ; $80C392  8D 88 0B     mx
    STZ $05                         ; $80C395  64 05        mx
    ASL $04                         ; $80C397  06 04        mx
    ASL $04                         ; $80C399  06 04        mx
    ASL $04                         ; $80C39B  06 04        mx
    ROL $05                         ; $80C39D  26 05        mx
    ASL $04                         ; $80C39F  06 04        mx
    ROL $05                         ; $80C3A1  26 05        mx
    CLC                             ; $80C3A3  18           mx
    LDA $05                         ; $80C3A4  A5 05        mx
    ADC #$1B                        ; $80C3A6  69 1B        mx
    STA $05                         ; $80C3A8  85 05        mx
    LDY #$00                        ; $80C3AA  A0 00        mx
    LDA ($04),Y                     ; $80C3AC  B1 04        mx
    STA $88                         ; $80C3AE  85 88        mx
    CMP #$15                        ; $80C3B0  C9 15        mx
    BEQ L_80C3BD                    ; $80C3B2  F0 09        mx
    CMP #$16                        ; $80C3B4  C9 16        mx
    BEQ L_80C3BD                    ; $80C3B6  F0 05        mx
    SEC                             ; $80C3B8  38           mx
    SBC #$04                        ; $80C3B9  E9 04        mx
    BRA L_80C3C0                    ; $80C3BB  80 03        mx
L_80C3BD:
    SEC                             ; $80C3BD  38           mx
    SBC #$15                        ; $80C3BE  E9 15        mx
L_80C3C0:
    STA $0B8D                       ; $80C3C0  8D 8D 0B     mx
    LDX #$03                        ; $80C3C3  A2 03        mx
L_80C3C5:
    LDA $C65E,X                     ; $80C3C5  BD 5E C6     mx
    BIT $027D                       ; $80C3C8  2C 7D 02     mx
    BEQ L_80C3D2                    ; $80C3CB  F0 05        mx
    LDA $88                         ; $80C3CD  A5 88        mx
    STA $0C35,X                     ; $80C3CF  9D 35 0C     mx
L_80C3D2:
    DEX                             ; $80C3D2  CA           mx
    BPL L_80C3C5                    ; $80C3D3  10 F0        mx
    LDA $0B87                       ; $80C3D5  AD 87 0B     mx
    ASL                             ; $80C3D8  0A           mx
    ASL                             ; $80C3D9  0A           mx
    STA $88                         ; $80C3DA  85 88        mx
    ASL                             ; $80C3DC  0A           mx
    CLC                             ; $80C3DD  18           mx
    ADC $88                         ; $80C3DE  65 88        mx
    STA $0B89                       ; $80C3E0  8D 89 0B     mx
    LDA $0B88                       ; $80C3E3  AD 88 0B     mx
    ASL                             ; $80C3E6  0A           mx
    ASL                             ; $80C3E7  0A           mx
    STA $88                         ; $80C3E8  85 88        mx
    ASL                             ; $80C3EA  0A           mx
    CLC                             ; $80C3EB  18           mx
    ADC $88                         ; $80C3EC  65 88        mx
    STA $0B8A                       ; $80C3EE  8D 8A 0B     mx
    LDA $0B8D                       ; $80C3F1  AD 8D 0B     mx
    ASL                             ; $80C3F4  0A           mx
    ASL                             ; $80C3F5  0A           mx
    ADC $1F43                       ; $80C3F6  6D 43 1F     mx
    ASL                             ; $80C3F9  0A           mx
    TAY                             ; $80C3FA  A8           mx
    DEY                             ; $80C3FB  88           mx
    DEY                             ; $80C3FC  88           mx
    LDA $0B89                       ; $80C3FD  AD 89 0B     mx
    SEC                             ; $80C400  38           mx
    SBC $0B8A                       ; $80C401  ED 8A 0B     mx
    CLC                             ; $80C404  18           mx
    ADC $C61E,Y                     ; $80C405  79 1E C6     mx
    STA $0B8B                       ; $80C408  8D 8B 0B     mx
    LDA $0B89                       ; $80C40B  AD 89 0B     mx
    CLC                             ; $80C40E  18           mx
    ADC $0B8A                       ; $80C40F  6D 8A 0B     mx
    LSR                             ; $80C412  4A           mx
    CLC                             ; $80C413  18           mx
    ADC $C62E,Y                     ; $80C414  79 2E C6     mx
    STA $0B8C                       ; $80C417  8D 8C 0B     mx
    LDA #$57                        ; $80C41A  A9 57        mx
    CLC                             ; $80C41C  18           mx
    ADC $0B8B                       ; $80C41D  6D 8B 0B     mx
    STA $4C                         ; $80C420  85 4C        mx
    LDA $027D                       ; $80C422  AD 7D 02     mx
    BIT #$01                        ; $80C425  89 01        mx
    BEQ L_80C43D                    ; $80C427  F0 14        mx
    LDA $4C                         ; $80C429  A5 4C        mx
    JSR L_80C5E8                    ; $80C42B  20 E8 C5     mx
    STZ $DC                         ; $80C42E  64 DC        mx
    STX $DE                         ; $80C430  86 DE        mx
    SEC                             ; $80C432  38           mx
    SBC #$B0                        ; $80C433  E9 B0        mx
    STA $DD                         ; $80C435  85 DD        mx
    LDA $DE                         ; $80C437  A5 DE        mx
    SBC #$00                        ; $80C439  E9 00        mx
    STA $DE                         ; $80C43B  85 DE        mx
L_80C43D:
    LDA #$03                        ; $80C43D  A9 03        mx
    CLC                             ; $80C43F  18           mx
    ADC $0B8C                       ; $80C440  6D 8C 0B     mx
    STA $4E                         ; $80C443  85 4E        mx
    LDA $027D                       ; $80C445  AD 7D 02     mx
    BIT #$01                        ; $80C448  89 01        mx
    BEQ L_80C460                    ; $80C44A  F0 14        mx
    LDA $4E                         ; $80C44C  A5 4E        mx
    JSR L_80C5E8                    ; $80C44E  20 E8 C5     mx
    STZ $EE                         ; $80C451  64 EE        mx
    STX $F0                         ; $80C453  86 F0        mx
    SEC                             ; $80C455  38           mx
    SBC #$18                        ; $80C456  E9 18        mx
    STA $EF                         ; $80C458  85 EF        mx
    LDA $F0                         ; $80C45A  A5 F0        mx
    SBC #$01                        ; $80C45C  E9 01        mx
    STA $F0                         ; $80C45E  85 F0        mx
L_80C460:
    LDA $027D                       ; $80C460  AD 7D 02     mx
    BIT #$04                        ; $80C463  89 04        mx
    BEQ L_80C497                    ; $80C465  F0 30        mx
    LDA $4C                         ; $80C467  A5 4C        mx
    CLC                             ; $80C469  18           mx
    ADC $C63E,Y                     ; $80C46A  79 3E C6     mx
    JSR L_80C5E8                    ; $80C46D  20 E8 C5     mx
    STZ $E2                         ; $80C470  64 E2        mx
    STX $E4                         ; $80C472  86 E4        mx
    SEC                             ; $80C474  38           mx
    SBC #$B0                        ; $80C475  E9 B0        mx
    STA $E3                         ; $80C477  85 E3        mx
    LDA $E4                         ; $80C479  A5 E4        mx
    SBC #$00                        ; $80C47B  E9 00        mx
    STA $E4                         ; $80C47D  85 E4        mx
    LDA $4E                         ; $80C47F  A5 4E        mx
    CLC                             ; $80C481  18           mx
    ADC $C64E,Y                     ; $80C482  79 4E C6     mx
    JSR L_80C5E8                    ; $80C485  20 E8 C5     mx
    STZ $F4                         ; $80C488  64 F4        mx
    STX $F6                         ; $80C48A  86 F6        mx
    SEC                             ; $80C48C  38           mx
    SBC #$18                        ; $80C48D  E9 18        mx
    STA $F5                         ; $80C48F  85 F5        mx
    LDA $F6                         ; $80C491  A5 F6        mx
    SBC #$01                        ; $80C493  E9 01        mx
    STA $F6                         ; $80C495  85 F6        mx
L_80C497:
    LDA $0B89                       ; $80C497  AD 89 0B     mx
    SEC                             ; $80C49A  38           mx
    SBC $0B8A                       ; $80C49B  ED 8A 0B     mx
    CLC                             ; $80C49E  18           mx
    ADC $C61F,Y                     ; $80C49F  79 1F C6     mx
    STA $0B8B                       ; $80C4A2  8D 8B 0B     mx
    LDA $0B89                       ; $80C4A5  AD 89 0B     mx
    CLC                             ; $80C4A8  18           mx
    ADC $0B8A                       ; $80C4A9  6D 8A 0B     mx
    LSR                             ; $80C4AC  4A           mx
    CLC                             ; $80C4AD  18           mx
    ADC $C62F,Y                     ; $80C4AE  79 2F C6     mx
    STA $0B8C                       ; $80C4B1  8D 8C 0B     mx
    LDA #$57                        ; $80C4B4  A9 57        mx
    CLC                             ; $80C4B6  18           mx
    ADC $0B8B                       ; $80C4B7  6D 8B 0B     mx
    STA $4D                         ; $80C4BA  85 4D        mx
    LDA $027D                       ; $80C4BC  AD 7D 02     mx
    BIT #$02                        ; $80C4BF  89 02        mx
    BEQ L_80C4D7                    ; $80C4C1  F0 14        mx
    LDA $4D                         ; $80C4C3  A5 4D        mx
    JSR L_80C5E8                    ; $80C4C5  20 E8 C5     mx
    STZ $DF                         ; $80C4C8  64 DF        mx
    STX $E1                         ; $80C4CA  86 E1        mx
    SEC                             ; $80C4CC  38           mx
    SBC #$B0                        ; $80C4CD  E9 B0        mx
    STA $E0                         ; $80C4CF  85 E0        mx
    LDA $E1                         ; $80C4D1  A5 E1        mx
    SBC #$00                        ; $80C4D3  E9 00        mx
    STA $E1                         ; $80C4D5  85 E1        mx
L_80C4D7:
    LDA #$03                        ; $80C4D7  A9 03        mx
    CLC                             ; $80C4D9  18           mx
    ADC $0B8C                       ; $80C4DA  6D 8C 0B     mx
    STA $4F                         ; $80C4DD  85 4F        mx
    LDA $027D                       ; $80C4DF  AD 7D 02     mx
    BIT #$02                        ; $80C4E2  89 02        mx
    BEQ L_80C4FA                    ; $80C4E4  F0 14        mx
    LDA $4F                         ; $80C4E6  A5 4F        mx
    JSR L_80C5E8                    ; $80C4E8  20 E8 C5     mx
    STZ $F1                         ; $80C4EB  64 F1        mx
    STX $F3                         ; $80C4ED  86 F3        mx
    SEC                             ; $80C4EF  38           mx
    SBC #$18                        ; $80C4F0  E9 18        mx
    STA $F2                         ; $80C4F2  85 F2        mx
    LDA $F3                         ; $80C4F4  A5 F3        mx
    SBC #$01                        ; $80C4F6  E9 01        mx
    STA $F3                         ; $80C4F8  85 F3        mx
L_80C4FA:
    LDA $027D                       ; $80C4FA  AD 7D 02     mx
    BIT #$08                        ; $80C4FD  89 08        mx
    BEQ L_80C531                    ; $80C4FF  F0 30        mx
    LDA $4D                         ; $80C501  A5 4D        mx
    CLC                             ; $80C503  18           mx
    ADC $C63F,Y                     ; $80C504  79 3F C6     mx
    JSR L_80C5E8                    ; $80C507  20 E8 C5     mx
    STZ $E5                         ; $80C50A  64 E5        mx
    STX $E7                         ; $80C50C  86 E7        mx
    SEC                             ; $80C50E  38           mx
    SBC #$B0                        ; $80C50F  E9 B0        mx
    STA $E6                         ; $80C511  85 E6        mx
    LDA $E7                         ; $80C513  A5 E7        mx
    SBC #$00                        ; $80C515  E9 00        mx
    STA $E7                         ; $80C517  85 E7        mx
    LDA $4F                         ; $80C519  A5 4F        mx
    CLC                             ; $80C51B  18           mx
    ADC $C64F,Y                     ; $80C51C  79 4F C6     mx
    JSR L_80C5E8                    ; $80C51F  20 E8 C5     mx
    STZ $F7                         ; $80C522  64 F7        mx
    STX $F9                         ; $80C524  86 F9        mx
    SEC                             ; $80C526  38           mx
    SBC #$18                        ; $80C527  E9 18        mx
    STA $F8                         ; $80C529  85 F8        mx
    LDA $F9                         ; $80C52B  A5 F9        mx
    SBC #$01                        ; $80C52D  E9 01        mx
    STA $F9                         ; $80C52F  85 F9        mx
L_80C531:
    LDA $032E                       ; $80C531  AD 2E 03     mx
    BEQ L_80C544                    ; $80C534  F0 0E        mx
    LDA $027D                       ; $80C536  AD 7D 02     mx
    BIT #$01                        ; $80C539  89 01        mx
    BEQ L_80C544                    ; $80C53B  F0 07        mx
    LDA $4E                         ; $80C53D  A5 4E        mx
    SEC                             ; $80C53F  38           mx
    SBC #$07                        ; $80C540  E9 07        mx
    STA $4E                         ; $80C542  85 4E        mx
L_80C544:
    LDA $027D                       ; $80C544  AD 7D 02     mx
    BIT #$01                        ; $80C547  89 01        mx
    BEQ L_80C55A                    ; $80C549  F0 0F        mx
    LDA $C5FE,Y                     ; $80C54B  B9 FE C5     mx
    STA $0C7A                       ; $80C54E  8D 7A 0C     mx
    STA $0A4F                       ; $80C551  8D 4F 0A     mx
    LDA $C60E,Y                     ; $80C554  B9 0E C6     mx
    STA $0E21                       ; $80C557  8D 21 0E     mx
L_80C55A:
    LDA $027D                       ; $80C55A  AD 7D 02     mx
    BIT #$02                        ; $80C55D  89 02        mx
    BEQ L_80C570                    ; $80C55F  F0 0F        mx
    LDA $C5FF,Y                     ; $80C561  B9 FF C5     mx
    STA $0C7B                       ; $80C564  8D 7B 0C     mx
    STA $0A50                       ; $80C567  8D 50 0A     mx
    LDA $C60F,Y                     ; $80C56A  B9 0F C6     mx
    STA $0E22                       ; $80C56D  8D 22 0E     mx
L_80C570:
    LDA $027D                       ; $80C570  AD 7D 02     mx
    BIT #$04                        ; $80C573  89 04        mx
    BEQ L_80C586                    ; $80C575  F0 0F        mx
    LDA $C5FE,Y                     ; $80C577  B9 FE C5     mx
    STA $0C7C                       ; $80C57A  8D 7C 0C     mx
    STA $0A51                       ; $80C57D  8D 51 0A     mx
    LDA $C60E,Y                     ; $80C580  B9 0E C6     mx
    STA $0E23                       ; $80C583  8D 23 0E     mx
L_80C586:
    LDA $027D                       ; $80C586  AD 7D 02     mx
    BIT #$08                        ; $80C589  89 08        mx
    BEQ L_80C59C                    ; $80C58B  F0 0F        mx
    LDA $C5FF,Y                     ; $80C58D  B9 FF C5     mx
    STA $0C7D                       ; $80C590  8D 7D 0C     mx
    STA $0A52                       ; $80C593  8D 52 0A     mx
    LDA $C60F,Y                     ; $80C596  B9 0F C6     mx
    STA $0E24                       ; $80C599  8D 24 0E     mx
L_80C59C:
    LDX #$03                        ; $80C59C  A2 03        mx
L_80C59E:
    LDA $C65E,X                     ; $80C59E  BD 5E C6     mx
    BIT $027D                       ; $80C5A1  2C 7D 02     mx
    BEQ L_80C5BE                    ; $80C5A4  F0 18        mx
    REP #$20                        ; $80C5A6  C2 20        mx
    LDA $DD,X                       ; $80C5A8  B5 DD        Mx
    STA $0C5B,X                     ; $80C5AA  9D 5B 0C     Mx
    LDA $EF,X                       ; $80C5AD  B5 EF        Mx
    STA $0C67,X                     ; $80C5AF  9D 67 0C     Mx
    SEP #$20                        ; $80C5B2  E2 20        Mx
    LDA $DC,X                       ; $80C5B4  B5 DC        mx
    STA $0C5A,X                     ; $80C5B6  9D 5A 0C     mx
    LDA $EE,X                       ; $80C5B9  B5 EE        mx
    STA $0C66,X                     ; $80C5BB  9D 66 0C     mx
L_80C5BE:
    DEX                             ; $80C5BE  CA           mx
    BPL L_80C59E                    ; $80C5BF  10 DD        mx
    LDX #$00                        ; $80C5C1  A2 00        mx
L_80C5C3:
    LDA $C65E,X                     ; $80C5C3  BD 5E C6     mx
    BIT $027D                       ; $80C5C6  2C 7D 02     mx
    BEQ L_80C5E2                    ; $80C5C9  F0 17        mx
    LDA $0C7A,X                     ; $80C5CB  BD 7A 0C     mx
    LSR                             ; $80C5CE  4A           mx
    LSR                             ; $80C5CF  4A           mx
    LSR                             ; $80C5D0  4A           mx
    TAY                             ; $80C5D1  A8           mx
    LDA $C5FA,Y                     ; $80C5D2  B9 FA C5     mx
    CLC                             ; $80C5D5  18           mx
    ADC $0CB1,X                     ; $80C5D6  7D B1 0C     mx
    STA $0CA7,X                     ; $80C5D9  9D A7 0C     mx
    STA $0CAD,X                     ; $80C5DC  9D AD 0C     mx
    STA $0CC9,X                     ; $80C5DF  9D C9 0C     mx
L_80C5E2:
    INX                             ; $80C5E2  E8           mx
    CPX #$04                        ; $80C5E3  E0 04        mx
    BCC L_80C5C3                    ; $80C5E5  90 DC        mx
    RTS                             ; $80C5E7  60           mx
L_80C5E8:
    STA $211B                       ; $80C5E8  8D 1B 21     mx
    STZ $211B                       ; $80C5EB  9C 1B 21     mx
    LDA #$08                        ; $80C5EE  A9 08        mx
    STA $211C                       ; $80C5F0  8D 1C 21     mx
    LDA $2134                       ; $80C5F3  AD 34 21     mx
    LDX $2135                       ; $80C5F6  AE 35 21     mx
    RTS                             ; $80C5F9  60           mx
    db $F8,$FF,$08,$01,$1C,$1C,$0C,$0C,$1C,$0C,$0C,$1C,$14,$14,$04,$04 ; $80C5FA
    db $14,$04,$04,$14,$00,$00,$01,$01,$00,$01,$01,$00,$00,$00,$01,$01 ; $80C60A
    db $00,$01,$01,$00,$FE,$00,$01,$03,$FC,$03,$01,$FE,$05,$03,$01,$FF ; $80C61A
    db $05,$FD,$FF,$03,$FF,$FE,$00,$FF,$FD,$FF,$00,$FC,$FE,$FD,$FF,$FE ; $80C62A
    db $FD,$FF,$00,$FC,$FE,$02,$FE,$02,$FD,$03,$03,$FD,$02,$FE,$02,$FE ; $80C63A
    db $03,$FD,$FD,$03,$01,$FF,$01,$FF,$FE,$02,$02,$FE,$01,$FF,$01,$FF ; $80C64A
    db $FE,$02,$02,$FE,$01,$02,$04,$08                                 ; $80C65A
L_80C662:
    LDY $0C7A                       ; $80C662  AC 7A 0C     mx
    LDA $DB8C,Y                     ; $80C665  B9 8C DB     mx
    STA $0AEB                       ; $80C668  8D EB 0A     mx
    LDA $032E                       ; $80C66B  AD 2E 03     mx
    BEQ L_80C679                    ; $80C66E  F0 09        mx
    LDA $0AD9                       ; $80C670  AD D9 0A     mx
    CLC                             ; $80C673  18           mx
    ADC $DBAC,Y                     ; $80C674  79 AC DB     mx
    BRA L_80C680                    ; $80C677  80 07        mx
L_80C679:
    LDA $0AD9                       ; $80C679  AD D9 0A     mx
    CLC                             ; $80C67C  18           mx
    ADC $DBCC,Y                     ; $80C67D  79 CC DB     mx
L_80C680:
    STA $0AED                       ; $80C680  8D ED 0A     mx
    LDY $0C7B                       ; $80C683  AC 7B 0C     mx
    LDA $DB8C,Y                     ; $80C686  B9 8C DB     mx
    STA $0AEC                       ; $80C689  8D EC 0A     mx
    LDA #$9E                        ; $80C68C  A9 9E        mx
    CLC                             ; $80C68E  18           mx
    ADC $DBCC,Y                     ; $80C68F  79 CC DB     mx
    STA $0AEE                       ; $80C692  8D EE 0A     mx
    LDY #$00                        ; $80C695  A0 00        mx
    LDX #$00                        ; $80C697  A2 00        mx
    JSR L_80C6A0                    ; $80C699  20 A0 C6     mx
    LDY #$01                        ; $80C69C  A0 01        mx
    LDX #$02                        ; $80C69E  A2 02        mx
L_80C6A0:
    LDA $0ADB,X                     ; $80C6A0  BD DB 0A     mx
    STA $0AE3,X                     ; $80C6A3  9D E3 0A     mx
    LDA $0ADF,X                     ; $80C6A6  BD DF 0A     mx
    STA $0AE7,X                     ; $80C6A9  9D E7 0A     mx
    LDA $0A1A,Y                     ; $80C6AC  B9 1A 0A     mx
    BNE L_80C6EB                    ; $80C6AF  D0 3A        mx
    LDA $0CC1,Y                     ; $80C6B1  B9 C1 0C     mx
    BNE L_80C6EB                    ; $80C6B4  D0 35        mx
    LDA $0EDF,Y                     ; $80C6B6  B9 DF 0E     mx
    BEQ L_80C6EB                    ; $80C6B9  F0 30        mx
    LDA $0ADB,X                     ; $80C6BB  BD DB 0A     mx
    CMP $0AEB,Y                     ; $80C6BE  D9 EB 0A     mx
    BEQ L_80C6D3                    ; $80C6C1  F0 10        mx
    BCC L_80C6CD                    ; $80C6C3  90 08        mx
    DEC $0ADB,X                     ; $80C6C5  DE DB 0A     mx
    DEC $0ADB,X                     ; $80C6C8  DE DB 0A     mx
    BRA L_80C6D3                    ; $80C6CB  80 06        mx
L_80C6CD:
    INC $0ADB,X                     ; $80C6CD  FE DB 0A     mx
    INC $0ADB,X                     ; $80C6D0  FE DB 0A     mx
L_80C6D3:
    LDA $0ADF,X                     ; $80C6D3  BD DF 0A     mx
    CMP $0AED,Y                     ; $80C6D6  D9 ED 0A     mx
    BEQ L_80C6EB                    ; $80C6D9  F0 10        mx
    BCC L_80C6E5                    ; $80C6DB  90 08        mx
    DEC $0ADF,X                     ; $80C6DD  DE DF 0A     mx
    DEC $0ADF,X                     ; $80C6E0  DE DF 0A     mx
    BRA L_80C6EB                    ; $80C6E3  80 06        mx
L_80C6E5:
    INC $0ADF,X                     ; $80C6E5  FE DF 0A     mx
    INC $0ADF,X                     ; $80C6E8  FE DF 0A     mx
L_80C6EB:
    RTS                             ; $80C6EB  60           mx
L_80C6EC:
    PHP                             ; $80C6EC  08           mx
    SEP #$20                        ; $80C6ED  E2 20        mx
    STZ $032E                       ; $80C6EF  9C 2E 03     mx
    STZ $032F                       ; $80C6F2  9C 2F 03     mx
    LDA $0BFF                       ; $80C6F5  AD FF 0B     mx
    BEQ L_80C700                    ; $80C6F8  F0 06        mx
    DEC                             ; $80C6FA  3A           mx
    BEQ L_80C707                    ; $80C6FB  F0 0A        mx
    DEC                             ; $80C6FD  3A           mx
    BEQ L_80C70A                    ; $80C6FE  F0 0A        mx
L_80C700:
    LDA $0F0E                       ; $80C700  AD 0E 0F     mx
    BIT #$02                        ; $80C703  89 02        mx
    BEQ L_80C70A                    ; $80C705  F0 03        mx
L_80C707:
    INC $032E                       ; $80C707  EE 2E 03     mx
L_80C70A:
    PLP                             ; $80C70A  28           mx
    RTS                             ; $80C70B  60           mx
L_80C70C:
    REP #$30                        ; $80C70C  C2 30        mx
    LDX #$0000                      ; $80C70E  A2 00 00     MX
    LDA #$0080                      ; $80C711  A9 80 00     MX
L_80C714:
    STA $13FA,X                     ; $80C714  9D FA 13     MX
    STA $150A,X                     ; $80C717  9D 0A 15     MX
    INX                             ; $80C71A  E8           MX
    INX                             ; $80C71B  E8           MX
    STZ $13FA,X                     ; $80C71C  9E FA 13     MX
    STZ $150A,X                     ; $80C71F  9E 0A 15     MX
    INX                             ; $80C722  E8           MX
    INX                             ; $80C723  E8           MX
    CPX #$0100                      ; $80C724  E0 00 01     MX
    BCC L_80C714                    ; $80C727  90 EB        MX
    LDX #$0000                      ; $80C729  A2 00 00     MX
    LDA #$FFFF                      ; $80C72C  A9 FF FF     MX
L_80C72F:
    STA $14FA,X                     ; $80C72F  9D FA 14     MX
    STA $160A,X                     ; $80C732  9D 0A 16     MX
    INX                             ; $80C735  E8           MX
    INX                             ; $80C736  E8           MX
    CPX #$0010                      ; $80C737  E0 10 00     MX
    BCC L_80C72F                    ; $80C73A  90 F3        MX
    STZ $13F6                       ; $80C73C  9C F6 13     MX
    SEP #$30                        ; $80C73F  E2 30        MX
    STZ $4340                       ; $80C741  9C 40 43     mx
    LDA #$04                        ; $80C744  A9 04        mx
    STA $4341                       ; $80C746  8D 41 43     mx
    LDA #$7E                        ; $80C749  A9 7E        mx
    STA $4344                       ; $80C74B  8D 44 43     mx
    RTS                             ; $80C74E  60           mx
L_80C74F:
    REP #$30                        ; $80C74F  C2 30        mx
    LDA $13F6                       ; $80C751  AD F6 13     MX
    BEQ L_80C77E                    ; $80C754  F0 28        MX
    LDY #$00FE                      ; $80C756  A0 FE 00     MX
L_80C759:
    LDA $13FA,Y                     ; $80C759  B9 FA 13     MX
    STA $161A,Y                     ; $80C75C  99 1A 16     MX
    LDA $150A,Y                     ; $80C75F  B9 0A 15     MX
    STA $183A,Y                     ; $80C762  99 3A 18     MX
    DEY                             ; $80C765  88           MX
    DEY                             ; $80C766  88           MX
    BPL L_80C759                    ; $80C767  10 F0        MX
    LDY #$000E                      ; $80C769  A0 0E 00     MX
L_80C76C:
    LDA $14FA,Y                     ; $80C76C  B9 FA 14     MX
    STA $171A,Y                     ; $80C76F  99 1A 17     MX
    LDA $160A,Y                     ; $80C772  B9 0A 16     MX
    STA $193A,Y                     ; $80C775  99 3A 19     MX
    DEY                             ; $80C778  88           MX
    DEY                             ; $80C779  88           MX
    BPL L_80C76C                    ; $80C77A  10 F0        MX
    BRA L_80C7A4                    ; $80C77C  80 26        MX
L_80C77E:
    LDY #$00FE                      ; $80C77E  A0 FE 00     MX
L_80C781:
    LDA $13FA,Y                     ; $80C781  B9 FA 13     MX
    STA $172A,Y                     ; $80C784  99 2A 17     MX
    LDA $150A,Y                     ; $80C787  B9 0A 15     MX
    STA $194A,Y                     ; $80C78A  99 4A 19     MX
    DEY                             ; $80C78D  88           MX
    DEY                             ; $80C78E  88           MX
    BPL L_80C781                    ; $80C78F  10 F0        MX
    LDY #$000E                      ; $80C791  A0 0E 00     MX
L_80C794:
    LDA $14FA,Y                     ; $80C794  B9 FA 14     MX
    STA $182A,Y                     ; $80C797  99 2A 18     MX
    LDA $160A,Y                     ; $80C79A  B9 0A 16     MX
    STA $1A4A,Y                     ; $80C79D  99 4A 1A     MX
    DEY                             ; $80C7A0  88           MX
    DEY                             ; $80C7A1  88           MX
    BPL L_80C794                    ; $80C7A2  10 F0        MX
L_80C7A4:
    LDA $13F6                       ; $80C7A4  AD F6 13     MX
    EOR #$0002                      ; $80C7A7  49 02 00     MX
    STA $13F6                       ; $80C7AA  8D F6 13     MX
    SEP #$30                        ; $80C7AD  E2 30        MX
    RTS                             ; $80C7AF  60           mx
L_80C7B0:
    STX $0BD0                       ; $80C7B0  8E D0 0B     mx
    REP #$30                        ; $80C7B3  C2 30        mx
    LDY $0F0F                       ; $80C7B5  AC 0F 0F     MX
    CPY #$0011                      ; $80C7B8  C0 11 00     MX
    BCS L_80C7D9                    ; $80C7BB  B0 1C        MX
    PHA                             ; $80C7BD  48           MX
    JSR L_80D1C7                    ; $80C7BE  20 C7 D1     MX
    STX $1257                       ; $80C7C1  8E 57 12     MX
    TXA                             ; $80C7C4  8A           MX
    ASL                             ; $80C7C5  0A           MX
    STA $1259                       ; $80C7C6  8D 59 12     MX
    PLA                             ; $80C7C9  68           MX
    SEP #$30                        ; $80C7CA  E2 30        MX
    LDX $0BD0                       ; $80C7CC  AE D0 0B     mx
    JSR L_80C7E7                    ; $80C7CF  20 E7 C7     mx
    STZ $A1                         ; $80C7D2  64 A1        mx
    STZ $A3                         ; $80C7D4  64 A3        mx
    JSR L_80BB5E                    ; $80C7D6  20 5E BB     mx
L_80C7D9:
    SEP #$30                        ; $80C7D9  E2 30        mx
    LDX $0BD0                       ; $80C7DB  AE D0 0B     mx
    RTS                             ; $80C7DE  60           mx
L_80C7DF:
    PHB                             ; $80C7DF  8B           mx
    PHK                             ; $80C7E0  4B           mx
    PLB                             ; $80C7E1  AB           mx
    JSR L_80C7E7                    ; $80C7E2  20 E7 C7     mx
    PLB                             ; $80C7E5  AB           mx
    RTL                             ; $80C7E6  6B           mx
L_80C7E7:
    PHX                             ; $80C7E7  DA           mx
    PHY                             ; $80C7E8  5A           mx
    STZ $9D                         ; $80C7E9  64 9D        mx
    STZ $9F                         ; $80C7EB  64 9F        mx
    CMP #$03                        ; $80C7ED  C9 03        mx
    BNE L_80C800                    ; $80C7EF  D0 0F        mx
    LDY $0B33,X                     ; $80C7F1  BC 33 0B     mx
    LDA $DACD,Y                     ; $80C7F4  B9 CD DA     mx
    STA $9C                         ; $80C7F7  85 9C        mx
    LDA $DAFA,Y                     ; $80C7F9  B9 FA DA     mx
    STA $9E                         ; $80C7FC  85 9E        mx
    BRA L_80C82E                    ; $80C7FE  80 2E        mx
L_80C800:
    CMP #$01                        ; $80C800  C9 01        mx
    BNE L_80C813                    ; $80C802  D0 0F        mx
    LDY $0B33,X                     ; $80C804  BC 33 0B     mx
    LDA $DA73,Y                     ; $80C807  B9 73 DA     mx
    STA $9C                         ; $80C80A  85 9C        mx
    LDA $DAA0,Y                     ; $80C80C  B9 A0 DA     mx
    STA $9E                         ; $80C80F  85 9E        mx
    BRA L_80C82E                    ; $80C811  80 1B        mx
L_80C813:
    CMP #$00                        ; $80C813  C9 00        mx
    BNE L_80C826                    ; $80C815  D0 0F        mx
    LDY $0B33,X                     ; $80C817  BC 33 0B     mx
    LDA $DA19,Y                     ; $80C81A  B9 19 DA     mx
    STA $9C                         ; $80C81D  85 9C        mx
    LDA $DA46,Y                     ; $80C81F  B9 46 DA     mx
    STA $9E                         ; $80C822  85 9E        mx
    BRA L_80C82E                    ; $80C824  80 08        mx
L_80C826:
    LDA #$10                        ; $80C826  A9 10        mx
    STA $9C                         ; $80C828  85 9C        mx
    LDA #$1A                        ; $80C82A  A9 1A        mx
    STA $9E                         ; $80C82C  85 9E        mx
L_80C82E:
    LDA $0B3B,X                     ; $80C82E  BD 3B 0B     mx
    BEQ L_80C83D                    ; $80C831  F0 0A        mx
    LDA #$17                        ; $80C833  A9 17        mx
    SEC                             ; $80C835  38           mx
    SBC $9C                         ; $80C836  E5 9C        mx
    CLC                             ; $80C838  18           mx
    ADC #$08                        ; $80C839  69 08        mx
    STA $9C                         ; $80C83B  85 9C        mx
L_80C83D:
    LDA $9C                         ; $80C83D  A5 9C        mx
    BPL L_80C843                    ; $80C83F  10 02        mx
    DEC $9D                         ; $80C841  C6 9D        mx
L_80C843:
    LDA $9E                         ; $80C843  A5 9E        mx
    BPL L_80C849                    ; $80C845  10 02        mx
    DEC $9F                         ; $80C847  C6 9F        mx
L_80C849:
    REP #$30                        ; $80C849  C2 30        mx
    LDA $9C                         ; $80C84B  A5 9C        MX
    AND #$8000                      ; $80C84D  29 00 80     MX
    LSR $9C                         ; $80C850  46 9C        MX
    ORA $9C                         ; $80C852  05 9C        MX
    STA $9C                         ; $80C854  85 9C        MX
    LDA $9E                         ; $80C856  A5 9E        MX
    AND #$8000                      ; $80C858  29 00 80     MX
    LSR $9E                         ; $80C85B  46 9E        MX
    ORA $9E                         ; $80C85D  05 9E        MX
    STA $9E                         ; $80C85F  85 9E        MX
    SEP #$30                        ; $80C861  E2 30        MX
    PLY                             ; $80C863  7A           mx
    PLX                             ; $80C864  FA           mx
    RTS                             ; $80C865  60           mx
L_80C866:
    JSR L_80C87D                    ; $80C866  20 7D C8     mx
    REP #$30                        ; $80C869  C2 30        mx
    JSR L_80C8D2                    ; $80C86B  20 D2 C8     MX
    JSR L_80C952                    ; $80C86E  20 52 C9     MX
    JSR L_80D6C7                    ; $80C871  20 C7 D6     MX
    JSR L_80CAE4                    ; $80C874  20 E4 CA     MX
    JSR L_80CAAE                    ; $80C877  20 AE CA     MX
    SEP #$30                        ; $80C87A  E2 30        MX
    RTS                             ; $80C87C  60           mx
L_80C87D:
    LDA $0E3B                       ; $80C87D  AD 3B 0E     mx
    ASL                             ; $80C880  0A           mx
    ASL                             ; $80C881  0A           mx
    TAY                             ; $80C882  A8           mx
    LDA $0EA9,Y                     ; $80C883  B9 A9 0E     mx
    STA $0E40                       ; $80C886  8D 40 0E     mx
    LDA $0E33                       ; $80C889  AD 33 0E     mx
    ASL                             ; $80C88C  0A           mx
    ASL                             ; $80C88D  0A           mx
    TAY                             ; $80C88E  A8           mx
    LDA $0E91,Y                     ; $80C88F  B9 91 0E     mx
    STA $0E3F                       ; $80C892  8D 3F 0E     mx
    LDA $0E37                       ; $80C895  AD 37 0E     mx
    ASL                             ; $80C898  0A           mx
    ASL                             ; $80C899  0A           mx
    TAY                             ; $80C89A  A8           mx
    LDA $0E91,Y                     ; $80C89B  B9 91 0E     mx
    CPY #$08                        ; $80C89E  C0 08        mx
    BNE L_80C8A4                    ; $80C8A0  D0 02        mx
    INC                             ; $80C8A2  1A           mx
    LSR                             ; $80C8A3  4A           mx
L_80C8A4:
    STA $0E41                       ; $80C8A4  8D 41 0E     mx
    LDA $0E3C                       ; $80C8A7  AD 3C 0E     mx
    ASL                             ; $80C8AA  0A           mx
    ASL                             ; $80C8AB  0A           mx
    TAY                             ; $80C8AC  A8           mx
    LDA $0EAA,Y                     ; $80C8AD  B9 AA 0E     mx
    STA $0E43                       ; $80C8B0  8D 43 0E     mx
    LDA $0E34                       ; $80C8B3  AD 34 0E     mx
    ASL                             ; $80C8B6  0A           mx
    ASL                             ; $80C8B7  0A           mx
    TAY                             ; $80C8B8  A8           mx
    LDA $0E92,Y                     ; $80C8B9  B9 92 0E     mx
    STA $0E42                       ; $80C8BC  8D 42 0E     mx
    LDA $0E38                       ; $80C8BF  AD 38 0E     mx
    ASL                             ; $80C8C2  0A           mx
    ASL                             ; $80C8C3  0A           mx
    TAY                             ; $80C8C4  A8           mx
    LDA $0E92,Y                     ; $80C8C5  B9 92 0E     mx
    CPY #$08                        ; $80C8C8  C0 08        mx
    BNE L_80C8CE                    ; $80C8CA  D0 02        mx
    INC                             ; $80C8CC  1A           mx
    LSR                             ; $80C8CD  4A           mx
L_80C8CE:
    STA $0E44                       ; $80C8CE  8D 44 0E     mx
    RTS                             ; $80C8D1  60           mx
L_80C8D2:
    LDA $0255                       ; $80C8D2  AD 55 02     MX
    BNE L_80C903                    ; $80C8D5  D0 2C        MX
    SEP #$30                        ; $80C8D7  E2 30        MX
    LDA $0B49                       ; $80C8D9  AD 49 0B     mx
    INC                             ; $80C8DC  1A           mx
    AND #$0F                        ; $80C8DD  29 0F        mx
    STA $0B49                       ; $80C8DF  8D 49 0B     mx
    LSR                             ; $80C8E2  4A           mx
    LSR                             ; $80C8E3  4A           mx
    LDX #$00                        ; $80C8E4  A2 00        mx
    JSR L_80C904                    ; $80C8E6  20 04 C9     mx
    LDX #$04                        ; $80C8E9  A2 04        mx
    INC                             ; $80C8EB  1A           mx
    AND #$03                        ; $80C8EC  29 03        mx
    JSR L_80C904                    ; $80C8EE  20 04 C9     mx
    LDX #$08                        ; $80C8F1  A2 08        mx
    INC                             ; $80C8F3  1A           mx
    AND #$03                        ; $80C8F4  29 03        mx
    JSR L_80C904                    ; $80C8F6  20 04 C9     mx
    LDX #$0C                        ; $80C8F9  A2 0C        mx
    INC                             ; $80C8FB  1A           mx
    AND #$03                        ; $80C8FC  29 03        mx
    JSR L_80C904                    ; $80C8FE  20 04 C9     mx
    REP #$30                        ; $80C901  C2 30        mx
L_80C903:
    RTS                             ; $80C903  60           MX
L_80C904:
    STA $88                         ; $80C904  85 88        mx
    TAY                             ; $80C906  A8           mx
    LDA $0EDF,Y                     ; $80C907  B9 DF 0E     mx
    BEQ L_80C943                    ; $80C90A  F0 37        mx
    LDA $0C82,Y                     ; $80C90C  B9 82 0C     mx
    BNE L_80C943                    ; $80C90F  D0 32        mx
    LDA $0EF1,Y                     ; $80C911  B9 F1 0E     mx
    BEQ L_80C943                    ; $80C914  F0 2D        mx
    LDA $0C31,Y                     ; $80C916  B9 31 0C     mx
    PHA                             ; $80C919  48           mx
    AND #$07                        ; $80C91A  29 07        mx
    INC                             ; $80C91C  1A           mx
    ASL                             ; $80C91D  0A           mx
    ASL                             ; $80C91E  0A           mx
    ASL                             ; $80C91F  0A           mx
    STA $13FA,X                     ; $80C920  9D FA 13     mx
    STA $150A,X                     ; $80C923  9D 0A 15     mx
    PLA                             ; $80C926  68           mx
    AND #$38                        ; $80C927  29 38        mx
    CLC                             ; $80C929  18           mx
    ADC #$08                        ; $80C92A  69 08        mx
    STA $13FB,X                     ; $80C92C  9D FB 13     mx
    CLC                             ; $80C92F  18           mx
    ADC #$70                        ; $80C930  69 70        mx
    STA $150B,X                     ; $80C932  9D 0B 15     mx
    LDY $88                         ; $80C935  A4 88        mx
    LDA $C94E,Y                     ; $80C937  B9 4E C9     mx
    STA $13FD,X                     ; $80C93A  9D FD 13     mx
    STA $150D,X                     ; $80C93D  9D 0D 15     mx
    LDA $88                         ; $80C940  A5 88        mx
    RTS                             ; $80C942  60           mx
L_80C943:
    LDA #$E1                        ; $80C943  A9 E1        mx
    STA $13FB,X                     ; $80C945  9D FB 13     mx
    STA $150B,X                     ; $80C948  9D 0B 15     mx
    LDA $88                         ; $80C94B  A5 88        mx
    RTS                             ; $80C94D  60           mx
    db $30,$32,$34,$36                                                 ; $80C94E
L_80C952:
    LDA $0EDF                       ; $80C952  AD DF 0E     MX
    AND #$00FF                      ; $80C955  29 FF 00     MX
    LDX #$0000                      ; $80C958  A2 00 00     MX
    JSR L_80C98A                    ; $80C95B  20 8A C9     MX
    LDA $0EE0                       ; $80C95E  AD E0 0E     MX
    AND #$00FF                      ; $80C961  29 FF 00     MX
    LDX #$000C                      ; $80C964  A2 0C 00     MX
    JSR L_80C98A                    ; $80C967  20 8A C9     MX
    LDA #$0AF1                      ; $80C96A  A9 F1 0A     MX
    STA $4312                       ; $80C96D  8D 12 43     MX
    LDA #$000C                      ; $80C970  A9 0C 00     MX
    STA $4315                       ; $80C973  8D 15 43     MX
    SEP #$30                        ; $80C976  E2 30        MX
    LDA #$01                        ; $80C978  A9 01        mx
    STA $4310                       ; $80C97A  8D 10 43     mx
    LDA #$18                        ; $80C97D  A9 18        mx
    STA $4311                       ; $80C97F  8D 11 43     mx
    LDA #$7E                        ; $80C982  A9 7E        mx
    STA $4314                       ; $80C984  8D 14 43     mx
    REP #$30                        ; $80C987  C2 30        mx
    RTS                             ; $80C989  60           MX
L_80C98A:
    LDY #$2450                      ; $80C98A  A0 50 24     MX
    CMP #$0005                      ; $80C98D  C9 05 00     MX
    BCS L_80C995                    ; $80C990  B0 03        MX
    LDY #$2C50                      ; $80C992  A0 50 2C     MX
L_80C995:
    STY $88                         ; $80C995  84 88        MX
    LDY #$0006                      ; $80C997  A0 06 00     MX
L_80C99A:
    CMP #$0000                      ; $80C99A  C9 00 00     MX
    BEQ L_80C9AF                    ; $80C99D  F0 10        MX
    DEC                             ; $80C99F  3A           MX
    BEQ L_80C9A9                    ; $80C9A0  F0 07        MX
    DEC                             ; $80C9A2  3A           MX
    PHA                             ; $80C9A3  48           MX
    LDA #$0002                      ; $80C9A4  A9 02 00     MX
    BRA L_80C9B3                    ; $80C9A7  80 0A        MX
L_80C9A9:
    PHA                             ; $80C9A9  48           MX
    LDA #$0001                      ; $80C9AA  A9 01 00     MX
    BRA L_80C9B3                    ; $80C9AD  80 04        MX
L_80C9AF:
    PHA                             ; $80C9AF  48           MX
    LDA #$0000                      ; $80C9B0  A9 00 00     MX
L_80C9B3:
    CLC                             ; $80C9B3  18           MX
    ADC $88                         ; $80C9B4  65 88        MX
    STA $0AF1,X                     ; $80C9B6  9D F1 0A     MX
    INX                             ; $80C9B9  E8           MX
    INX                             ; $80C9BA  E8           MX
    PLA                             ; $80C9BB  68           MX
    DEY                             ; $80C9BC  88           MX
    BNE L_80C99A                    ; $80C9BD  D0 DB        MX
    RTS                             ; $80C9BF  60           MX
L_80C9C0:
    REP #$30                        ; $80C9C0  C2 30        mx
    LDA #$0079                      ; $80C9C2  A9 79 00     MX
    JSR L_8083A3                    ; $80C9C5  20 A3 83     MX
    SEP #$30                        ; $80C9C8  E2 30        MX
    LDA #$80                        ; $80C9CA  A9 80        mx
    STA $2115                       ; $80C9CC  8D 15 21     mx
    REP #$30                        ; $80C9CF  C2 30        mx
    LDA #$3C2B                      ; $80C9D1  A9 2B 3C     MX
    STA $0A42                       ; $80C9D4  8D 42 0A     MX
    LDA $0E33                       ; $80C9D7  AD 33 0E     MX
    AND #$00FF                      ; $80C9DA  29 FF 00     MX
    JSR L_80CA3B                    ; $80C9DD  20 3B CA     MX
    LDA #$3C2F                      ; $80C9E0  A9 2F 3C     MX
    STA $0A42                       ; $80C9E3  8D 42 0A     MX
    LDA $0E3B                       ; $80C9E6  AD 3B 0E     MX
    AND #$00FF                      ; $80C9E9  29 FF 00     MX
    CLC                             ; $80C9EC  18           MX
    ADC #$0006                      ; $80C9ED  69 06 00     MX
    JSR L_80CA3B                    ; $80C9F0  20 3B CA     MX
    LDA #$3C33                      ; $80C9F3  A9 33 3C     MX
    STA $0A42                       ; $80C9F6  8D 42 0A     MX
    LDA $0E37                       ; $80C9F9  AD 37 0E     MX
    AND #$00FF                      ; $80C9FC  29 FF 00     MX
    JSR L_80CA3B                    ; $80C9FF  20 3B CA     MX
    LDA $032E                       ; $80CA02  AD 2E 03     MX
    BNE L_80CA38                    ; $80CA05  D0 31        MX
    LDA #$3DEB                      ; $80CA07  A9 EB 3D     MX
    STA $0A42                       ; $80CA0A  8D 42 0A     MX
    LDA $0E34                       ; $80CA0D  AD 34 0E     MX
    AND #$00FF                      ; $80CA10  29 FF 00     MX
    JSR L_80CA3B                    ; $80CA13  20 3B CA     MX
    LDA #$3DEF                      ; $80CA16  A9 EF 3D     MX
    STA $0A42                       ; $80CA19  8D 42 0A     MX
    LDA $0E3C                       ; $80CA1C  AD 3C 0E     MX
    AND #$00FF                      ; $80CA1F  29 FF 00     MX
    CLC                             ; $80CA22  18           MX
    ADC #$0006                      ; $80CA23  69 06 00     MX
    JSR L_80CA3B                    ; $80CA26  20 3B CA     MX
    LDA #$3DF3                      ; $80CA29  A9 F3 3D     MX
    STA $0A42                       ; $80CA2C  8D 42 0A     MX
    LDA $0E38                       ; $80CA2F  AD 38 0E     MX
    AND #$00FF                      ; $80CA32  29 FF 00     MX
    JSR L_80CA3B                    ; $80CA35  20 3B CA     MX
L_80CA38:
    SEP #$30                        ; $80CA38  E2 30        MX
    RTS                             ; $80CA3A  60           mx
L_80CA3B:
    PHA                             ; $80CA3B  48           MX
    LDA $0A42                       ; $80CA3C  AD 42 0A     MX
    STA $2116                       ; $80CA3F  8D 16 21     MX
    PLA                             ; $80CA42  68           MX
    ASL                             ; $80CA43  0A           MX
    CLC                             ; $80CA44  18           MX
    ADC #$2040                      ; $80CA45  69 40 20     MX
    STA $2118                       ; $80CA48  8D 18 21     MX
    INC                             ; $80CA4B  1A           MX
    STA $2118                       ; $80CA4C  8D 18 21     MX
    PHA                             ; $80CA4F  48           MX
    LDA $0A42                       ; $80CA50  AD 42 0A     MX
    CLC                             ; $80CA53  18           MX
    ADC #$0020                      ; $80CA54  69 20 00     MX
    STA $2116                       ; $80CA57  8D 16 21     MX
    PLA                             ; $80CA5A  68           MX
    CLC                             ; $80CA5B  18           MX
    ADC #$001F                      ; $80CA5C  69 1F 00     MX
    STA $2118                       ; $80CA5F  8D 18 21     MX
    INC                             ; $80CA62  1A           MX
    STA $2118                       ; $80CA63  8D 18 21     MX
    RTS                             ; $80CA66  60           MX
L_80CA67:
    SEP #$20                        ; $80CA67  E2 20        MX
    LDA #$80                        ; $80CA69  A9 80        mX
    STA $2115                       ; $80CA6B  8D 15 21     mX
    LDA $1F40                       ; $80CA6E  AD 40 1F     mX
    STA $0BE6                       ; $80CA71  8D E6 0B     mX
    STA $0BE7                       ; $80CA74  8D E7 0B     mX
    REP #$20                        ; $80CA77  C2 20        mX
    JSR L_80CAD9                    ; $80CA79  20 D9 CA     MX
    STA $78                         ; $80CA7C  85 78        MX
    STA $7C                         ; $80CA7E  85 7C        MX
    LDX #$3C38                      ; $80CA80  A2 38 3C     MX
    JSR L_80CA92                    ; $80CA83  20 92 CA     MX
    LDA $032E                       ; $80CA86  AD 2E 03     MX
    BNE L_80CA91                    ; $80CA89  D0 06        MX
    LDX #$3DF8                      ; $80CA8B  A2 F8 3D     MX
    JSR L_80CA92                    ; $80CA8E  20 92 CA     MX
L_80CA91:
    RTS                             ; $80CA91  60           MX
L_80CA92:
    STX $2116                       ; $80CA92  8E 16 21     MX
    LDA #$202C                      ; $80CA95  A9 2C 20     MX
    STA $2118                       ; $80CA98  8D 18 21     MX
    LDA #$2021                      ; $80CA9B  A9 21 20     MX
    STA $2118                       ; $80CA9E  8D 18 21     MX
    LDA #$2030                      ; $80CAA1  A9 30 20     MX
    STA $2118                       ; $80CAA4  8D 18 21     MX
    LDA #$2033                      ; $80CAA7  A9 33 20     MX
    STA $2118                       ; $80CAAA  8D 18 21     MX
    RTS                             ; $80CAAD  60           MX
L_80CAAE:
    SEP #$20                        ; $80CAAE  E2 20        MX
    LDA $0EF1                       ; $80CAB0  AD F1 0E     mX
    CMP $0BE6                       ; $80CAB3  CD E6 0B     mX
    BCS L_80CAC2                    ; $80CAB6  B0 0A        mX
    STA $0BE6                       ; $80CAB8  8D E6 0B     mX
    REP #$20                        ; $80CABB  C2 20        mX
    JSR L_80CAD9                    ; $80CABD  20 D9 CA     MX
    STA $78                         ; $80CAC0  85 78        MX
L_80CAC2:
    SEP #$20                        ; $80CAC2  E2 20        MX
    LDA $0EF2                       ; $80CAC4  AD F2 0E     mX
    CMP $0BE7                       ; $80CAC7  CD E7 0B     mX
    BCS L_80CAD6                    ; $80CACA  B0 0A        mX
    STA $0BE7                       ; $80CACC  8D E7 0B     mX
    REP #$20                        ; $80CACF  C2 20        mX
    JSR L_80CAD9                    ; $80CAD1  20 D9 CA     MX
    STA $7C                         ; $80CAD4  85 7C        MX
L_80CAD6:
    REP #$30                        ; $80CAD6  C2 30        MX
    RTS                             ; $80CAD8  60           MX
L_80CAD9:
    PHY                             ; $80CAD9  5A           MX
    AND #$000F                      ; $80CADA  29 0F 00     MX
    ASL                             ; $80CADD  0A           MX
    TAY                             ; $80CADE  A8           MX
    LDA $DB38,Y                     ; $80CADF  B9 38 DB     MX
    PLY                             ; $80CAE2  7A           MX
    RTS                             ; $80CAE3  60           MX
L_80CAE4:
    LDX #$0000                      ; $80CAE4  A2 00 00     MX
    LDY #$0000                      ; $80CAE7  A0 00 00     MX
    JSR L_80CAF3                    ; $80CAEA  20 F3 CA     MX
    LDX #$0001                      ; $80CAED  A2 01 00     MX
    LDY #$000A                      ; $80CAF0  A0 0A 00     MX
L_80CAF3:
    LDA $0EF1,X                     ; $80CAF3  BD F1 0E     MX
    AND #$00FF                      ; $80CAF6  29 FF 00     MX
    BEQ L_80CB33                    ; $80CAF9  F0 38        MX
    JSR L_80CB34                    ; $80CAFB  20 34 CB     MX
    LDA $0BEA                       ; $80CAFE  AD EA 0B     MX
    JSR L_80CAD9                    ; $80CB01  20 D9 CA     MX
    STA $0A22,Y                     ; $80CB04  99 22 0A     MX
    LDA $0BE9                       ; $80CB07  AD E9 0B     MX
    LSR                             ; $80CB0A  4A           MX
    LSR                             ; $80CB0B  4A           MX
    LSR                             ; $80CB0C  4A           MX
    LSR                             ; $80CB0D  4A           MX
    JSR L_80CAD9                    ; $80CB0E  20 D9 CA     MX
    STA $0A24,Y                     ; $80CB11  99 24 0A     MX
    LDA $0BE9                       ; $80CB14  AD E9 0B     MX
    JSR L_80CAD9                    ; $80CB17  20 D9 CA     MX
    STA $0A26,Y                     ; $80CB1A  99 26 0A     MX
    LDA $0BE8                       ; $80CB1D  AD E8 0B     MX
    LSR                             ; $80CB20  4A           MX
    LSR                             ; $80CB21  4A           MX
    LSR                             ; $80CB22  4A           MX
    LSR                             ; $80CB23  4A           MX
    JSR L_80CAD9                    ; $80CB24  20 D9 CA     MX
    STA $0A28,Y                     ; $80CB27  99 28 0A     MX
    LDA $0BE8                       ; $80CB2A  AD E8 0B     MX
    JSR L_80CAD9                    ; $80CB2D  20 D9 CA     MX
    STA $0A2A,Y                     ; $80CB30  99 2A 0A     MX
L_80CB33:
    RTS                             ; $80CB33  60           MX
L_80CB34:
    CPX #$0000                      ; $80CB34  E0 00 00     MX
    BNE L_80CB46                    ; $80CB37  D0 0D        MX
    LDA $0BE8                       ; $80CB39  AD E8 0B     MX
    STA $0F07                       ; $80CB3C  8D 07 0F     MX
    LDA $0BE9                       ; $80CB3F  AD E9 0B     MX
    STA $0F08                       ; $80CB42  8D 08 0F     MX
    RTS                             ; $80CB45  60           MX
L_80CB46:
    LDA $0BE8                       ; $80CB46  AD E8 0B     MX
    STA $0F0A                       ; $80CB49  8D 0A 0F     MX
    LDA $0BE9                       ; $80CB4C  AD E9 0B     MX
    STA $0F0B                       ; $80CB4F  8D 0B 0F     MX
    RTS                             ; $80CB52  60           MX
L_80CB53:
    REP #$30                        ; $80CB53  C2 30        mx
    LDA #$0068                      ; $80CB55  A9 68 00     MX
    JSR L_8083A3                    ; $80CB58  20 A3 83     MX
    PEA $2200                       ; $80CB5B  F4 00 22     MX
    PEA $004C                       ; $80CB5E  F4 4C 00     MX
    JSR L_80A2E7                    ; $80CB61  20 E7 A2     MX
    PLA                             ; $80CB64  68           MX
    PLA                             ; $80CB65  68           MX
    SEP #$30                        ; $80CB66  E2 30        MX
    LDX #$00                        ; $80CB68  A2 00        mx
L_80CB6A:
    STZ $14DA,X                     ; $80CB6A  9E DA 14     mx
    STZ $15EA,X                     ; $80CB6D  9E EA 15     mx
    STZ $14DB,X                     ; $80CB70  9E DB 14     mx
    STZ $15EB,X                     ; $80CB73  9E EB 15     mx
    LDA #$4C                        ; $80CB76  A9 4C        mx
    STA $14DC,X                     ; $80CB78  9D DC 14     mx
    STA $15EC,X                     ; $80CB7B  9D EC 15     mx
    LDA #$2C                        ; $80CB7E  A9 2C        mx
    STA $14DD,X                     ; $80CB80  9D DD 14     mx
    STA $15ED,X                     ; $80CB83  9D ED 15     mx
    INX                             ; $80CB86  E8           mx
    INX                             ; $80CB87  E8           mx
    INX                             ; $80CB88  E8           mx
    INX                             ; $80CB89  E8           mx
    CPX #$10                        ; $80CB8A  E0 10        mx
    BCC L_80CB6A                    ; $80CB8C  90 DC        mx
    LDA #$AA                        ; $80CB8E  A9 AA        mx
    STA $1508                       ; $80CB90  8D 08 15     mx
    STA $1618                       ; $80CB93  8D 18 16     mx
    RTS                             ; $80CB96  60           mx
L_80CB97:
    LDY #$00                        ; $80CB97  A0 00        mx
    LDX #$00                        ; $80CB99  A2 00        mx
L_80CB9B:
    LDA $0C82,X                     ; $80CB9B  BD 82 0C     mx
    BNE L_80CBA5                    ; $80CB9E  D0 05        mx
    LDA $0C7E,X                     ; $80CBA0  BD 7E 0C     mx
    BNE L_80CBB0                    ; $80CBA3  D0 0B        mx
L_80CBA5:
    LDA #$E1                        ; $80CBA5  A9 E1        mx
    STA $14DB,Y                     ; $80CBA7  99 DB 14     mx
    STA $15EB,Y                     ; $80CBAA  99 EB 15     mx
    JMP L_80CC35                    ; $80CBAD  4C 35 CC     mx
L_80CBB0:
    LDA $0B09,X                     ; $80CBB0  BD 09 0B     mx
    CLC                             ; $80CBB3  18           mx
    ADC #$08                        ; $80CBB4  69 08        mx
    STA $14DA,Y                     ; $80CBB6  99 DA 14     mx
    LDA #$80                        ; $80CBB9  A9 80        mx
    ADC $0B0F,X                     ; $80CBBB  7D 0F 0B     mx
    PHY                             ; $80CBBE  5A           mx
    PHX                             ; $80CBBF  DA           mx
    PHA                             ; $80CBC0  48           mx
    TXA                             ; $80CBC1  8A           mx
    CLC                             ; $80CBC2  18           mx
    ADC #$1C                        ; $80CBC3  69 1C        mx
    TAY                             ; $80CBC5  A8           mx
    PLA                             ; $80CBC6  68           mx
    JSR L_80D147                    ; $80CBC7  20 47 D1     mx
    PLX                             ; $80CBCA  FA           mx
    PLY                             ; $80CBCB  7A           mx
    LDA $0B21,X                     ; $80CBCC  BD 21 0B     mx
    CLC                             ; $80CBCF  18           mx
    ADC #$08                        ; $80CBD0  69 08        mx
    STA $15EA,Y                     ; $80CBD2  99 EA 15     mx
    LDA #$80                        ; $80CBD5  A9 80        mx
    ADC $0B27,X                     ; $80CBD7  7D 27 0B     mx
    PHY                             ; $80CBDA  5A           mx
    PHX                             ; $80CBDB  DA           mx
    PHA                             ; $80CBDC  48           mx
    TXA                             ; $80CBDD  8A           mx
    CLC                             ; $80CBDE  18           mx
    ADC #$1C                        ; $80CBDF  69 1C        mx
    TAY                             ; $80CBE1  A8           mx
    PLA                             ; $80CBE2  68           mx
    JSR L_80D183                    ; $80CBE3  20 83 D1     mx
    PLX                             ; $80CBE6  FA           mx
    PLY                             ; $80CBE7  7A           mx
    STZ $9F                         ; $80CBE8  64 9F        mx
    LDA $0B1B,X                     ; $80CBEA  BD 1B 0B     mx
    BEQ L_80CBF3                    ; $80CBED  F0 04        mx
    LDA #$FF                        ; $80CBEF  A9 FF        mx
    STA $9F                         ; $80CBF1  85 9F        mx
L_80CBF3:
    LDA $0B15,X                     ; $80CBF3  BD 15 0B     mx
    STA $9E                         ; $80CBF6  85 9E        mx
    LDA $0A45,X                     ; $80CBF8  BD 45 0A     mx
    STA $A0                         ; $80CBFB  85 A0        mx
    STZ $A1                         ; $80CBFD  64 A1        mx
    LDA $0A4B,X                     ; $80CBFF  BD 4B 0A     mx
    STA $A2                         ; $80CC02  85 A2        mx
    STZ $A3                         ; $80CC04  64 A3        mx
    REP #$20                        ; $80CC06  C2 20        mx
    LDA $9E                         ; $80CC08  A5 9E        Mx
    CLC                             ; $80CC0A  18           Mx
    ADC $A0                         ; $80CC0B  65 A0        Mx
    ADC #$001E                      ; $80CC0D  69 1E 00     Mx
    SEC                             ; $80CC10  38           Mx
    SBC $A2                         ; $80CC11  E5 A2        Mx
    CMP #$00E0                      ; $80CC13  C9 E0 00     Mx
    BCC L_80CC20                    ; $80CC16  90 08        Mx
    CMP #$FFD1                      ; $80CC18  C9 D1 FF     Mx
    BCS L_80CC20                    ; $80CC1B  B0 03        Mx
    LDA #$00E1                      ; $80CC1D  A9 E1 00     Mx
L_80CC20:
    SEP #$20                        ; $80CC20  E2 20        Mx
    STA $14DB,Y                     ; $80CC22  99 DB 14     mx
    LDA $0B2D,X                     ; $80CC25  BD 2D 0B     mx
    CLC                             ; $80CC28  18           mx
    ADC $0A45,X                     ; $80CC29  7D 45 0A     mx
    ADC #$1E                        ; $80CC2C  69 1E        mx
    SEC                             ; $80CC2E  38           mx
    SBC $0A4B,X                     ; $80CC2F  FD 4B 0A     mx
    STA $15EB,Y                     ; $80CC32  99 EB 15     mx
L_80CC35:
    INY                             ; $80CC35  C8           mx
    INY                             ; $80CC36  C8           mx
    INY                             ; $80CC37  C8           mx
    INY                             ; $80CC38  C8           mx
    INX                             ; $80CC39  E8           mx
    CPX #$04                        ; $80CC3A  E0 04        mx
    BCS L_80CC41                    ; $80CC3C  B0 03        mx
    JMP L_80CB9B                    ; $80CC3E  4C 9B CB     mx
L_80CC41:
    RTS                             ; $80CC41  60           mx
L_80CC42:
    LDA $0255                       ; $80CC42  AD 55 02     MX
    BNE L_80CC78                    ; $80CC45  D0 31        MX
    STZ $0B49                       ; $80CC47  9C 49 0B     MX
    LDA #$3C21                      ; $80CC4A  A9 21 3C     MX
    JSR L_80CC99                    ; $80CC4D  20 99 CC     MX
    LDA $032E                       ; $80CC50  AD 2E 03     MX
    BNE L_80CC5B                    ; $80CC53  D0 06        MX
    LDA #$3DE1                      ; $80CC55  A9 E1 3D     MX
    JSR L_80CC99                    ; $80CC58  20 99 CC     MX
L_80CC5B:
    SEP #$30                        ; $80CC5B  E2 30        MX
    LDX #$00                        ; $80CC5D  A2 00        mx
L_80CC5F:
    LDA $CC79,X                     ; $80CC5F  BD 79 CC     mx
    STA $13FA,X                     ; $80CC62  9D FA 13     mx
    LDA $CC89,X                     ; $80CC65  BD 89 CC     mx
    STA $150A,X                     ; $80CC68  9D 0A 15     mx
    INX                             ; $80CC6B  E8           mx
    CPX #$10                        ; $80CC6C  E0 10        mx
    BNE L_80CC5F                    ; $80CC6E  D0 EF        mx
    STZ $14FA                       ; $80CC70  9C FA 14     mx
    STZ $160A                       ; $80CC73  9C 0A 16     mx
    REP #$30                        ; $80CC76  C2 30        mx
L_80CC78:
    RTS                             ; $80CC78  60           MX
L_80CC79:
    PHP                             ; $80CC79  08           MX
    PHP                             ; $80CC7A  08           MX
    CPX $4030                       ; $80CC7B  EC 30 40     MX
    PHP                             ; $80CC7E  08           MX
    CPX $0832                       ; $80CC7F  EC 32 08     MX
    RTI                             ; $80CC82  40           MX
    db $EC,$34,$40,$40,$EC,$36,$08,$78,$EC,$30,$40,$78,$EC,$32,$08,$B0 ; $80CC83
    db $EC,$34,$40,$B0,$EC,$36                                         ; $80CC93
L_80CC99:
    STA $A0                         ; $80CC99  85 A0        MX
    LDX #$0000                      ; $80CC9B  A2 00 00     MX
    LDY #$0080                      ; $80CC9E  A0 80 00     MX
    JSR L_80CCF2                    ; $80CCA1  20 F2 CC     MX
    LDA $A0                         ; $80CCA4  A5 A0        MX
    LDX #$0080                      ; $80CCA6  A2 80 00     MX
    LDY #$0100                      ; $80CCA9  A0 00 01     MX
    JSR L_80CCF2                    ; $80CCAC  20 F2 CC     MX
    LDA $A0                         ; $80CCAF  A5 A0        MX
    LDX #$0100                      ; $80CCB1  A2 00 01     MX
    LDY #$0180                      ; $80CCB4  A0 80 01     MX
    JSR L_80CCF2                    ; $80CCB7  20 F2 CC     MX
    LDA $A0                         ; $80CCBA  A5 A0        MX
    LDX #$0180                      ; $80CCBC  A2 80 01     MX
    LDY #$0200                      ; $80CCBF  A0 00 02     MX
    JSR L_80CCF2                    ; $80CCC2  20 F2 CC     MX
    LDA $A0                         ; $80CCC5  A5 A0        MX
    LDX #$0200                      ; $80CCC7  A2 00 02     MX
    LDY #$0280                      ; $80CCCA  A0 80 02     MX
    JSR L_80CCF2                    ; $80CCCD  20 F2 CC     MX
    LDA $A0                         ; $80CCD0  A5 A0        MX
    LDX #$0280                      ; $80CCD2  A2 80 02     MX
    LDY #$0300                      ; $80CCD5  A0 00 03     MX
    JSR L_80CCF2                    ; $80CCD8  20 F2 CC     MX
    LDA $A0                         ; $80CCDB  A5 A0        MX
    LDX #$0300                      ; $80CCDD  A2 00 03     MX
    LDY #$0380                      ; $80CCE0  A0 80 03     MX
    JSR L_80CCF2                    ; $80CCE3  20 F2 CC     MX
    LDA $A0                         ; $80CCE6  A5 A0        MX
    LDX #$0380                      ; $80CCE8  A2 80 03     MX
    LDY #$0400                      ; $80CCEB  A0 00 04     MX
    JSR L_80CCF2                    ; $80CCEE  20 F2 CC     MX
    RTS                             ; $80CCF1  60           MX
L_80CCF2:
    STY $9E                         ; $80CCF2  84 9E        MX
    STA $2116                       ; $80CCF4  8D 16 21     MX
    CLC                             ; $80CCF7  18           MX
    ADC #$0020                      ; $80CCF8  69 20 00     MX
    STA $A0                         ; $80CCFB  85 A0        MX
L_80CCFD:
    LDA $1B00,X                     ; $80CCFD  BD 00 1B     MX
    AND #$00FF                      ; $80CD00  29 FF 00     MX
    ASL                             ; $80CD03  0A           MX
    TAY                             ; $80CD04  A8           MX
    LDA $CD12,Y                     ; $80CD05  B9 12 CD     MX
    STA $2118                       ; $80CD08  8D 18 21     MX
    TXA                             ; $80CD0B  8A           MX
    CLC                             ; $80CD0C  18           MX
    ADC #$0010                      ; $80CD0D  69 10 00     MX
    TAX                             ; $80CD10  AA           MX
    CPX $9E                         ; $80CD11  E4 9E        MX
    BNE L_80CCFD                    ; $80CD13  D0 E8        MX
    RTS                             ; $80CD15  60           MX
    db $5D,$20,$5E,$20,$53,$20,$54,$20,$57,$20,$58,$20,$7D,$20,$7F,$20 ; $80CD16
    db $55,$20,$7E,$20,$56,$20,$5C,$20,$7C,$20,$5F,$20,$7C,$20,$56,$20 ; $80CD26
    db $5F,$20,$5C,$20,$59,$20,$5A,$20,$5B,$20,$00,$20                 ; $80CD36
L_80CD42:
    LDA #$0080                      ; $80CD42  A9 80 00     MX
    JSR L_8083A3                    ; $80CD45  20 A3 83     MX
    LDA #$0082                      ; $80CD48  A9 82 00     MX
    JSR L_8083A3                    ; $80CD4B  20 A3 83     MX
    LDA #$0081                      ; $80CD4E  A9 81 00     MX
    LDX #$21C0                      ; $80CD51  A2 C0 21     MX
    JSR L_8082FF                    ; $80CD54  20 FF 82     MX
    LDA #$0083                      ; $80CD57  A9 83 00     MX
    LDX #$21A0                      ; $80CD5A  A2 A0 21     MX
    JMP L_8082FF                    ; $80CD5D  4C FF 82     MX
L_80CD60:
    REP #$30                        ; $80CD60  C2 30        mx
    JSR L_80CD42                    ; $80CD62  20 42 CD     MX
    SEP #$30                        ; $80CD65  E2 30        MX
    RTS                             ; $80CD67  60           mx
L_80CD68:
    JSR L_80C87D                    ; $80CD68  20 7D C8     mx
    REP #$30                        ; $80CD6B  C2 30        mx
    JSR L_80CC42                    ; $80CD6D  20 42 CC     MX
    JSR L_80C952                    ; $80CD70  20 52 C9     MX
    JSR L_80D75B                    ; $80CD73  20 5B D7     MX
    JSR L_80CAE4                    ; $80CD76  20 E4 CA     MX
    JSR L_80CA67                    ; $80CD79  20 67 CA     MX
    SEP #$30                        ; $80CD7C  E2 30        MX
    RTS                             ; $80CD7E  60           mx
L_80CD7F:
    PHB                             ; $80CD7F  8B           mx
    PHK                             ; $80CD80  4B           mx
    PLB                             ; $80CD81  AB           mx
    JSR L_80CD91                    ; $80CD82  20 91 CD     mx
    PLB                             ; $80CD85  AB           mx
    RTL                             ; $80CD86  6B           mx
L_80CD87:
    PHB                             ; $80CD87  8B           mx
    PHK                             ; $80CD88  4B           mx
    PLB                             ; $80CD89  AB           mx
    JSR L_80CD8F                    ; $80CD8A  20 8F CD     mx
    PLB                             ; $80CD8D  AB           mx
    RTL                             ; $80CD8E  6B           mx
L_80CD8F:
    LDA #$00                        ; $80CD8F  A9 00        mx
L_80CD91:
    REP #$30                        ; $80CD91  C2 30        mx
    AND #$00FF                      ; $80CD93  29 FF 00     MX
    STA $9E                         ; $80CD96  85 9E        MX
    TXA                             ; $80CD98  8A           MX
    ASL                             ; $80CD99  0A           MX
    TAY                             ; $80CD9A  A8           MX
    LDA $DC1E,Y                     ; $80CD9B  B9 1E DC     MX
    STA $08                         ; $80CD9E  85 08        MX
    LDA #$007E                      ; $80CDA0  A9 7E 00     MX
    STA $0A                         ; $80CDA3  85 0A        MX
    LDA $0E2D,X                     ; $80CDA5  BD 2D 0E     MX
    AND #$00FF                      ; $80CDA8  29 FF 00     MX
    ASL                             ; $80CDAB  0A           MX
    ASL                             ; $80CDAC  0A           MX
    ASL                             ; $80CDAD  0A           MX
    ASL                             ; $80CDAE  0A           MX
    ASL                             ; $80CDAF  0A           MX
    ADC #$D90D                      ; $80CDB0  69 0D D9     MX
    STA $04                         ; $80CDB3  85 04        MX
    LDY #$0000                      ; $80CDB5  A0 00 00     MX
L_80CDB8:
    LDA ($04),Y                     ; $80CDB8  B1 04        MX
    STA [$08],Y                     ; $80CDBA  97 08        MX
    INY                             ; $80CDBC  C8           MX
    INY                             ; $80CDBD  C8           MX
    CPY #$000C                      ; $80CDBE  C0 0C 00     MX
    BCC L_80CDB8                    ; $80CDC1  90 F5        MX
    LDA $9E                         ; $80CDC3  A5 9E        MX
    CMP #$0002                      ; $80CDC5  C9 02 00     MX
    BNE L_80CDCF                    ; $80CDC8  D0 05        MX
    LDA #$0006                      ; $80CDCA  A9 06 00     MX
    BRA L_80CDD5                    ; $80CDCD  80 06        MX
L_80CDCF:
    LDA $0DF2,X                     ; $80CDCF  BD F2 0D     MX
    AND #$00FF                      ; $80CDD2  29 FF 00     MX
L_80CDD5:
    AND #$00FF                      ; $80CDD5  29 FF 00     MX
    ASL                             ; $80CDD8  0A           MX
    ASL                             ; $80CDD9  0A           MX
    ASL                             ; $80CDDA  0A           MX
    ASL                             ; $80CDDB  0A           MX
    ASL                             ; $80CDDC  0A           MX
    ADC #$D90D                      ; $80CDDD  69 0D D9     MX
    STA $04                         ; $80CDE0  85 04        MX
    LDY #$000C                      ; $80CDE2  A0 0C 00     MX
L_80CDE5:
    LDA ($04),Y                     ; $80CDE5  B1 04        MX
    STA [$08],Y                     ; $80CDE7  97 08        MX
    INY                             ; $80CDE9  C8           MX
    INY                             ; $80CDEA  C8           MX
    CPY #$0020                      ; $80CDEB  C0 20 00     MX
    BCC L_80CDE5                    ; $80CDEE  90 F5        MX
    LDA $9E                         ; $80CDF0  A5 9E        MX
    CMP #$0001                      ; $80CDF2  C9 01 00     MX
    BNE L_80CE09                    ; $80CDF5  D0 12        MX
    LDY #$0000                      ; $80CDF7  A0 00 00     MX
L_80CDFA:
    LDA [$08],Y                     ; $80CDFA  B7 08        MX
    LSR                             ; $80CDFC  4A           MX
    AND #$3DEF                      ; $80CDFD  29 EF 3D     MX
    STA [$08],Y                     ; $80CE00  97 08        MX
    INY                             ; $80CE02  C8           MX
    INY                             ; $80CE03  C8           MX
    CPY #$0020                      ; $80CE04  C0 20 00     MX
    BCC L_80CDFA                    ; $80CE07  90 F1        MX
L_80CE09:
    SEP #$30                        ; $80CE09  E2 30        MX
    RTS                             ; $80CE0B  60           mx
    db $05,$50,$FA,$AF                                                 ; $80CE0C
L_80CE10:
    REP #$30                        ; $80CE10  C2 30        mx
    LDA #$0068                      ; $80CE12  A9 68 00     MX
    STA $0ADB                       ; $80CE15  8D DB 0A     MX
    STA $0ADD                       ; $80CE18  8D DD 0A     MX
    STA $0AE3                       ; $80CE1B  8D E3 0A     MX
    STA $0AE5                       ; $80CE1E  8D E5 0A     MX
    LDA #$009E                      ; $80CE21  A9 9E 00     MX
    STA $0AE1                       ; $80CE24  8D E1 0A     MX
    STA $0AE9                       ; $80CE27  8D E9 0A     MX
    LDA #$002C                      ; $80CE2A  A9 2C 00     MX
    LDX $032E                       ; $80CE2D  AE 2E 03     MX
    BEQ L_80CE35                    ; $80CE30  F0 03        MX
    LDA #$0064                      ; $80CE32  A9 64 00     MX
L_80CE35:
    STA $0ADF                       ; $80CE35  8D DF 0A     MX
    STA $0AE7                       ; $80CE38  8D E7 0A     MX
    STA $0AD9                       ; $80CE3B  8D D9 0A     MX
    LDA #$FFFF                      ; $80CE3E  A9 FF FF     MX
    STA $0A36                       ; $80CE41  8D 36 0A     MX
    STA $0A38                       ; $80CE44  8D 38 0A     MX
    SEP #$30                        ; $80CE47  E2 30        MX
    LDX #$00                        ; $80CE49  A2 00        mx
    JSR L_80CD8F                    ; $80CE4B  20 8F CD     mx
    LDX #$01                        ; $80CE4E  A2 01        mx
    JSR L_80CD8F                    ; $80CE50  20 8F CD     mx
    LDX #$02                        ; $80CE53  A2 02        mx
    JSR L_80CD8F                    ; $80CE55  20 8F CD     mx
    LDX #$03                        ; $80CE58  A2 03        mx
    JSR L_80CD8F                    ; $80CE5A  20 8F CD     mx
    STZ $2102                       ; $80CE5D  9C 02 21     mx
    LDA #$80                        ; $80CE60  A9 80        mx
    STA $2103                       ; $80CE62  8D 03 21     mx
    LDX #$03                        ; $80CE65  A2 03        mx
L_80CE67:
    LDY $0C7A,X                     ; $80CE67  BC 7A 0C     mx
    LDA $DB4C,Y                     ; $80CE6A  B9 4C DB     mx
    STA $0B33,X                     ; $80CE6D  9D 33 0B     mx
    LDA $DB6C,Y                     ; $80CE70  B9 6C DB     mx
    STA $0B3B,X                     ; $80CE73  9D 3B 0B     mx
    LDA #$FF                        ; $80CE76  A9 FF        mx
    STA $0B37,X                     ; $80CE78  9D 37 0B     mx
    DEX                             ; $80CE7B  CA           mx
    BPL L_80CE67                    ; $80CE7C  10 E9        mx
    RTS                             ; $80CE7E  60           mx
L_80CE7F:
    REP #$30                        ; $80CE7F  C2 30        mx
    LDA #$0000                      ; $80CE81  A9 00 00     MX
    STA $A8                         ; $80CE84  85 A8        MX
    INC                             ; $80CE86  1A           MX
    STA $AA                         ; $80CE87  85 AA        MX
    INC                             ; $80CE89  1A           MX
    STA $AC                         ; $80CE8A  85 AC        MX
    INC                             ; $80CE8C  1A           MX
    STA $AE                         ; $80CE8D  85 AE        MX
    LDA $EF                         ; $80CE8F  A5 EF        MX
    CLC                             ; $80CE91  18           MX
    ADC #$0400                      ; $80CE92  69 00 04     MX
    STA $9C                         ; $80CE95  85 9C        MX
    LDA $F2                         ; $80CE97  A5 F2        MX
    CLC                             ; $80CE99  18           MX
    ADC #$0400                      ; $80CE9A  69 00 04     MX
    STA $9E                         ; $80CE9D  85 9E        MX
    LDA $F5                         ; $80CE9F  A5 F5        MX
    CLC                             ; $80CEA1  18           MX
    ADC #$0400                      ; $80CEA2  69 00 04     MX
    STA $A0                         ; $80CEA5  85 A0        MX
    LDA $F8                         ; $80CEA7  A5 F8        MX
    CLC                             ; $80CEA9  18           MX
    ADC #$0400                      ; $80CEAA  69 00 04     MX
    STA $A2                         ; $80CEAD  85 A2        MX
L_80CEAF:
    STZ $72                         ; $80CEAF  64 72        MX
    LDX #$0000                      ; $80CEB1  A2 00 00     MX
L_80CEB4:
    LDA $9C,X                       ; $80CEB4  B5 9C        MX
    CMP $9E,X                       ; $80CEB6  D5 9E        MX
    BCS L_80CECA                    ; $80CEB8  B0 10        MX
    LDY $9E,X                       ; $80CEBA  B4 9E        MX
    STY $9C,X                       ; $80CEBC  94 9C        MX
    STA $9E,X                       ; $80CEBE  95 9E        MX
    LDA $A8,X                       ; $80CEC0  B5 A8        MX
    LDY $AA,X                       ; $80CEC2  B4 AA        MX
    STA $AA,X                       ; $80CEC4  95 AA        MX
    STY $A8,X                       ; $80CEC6  94 A8        MX
    INC $72                         ; $80CEC8  E6 72        MX
L_80CECA:
    INX                             ; $80CECA  E8           MX
    INX                             ; $80CECB  E8           MX
    CPX #$0006                      ; $80CECC  E0 06 00     MX
    BCC L_80CEB4                    ; $80CECF  90 E3        MX
    LDA $72                         ; $80CED1  A5 72        MX
    BNE L_80CEAF                    ; $80CED3  D0 DA        MX
    SEP #$30                        ; $80CED5  E2 30        MX
    LDX $A8                         ; $80CED7  A6 A8        mx
    LDY #$00                        ; $80CED9  A0 00        mx
    JSR L_80CEED                    ; $80CEDB  20 ED CE     mx
    LDX $AA                         ; $80CEDE  A6 AA        mx
    JSR L_80CEED                    ; $80CEE0  20 ED CE     mx
    LDX $AC                         ; $80CEE3  A6 AC        mx
    JSR L_80CEED                    ; $80CEE5  20 ED CE     mx
    LDX $AE                         ; $80CEE8  A6 AE        mx
    JMP L_80CEED                    ; $80CEEA  4C ED CE     mx
L_80CEED:
    PHY                             ; $80CEED  5A           mx
    LDA $0B0F,X                     ; $80CEEE  BD 0F 0B     mx
    STA $9C                         ; $80CEF1  85 9C        mx
    STA $9D                         ; $80CEF3  85 9D        mx
    LDA $0B27,X                     ; $80CEF5  BD 27 0B     mx
    STA $9E                         ; $80CEF8  85 9E        mx
    STA $9F                         ; $80CEFA  85 9F        mx
    TYA                             ; $80CEFC  98           mx
    STA $0B3F,X                     ; $80CEFD  9D 3F 0B     mx
    ASL                             ; $80CF00  0A           mx
    ASL                             ; $80CF01  0A           mx
    TAY                             ; $80CF02  A8           mx
    JSR L_80CF15                    ; $80CF03  20 15 CF     mx
    JSR L_80CFC0                    ; $80CF06  20 C0 CF     mx
    JSR L_80D041                    ; $80CF09  20 41 D0     mx
    JSR L_80D0A2                    ; $80CF0C  20 A2 D0     mx
    PLA                             ; $80CF0F  68           mx
    CLC                             ; $80CF10  18           mx
    ADC #$06                        ; $80CF11  69 06        mx
    TAY                             ; $80CF13  A8           mx
    RTS                             ; $80CF14  60           mx
L_80CF15:
    LDA $0B3B,X                     ; $80CF15  BD 3B 0B     mx
    BNE L_80CF6D                    ; $80CF18  D0 53        mx
    LDA $0B09,X                     ; $80CF1A  BD 09 0B     mx
    CLC                             ; $80CF1D  18           mx
    ADC $0B50,X                     ; $80CF1E  7D 50 0B     mx
    STA $146A,Y                     ; $80CF21  99 6A 14     mx
    STA $1476,Y                     ; $80CF24  99 76 14     mx
    CLC                             ; $80CF27  18           mx
    ADC #$10                        ; $80CF28  69 10        mx
    STA $147A,Y                     ; $80CF2A  99 7A 14     mx
    BCC L_80CF33                    ; $80CF2D  90 04        mx
    INC $9C                         ; $80CF2F  E6 9C        mx
    INC $9D                         ; $80CF31  E6 9D        mx
L_80CF33:
    CLC                             ; $80CF33  18           mx
    ADC #$10                        ; $80CF34  69 10        mx
    STA $146E,Y                     ; $80CF36  99 6E 14     mx
    STA $1472,Y                     ; $80CF39  99 72 14     mx
    STA $147E,Y                     ; $80CF3C  99 7E 14     mx
    BCC L_80CF43                    ; $80CF3F  90 02        mx
    INC $9D                         ; $80CF41  E6 9D        mx
L_80CF43:
    LDA $0B21,X                     ; $80CF43  BD 21 0B     mx
    CLC                             ; $80CF46  18           mx
    ADC $0B50,X                     ; $80CF47  7D 50 0B     mx
    STA $157A,Y                     ; $80CF4A  99 7A 15     mx
    STA $1586,Y                     ; $80CF4D  99 86 15     mx
    CLC                             ; $80CF50  18           mx
    ADC #$10                        ; $80CF51  69 10        mx
    STA $158A,Y                     ; $80CF53  99 8A 15     mx
    BCC L_80CF5C                    ; $80CF56  90 04        mx
    INC $9E                         ; $80CF58  E6 9E        mx
    INC $9F                         ; $80CF5A  E6 9F        mx
L_80CF5C:
    CLC                             ; $80CF5C  18           mx
    ADC #$10                        ; $80CF5D  69 10        mx
    STA $157E,Y                     ; $80CF5F  99 7E 15     mx
    STA $1582,Y                     ; $80CF62  99 82 15     mx
    STA $158E,Y                     ; $80CF65  99 8E 15     mx
    BCC L_80CF6C                    ; $80CF68  90 02        mx
    INC $9F                         ; $80CF6A  E6 9F        mx
L_80CF6C:
    RTS                             ; $80CF6C  60           mx
L_80CF6D:
    LDA $0B09,X                     ; $80CF6D  BD 09 0B     mx
    CLC                             ; $80CF70  18           mx
    ADC $0B50,X                     ; $80CF71  7D 50 0B     mx
    STA $146E,Y                     ; $80CF74  99 6E 14     mx
    STA $1472,Y                     ; $80CF77  99 72 14     mx
    STA $147E,Y                     ; $80CF7A  99 7E 14     mx
    CLC                             ; $80CF7D  18           mx
    ADC #$10                        ; $80CF7E  69 10        mx
    STA $146A,Y                     ; $80CF80  99 6A 14     mx
    STA $147A,Y                     ; $80CF83  99 7A 14     mx
    BCC L_80CF8C                    ; $80CF86  90 04        mx
    INC $9C                         ; $80CF88  E6 9C        mx
    INC $9D                         ; $80CF8A  E6 9D        mx
L_80CF8C:
    CLC                             ; $80CF8C  18           mx
    ADC #$10                        ; $80CF8D  69 10        mx
    STA $1476,Y                     ; $80CF8F  99 76 14     mx
    BCC L_80CF96                    ; $80CF92  90 02        mx
    INC $9D                         ; $80CF94  E6 9D        mx
L_80CF96:
    LDA $0B21,X                     ; $80CF96  BD 21 0B     mx
    CLC                             ; $80CF99  18           mx
    ADC $0B50,X                     ; $80CF9A  7D 50 0B     mx
    STA $157E,Y                     ; $80CF9D  99 7E 15     mx
    STA $1582,Y                     ; $80CFA0  99 82 15     mx
    STA $158E,Y                     ; $80CFA3  99 8E 15     mx
    CLC                             ; $80CFA6  18           mx
    ADC #$10                        ; $80CFA7  69 10        mx
    STA $157A,Y                     ; $80CFA9  99 7A 15     mx
    STA $158A,Y                     ; $80CFAC  99 8A 15     mx
    BCC L_80CFB5                    ; $80CFAF  90 04        mx
    INC $9E                         ; $80CFB1  E6 9E        mx
    INC $9F                         ; $80CFB3  E6 9F        mx
L_80CFB5:
    CLC                             ; $80CFB5  18           mx
    ADC #$10                        ; $80CFB6  69 10        mx
    STA $1586,Y                     ; $80CFB8  99 86 15     mx
    BCC L_80CFBF                    ; $80CFBB  90 02        mx
    INC $9F                         ; $80CFBD  E6 9F        mx
L_80CFBF:
    RTS                             ; $80CFBF  60           mx
L_80CFC0:
    LDA $0B1B,X                     ; $80CFC0  BD 1B 0B     mx
    BNE L_80CFF6                    ; $80CFC3  D0 31        mx
    LDA $0B15,X                     ; $80CFC5  BD 15 0B     mx
    STA $146B,Y                     ; $80CFC8  99 6B 14     mx
    STA $146F,Y                     ; $80CFCB  99 6F 14     mx
    CLC                             ; $80CFCE  18           mx
    ADC #$10                        ; $80CFCF  69 10        mx
    STA $1473,Y                     ; $80CFD1  99 73 14     mx
    LDA $0B15,X                     ; $80CFD4  BD 15 0B     mx
    CMP #$C1                        ; $80CFD7  C9 C1        mx
    BCS L_80CFE9                    ; $80CFD9  B0 0E        mx
    CLC                             ; $80CFDB  18           mx
    ADC #$20                        ; $80CFDC  69 20        mx
    STA $1477,Y                     ; $80CFDE  99 77 14     mx
    STA $147B,Y                     ; $80CFE1  99 7B 14     mx
    STA $147F,Y                     ; $80CFE4  99 7F 14     mx
    BRA L_80D025                    ; $80CFE7  80 3C        mx
L_80CFE9:
    LDA #$E0                        ; $80CFE9  A9 E0        mx
    STA $1477,Y                     ; $80CFEB  99 77 14     mx
    STA $147B,Y                     ; $80CFEE  99 7B 14     mx
    STA $147F,Y                     ; $80CFF1  99 7F 14     mx
    BRA L_80D025                    ; $80CFF4  80 2F        mx
L_80CFF6:
    LDA $0B15,X                     ; $80CFF6  BD 15 0B     mx
    CLC                             ; $80CFF9  18           mx
    ADC #$20                        ; $80CFFA  69 20        mx
    STA $1477,Y                     ; $80CFFC  99 77 14     mx
    STA $147B,Y                     ; $80CFFF  99 7B 14     mx
    STA $147F,Y                     ; $80D002  99 7F 14     mx
    LDA $0B15,X                     ; $80D005  BD 15 0B     mx
    CMP #$E1                        ; $80D008  C9 E1        mx
    BCC L_80D01A                    ; $80D00A  90 0E        mx
    STA $146B,Y                     ; $80D00C  99 6B 14     mx
    STA $146F,Y                     ; $80D00F  99 6F 14     mx
    CLC                             ; $80D012  18           mx
    ADC #$10                        ; $80D013  69 10        mx
    STA $1473,Y                     ; $80D015  99 73 14     mx
    BRA L_80D025                    ; $80D018  80 0B        mx
L_80D01A:
    LDA #$E0                        ; $80D01A  A9 E0        mx
    STA $146B,Y                     ; $80D01C  99 6B 14     mx
    STA $146F,Y                     ; $80D01F  99 6F 14     mx
    STA $1473,Y                     ; $80D022  99 73 14     mx
L_80D025:
    LDA $0B2D,X                     ; $80D025  BD 2D 0B     mx
    STA $157B,Y                     ; $80D028  99 7B 15     mx
    STA $157F,Y                     ; $80D02B  99 7F 15     mx
    CLC                             ; $80D02E  18           mx
    ADC #$10                        ; $80D02F  69 10        mx
    STA $1583,Y                     ; $80D031  99 83 15     mx
    CLC                             ; $80D034  18           mx
    ADC #$10                        ; $80D035  69 10        mx
    STA $1587,Y                     ; $80D037  99 87 15     mx
    STA $158B,Y                     ; $80D03A  99 8B 15     mx
    STA $158F,Y                     ; $80D03D  99 8F 15     mx
    RTS                             ; $80D040  60           mx
L_80D041:
    LDA $DBF4,X                     ; $80D041  BD F4 DB     mx
    STA $146C,Y                     ; $80D044  99 6C 14     mx
    STA $157C,Y                     ; $80D047  99 7C 15     mx
    CLC                             ; $80D04A  18           mx
    ADC #$04                        ; $80D04B  69 04        mx
    STA $1470,Y                     ; $80D04D  99 70 14     mx
    STA $1580,Y                     ; $80D050  99 80 15     mx
    ADC #$20                        ; $80D053  69 20        mx
    STA $1474,Y                     ; $80D055  99 74 14     mx
    STA $1584,Y                     ; $80D058  99 84 15     mx
    ADC #$1C                        ; $80D05B  69 1C        mx
    STA $1478,Y                     ; $80D05D  99 78 14     mx
    STA $1588,Y                     ; $80D060  99 88 15     mx
    ADC #$02                        ; $80D063  69 02        mx
    STA $147C,Y                     ; $80D065  99 7C 14     mx
    STA $158C,Y                     ; $80D068  99 8C 15     mx
    ADC #$02                        ; $80D06B  69 02        mx
    STA $1480,Y                     ; $80D06D  99 80 14     mx
    STA $1590,Y                     ; $80D070  99 90 15     mx
    LDA $0B3B,X                     ; $80D073  BD 3B 0B     mx
    BEQ L_80D07A                    ; $80D076  F0 02        mx
    LDA #$40                        ; $80D078  A9 40        mx
L_80D07A:
    ORA $DBFA,X                     ; $80D07A  1D FA DB     mx
    STA $146D,Y                     ; $80D07D  99 6D 14     mx
    STA $157D,Y                     ; $80D080  99 7D 15     mx
    STA $1471,Y                     ; $80D083  99 71 14     mx
    STA $1581,Y                     ; $80D086  99 81 15     mx
    STA $1475,Y                     ; $80D089  99 75 14     mx
    STA $1585,Y                     ; $80D08C  99 85 15     mx
    STA $1479,Y                     ; $80D08F  99 79 14     mx
    STA $1589,Y                     ; $80D092  99 89 15     mx
    STA $147D,Y                     ; $80D095  99 7D 14     mx
    STA $158D,Y                     ; $80D098  99 8D 15     mx
    STA $1481,Y                     ; $80D09B  99 81 14     mx
    STA $1591,Y                     ; $80D09E  99 91 15     mx
    RTS                             ; $80D0A1  60           mx
L_80D0A2:
    LDA $0B3B,X                     ; $80D0A2  BD 3B 0B     mx
    BNE L_80D0F7                    ; $80D0A5  D0 50        mx
    LDY $0B3F,X                     ; $80D0A7  BC 3F 0B     mx
    LDA $0B0F,X                     ; $80D0AA  BD 0F 0B     mx
    ORA #$80                        ; $80D0AD  09 80        mx
    JSR L_80D147                    ; $80D0AF  20 47 D1     mx
    INY                             ; $80D0B2  C8           mx
    LDA $9D                         ; $80D0B3  A5 9D        mx
    JSR L_80D147                    ; $80D0B5  20 47 D1     mx
    INY                             ; $80D0B8  C8           mx
    JSR L_80D147                    ; $80D0B9  20 47 D1     mx
    INY                             ; $80D0BC  C8           mx
    LDA $0B0F,X                     ; $80D0BD  BD 0F 0B     mx
    JSR L_80D147                    ; $80D0C0  20 47 D1     mx
    INY                             ; $80D0C3  C8           mx
    LDA $9C                         ; $80D0C4  A5 9C        mx
    JSR L_80D147                    ; $80D0C6  20 47 D1     mx
    INY                             ; $80D0C9  C8           mx
    LDA $9D                         ; $80D0CA  A5 9D        mx
    JSR L_80D147                    ; $80D0CC  20 47 D1     mx
    LDY $0B3F,X                     ; $80D0CF  BC 3F 0B     mx
    LDA $0B27,X                     ; $80D0D2  BD 27 0B     mx
    ORA #$80                        ; $80D0D5  09 80        mx
    JSR L_80D183                    ; $80D0D7  20 83 D1     mx
    INY                             ; $80D0DA  C8           mx
    LDA $9F                         ; $80D0DB  A5 9F        mx
    JSR L_80D183                    ; $80D0DD  20 83 D1     mx
    INY                             ; $80D0E0  C8           mx
    JSR L_80D183                    ; $80D0E1  20 83 D1     mx
    INY                             ; $80D0E4  C8           mx
    LDA $0B27,X                     ; $80D0E5  BD 27 0B     mx
    JSR L_80D183                    ; $80D0E8  20 83 D1     mx
    INY                             ; $80D0EB  C8           mx
    LDA $9E                         ; $80D0EC  A5 9E        mx
    JSR L_80D183                    ; $80D0EE  20 83 D1     mx
    INY                             ; $80D0F1  C8           mx
    LDA $9F                         ; $80D0F2  A5 9F        mx
    JMP L_80D183                    ; $80D0F4  4C 83 D1     mx
L_80D0F7:
    LDY $0B3F,X                     ; $80D0F7  BC 3F 0B     mx
    LDA $9C                         ; $80D0FA  A5 9C        mx
    ORA #$80                        ; $80D0FC  09 80        mx
    JSR L_80D147                    ; $80D0FE  20 47 D1     mx
    INY                             ; $80D101  C8           mx
    LDA $0B0F,X                     ; $80D102  BD 0F 0B     mx
    JSR L_80D147                    ; $80D105  20 47 D1     mx
    INY                             ; $80D108  C8           mx
    JSR L_80D147                    ; $80D109  20 47 D1     mx
    INY                             ; $80D10C  C8           mx
    LDA $9D                         ; $80D10D  A5 9D        mx
    JSR L_80D147                    ; $80D10F  20 47 D1     mx
    INY                             ; $80D112  C8           mx
    LDA $9C                         ; $80D113  A5 9C        mx
    JSR L_80D147                    ; $80D115  20 47 D1     mx
    INY                             ; $80D118  C8           mx
    LDA $0B0F,X                     ; $80D119  BD 0F 0B     mx
    JSR L_80D147                    ; $80D11C  20 47 D1     mx
    LDY $0B3F,X                     ; $80D11F  BC 3F 0B     mx
    LDA $9E                         ; $80D122  A5 9E        mx
    ORA #$80                        ; $80D124  09 80        mx
    JSR L_80D183                    ; $80D126  20 83 D1     mx
    INY                             ; $80D129  C8           mx
    LDA $0B27,X                     ; $80D12A  BD 27 0B     mx
    JSR L_80D183                    ; $80D12D  20 83 D1     mx
    INY                             ; $80D130  C8           mx
    JSR L_80D183                    ; $80D131  20 83 D1     mx
    INY                             ; $80D134  C8           mx
    LDA $9F                         ; $80D135  A5 9F        mx
    JSR L_80D183                    ; $80D137  20 83 D1     mx
    INY                             ; $80D13A  C8           mx
    LDA $9E                         ; $80D13B  A5 9E        mx
    JSR L_80D183                    ; $80D13D  20 83 D1     mx
    INY                             ; $80D140  C8           mx
    LDA $0B27,X                     ; $80D141  BD 27 0B     mx
    JMP L_80D183                    ; $80D144  4C 83 D1     mx
L_80D147:
    STA $A1                         ; $80D147  85 A1        mx
    AND #$01                        ; $80D149  29 01        mx
    STA $A0                         ; $80D14B  85 A0        mx
    STX $A2                         ; $80D14D  86 A2        mx
    STY $A3                         ; $80D14F  84 A3        mx
    TYA                             ; $80D151  98           mx
    AND #$03                        ; $80D152  29 03        mx
    TAX                             ; $80D154  AA           mx
    TYA                             ; $80D155  98           mx
    LSR                             ; $80D156  4A           mx
    LSR                             ; $80D157  4A           mx
    TAY                             ; $80D158  A8           mx
    LDA $1501,Y                     ; $80D159  B9 01 15     mx
    AND $DC00,X                     ; $80D15C  3D 00 DC     mx
    STA $1501,Y                     ; $80D15F  99 01 15     mx
    LDA $A0                         ; $80D162  A5 A0        mx
    BEQ L_80D16F                    ; $80D164  F0 09        mx
    LDA $1501,Y                     ; $80D166  B9 01 15     mx
    ORA $DC04,X                     ; $80D169  1D 04 DC     mx
    STA $1501,Y                     ; $80D16C  99 01 15     mx
L_80D16F:
    LDA $A1                         ; $80D16F  A5 A1        mx
    BPL L_80D17C                    ; $80D171  10 09        mx
    LDA $1501,Y                     ; $80D173  B9 01 15     mx
    ORA $DC08,X                     ; $80D176  1D 08 DC     mx
    STA $1501,Y                     ; $80D179  99 01 15     mx
L_80D17C:
    LDA $A0                         ; $80D17C  A5 A0        mx
    LDX $A2                         ; $80D17E  A6 A2        mx
    LDY $A3                         ; $80D180  A4 A3        mx
    RTS                             ; $80D182  60           mx
L_80D183:
    STA $A1                         ; $80D183  85 A1        mx
    AND #$01                        ; $80D185  29 01        mx
    STA $A0                         ; $80D187  85 A0        mx
    STX $A2                         ; $80D189  86 A2        mx
    STY $A3                         ; $80D18B  84 A3        mx
    TYA                             ; $80D18D  98           mx
    AND #$03                        ; $80D18E  29 03        mx
    TAX                             ; $80D190  AA           mx
    TYA                             ; $80D191  98           mx
    LSR                             ; $80D192  4A           mx
    LSR                             ; $80D193  4A           mx
    TAY                             ; $80D194  A8           mx
    LDA $1611,Y                     ; $80D195  B9 11 16     mx
    AND $DC00,X                     ; $80D198  3D 00 DC     mx
    STA $1611,Y                     ; $80D19B  99 11 16     mx
    LDA $A0                         ; $80D19E  A5 A0        mx
    BEQ L_80D1AB                    ; $80D1A0  F0 09        mx
    LDA $1611,Y                     ; $80D1A2  B9 11 16     mx
    ORA $DC04,X                     ; $80D1A5  1D 04 DC     mx
    STA $1611,Y                     ; $80D1A8  99 11 16     mx
L_80D1AB:
    LDA $A1                         ; $80D1AB  A5 A1        mx
    BPL L_80D1B8                    ; $80D1AD  10 09        mx
    LDA $1611,Y                     ; $80D1AF  B9 11 16     mx
    ORA $DC08,X                     ; $80D1B2  1D 08 DC     mx
    STA $1611,Y                     ; $80D1B5  99 11 16     mx
L_80D1B8:
    LDA $A0                         ; $80D1B8  A5 A0        mx
    LDX $A2                         ; $80D1BA  A6 A2        mx
    LDY $A3                         ; $80D1BC  A4 A3        mx
    RTS                             ; $80D1BE  60           mx
L_80D1BF:
    PHB                             ; $80D1BF  8B           MX
    PHK                             ; $80D1C0  4B           MX
    PLB                             ; $80D1C1  AB           MX
    JSR L_80D1C7                    ; $80D1C2  20 C7 D1     MX
    PLB                             ; $80D1C5  AB           MX
    RTL                             ; $80D1C6  6B           MX
L_80D1C7:
    LDA $0F0F                       ; $80D1C7  AD 0F 0F     MX
    CMP #$0018                      ; $80D1CA  C9 18 00     MX
    BNE L_80D1D1                    ; $80D1CD  D0 02        MX
    CLC                             ; $80D1CF  18           MX
    RTS                             ; $80D1D0  60           MX
L_80D1D1:
    LDX #$0000                      ; $80D1D1  A2 00 00     MX
L_80D1D4:
    LDA $0F11,X                     ; $80D1D4  BD 11 0F     MX
    BEQ L_80D1DD                    ; $80D1D7  F0 04        MX
    INX                             ; $80D1D9  E8           MX
    INX                             ; $80D1DA  E8           MX
    BRA L_80D1D4                    ; $80D1DB  80 F7        MX
L_80D1DD:
    SEC                             ; $80D1DD  38           MX
    RTS                             ; $80D1DE  60           MX
L_80D1DF:
    PHA                             ; $80D1DF  48           MX
    JSR L_80D1C7                    ; $80D1E0  20 C7 D1     MX
    PLA                             ; $80D1E3  68           MX
    BCC L_80D215                    ; $80D1E4  90 2F        MX
    STA $0F41,X                     ; $80D1E6  9D 41 0F     MX
    INC $0F0F                       ; $80D1E9  EE 0F 0F     MX
    INC $0F11,X                     ; $80D1EC  FE 11 0F     MX
    LDA $0A45                       ; $80D1EF  AD 45 0A     MX
    AND #$00FF                      ; $80D1F2  29 FF 00     MX
    STA $1031,X                     ; $80D1F5  9D 31 10     MX
    TXA                             ; $80D1F8  8A           MX
    ASL                             ; $80D1F9  0A           MX
    TAX                             ; $80D1FA  AA           MX
    LDA $DB                         ; $80D1FB  A5 DB        MX
    AND #$FF00                      ; $80D1FD  29 00 FF     MX
    STA $0F71,X                     ; $80D200  9D 71 0F     MX
    LDA $DD                         ; $80D203  A5 DD        MX
    STA $0F73,X                     ; $80D205  9D 73 0F     MX
    LDA $ED                         ; $80D208  A5 ED        MX
    AND #$FF00                      ; $80D20A  29 00 FF     MX
    STA $0FD1,X                     ; $80D20D  9D D1 0F     MX
    LDA $EF                         ; $80D210  A5 EF        MX
    STA $0FD3,X                     ; $80D212  9D D3 0F     MX
L_80D215:
    RTS                             ; $80D215  60           MX
L_80D216:
    LDX #$00                        ; $80D216  A2 00        mx
    LDY #$00                        ; $80D218  A0 00        mx
    JSR L_80D2FB                    ; $80D21A  20 FB D2     mx
    LDX #$02                        ; $80D21D  A2 02        mx
    LDY #$04                        ; $80D21F  A0 04        mx
    JSR L_80D2FB                    ; $80D221  20 FB D2     mx
    LDX #$04                        ; $80D224  A2 04        mx
    LDY #$08                        ; $80D226  A0 08        mx
    JSR L_80D2FB                    ; $80D228  20 FB D2     mx
    LDX #$06                        ; $80D22B  A2 06        mx
    LDY #$0C                        ; $80D22D  A0 0C        mx
    JSR L_80D2FB                    ; $80D22F  20 FB D2     mx
    LDA $9C                         ; $80D232  A5 9C        mx
    STA $14FB                       ; $80D234  8D FB 14     mx
    LDA $9D                         ; $80D237  A5 9D        mx
    STA $160B                       ; $80D239  8D 0B 16     mx
    LDX #$08                        ; $80D23C  A2 08        mx
    LDY #$10                        ; $80D23E  A0 10        mx
    JSR L_80D2FB                    ; $80D240  20 FB D2     mx
    LDX #$0A                        ; $80D243  A2 0A        mx
    LDY #$14                        ; $80D245  A0 14        mx
    JSR L_80D2FB                    ; $80D247  20 FB D2     mx
    LDX #$0C                        ; $80D24A  A2 0C        mx
    LDY #$18                        ; $80D24C  A0 18        mx
    JSR L_80D2FB                    ; $80D24E  20 FB D2     mx
    LDX #$0E                        ; $80D251  A2 0E        mx
    LDY #$1C                        ; $80D253  A0 1C        mx
    JSR L_80D2FB                    ; $80D255  20 FB D2     mx
    LDA $9C                         ; $80D258  A5 9C        mx
    STA $14FC                       ; $80D25A  8D FC 14     mx
    LDA $9D                         ; $80D25D  A5 9D        mx
    STA $160C                       ; $80D25F  8D 0C 16     mx
    LDX #$10                        ; $80D262  A2 10        mx
    LDY #$20                        ; $80D264  A0 20        mx
    JSR L_80D2FB                    ; $80D266  20 FB D2     mx
    LDX #$12                        ; $80D269  A2 12        mx
    LDY #$24                        ; $80D26B  A0 24        mx
    JSR L_80D2FB                    ; $80D26D  20 FB D2     mx
    LDX #$14                        ; $80D270  A2 14        mx
    LDY #$28                        ; $80D272  A0 28        mx
    JSR L_80D2FB                    ; $80D274  20 FB D2     mx
    LDX #$16                        ; $80D277  A2 16        mx
    LDY #$2C                        ; $80D279  A0 2C        mx
    JSR L_80D2FB                    ; $80D27B  20 FB D2     mx
    LDA $9C                         ; $80D27E  A5 9C        mx
    STA $14FD                       ; $80D280  8D FD 14     mx
    LDA $9D                         ; $80D283  A5 9D        mx
    STA $160D                       ; $80D285  8D 0D 16     mx
    LDX #$18                        ; $80D288  A2 18        mx
    LDY #$30                        ; $80D28A  A0 30        mx
    JSR L_80D2FB                    ; $80D28C  20 FB D2     mx
    LDX #$1A                        ; $80D28F  A2 1A        mx
    LDY #$34                        ; $80D291  A0 34        mx
    JSR L_80D2FB                    ; $80D293  20 FB D2     mx
    LDX #$1C                        ; $80D296  A2 1C        mx
    LDY #$38                        ; $80D298  A0 38        mx
    JSR L_80D2FB                    ; $80D29A  20 FB D2     mx
    LDX #$1E                        ; $80D29D  A2 1E        mx
    LDY #$3C                        ; $80D29F  A0 3C        mx
    JSR L_80D2FB                    ; $80D2A1  20 FB D2     mx
    LDA $9C                         ; $80D2A4  A5 9C        mx
    STA $14FE                       ; $80D2A6  8D FE 14     mx
    LDA $9D                         ; $80D2A9  A5 9D        mx
    STA $160E                       ; $80D2AB  8D 0E 16     mx
    LDX #$20                        ; $80D2AE  A2 20        mx
    LDY #$40                        ; $80D2B0  A0 40        mx
    JSR L_80D2FB                    ; $80D2B2  20 FB D2     mx
    LDX #$22                        ; $80D2B5  A2 22        mx
    LDY #$44                        ; $80D2B7  A0 44        mx
    JSR L_80D2FB                    ; $80D2B9  20 FB D2     mx
    LDX #$24                        ; $80D2BC  A2 24        mx
    LDY #$48                        ; $80D2BE  A0 48        mx
    JSR L_80D2FB                    ; $80D2C0  20 FB D2     mx
    LDX #$26                        ; $80D2C3  A2 26        mx
    LDY #$4C                        ; $80D2C5  A0 4C        mx
    JSR L_80D2FB                    ; $80D2C7  20 FB D2     mx
    LDA $9C                         ; $80D2CA  A5 9C        mx
    STA $14FF                       ; $80D2CC  8D FF 14     mx
    LDA $9D                         ; $80D2CF  A5 9D        mx
    STA $160F                       ; $80D2D1  8D 0F 16     mx
    LDX #$28                        ; $80D2D4  A2 28        mx
    LDY #$50                        ; $80D2D6  A0 50        mx
    JSR L_80D2FB                    ; $80D2D8  20 FB D2     mx
    LDX #$2A                        ; $80D2DB  A2 2A        mx
    LDY #$54                        ; $80D2DD  A0 54        mx
    JSR L_80D2FB                    ; $80D2DF  20 FB D2     mx
    LDX #$2C                        ; $80D2E2  A2 2C        mx
    LDY #$58                        ; $80D2E4  A0 58        mx
    JSR L_80D2FB                    ; $80D2E6  20 FB D2     mx
    LDX #$2E                        ; $80D2E9  A2 2E        mx
    LDY #$5C                        ; $80D2EB  A0 5C        mx
    JSR L_80D2FB                    ; $80D2ED  20 FB D2     mx
    LDA $9C                         ; $80D2F0  A5 9C        mx
    STA $1500                       ; $80D2F2  8D 00 15     mx
    LDA $9D                         ; $80D2F5  A5 9D        mx
    STA $1610                       ; $80D2F7  8D 10 16     mx
    RTS                             ; $80D2FA  60           mx
L_80D2FB:
    LDA $0F11,X                     ; $80D2FB  BD 11 0F     mx
    BEQ L_80D343                    ; $80D2FE  F0 43        mx
    JSR L_80D356                    ; $80D300  20 56 D3     mx
    LDA $9E                         ; $80D303  A5 9E        mx
    LSR                             ; $80D305  4A           mx
    ROR $9C                         ; $80D306  66 9C        mx
    LDA $1211,X                     ; $80D308  BD 11 12     mx
    LSR                             ; $80D30B  4A           mx
    ROR $9C                         ; $80D30C  66 9C        mx
    LDA $A0                         ; $80D30E  A5 A0        mx
    STA $140A,Y                     ; $80D310  99 0A 14     mx
    LDA $A2                         ; $80D313  A5 A2        mx
    STA $140B,Y                     ; $80D315  99 0B 14     mx
    JSR L_80D3BB                    ; $80D318  20 BB D3     mx
    LDA $9E                         ; $80D31B  A5 9E        mx
    LSR                             ; $80D31D  4A           mx
    ROR $9D                         ; $80D31E  66 9D        mx
    LDA $1211,X                     ; $80D320  BD 11 12     mx
    LSR                             ; $80D323  4A           mx
    ROR $9D                         ; $80D324  66 9D        mx
    LDA $A0                         ; $80D326  A5 A0        mx
    STA $151A,Y                     ; $80D328  99 1A 15     mx
    LDA $A2                         ; $80D32B  A5 A2        mx
    STA $151B,Y                     ; $80D32D  99 1B 15     mx
    LDA $11B1,X                     ; $80D330  BD B1 11     mx
    STA $140C,Y                     ; $80D333  99 0C 14     mx
    STA $151C,Y                     ; $80D336  99 1C 15     mx
    LDA $11E1,X                     ; $80D339  BD E1 11     mx
    STA $140D,Y                     ; $80D33C  99 0D 14     mx
    STA $151D,Y                     ; $80D33F  99 1D 15     mx
    RTS                             ; $80D342  60           mx
L_80D343:
    LDA #$80                        ; $80D343  A9 80        mx
    STA $140A,Y                     ; $80D345  99 0A 14     mx
    STA $151A,Y                     ; $80D348  99 1A 15     mx
    SEC                             ; $80D34B  38           mx
    ROR $9C                         ; $80D34C  66 9C        mx
    LSR $9C                         ; $80D34E  46 9C        mx
    SEC                             ; $80D350  38           mx
    ROR $9D                         ; $80D351  66 9D        mx
    LSR $9D                         ; $80D353  46 9D        mx
    RTS                             ; $80D355  60           mx
L_80D356:
    PHY                             ; $80D356  5A           mx
    TXA                             ; $80D357  8A           mx
    ASL                             ; $80D358  0A           mx
    TAY                             ; $80D359  A8           mx
    LDA $0FD2,Y                     ; $80D35A  B9 D2 0F     mx
    SEC                             ; $80D35D  38           mx
    SBC $EE                         ; $80D35E  E5 EE        mx
    REP #$30                        ; $80D360  C2 30        mx
    STZ $9E                         ; $80D362  64 9E        MX
    LDA $0FD3,Y                     ; $80D364  B9 D3 0F     MX
    SBC $EF                         ; $80D367  E5 EF        MX
    SEC                             ; $80D369  38           MX
    SBC $1031,X                     ; $80D36A  FD 31 10     MX
    CLC                             ; $80D36D  18           MX
    ADC $0ADF                       ; $80D36E  6D DF 0A     MX
    CMP #$FFF1                      ; $80D371  C9 F1 FF     MX
    BCS L_80D384                    ; $80D374  B0 0E        MX
    CMP #$00E0                      ; $80D376  C9 E0 00     MX
    BCC L_80D384                    ; $80D379  90 09        MX
L_80D37B:
    INC $9E                         ; $80D37B  E6 9E        MX
    LDA #$0080                      ; $80D37D  A9 80 00     MX
    STA $A0                         ; $80D380  85 A0        MX
    BRA L_80D3B7                    ; $80D382  80 33        MX
L_80D384:
    STA $A2                         ; $80D384  85 A2        MX
    SEP #$30                        ; $80D386  E2 30        MX
    LDA $0F72,Y                     ; $80D388  B9 72 0F     mx
    SEC                             ; $80D38B  38           mx
    SBC $DC                         ; $80D38C  E5 DC        mx
    REP #$30                        ; $80D38E  C2 30        mx
    LDA $0F73,Y                     ; $80D390  B9 73 0F     MX
    SBC $DD                         ; $80D393  E5 DD        MX
    BMI L_80D39D                    ; $80D395  30 06        MX
    ASL                             ; $80D397  0A           MX
    AND #$7FFF                      ; $80D398  29 FF 7F     MX
    BRA L_80D3A1                    ; $80D39B  80 04        MX
L_80D39D:
    ASL                             ; $80D39D  0A           MX
    ORA #$8000                      ; $80D39E  09 00 80     MX
L_80D3A1:
    CLC                             ; $80D3A1  18           MX
    ADC $0ADB                       ; $80D3A2  6D DB 0A     MX
    CMP #$FFC0                      ; $80D3A5  C9 C0 FF     MX
    BCS L_80D3B3                    ; $80D3A8  B0 09        MX
    CMP #$0100                      ; $80D3AA  C9 00 01     MX
    BCS L_80D37B                    ; $80D3AD  B0 CC        MX
    STA $A0                         ; $80D3AF  85 A0        MX
    BRA L_80D3B7                    ; $80D3B1  80 04        MX
L_80D3B3:
    INC $9E                         ; $80D3B3  E6 9E        MX
    STA $A0                         ; $80D3B5  85 A0        MX
L_80D3B7:
    SEP #$30                        ; $80D3B7  E2 30        MX
    PLY                             ; $80D3B9  7A           mx
    RTS                             ; $80D3BA  60           mx
L_80D3BB:
    PHY                             ; $80D3BB  5A           mx
    TXA                             ; $80D3BC  8A           mx
    ASL                             ; $80D3BD  0A           mx
    TAY                             ; $80D3BE  A8           mx
    LDA $0FD2,Y                     ; $80D3BF  B9 D2 0F     mx
    SEC                             ; $80D3C2  38           mx
    SBC $F1                         ; $80D3C3  E5 F1        mx
    REP #$30                        ; $80D3C5  C2 30        mx
    STZ $9E                         ; $80D3C7  64 9E        MX
    LDA $0FD3,Y                     ; $80D3C9  B9 D3 0F     MX
    SBC $F2                         ; $80D3CC  E5 F2        MX
    SEC                             ; $80D3CE  38           MX
    SBC $1031,X                     ; $80D3CF  FD 31 10     MX
    CLC                             ; $80D3D2  18           MX
    ADC $0AE1                       ; $80D3D3  6D E1 0A     MX
    CMP #$0040                      ; $80D3D6  C9 40 00     MX
    BCC L_80D3E0                    ; $80D3D9  90 05        MX
    CMP #$00E0                      ; $80D3DB  C9 E0 00     MX
    BCC L_80D3E9                    ; $80D3DE  90 09        MX
L_80D3E0:
    INC $9E                         ; $80D3E0  E6 9E        MX
    LDA #$0080                      ; $80D3E2  A9 80 00     MX
    STA $A0                         ; $80D3E5  85 A0        MX
    BRA L_80D41C                    ; $80D3E7  80 33        MX
L_80D3E9:
    STA $A2                         ; $80D3E9  85 A2        MX
    SEP #$30                        ; $80D3EB  E2 30        MX
    LDA $0F72,Y                     ; $80D3ED  B9 72 0F     mx
    SEC                             ; $80D3F0  38           mx
    SBC $DF                         ; $80D3F1  E5 DF        mx
    REP #$30                        ; $80D3F3  C2 30        mx
    LDA $0F73,Y                     ; $80D3F5  B9 73 0F     MX
    SBC $E0                         ; $80D3F8  E5 E0        MX
    BMI L_80D402                    ; $80D3FA  30 06        MX
    ASL                             ; $80D3FC  0A           MX
    AND #$7FFF                      ; $80D3FD  29 FF 7F     MX
    BRA L_80D406                    ; $80D400  80 04        MX
L_80D402:
    ASL                             ; $80D402  0A           MX
    ORA #$8000                      ; $80D403  09 00 80     MX
L_80D406:
    CLC                             ; $80D406  18           MX
    ADC $0ADD                       ; $80D407  6D DD 0A     MX
    CMP #$FFC0                      ; $80D40A  C9 C0 FF     MX
    BCS L_80D418                    ; $80D40D  B0 09        MX
    CMP #$0100                      ; $80D40F  C9 00 01     MX
    BCS L_80D3E0                    ; $80D412  B0 CC        MX
    STA $A0                         ; $80D414  85 A0        MX
    BRA L_80D41C                    ; $80D416  80 04        MX
L_80D418:
    INC $9E                         ; $80D418  E6 9E        MX
    STA $A0                         ; $80D41A  85 A0        MX
L_80D41C:
    SEP #$30                        ; $80D41C  E2 30        MX
    PLY                             ; $80D41E  7A           mx
    RTS                             ; $80D41F  60           mx
L_80D420:
    LDX #$00                        ; $80D420  A2 00        mx
    JSR L_80D444                    ; $80D422  20 44 D4     mx
    LDX #$01                        ; $80D425  A2 01        mx
    JSR L_80D444                    ; $80D427  20 44 D4     mx
    LDX #$02                        ; $80D42A  A2 02        mx
    JSR L_80D444                    ; $80D42C  20 44 D4     mx
    LDX #$03                        ; $80D42F  A2 03        mx
    JSR L_80D444                    ; $80D431  20 44 D4     mx
    LDX #$04                        ; $80D434  A2 04        mx
    STX $0BD0                       ; $80D436  8E D0 0B     mx
    JSR L_80D5AD                    ; $80D439  20 AD D5     mx
    LDX #$05                        ; $80D43C  A2 05        mx
    STX $0BD0                       ; $80D43E  8E D0 0B     mx
    JMP L_80D5AD                    ; $80D441  4C AD D5     mx
L_80D444:
    STX $0BD0                       ; $80D444  8E D0 0B     mx
    LDA $0B37,X                     ; $80D447  BD 37 0B     mx
    CMP $0B33,X                     ; $80D44A  DD 33 0B     mx
    BEQ L_80D456                    ; $80D44D  F0 07        mx
    REP #$30                        ; $80D44F  C2 30        mx
    JSR L_80D459                    ; $80D451  20 59 D4     MX
    SEP #$30                        ; $80D454  E2 30        MX
L_80D456:
    JMP L_80D5AD                    ; $80D456  4C AD D5     mx
L_80D459:
    LDY #$0000                      ; $80D459  A0 00 00     MX
    LDA $0A36                       ; $80D45C  AD 36 0A     MX
    BMI L_80D46A                    ; $80D45F  30 09        MX
    LDY #$0002                      ; $80D461  A0 02 00     MX
    LDA $0A38                       ; $80D464  AD 38 0A     MX
    BMI L_80D46A                    ; $80D467  30 01        MX
    RTS                             ; $80D469  60           MX
L_80D46A:
    PHY                             ; $80D46A  5A           MX
    LDA $DBF4,X                     ; $80D46B  BD F4 DB     MX
    AND #$00FF                      ; $80D46E  29 FF 00     MX
    STA $0A36,Y                     ; $80D471  99 36 0A     MX
    SEP #$20                        ; $80D474  E2 20        MX
    LDA $0B33,X                     ; $80D476  BD 33 0B     mX
    STA $0B37,X                     ; $80D479  9D 37 0B     mX
    REP #$20                        ; $80D47C  C2 20        mX
    AND #$00FF                      ; $80D47E  29 FF 00     MX
    CMP #$002D                      ; $80D481  C9 2D 00     MX
    BCC L_80D48C                    ; $80D484  90 06        MX
    CLC                             ; $80D486  18           MX
    ADC #$00B4                      ; $80D487  69 B4 00     MX
    BRA L_80D499                    ; $80D48A  80 0D        MX
L_80D48C:
    PHA                             ; $80D48C  48           MX
    LDA $0DF2,X                     ; $80D48D  BD F2 0D     MX
    AND #$00FF                      ; $80D490  29 FF 00     MX
    ASL                             ; $80D493  0A           MX
    TAY                             ; $80D494  A8           MX
    PLA                             ; $80D495  68           MX
    ADC $DC0C,Y                     ; $80D496  79 0C DC     MX
L_80D499:
    PLY                             ; $80D499  7A           MX
    JMP L_80D4A5                    ; $80D49A  4C A5 D4     MX
L_80D49D:
    PHB                             ; $80D49D  8B           MX
    PHK                             ; $80D49E  4B           MX
    PLB                             ; $80D49F  AB           MX
    JSR L_80D4A5                    ; $80D4A0  20 A5 D4     MX
    PLB                             ; $80D4A3  AB           MX
    RTL                             ; $80D4A4  6B           MX
L_80D4A5:
    STA $CF                         ; $80D4A5  85 CF        MX
    LDA #$0480                      ; $80D4A7  A9 80 04     MX
    STA $D3                         ; $80D4AA  85 D3        MX
    JSR L_80D53B                    ; $80D4AC  20 3B D5     MX
    LDA $DBF0,Y                     ; $80D4AF  B9 F0 DB     MX
    STA $2181                       ; $80D4B2  8D 81 21     MX
    LDA $D5                         ; $80D4B5  A5 D5        MX
    AND #$7FFF                      ; $80D4B7  29 FF 7F     MX
    CMP #$7B81                      ; $80D4BA  C9 81 7B     MX
    BCS L_80D4D9                    ; $80D4BD  B0 1A        MX
    LDA #$0480                      ; $80D4BF  A9 80 04     MX
    STA $4375                       ; $80D4C2  8D 75 43     MX
    LDA $D5                         ; $80D4C5  A5 D5        MX
    ORA #$8000                      ; $80D4C7  09 00 80     MX
    STA $4372                       ; $80D4CA  8D 72 43     MX
    LDA $D5                         ; $80D4CD  A5 D5        MX
    ASL                             ; $80D4CF  0A           MX
    ROL $D7                         ; $80D4D0  26 D7        MX
    LDA $D7                         ; $80D4D2  A5 D7        MX
    ADC #$008A                      ; $80D4D4  69 8A 00     MX
    BRA L_80D523                    ; $80D4D7  80 4A        MX
L_80D4D9:
    STA $9C                         ; $80D4D9  85 9C        MX
    LDA #$8000                      ; $80D4DB  A9 00 80     MX
    SEC                             ; $80D4DE  38           MX
    SBC $9C                         ; $80D4DF  E5 9C        MX
    STA $9C                         ; $80D4E1  85 9C        MX
    STA $4375                       ; $80D4E3  8D 75 43     MX
    LDA $D5                         ; $80D4E6  A5 D5        MX
    ORA #$8000                      ; $80D4E8  09 00 80     MX
    STA $4372                       ; $80D4EB  8D 72 43     MX
    LDA $D5                         ; $80D4EE  A5 D5        MX
    ASL                             ; $80D4F0  0A           MX
    ROL $D7                         ; $80D4F1  26 D7        MX
    LDA $D7                         ; $80D4F3  A5 D7        MX
    ADC #$008A                      ; $80D4F5  69 8A 00     MX
    STA $D7                         ; $80D4F8  85 D7        MX
    SEP #$20                        ; $80D4FA  E2 20        MX
    STA $4374                       ; $80D4FC  8D 74 43     mX
    STZ $4370                       ; $80D4FF  9C 70 43     mX
    LDA #$80                        ; $80D502  A9 80        mX
    STA $4371                       ; $80D504  8D 71 43     mX
    STZ $2183                       ; $80D507  9C 83 21     mX
    LDA #$80                        ; $80D50A  A9 80        mX
    STA $420B                       ; $80D50C  8D 0B 42     mX
    REP #$20                        ; $80D50F  C2 20        mX
    LDA #$0480                      ; $80D511  A9 80 04     MX
    SEC                             ; $80D514  38           MX
    SBC $9C                         ; $80D515  E5 9C        MX
    STA $4375                       ; $80D517  8D 75 43     MX
    LDA #$8000                      ; $80D51A  A9 00 80     MX
    STA $4372                       ; $80D51D  8D 72 43     MX
    LDA $D7                         ; $80D520  A5 D7        MX
    INC                             ; $80D522  1A           MX
L_80D523:
    SEP #$20                        ; $80D523  E2 20        MX
    STA $4374                       ; $80D525  8D 74 43     mX
    STZ $4370                       ; $80D528  9C 70 43     mX
    LDA #$80                        ; $80D52B  A9 80        mX
    STA $4371                       ; $80D52D  8D 71 43     mX
    STZ $2183                       ; $80D530  9C 83 21     mX
    LDA #$80                        ; $80D533  A9 80        mX
    STA $420B                       ; $80D535  8D 0B 42     mX
    REP #$20                        ; $80D538  C2 20        mX
    RTS                             ; $80D53A  60           MX
L_80D53B:
    SEP #$20                        ; $80D53B  E2 20        MX
    LDA $CF                         ; $80D53D  A5 CF        mX
    STA $4202                       ; $80D53F  8D 02 42     mX
    LDA $D3                         ; $80D542  A5 D3        mX
    STA $4203                       ; $80D544  8D 03 42     mX
    REP #$20                        ; $80D547  C2 20        mX
    NOP                             ; $80D549  EA           MX
    NOP                             ; $80D54A  EA           MX
    NOP                             ; $80D54B  EA           MX
    LDA $4216                       ; $80D54C  AD 16 42     MX
    STA $D5                         ; $80D54F  85 D5        MX
    SEP #$20                        ; $80D551  E2 20        MX
    LDA $D0                         ; $80D553  A5 D0        mX
    STA $4202                       ; $80D555  8D 02 42     mX
    LDA $D4                         ; $80D558  A5 D4        mX
    STA $4203                       ; $80D55A  8D 03 42     mX
    REP #$20                        ; $80D55D  C2 20        mX
    NOP                             ; $80D55F  EA           MX
    NOP                             ; $80D560  EA           MX
    NOP                             ; $80D561  EA           MX
    LDA $4216                       ; $80D562  AD 16 42     MX
    STA $D7                         ; $80D565  85 D7        MX
    SEP #$20                        ; $80D567  E2 20        MX
    LDA $CF                         ; $80D569  A5 CF        mX
    STA $4202                       ; $80D56B  8D 02 42     mX
    LDA $D4                         ; $80D56E  A5 D4        mX
    STA $4203                       ; $80D570  8D 03 42     mX
    REP #$20                        ; $80D573  C2 20        mX
    NOP                             ; $80D575  EA           MX
    NOP                             ; $80D576  EA           MX
    NOP                             ; $80D577  EA           MX
    LDA $4216                       ; $80D578  AD 16 42     MX
    CLC                             ; $80D57B  18           MX
    ADC $D6                         ; $80D57C  65 D6        MX
    STA $D6                         ; $80D57E  85 D6        MX
    BCC L_80D584                    ; $80D580  90 02        MX
    INC $D8                         ; $80D582  E6 D8        MX
L_80D584:
    SEP #$20                        ; $80D584  E2 20        MX
    LDA $D0                         ; $80D586  A5 D0        mX
    STA $4202                       ; $80D588  8D 02 42     mX
    LDA $D3                         ; $80D58B  A5 D3        mX
    STA $4203                       ; $80D58D  8D 03 42     mX
    REP #$20                        ; $80D590  C2 20        mX
    NOP                             ; $80D592  EA           MX
    NOP                             ; $80D593  EA           MX
    NOP                             ; $80D594  EA           MX
    LDA $4216                       ; $80D595  AD 16 42     MX
    CLC                             ; $80D598  18           MX
    ADC $D6                         ; $80D599  65 D6        MX
    STA $D6                         ; $80D59B  85 D6        MX
    BCC L_80D5A1                    ; $80D59D  90 02        MX
    INC $D8                         ; $80D59F  E6 D8        MX
L_80D5A1:
    RTS                             ; $80D5A1  60           MX
L_80D5A2:
    LDA #$01                        ; $80D5A2  A9 01        mx
    STA $0B0F,X                     ; $80D5A4  9D 0F 0B     mx
    LDA #$80                        ; $80D5A7  A9 80        mx
    STA $0B09,X                     ; $80D5A9  9D 09 0B     mx
    RTS                             ; $80D5AC  60           mx
L_80D5AD:
    CPX #$04                        ; $80D5AD  E0 04        mx
    BCS L_80D5C0                    ; $80D5AF  B0 0F        mx
    LDA $0C86,X                     ; $80D5B1  BD 86 0C     mx
    BNE L_80D5C6                    ; $80D5B4  D0 10        mx
    LDA $0EDF,X                     ; $80D5B6  BD DF 0E     mx
    BNE L_80D5CE                    ; $80D5B9  D0 13        mx
    LDA $0CC1,X                     ; $80D5BB  BD C1 0C     mx
    BNE L_80D5CE                    ; $80D5BE  D0 0E        mx
L_80D5C0:
    LDA $0EDF,X                     ; $80D5C0  BD DF 0E     mx
    BNE L_80D5CE                    ; $80D5C3  D0 09        mx
    RTS                             ; $80D5C5  60           mx
L_80D5C6:
    LDA #$05                        ; $80D5C6  A9 05        mx
    STA $0B2D,X                     ; $80D5C8  9D 2D 0B     mx
    JMP L_80D5A2                    ; $80D5CB  4C A2 D5     mx
L_80D5CE:
    LDY $A024,X                     ; $80D5CE  BC 24 A0     mx
    LDA $0A45,X                     ; $80D5D1  BD 45 0A     mx
    STA $9E                         ; $80D5D4  85 9E        mx
    STZ $9F                         ; $80D5D6  64 9F        mx
    LDA $00EE,Y                     ; $80D5D8  B9 EE 00     mx
    SEC                             ; $80D5DB  38           mx
    SBC $EE                         ; $80D5DC  E5 EE        mx
    REP #$30                        ; $80D5DE  C2 30        mx
    LDA $00EF,Y                     ; $80D5E0  B9 EF 00     MX
    SBC $EF                         ; $80D5E3  E5 EF        MX
    SEC                             ; $80D5E5  38           MX
    SBC $9E                         ; $80D5E6  E5 9E        MX
    CLC                             ; $80D5E8  18           MX
    ADC $0ADF                       ; $80D5E9  6D DF 0A     MX
    CMP #$FFD1                      ; $80D5EC  C9 D1 FF     MX
    BCS L_80D5FF                    ; $80D5EF  B0 0E        MX
    CMP #$00E0                      ; $80D5F1  C9 E0 00     MX
    BCC L_80D60D                    ; $80D5F4  90 17        MX
    SEP #$30                        ; $80D5F6  E2 30        MX
    JSR L_80D5A2                    ; $80D5F8  20 A2 D5     mx
    BRA L_80D657                    ; $80D5FB  80 5A        mx
L_80D5FD:
    REP #$30                        ; $80D5FD  C2 30        mx
L_80D5FF:
    SEP #$30                        ; $80D5FF  E2 30        MX
    STA $0B15,X                     ; $80D601  9D 15 0B     mx
    LDA #$01                        ; $80D604  A9 01        mx
    STA $0B1B,X                     ; $80D606  9D 1B 0B     mx
    BRA L_80D615                    ; $80D609  80 0A        mx
L_80D60B:
    REP #$30                        ; $80D60B  C2 30        mx
L_80D60D:
    SEP #$30                        ; $80D60D  E2 30        MX
    STA $0B15,X                     ; $80D60F  9D 15 0B     mx
    STZ $0B1B,X                     ; $80D612  9E 1B 0B     mx
L_80D615:
    LDA $00DC,Y                     ; $80D615  B9 DC 00     mx
    SEC                             ; $80D618  38           mx
    SBC $DC                         ; $80D619  E5 DC        mx
    REP #$30                        ; $80D61B  C2 30        mx
    LDA $00DD,Y                     ; $80D61D  B9 DD 00     MX
    SBC $DD                         ; $80D620  E5 DD        MX
    BMI L_80D62A                    ; $80D622  30 06        MX
    ASL                             ; $80D624  0A           MX
    AND #$7FFF                      ; $80D625  29 FF 7F     MX
    BRA L_80D62E                    ; $80D628  80 04        MX
L_80D62A:
    ASL                             ; $80D62A  0A           MX
    ORA #$8000                      ; $80D62B  09 00 80     MX
L_80D62E:
    CLC                             ; $80D62E  18           MX
    ADC $0ADB                       ; $80D62F  6D DB 0A     MX
    CMP #$FFC0                      ; $80D632  C9 C0 FF     MX
    BCS L_80D64D                    ; $80D635  B0 16        MX
    CMP #$0100                      ; $80D637  C9 00 01     MX
    BCC L_80D643                    ; $80D63A  90 07        MX
    SEP #$30                        ; $80D63C  E2 30        MX
    JSR L_80D5A2                    ; $80D63E  20 A2 D5     mx
    BRA L_80D657                    ; $80D641  80 14        mx
L_80D643:
    SEP #$30                        ; $80D643  E2 30        MX
    STA $0B09,X                     ; $80D645  9D 09 0B     mx
    STZ $0B0F,X                     ; $80D648  9E 0F 0B     mx
    BRA L_80D657                    ; $80D64B  80 0A        mx
L_80D64D:
    SEP #$30                        ; $80D64D  E2 30        MX
    STA $0B09,X                     ; $80D64F  9D 09 0B     mx
    LDA #$01                        ; $80D652  A9 01        mx
    STA $0B0F,X                     ; $80D654  9D 0F 0B     mx
L_80D657:
    LDA $0A45,X                     ; $80D657  BD 45 0A     mx
    STA $9E                         ; $80D65A  85 9E        mx
    STZ $9F                         ; $80D65C  64 9F        mx
    LDA $00EE,Y                     ; $80D65E  B9 EE 00     mx
    SEC                             ; $80D661  38           mx
    SBC $F1                         ; $80D662  E5 F1        mx
    REP #$30                        ; $80D664  C2 30        mx
    LDA $00EF,Y                     ; $80D666  B9 EF 00     MX
    SBC $F2                         ; $80D669  E5 F2        MX
    SEC                             ; $80D66B  38           MX
    SBC $9E                         ; $80D66C  E5 9E        MX
    CLC                             ; $80D66E  18           MX
    ADC $0AE1                       ; $80D66F  6D E1 0A     MX
    CMP #$0040                      ; $80D672  C9 40 00     MX
    BCC L_80D67C                    ; $80D675  90 05        MX
    CMP #$00E0                      ; $80D677  C9 E0 00     MX
    BCC L_80D67F                    ; $80D67A  90 03        MX
L_80D67C:
    LDA #$0005                      ; $80D67C  A9 05 00     MX
L_80D67F:
    SEP #$30                        ; $80D67F  E2 30        MX
    STA $0B2D,X                     ; $80D681  9D 2D 0B     mx
    LDA $00DC,Y                     ; $80D684  B9 DC 00     mx
    SEC                             ; $80D687  38           mx
    SBC $DF                         ; $80D688  E5 DF        mx
    REP #$30                        ; $80D68A  C2 30        mx
    LDA $00DD,Y                     ; $80D68C  B9 DD 00     MX
    SBC $E0                         ; $80D68F  E5 E0        MX
    BMI L_80D699                    ; $80D691  30 06        MX
    ASL                             ; $80D693  0A           MX
    AND #$7FFF                      ; $80D694  29 FF 7F     MX
    BRA L_80D69D                    ; $80D697  80 04        MX
L_80D699:
    ASL                             ; $80D699  0A           MX
    ORA #$8000                      ; $80D69A  09 00 80     MX
L_80D69D:
    CLC                             ; $80D69D  18           MX
    ADC $0ADD                       ; $80D69E  6D DD 0A     MX
    CMP #$FFC0                      ; $80D6A1  C9 C0 FF     MX
    BCS L_80D6BC                    ; $80D6A4  B0 16        MX
    CMP #$0100                      ; $80D6A6  C9 00 01     MX
    BCC L_80D6B3                    ; $80D6A9  90 08        MX
    SEP #$30                        ; $80D6AB  E2 30        MX
    LDA #$05                        ; $80D6AD  A9 05        mx
    STA $0B2D,X                     ; $80D6AF  9D 2D 0B     mx
    RTS                             ; $80D6B2  60           mx
L_80D6B3:
    SEP #$30                        ; $80D6B3  E2 30        MX
    STA $0B21,X                     ; $80D6B5  9D 21 0B     mx
    STZ $0B27,X                     ; $80D6B8  9E 27 0B     mx
    RTS                             ; $80D6BB  60           mx
L_80D6BC:
    SEP #$30                        ; $80D6BC  E2 30        MX
    STA $0B21,X                     ; $80D6BE  9D 21 0B     mx
    LDA #$01                        ; $80D6C1  A9 01        mx
    STA $0B27,X                     ; $80D6C3  9D 27 0B     mx
    RTS                             ; $80D6C6  60           mx
L_80D6C7:
    LDX #$0000                      ; $80D6C7  A2 00 00     MX
    JSR L_80D6DF                    ; $80D6CA  20 DF D6     MX
    LDX #$0001                      ; $80D6CD  A2 01 00     MX
    JSR L_80D6DF                    ; $80D6D0  20 DF D6     MX
    LDX #$0002                      ; $80D6D3  A2 02 00     MX
    JSR L_80D6DF                    ; $80D6D6  20 DF D6     MX
    LDX #$0003                      ; $80D6D9  A2 03 00     MX
    JMP L_80D6DF                    ; $80D6DC  4C DF D6     MX
L_80D6DF:
    LDA $0EDF,X                     ; $80D6DF  BD DF 0E     MX
    AND #$00FF                      ; $80D6E2  29 FF 00     MX
    BEQ L_80D75A                    ; $80D6E5  F0 73        MX
    TXA                             ; $80D6E7  8A           MX
    ASL                             ; $80D6E8  0A           MX
    TAY                             ; $80D6E9  A8           MX
    LDA $48,X                       ; $80D6EA  B5 48        MX
    AND #$00FF                      ; $80D6EC  29 FF 00     MX
    BIT #$0080                      ; $80D6EF  89 80 00     MX
    BEQ L_80D6FB                    ; $80D6F2  F0 07        MX
    ORA #$FF00                      ; $80D6F4  09 00 FF     MX
    EOR #$FFFF                      ; $80D6F7  49 FF FF     MX
    INC                             ; $80D6FA  1A           MX
L_80D6FB:
    CLC                             ; $80D6FB  18           MX
    ADC $0DE8,Y                     ; $80D6FC  79 E8 0D     MX
    STA $0DE8,Y                     ; $80D6FF  99 E8 0D     MX
    CMP #$0010                      ; $80D702  C9 10 00     MX
    BCC L_80D75A                    ; $80D705  90 53        MX
    LDA #$0000                      ; $80D707  A9 00 00     MX
    STA $0DE8,Y                     ; $80D70A  99 E8 0D     MX
    LDA $48,X                       ; $80D70D  B5 48        MX
    BIT #$0080                      ; $80D70F  89 80 00     MX
    BNE L_80D72A                    ; $80D712  D0 16        MX
    LDA $0DE0,Y                     ; $80D714  B9 E0 0D     MX
    PHA                             ; $80D717  48           MX
    LDA $0DD8,Y                     ; $80D718  B9 D8 0D     MX
    STA $0DE0,Y                     ; $80D71B  99 E0 0D     MX
    LDA $0DD0,Y                     ; $80D71E  B9 D0 0D     MX
    STA $0DD8,Y                     ; $80D721  99 D8 0D     MX
    PLA                             ; $80D724  68           MX
    STA $0DD0,Y                     ; $80D725  99 D0 0D     MX
    BRA L_80D73E                    ; $80D728  80 14        MX
L_80D72A:
    LDA $0DD0,Y                     ; $80D72A  B9 D0 0D     MX
    PHA                             ; $80D72D  48           MX
    LDA $0DD8,Y                     ; $80D72E  B9 D8 0D     MX
    STA $0DD0,Y                     ; $80D731  99 D0 0D     MX
    LDA $0DE0,Y                     ; $80D734  B9 E0 0D     MX
    STA $0DD8,Y                     ; $80D737  99 D8 0D     MX
    PLA                             ; $80D73A  68           MX
    STA $0DE0,Y                     ; $80D73B  99 E0 0D     MX
L_80D73E:
    TXA                             ; $80D73E  8A           MX
    ASL                             ; $80D73F  0A           MX
    ASL                             ; $80D740  0A           MX
    ASL                             ; $80D741  0A           MX
    ASL                             ; $80D742  0A           MX
    ASL                             ; $80D743  0A           MX
    TAX                             ; $80D744  AA           MX
    LDA $0DD0,Y                     ; $80D745  B9 D0 0D     MX
    STA $7E210E,X                   ; $80D748  9F 0E 21 7E  MX
    LDA $0DD8,Y                     ; $80D74C  B9 D8 0D     MX
    STA $7E2110,X                   ; $80D74F  9F 10 21 7E  MX
    LDA $0DE0,Y                     ; $80D753  B9 E0 0D     MX
    STA $7E2112,X                   ; $80D756  9F 12 21 7E  MX
L_80D75A:
    RTS                             ; $80D75A  60           MX
L_80D75B:
    LDY #$0000                      ; $80D75B  A0 00 00     MX
    LDX #$0000                      ; $80D75E  A2 00 00     MX
L_80D761:
    LDA $DC18,Y                     ; $80D761  B9 18 DC     MX
    STA $0DD0,X                     ; $80D764  9D D0 0D     MX
    STA $0DD2,X                     ; $80D767  9D D2 0D     MX
    STA $0DD4,X                     ; $80D76A  9D D4 0D     MX
    STA $0DD6,X                     ; $80D76D  9D D6 0D     MX
    TXA                             ; $80D770  8A           MX
    CLC                             ; $80D771  18           MX
    ADC #$0008                      ; $80D772  69 08 00     MX
    TAX                             ; $80D775  AA           MX
    INY                             ; $80D776  C8           MX
    INY                             ; $80D777  C8           MX
    CPY #$0006                      ; $80D778  C0 06 00     MX
    BCC L_80D761                    ; $80D77B  90 E4        MX
    LDA #$000F                      ; $80D77D  A9 0F 00     MX
    STA $0DE8                       ; $80D780  8D E8 0D     MX
    STA $0DEA                       ; $80D783  8D EA 0D     MX
    STA $0DEC                       ; $80D786  8D EC 0D     MX
    STA $0DEE                       ; $80D789  8D EE 0D     MX
    RTS                             ; $80D78C  60           MX
    db $F0,$F0,$F0,$00,$F0,$00,$F0,$F0,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D78D
    db $F0,$90,$F0,$90,$F0,$90,$F0,$90,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D79D
    db $F0,$F0,$F0,$00,$F0,$00,$F0,$F0,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D7AD
    db $F0,$90,$F0,$90,$F0,$90,$F0,$90,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D7BD
    db $C0,$C0,$E0,$20,$F0,$10,$F0,$90,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D7CD
    db $F0,$90,$F0,$80,$70,$40,$30,$30,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D7DD
    db $30,$30,$70,$40,$F0,$80,$F0,$90,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D7ED
    db $F0,$90,$F0,$10,$E0,$20,$C0,$C0,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D7FD
    db $F0,$F0,$F0,$00,$F0,$00,$F0,$90,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D80D
    db $F0,$90,$F0,$10,$F0,$10,$F0,$90,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D81D
    db $F0,$90,$F0,$80,$F0,$80,$F0,$90,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D82D
    db $F0,$90,$F0,$00,$F0,$00,$F0,$F0,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D83D
    db $F0,$90,$F0,$80,$F0,$80,$F0,$90,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D84D
    db $F0,$F0,$F0,$00,$F0,$00,$F0,$90,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D85D
    db $F0,$90,$F0,$00,$F0,$00,$F0,$F0,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D86D
    db $F0,$90,$F0,$10,$F0,$10,$F0,$90,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D87D
    db $F0,$90,$F0,$00,$F0,$00,$F0,$90,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D88D
    db $F0,$F0,$D0,$20,$B0,$40,$F0,$F0,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D89D
    db $F0,$90,$D0,$B0,$B0,$D0,$F0,$90,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D8AD
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D8BD
    db $90,$90,$00,$00,$00,$00,$90,$90,$00,$60,$00,$F0,$00,$F0,$00,$60 ; $80D8CD
    db $F0,$90,$F0,$00,$F0,$00,$F0,$90,$00,$60,$00,$F0,$00,$F0,$00,$60 ; $80D8DD
    db $90,$F0,$00,$F0,$00,$F0,$90,$F0,$00,$60,$00,$F0,$00,$F0,$00,$60 ; $80D8ED
    db $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$00,$60,$00,$F0,$00,$F0,$00,$60 ; $80D8FD
    db $D2,$42,$33,$7F,$2D,$6E,$48,$61,$84,$50,$63,$38,$F5,$1C,$08,$21 ; $80D90D
    db $A5,$14,$42,$08,$DD,$77,$73,$4E,$CE,$39,$29,$25,$42,$08,$4A,$29 ; $80D91D
    db $D2,$42,$FA,$02,$18,$02,$57,$01,$D0,$00,$69,$00,$F5,$1C,$08,$21 ; $80D92D
    db $A5,$14,$42,$08,$DD,$77,$73,$4E,$CE,$39,$29,$25,$42,$08,$4A,$29 ; $80D93D
    db $D2,$42,$EF,$3D,$4A,$29,$A5,$14,$84,$10,$42,$08,$F5,$1C,$08,$21 ; $80D94D
    db $A5,$14,$42,$08,$DD,$77,$73,$4E,$CE,$39,$29,$25,$42,$08,$4A,$29 ; $80D95D
    db $D2,$42,$FF,$7F,$DE,$3F,$BD,$03,$99,$02,$95,$01,$F5,$1C,$08,$21 ; $80D96D
    db $A5,$14,$42,$08,$FE,$7B,$F7,$5E,$10,$42,$29,$25,$42,$08,$A5,$14 ; $80D97D
    db $D2,$42,$7F,$62,$FB,$2C,$16,$00,$10,$00,$0B,$00,$F5,$1C,$08,$21 ; $80D98D
    db $A5,$14,$42,$08,$FE,$7B,$F7,$5E,$10,$42,$29,$25,$42,$08,$A5,$14 ; $80D99D
    db $D2,$42,$26,$17,$A2,$0A,$00,$02,$60,$01,$A0,$00,$F5,$1C,$08,$21 ; $80D9AD
    db $A5,$14,$42,$08,$FE,$7B,$F7,$5E,$10,$42,$29,$25,$42,$08,$A5,$14 ; $80D9BD
    db $D2,$42,$BF,$2E,$1E,$16,$BC,$01,$35,$01,$CF,$00,$FF,$43,$BF,$33 ; $80D9CD
    db $5F,$23,$DF,$0E,$3F,$02,$7F,$01,$BF,$00,$16,$00,$42,$08,$6B,$2D ; $80D9DD
    db $D2,$42,$F7,$5E,$72,$4A,$CE,$39,$49,$25,$A5,$14,$00,$00,$00,$00 ; $80D9ED
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $80D9FD
    db $D2,$42,$F2,$4C,$70,$38,$0D,$24,$09,$14,$05,$08,$10,$01,$FB,$F6 ; $80DA0D
    db $F4,$F2,$F3,$F2,$F4,$F8,$01,$06,$11,$FC,$FA,$FC,$FD,$FC,$FB,$FA ; $80DA1D
    db $FB,$FC,$FD,$FD,$FE,$FD,$FD,$01,$02,$02,$01,$FF,$02,$FF,$FE,$FE ; $80DA2D
    db $FE,$FE,$FE,$FE,$00,$FD,$FB,$FC,$FD,$3A,$40,$38,$38,$2E,$2E,$22 ; $80DA3D
    db $14,$0E,$0E,$06,$FE,$FA,$22,$17,$07,$01,$1E,$1B,$13,$11,$04,$01 ; $80DA4D
    db $FF,$FD,$1A,$11,$FD,$FB,$28,$24,$13,$06,$29,$26,$23,$22,$17,$13 ; $80DA5D
    db $0D,$07,$27,$20,$10,$09,$11,$19,$1F,$25,$28,$28,$28,$28,$27,$23 ; $80DA6D
    db $1F,$18,$10,$21,$25,$25,$23,$1F,$23,$24,$24,$21,$21,$21,$20,$1C ; $80DA7D
    db $1F,$1E,$1D,$1C,$1D,$28,$25,$21,$20,$22,$23,$27,$28,$29,$27,$23 ; $80DA8D
    db $25,$28,$28,$FD,$00,$01,$07,$09,$0E,$0E,$10,$13,$15,$17,$18,$1A ; $80DA9D
    db $09,$0F,$1E,$25,$09,$0B,$10,$13,$1D,$1F,$23,$27,$0A,$11,$20,$29 ; $80DAAD
    db $FE,$03,$12,$1A,$01,$00,$05,$06,$10,$14,$17,$19,$03,$08,$16,$1C ; $80DABD
    db $11,$1C,$25,$2D,$30,$32,$30,$31,$2F,$2A,$25,$1C,$10,$29,$2F,$2E ; $80DACD
    db $29,$26,$2B,$2E,$2D,$28,$27,$27,$26,$23,$24,$23,$21,$21,$21,$2E ; $80DADD
    db $2A,$27,$27,$28,$2A,$2E,$31,$30,$2E,$2B,$2D,$31,$30,$F6,$FA,$FD ; $80DAED
    db $04,$07,$0E,$0E,$12,$14,$19,$1B,$1C,$22,$06,$0F,$21,$29,$04,$08 ; $80DAFD
    db $0E,$12,$21,$24,$28,$2E,$05,$11,$25,$31,$F7,$FF,$14,$1D,$FA,$FB ; $80DB0D
    db $00,$02,$0E,$14,$1A,$1D,$FD,$04,$17,$1F,$00,$01,$02,$00,$01,$02 ; $80DB1D
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$10,$20,$11,$20,$12 ; $80DB2D
    db $20,$13,$20,$14,$20,$15,$20,$16,$20,$17,$20,$18,$20,$19,$20,$06 ; $80DB3D
    db $06,$07,$08,$09,$09,$0A,$0B,$0C,$0C,$0B,$0A,$09,$09,$08,$07,$06 ; $80DB4D
    db $06,$05,$04,$03,$03,$02,$01,$00,$00,$01,$02,$03,$03,$04,$05,$01 ; $80DB5D
    db $01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $80DB6D
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$01,$40 ; $80DB7D
    db $40,$40,$40,$40,$40,$40,$54,$68,$7C,$7C,$90,$90,$90,$90,$90,$90 ; $80DB8D
    db $90,$90,$90,$90,$90,$90,$7C,$68,$54,$54,$40,$40,$40,$40,$40,$00 ; $80DB9D
    db $00,$0C,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$0C,$00 ; $80DBAD
    db $F4,$F4,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$F4,$00 ; $80DBBD
    db $00,$06,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$06,$00 ; $80DBCD
    db $FA,$FA,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$FA,$00 ; $80DBDD
    db $32,$80,$32,$00,$22,$00,$2A,$00,$06,$60,$66,$2C,$2E,$30,$32,$34 ; $80DBED
    db $36,$2F,$2F,$FC,$F3,$CF,$3F,$01,$04,$10,$40,$02,$08,$20,$80,$00 ; $80DBFD
    db $00,$2D,$00,$5A,$00,$87,$00,$B4,$00,$E1,$00,$08,$21,$A5,$14,$42 ; $80DC0D
    db $08,$00,$21,$20,$21,$40,$21,$60,$21                             ; $80DC1D
L_80DC26:
    PHP                             ; $80DC26  08           MX
    REP #$20                        ; $80DC27  C2 20        MX
    LDA $0255                       ; $80DC29  AD 55 02     MX
    BEQ L_80DC33                    ; $80DC2C  F0 05        MX
    LDA #$0000                      ; $80DC2E  A9 00 00     MX
    PLP                             ; $80DC31  28           MX
    RTS                             ; $80DC32  60           MX
L_80DC33:
    LDA $1F45                       ; $80DC33  AD 45 1F     MX
    INC                             ; $80DC36  1A           MX
    CLC                             ; $80DC37  18           MX
    ADC $1F48                       ; $80DC38  6D 48 1F     MX
    STA $1F4B                       ; $80DC3B  8D 4B 1F     MX
    LDA $1F47                       ; $80DC3E  AD 47 1F     MX
    ADC $1F4A                       ; $80DC41  6D 4A 1F     MX
    STA $1F4D                       ; $80DC44  8D 4D 1F     MX
    LDA $1F48                       ; $80DC47  AD 48 1F     MX
    STA $1F45                       ; $80DC4A  8D 45 1F     MX
    LDA $1F4A                       ; $80DC4D  AD 4A 1F     MX
    STA $1F47                       ; $80DC50  8D 47 1F     MX
    LDA $1F4C                       ; $80DC53  AD 4C 1F     MX
    STA $1F49                       ; $80DC56  8D 49 1F     MX
    LDA $1F46                       ; $80DC59  AD 46 1F     MX
    PLP                             ; $80DC5C  28           MX
    RTS                             ; $80DC5D  60           MX
L_80DC5E:
    STA $1F45                       ; $80DC5E  8D 45 1F     mx
    STA $1F46                       ; $80DC61  8D 46 1F     mx
    STA $1F47                       ; $80DC64  8D 47 1F     mx
    STA $1F48                       ; $80DC67  8D 48 1F     mx
    STA $1F49                       ; $80DC6A  8D 49 1F     mx
    STA $1F4A                       ; $80DC6D  8D 4A 1F     mx
    STA $1F4B                       ; $80DC70  8D 4B 1F     mx
    STA $1F4C                       ; $80DC73  8D 4C 1F     mx
    STA $1F4D                       ; $80DC76  8D 4D 1F     mx
    STA $1F4E                       ; $80DC79  8D 4E 1F     mx
    RTS                             ; $80DC7C  60           mx
read_pads:
    PHP                             ; $80DC7D  08           mx
    REP #$30                        ; $80DC7E  C2 30        mx
L_80DC80:
    LDA $4212                       ; $80DC80  AD 12 42     MX
    AND #$0001                      ; $80DC83  29 01 00     MX
    BNE L_80DC80                    ; $80DC86  D0 F8        MX
    LDA $0255                       ; $80DC88  AD 55 02     MX
    BNE L_80DCBD                    ; $80DC8B  D0 30        MX
    LDA $033D                       ; $80DC8D  AD 3D 03     MX  pad1_held
    STA $0345                       ; $80DC90  8D 45 03     MX
    LDA $4218                       ; $80DC93  AD 18 42     MX
    STA $033D                       ; $80DC96  8D 3D 03     MX  pad1_held
    EOR $0345                       ; $80DC99  4D 45 03     MX
    AND $033D                       ; $80DC9C  2D 3D 03     MX  pad1_held
    ORA $034D                       ; $80DC9F  0D 4D 03     MX  pad1_pressed
    STA $034D                       ; $80DCA2  8D 4D 03     MX  pad1_pressed
    LDA $033F                       ; $80DCA5  AD 3F 03     MX  pad2_held
    STA $0347                       ; $80DCA8  8D 47 03     MX
    LDA $421A                       ; $80DCAB  AD 1A 42     MX
    STA $033F                       ; $80DCAE  8D 3F 03     MX  pad2_held
    EOR $0347                       ; $80DCB1  4D 47 03     MX
    AND $033F                       ; $80DCB4  2D 3F 03     MX  pad2_held
    ORA $034F                       ; $80DCB7  0D 4F 03     MX  pad2_pressed
    STA $034F                       ; $80DCBA  8D 4F 03     MX  pad2_pressed
L_80DCBD:
    PLP                             ; $80DCBD  28           MX
    RTS                             ; $80DCBE  60           mx
L_80DCBF:
    LDA $0255                       ; $80DCBF  AD 55 02     mx
    BNE L_80DCFD                    ; $80DCC2  D0 39        mx
    LDY #$03                        ; $80DCC4  A0 03        mx
    LDA $031C                       ; $80DCC6  AD 1C 03     mx
    BNE L_80DCD8                    ; $80DCC9  D0 0D        mx
    LDA $0336                       ; $80DCCB  AD 36 03     mx  difficulty
    ASL                             ; $80DCCE  0A           mx
    ASL                             ; $80DCCF  0A           mx
    ASL                             ; $80DCD0  0A           mx
    ADC $0299                       ; $80DCD1  6D 99 02     mx  planet
    TAX                             ; $80DCD4  AA           mx
    LDY $DCFE,X                     ; $80DCD5  BC FE DC     mx
L_80DCD8:
    LDX $DD1B,Y                     ; $80DCD8  BE 1B DD     mx
    LDY #$00                        ; $80DCDB  A0 00        mx
L_80DCDD:
    REP #$30                        ; $80DCDD  C2 30        mx
    LDA $DD1B,X                     ; $80DCDF  BD 1B DD     MX
    AND #$00FF                      ; $80DCE2  29 FF 00     MX
    STA $13AF                       ; $80DCE5  8D AF 13     MX
    LDA $DD16,Y                     ; $80DCE8  B9 16 DD     MX
    AND #$00FF                      ; $80DCEB  29 FF 00     MX
    STA $13B1                       ; $80DCEE  8D B1 13     MX
    JSR L_80DD33                    ; $80DCF1  20 33 DD     MX
    INX                             ; $80DCF4  E8           MX
    INY                             ; $80DCF5  C8           MX
    CPY #$0005                      ; $80DCF6  C0 05 00     MX
    BNE L_80DCDD                    ; $80DCF9  D0 E2        MX
    SEP #$30                        ; $80DCFB  E2 30        MX
L_80DCFD:
    RTS                             ; $80DCFD  60           mx
    db $00,$00,$01,$01,$01,$02,$FF,$FF,$00,$00,$01,$01,$01,$02,$FF,$FF ; $80DCFE
    db $01,$01,$01,$01,$01,$02,$FF,$FF,$00,$04,$08,$0C,$10,$04,$09,$0E ; $80DD0E
    db $13,$00,$02,$05,$00,$05,$00,$05,$05,$00,$05,$00,$00,$05,$00,$05 ; $80DD1E
    db $00,$05,$00,$00,$05                                             ; $80DD2E
L_80DD33:
    PHX                             ; $80DD33  DA           MX
    PHY                             ; $80DD34  5A           MX
L_80DD35:
    DEC $13AF                       ; $80DD35  CE AF 13     MX
    BMI L_80DD5C                    ; $80DD38  30 22        MX
L_80DD3A:
    JSR L_80DC26                    ; $80DD3A  20 26 DC     MX
    AND #$01FF                      ; $80DD3D  29 FF 01     MX
    CMP #$0180                      ; $80DD40  C9 80 01     MX
    BCS L_80DD3A                    ; $80DD43  B0 F5        MX
    TAX                             ; $80DD45  AA           MX
L_80DD46:
    JSR L_80DC26                    ; $80DD46  20 26 DC     MX
    AND #$007F                      ; $80DD49  29 7F 00     MX
    CMP #$0073                      ; $80DD4C  C9 73 00     MX
    BCS L_80DD46                    ; $80DD4F  B0 F5        MX
    TAY                             ; $80DD51  A8           MX
    LDA $13B1                       ; $80DD52  AD B1 13     MX
    JSR L_80E328                    ; $80DD55  20 28 E3     MX
    BCC L_80DD35                    ; $80DD58  90 DB        MX
    BRA L_80DD3A                    ; $80DD5A  80 DE        MX
L_80DD5C:
    PLY                             ; $80DD5C  7A           MX
    PLX                             ; $80DD5D  FA           MX
    RTS                             ; $80DD5E  60           MX
L_80DD5F:
    LDA $0BEF                       ; $80DD5F  AD EF 0B     mx
    BEQ L_80DD65                    ; $80DD62  F0 01        mx
    RTS                             ; $80DD64  60           mx
L_80DD65:
    LDX #$00                        ; $80DD65  A2 00        mx
    JSR L_80DDF2                    ; $80DD67  20 F2 DD     mx
    JSR L_80DD96                    ; $80DD6A  20 96 DD     mx
    JSL L_81C36F                    ; $80DD6D  22 6F C3 81  mx
    LDX #$01                        ; $80DD71  A2 01        mx
    JSR L_80DDF2                    ; $80DD73  20 F2 DD     mx
    JSR L_80DD96                    ; $80DD76  20 96 DD     mx
    JSL L_81C36F                    ; $80DD79  22 6F C3 81  mx
    LDX #$02                        ; $80DD7D  A2 02        mx
    JSR L_80DDF2                    ; $80DD7F  20 F2 DD     mx
    JSR L_80DD96                    ; $80DD82  20 96 DD     mx
    JSL L_81C36F                    ; $80DD85  22 6F C3 81  mx
    LDX #$03                        ; $80DD89  A2 03        mx
    JSR L_80DDF2                    ; $80DD8B  20 F2 DD     mx
    JSR L_80DD96                    ; $80DD8E  20 96 DD     mx
    JSL L_81C36F                    ; $80DD91  22 6F C3 81  mx
    RTS                             ; $80DD95  60           mx
L_80DD96:
    LDX $0BD0                       ; $80DD96  AE D0 0B     mx
    LDA $0EDF,X                     ; $80DD99  BD DF 0E     mx
    BEQ L_80DDD4                    ; $80DD9C  F0 36        mx
    LDA $0EF1,X                     ; $80DD9E  BD F1 0E     mx
    BEQ L_80DDD4                    ; $80DDA1  F0 31        mx
    LDA $0E5B,X                     ; $80DDA3  BD 5B 0E     mx
    BEQ L_80DDAD                    ; $80DDA6  F0 05        mx
    DEC $0E5B,X                     ; $80DDA8  DE 5B 0E     mx
    BRA L_80DDD4                    ; $80DDAB  80 27        mx
L_80DDAD:
    LDA $0EC9,X                     ; $80DDAD  BD C9 0E     mx
    BEQ L_80DDD4                    ; $80DDB0  F0 22        mx
    LDA $0EA9,X                     ; $80DDB2  BD A9 0E     mx
    BNE L_80DDC7                    ; $80DDB5  D0 10        mx
    REP #$30                        ; $80DDB7  C2 30        mx
    LDA #$00A3                      ; $80DDB9  A9 A3 00     MX
    JSL L_81DE31                    ; $80DDBC  22 31 DE 81  MX
    SEP #$30                        ; $80DDC0  E2 30        MX
    LDX $0BD0                       ; $80DDC2  AE D0 0B     mx
    BRA L_80DDD4                    ; $80DDC5  80 0D        mx
L_80DDC7:
    DEC $0EA9,X                     ; $80DDC7  DE A9 0E     mx
    LDA #$14                        ; $80DDCA  A9 14        mx
    STA $0E5B,X                     ; $80DDCC  9D 5B 0E     mx
    LDA #$04                        ; $80DDCF  A9 04        mx
    JSR L_80F92A                    ; $80DDD1  20 2A F9     mx
L_80DDD4:
    RTS                             ; $80DDD4  60           mx
L_80DDD5:
    BCS L_80DDF1                    ; $80DDD5  B0 1A        MX
    SEP #$30                        ; $80DDD7  E2 30        MX
    LDX $0BD0                       ; $80DDD9  AE D0 0B     mx
    LDA $0C82,X                     ; $80DDDC  BD 82 0C     mx
    REP #$30                        ; $80DDDF  C2 30        mx
    BEQ L_80DDEA                    ; $80DDE1  F0 07        MX
    LDA $B8                         ; $80DDE3  A5 B8        MX
    AND #$03FF                      ; $80DDE5  29 FF 03     MX
    BNE L_80DDEE                    ; $80DDE8  D0 04        MX
L_80DDEA:
    LDA $B8                         ; $80DDEA  A5 B8        MX
    CLC                             ; $80DDEC  18           MX
    RTS                             ; $80DDED  60           MX
L_80DDEE:
    LDA $B8                         ; $80DDEE  A5 B8        MX
    SEC                             ; $80DDF0  38           MX
L_80DDF1:
    RTS                             ; $80DDF1  60           MX
L_80DDF2:
    STX $0BD0                       ; $80DDF2  8E D0 0B     mx
    LDA $0C82,X                     ; $80DDF5  BD 82 0C     mx
    BNE L_80DE15                    ; $80DDF8  D0 1B        mx
    LDA $0C25,X                     ; $80DDFA  BD 25 0C     mx
    BNE L_80DE14                    ; $80DDFD  D0 15        mx
    LDA $0EDF,X                     ; $80DDFF  BD DF 0E     mx
    BEQ L_80DE14                    ; $80DE02  F0 10        mx
    LDA $0EF1,X                     ; $80DE04  BD F1 0E     mx
    BEQ L_80DE14                    ; $80DE07  F0 0B        mx
    LDA $0A45,X                     ; $80DE09  BD 45 0A     mx
    SEC                             ; $80DE0C  38           mx
    SBC $0A4B,X                     ; $80DE0D  FD 4B 0A     mx
    CMP #$11                        ; $80DE10  C9 11        mx
    BCC L_80DE15                    ; $80DE12  90 01        mx
L_80DE14:
    RTS                             ; $80DE14  60           mx
L_80DE15:
    REP #$30                        ; $80DE15  C2 30        mx
    LDY #$0000                      ; $80DE17  A0 00 00     MX
    LDA $0C82,X                     ; $80DE1A  BD 82 0C     MX
    AND #$00FF                      ; $80DE1D  29 FF 00     MX
    BEQ L_80DE25                    ; $80DE20  F0 03        MX
    LDY #$0008                      ; $80DE22  A0 08 00     MX
L_80DE25:
    TYA                             ; $80DE25  98           MX
    LDY $032E                       ; $80DE26  AC 2E 03     MX
    BNE L_80DE2F                    ; $80DE29  D0 04        MX
    CLC                             ; $80DE2B  18           MX
    ADC #$0038                      ; $80DE2C  69 38 00     MX
L_80DE2F:
    STA $88                         ; $80DE2F  85 88        MX
    LDA $0A4B,X                     ; $80DE31  BD 4B 0A     MX
    AND #$00FF                      ; $80DE34  29 FF 00     MX
    STA $A0                         ; $80DE37  85 A0        MX
    LDA $A024,X                     ; $80DE39  BD 24 A0     MX
    AND #$00FF                      ; $80DE3C  29 FF 00     MX
    TAY                             ; $80DE3F  A8           MX
    LDA $00DD,Y                     ; $80DE40  B9 DD 00     MX
    ASL                             ; $80DE43  0A           MX
    CLC                             ; $80DE44  18           MX
    ADC #$01E0                      ; $80DE45  69 E0 01     MX
    LSR                             ; $80DE48  4A           MX
    LSR                             ; $80DE49  4A           MX
    LSR                             ; $80DE4A  4A           MX
    STA $126A                       ; $80DE4B  8D 6A 12     MX
    LDA $00EF,Y                     ; $80DE4E  B9 EF 00     MX
    CLC                             ; $80DE51  18           MX
    ADC $0AD9                       ; $80DE52  6D D9 0A     MX
    SEC                             ; $80DE55  38           MX
    SBC $A0                         ; $80DE56  E5 A0        MX
    CLC                             ; $80DE58  18           MX
    ADC $88                         ; $80DE59  65 88        MX
    CLC                             ; $80DE5B  18           MX
    ADC #$0100                      ; $80DE5C  69 00 01     MX
    LSR                             ; $80DE5F  4A           MX
    LSR                             ; $80DE60  4A           MX
    LSR                             ; $80DE61  4A           MX
    STA $126C                       ; $80DE62  8D 6C 12     MX
    LDX $126A                       ; $80DE65  AE 6A 12     MX
    LDY $126C                       ; $80DE68  AC 6C 12     MX
    JSR L_80F7F0                    ; $80DE6B  20 F0 F7     MX
    JSR L_80DDD5                    ; $80DE6E  20 D5 DD     MX
    BCS L_80DEC1                    ; $80DE71  B0 4E        MX
    LDX $126A                       ; $80DE73  AE 6A 12     MX
    DEX                             ; $80DE76  CA           MX
    STX $126A                       ; $80DE77  8E 6A 12     MX
    LDY $126C                       ; $80DE7A  AC 6C 12     MX
    JSR L_80F7F0                    ; $80DE7D  20 F0 F7     MX
    JSR L_80DDD5                    ; $80DE80  20 D5 DD     MX
    BCS L_80DEC1                    ; $80DE83  B0 3C        MX
    LDX $126A                       ; $80DE85  AE 6A 12     MX
    INX                             ; $80DE88  E8           MX
    INX                             ; $80DE89  E8           MX
    STX $126A                       ; $80DE8A  8E 6A 12     MX
    LDY $126C                       ; $80DE8D  AC 6C 12     MX
    JSR L_80F7F0                    ; $80DE90  20 F0 F7     MX
    JSR L_80DDD5                    ; $80DE93  20 D5 DD     MX
    BCS L_80DEC1                    ; $80DE96  B0 29        MX
    LDX $126A                       ; $80DE98  AE 6A 12     MX
    DEX                             ; $80DE9B  CA           MX
    STX $126A                       ; $80DE9C  8E 6A 12     MX
    LDY $126C                       ; $80DE9F  AC 6C 12     MX
    DEY                             ; $80DEA2  88           MX
    STY $126C                       ; $80DEA3  8C 6C 12     MX
    JSR L_80F7F0                    ; $80DEA6  20 F0 F7     MX
    BCS L_80DEC1                    ; $80DEA9  B0 16        MX
    LDX $126A                       ; $80DEAB  AE 6A 12     MX
    LDY $126C                       ; $80DEAE  AC 6C 12     MX
    INY                             ; $80DEB1  C8           MX
    INY                             ; $80DEB2  C8           MX
    STY $126C                       ; $80DEB3  8C 6C 12     MX
    JSR L_80F7F0                    ; $80DEB6  20 F0 F7     MX
    BCS L_80DEC1                    ; $80DEB9  B0 06        MX
    DEC $126C                       ; $80DEBB  CE 6C 12     MX
    BRL L_80E0A3                    ; $80DEBE  82 E2 01     MX
L_80DEC1:
    SEP #$10                        ; $80DEC1  E2 10        MX
    LDX $0BD0                       ; $80DEC3  AE D0 0B     Mx
    REP #$10                        ; $80DEC6  C2 10        Mx
    LDA $0C82,X                     ; $80DEC8  BD 82 0C     MX
    AND #$00FF                      ; $80DECB  29 FF 00     MX
    BEQ L_80DED8                    ; $80DECE  F0 08        MX
    SEP #$30                        ; $80DED0  E2 30        MX
    LDA #$01                        ; $80DED2  A9 01        mx
    STA $0C86,X                     ; $80DED4  9D 86 0C     mx
    RTS                             ; $80DED7  60           mx
L_80DED8:
    LDA $B8                         ; $80DED8  A5 B8        MX
    CMP #$03F6                      ; $80DEDA  C9 F6 03     MX
    BEQ L_80DEE4                    ; $80DEDD  F0 05        MX
    CMP #$03F7                      ; $80DEDF  C9 F7 03     MX
    BNE L_80DF4D                    ; $80DEE2  D0 69        MX
L_80DEE4:
    SEP #$30                        ; $80DEE4  E2 30        MX
    LDX $0BD0                       ; $80DEE6  AE D0 0B     mx
    LDA $0CB9,X                     ; $80DEE9  BD B9 0C     mx
    BEQ L_80DEF1                    ; $80DEEC  F0 03        mx
    BRL L_80E0A3                    ; $80DEEE  82 B2 01     mx
L_80DEF1:
    LDA $0C7E,X                     ; $80DEF1  BD 7E 0C     mx
    BEQ L_80DEF9                    ; $80DEF4  F0 03        mx
    BRL L_80E0A3                    ; $80DEF6  82 AA 01     mx
L_80DEF9:
    LDA $0DF2,X                     ; $80DEF9  BD F2 0D     mx
    CMP #$01                        ; $80DEFC  C9 01        mx
    BNE L_80DF03                    ; $80DEFE  D0 03        mx
    BRL L_80E0A3                    ; $80DF00  82 A0 01     mx
L_80DF03:
    CMP #$00                        ; $80DF03  C9 00        mx
    BNE L_80DF0A                    ; $80DF05  D0 03        mx
    BRL L_80E0A3                    ; $80DF07  82 99 01     mx
L_80DF0A:
    LDA $48,X                       ; $80DF0A  B5 48        mx
    CMP #$0A                        ; $80DF0C  C9 0A        mx
    BCC L_80DF3F                    ; $80DF0E  90 2F        mx
    LDA $13AB,X                     ; $80DF10  BD AB 13     mx
    BNE L_80DF3F                    ; $80DF13  D0 2A        mx
    LDA $0CBD,X                     ; $80DF15  BD BD 0C     mx
    BNE L_80DF40                    ; $80DF18  D0 26        mx
    LDA #$0A                        ; $80DF1A  A9 0A        mx
    STA $0CBD,X                     ; $80DF1C  9D BD 0C     mx
    DEC $80,X                       ; $80DF1F  D6 80        mx
    DEC $84,X                       ; $80DF21  D6 84        mx
    JSR L_80DC26                    ; $80DF23  20 26 DC     mx
    BIT #$01                        ; $80DF26  89 01        mx
    BNE L_80DF2E                    ; $80DF28  D0 04        mx
    LDA #$00                        ; $80DF2A  A9 00        mx
    BRA L_80DF30                    ; $80DF2C  80 02        mx
L_80DF2E:
    LDA #$02                        ; $80DF2E  A9 02        mx
L_80DF30:
    STA $13A7,X                     ; $80DF30  9D A7 13     mx
L_80DF33:
    CLC                             ; $80DF33  18           mx
    ADC $0C7A,X                     ; $80DF34  7D 7A 0C     mx
    SEC                             ; $80DF37  38           mx
    SBC #$01                        ; $80DF38  E9 01        mx
    AND #$1F                        ; $80DF3A  29 1F        mx
    STA $0C7A,X                     ; $80DF3C  9D 7A 0C     mx
L_80DF3F:
    RTS                             ; $80DF3F  60           mx
L_80DF40:
    LDA $0CBD,X                     ; $80DF40  BD BD 0C     mx
    INC                             ; $80DF43  1A           mx
    INC                             ; $80DF44  1A           mx
    STA $0CBD,X                     ; $80DF45  9D BD 0C     mx
    LDA $13A7,X                     ; $80DF48  BD A7 13     mx
    BRA L_80DF33                    ; $80DF4B  80 E6        mx
L_80DF4D:
    CMP #$03F8                      ; $80DF4D  C9 F8 03     MX
    BEQ L_80DF57                    ; $80DF50  F0 05        MX
    CMP #$03F9                      ; $80DF52  C9 F9 03     MX
    BNE L_80DFB0                    ; $80DF55  D0 59        MX
L_80DF57:
    SEP #$30                        ; $80DF57  E2 30        MX
    LDX $0BD0                       ; $80DF59  AE D0 0B     mx
    LDA $0CB9,X                     ; $80DF5C  BD B9 0C     mx
    BEQ L_80DF64                    ; $80DF5F  F0 03        mx
    BRL L_80E0A3                    ; $80DF61  82 3F 01     mx
L_80DF64:
    LDA $0C7E,X                     ; $80DF64  BD 7E 0C     mx
    BEQ L_80DF6C                    ; $80DF67  F0 03        mx
    BRL L_80E0A3                    ; $80DF69  82 37 01     mx
L_80DF6C:
    LDA $0C76,X                     ; $80DF6C  BD 76 0C     mx
    CLC                             ; $80DF6F  18           mx
    ADC #$0A                        ; $80DF70  69 0A        mx
    STA $0C76,X                     ; $80DF72  9D 76 0C     mx
    LDA #$0B                        ; $80DF75  A9 0B        mx
    JSR L_80F92A                    ; $80DF77  20 2A F9     mx
    JSL L_81895E                    ; $80DF7A  22 5E 89 81  mx
    LDX $0BD0                       ; $80DF7E  AE D0 0B     mx
    LDA $0EDF,X                     ; $80DF81  BD DF 0E     mx
    SEC                             ; $80DF84  38           mx
    SBC #$02                        ; $80DF85  E9 02        mx
    BEQ L_80DF8B                    ; $80DF87  F0 02        mx
    BPL L_80DF92                    ; $80DF89  10 07        mx
L_80DF8B:
    LDA #$01                        ; $80DF8B  A9 01        mx
    STA $0CC5,X                     ; $80DF8D  9D C5 0C     mx
    LDA #$00                        ; $80DF90  A9 00        mx
L_80DF92:
    STA $0EDF,X                     ; $80DF92  9D DF 0E     mx
    BNE L_80DFA2                    ; $80DF95  D0 0B        mx
    LDX $0BD0                       ; $80DF97  AE D0 0B     mx
    LDA $020C,X                     ; $80DF9A  BD 0C 02     mx
    LDY #$1F                        ; $80DF9D  A0 1F        mx
    JSR L_80FB70                    ; $80DF9F  20 70 FB     mx
L_80DFA2:
    REP #$30                        ; $80DFA2  C2 30        mx
    LDX $126A                       ; $80DFA4  AE 6A 12     MX
    LDY $126C                       ; $80DFA7  AC 6C 12     MX
    JSR L_80E264                    ; $80DFAA  20 64 E2     MX
    SEP #$30                        ; $80DFAD  E2 30        MX
    RTS                             ; $80DFAF  60           mx
L_80DFB0:
    CMP #$03FA                      ; $80DFB0  C9 FA 03     MX
    BEQ L_80DFBA                    ; $80DFB3  F0 05        MX
    CMP #$03FB                      ; $80DFB5  C9 FB 03     MX
    BNE L_80E001                    ; $80DFB8  D0 47        MX
L_80DFBA:
    SEP #$30                        ; $80DFBA  E2 30        MX
    LDX $0BD0                       ; $80DFBC  AE D0 0B     mx
    LDA #$07                        ; $80DFBF  A9 07        mx
    JSR L_80F966                    ; $80DFC1  20 66 F9     mx
    LDA $0BD0                       ; $80DFC4  AD D0 0B     mx
    CMP #$02                        ; $80DFC7  C9 02        mx
    BCS L_80DFF3                    ; $80DFC9  B0 28        mx
    ASL                             ; $80DFCB  0A           mx
    ASL                             ; $80DFCC  0A           mx
    TAX                             ; $80DFCD  AA           mx
    REP #$30                        ; $80DFCE  C2 30        mx
    SED                             ; $80DFD0  F8           MX
    LDA $0E06,X                     ; $80DFD1  BD 06 0E     MX
    CLC                             ; $80DFD4  18           MX
    ADC #$1000                      ; $80DFD5  69 00 10     MX
    STA $0E06,X                     ; $80DFD8  9D 06 0E     MX
    LDA $0E08,X                     ; $80DFDB  BD 08 0E     MX
    ADC #$0000                      ; $80DFDE  69 00 00     MX
    STA $0E08,X                     ; $80DFE1  9D 08 0E     MX
    CLD                             ; $80DFE4  D8           MX
    LDA $0BD0                       ; $80DFE5  AD D0 0B     MX
    AND #$00FF                      ; $80DFE8  29 FF 00     MX
    TAX                             ; $80DFEB  AA           MX
    LDA #$0099                      ; $80DFEC  A9 99 00     MX
    JSL L_81DE31                    ; $80DFEF  22 31 DE 81  MX
L_80DFF3:
    REP #$30                        ; $80DFF3  C2 30        MX
    LDX $126A                       ; $80DFF5  AE 6A 12     MX
    LDY $126C                       ; $80DFF8  AC 6C 12     MX
    JSR L_80E264                    ; $80DFFB  20 64 E2     MX
    SEP #$30                        ; $80DFFE  E2 30        MX
    RTS                             ; $80E000  60           mx
L_80E001:
    CMP #$03FC                      ; $80E001  C9 FC 03     MX
    BEQ L_80E00B                    ; $80E004  F0 05        MX
    CMP #$03FD                      ; $80E006  C9 FD 03     MX
    BNE L_80E068                    ; $80E009  D0 5D        MX
L_80E00B:
    SEP #$30                        ; $80E00B  E2 30        MX
    LDX $0BD0                       ; $80E00D  AE D0 0B     mx
    LDA #$07                        ; $80E010  A9 07        mx
    JSR L_80F966                    ; $80E012  20 66 F9     mx
    LDX $0BD0                       ; $80E015  AE D0 0B     mx
    LDA $0E33,X                     ; $80E018  BD 33 0E     mx
    ASL                             ; $80E01B  0A           mx
    ASL                             ; $80E01C  0A           mx
    ADC $0BD0                       ; $80E01D  6D D0 0B     mx
    TAY                             ; $80E020  A8           mx
    LDA $0E91,Y                     ; $80E021  B9 91 0E     mx
    INC                             ; $80E024  1A           mx
    CMP #$08                        ; $80E025  C9 08        mx
    BCC L_80E02B                    ; $80E027  90 02        mx
    LDA #$07                        ; $80E029  A9 07        mx
L_80E02B:
    STA $0E91,Y                     ; $80E02B  99 91 0E     mx
    LDA $0E37,X                     ; $80E02E  BD 37 0E     mx
    ASL                             ; $80E031  0A           mx
    ASL                             ; $80E032  0A           mx
    ADC $0BD0                       ; $80E033  6D D0 0B     mx
    TAY                             ; $80E036  A8           mx
    LDA $0E91,Y                     ; $80E037  B9 91 0E     mx
    INC                             ; $80E03A  1A           mx
    CMP #$08                        ; $80E03B  C9 08        mx
    BCC L_80E041                    ; $80E03D  90 02        mx
    LDA #$07                        ; $80E03F  A9 07        mx
L_80E041:
    STA $0E91,Y                     ; $80E041  99 91 0E     mx
    LDA $0E3B,X                     ; $80E044  BD 3B 0E     mx
    ASL                             ; $80E047  0A           mx
    ASL                             ; $80E048  0A           mx
    ADC $0BD0                       ; $80E049  6D D0 0B     mx
    TAY                             ; $80E04C  A8           mx
    LDA $0EA9,Y                     ; $80E04D  B9 A9 0E     mx
    INC                             ; $80E050  1A           mx
    CMP #$08                        ; $80E051  C9 08        mx
    BCC L_80E057                    ; $80E053  90 02        mx
    LDA #$07                        ; $80E055  A9 07        mx
L_80E057:
    STA $0EA9,Y                     ; $80E057  99 A9 0E     mx
    REP #$30                        ; $80E05A  C2 30        mx
    LDX $126A                       ; $80E05C  AE 6A 12     MX
    LDY $126C                       ; $80E05F  AC 6C 12     MX
    JSR L_80E264                    ; $80E062  20 64 E2     MX
    SEP #$30                        ; $80E065  E2 30        MX
    RTS                             ; $80E067  60           mx
L_80E068:
    CMP #$03FE                      ; $80E068  C9 FE 03     MX
    BEQ L_80E072                    ; $80E06B  F0 05        MX
    CMP #$03FF                      ; $80E06D  C9 FF 03     MX
    BNE L_80E0A3                    ; $80E070  D0 31        MX
L_80E072:
    SEP #$30                        ; $80E072  E2 30        MX
    LDX $0BD0                       ; $80E074  AE D0 0B     mx
    LDA #$07                        ; $80E077  A9 07        mx
    JSR L_80F966                    ; $80E079  20 66 F9     mx
    LDX $0BD0                       ; $80E07C  AE D0 0B     mx
    LDA $0DFE,X                     ; $80E07F  BD FE 0D     mx
    ASL                             ; $80E082  0A           mx
    CLC                             ; $80E083  18           mx
    ADC #$06                        ; $80E084  69 06        mx
    STA $0EDF,X                     ; $80E086  9D DF 0E     mx
    REP #$30                        ; $80E089  C2 30        mx
    CPX #$0002                      ; $80E08B  E0 02 00     MX
    BCS L_80E097                    ; $80E08E  B0 07        MX
    LDA #$009A                      ; $80E090  A9 9A 00     MX
    JSL L_81DE31                    ; $80E093  22 31 DE 81  MX
L_80E097:
    LDX $126A                       ; $80E097  AE 6A 12     MX
    LDY $126C                       ; $80E09A  AC 6C 12     MX
    JSR L_80E264                    ; $80E09D  20 64 E2     MX
    SEP #$30                        ; $80E0A0  E2 30        MX
    RTS                             ; $80E0A2  60           mx
L_80E0A3:
    SEP #$30                        ; $80E0A3  E2 30        MX
    LDX $0BD0                       ; $80E0A5  AE D0 0B     mx
    LDA $0CB9,X                     ; $80E0A8  BD B9 0C     mx
    BEQ L_80E0B1                    ; $80E0AB  F0 04        mx
    DEC                             ; $80E0AD  3A           mx
    STA $0CB9,X                     ; $80E0AE  9D B9 0C     mx
L_80E0B1:
    LDA $0E57,X                     ; $80E0B1  BD 57 0E     mx
    BEQ L_80E0BA                    ; $80E0B4  F0 04        mx
    DEC                             ; $80E0B6  3A           mx
    STA $0E57,X                     ; $80E0B7  9D 57 0E     mx
L_80E0BA:
    BNE L_80E115                    ; $80E0BA  D0 59        mx
    LDA $0EB9,X                     ; $80E0BC  BD B9 0E     mx
    BEQ L_80E115                    ; $80E0BF  F0 54        mx
    LDA $0E99,X                     ; $80E0C1  BD 99 0E     mx
    BNE L_80E0D3                    ; $80E0C4  D0 0D        mx
    REP #$30                        ; $80E0C6  C2 30        mx
    LDA #$00A3                      ; $80E0C8  A9 A3 00     MX
    JSL L_81DE31                    ; $80E0CB  22 31 DE 81  MX
    SEP #$30                        ; $80E0CF  E2 30        MX
    BRA L_80E115                    ; $80E0D1  80 42        mx
L_80E0D3:
    REP #$30                        ; $80E0D3  C2 30        mx
    LDX $126A                       ; $80E0D5  AE 6A 12     MX
    LDY $126C                       ; $80E0D8  AC 6C 12     MX
    LDA #$0000                      ; $80E0DB  A9 00 00     MX
    JSR L_80E328                    ; $80E0DE  20 28 E3     MX
    BCC L_80E101                    ; $80E0E1  90 1E        MX
    LDX $126A                       ; $80E0E3  AE 6A 12     MX
    INX                             ; $80E0E6  E8           MX
    LDY $126C                       ; $80E0E7  AC 6C 12     MX
    LDA #$0000                      ; $80E0EA  A9 00 00     MX
    JSR L_80E328                    ; $80E0ED  20 28 E3     MX
    BCC L_80E101                    ; $80E0F0  90 0F        MX
    LDX $126A                       ; $80E0F2  AE 6A 12     MX
    DEX                             ; $80E0F5  CA           MX
    LDY $126C                       ; $80E0F6  AC 6C 12     MX
    LDA #$0000                      ; $80E0F9  A9 00 00     MX
    JSR L_80E328                    ; $80E0FC  20 28 E3     MX
    BCS L_80E115                    ; $80E0FF  B0 14        MX
L_80E101:
    SEP #$30                        ; $80E101  E2 30        MX
    LDX $0BD0                       ; $80E103  AE D0 0B     mx
    DEC $0E99,X                     ; $80E106  DE 99 0E     mx
    LDA #$02                        ; $80E109  A9 02        mx
    STA $0E57,X                     ; $80E10B  9D 57 0E     mx
    LDA #$10                        ; $80E10E  A9 10        mx
    JSR L_80F92A                    ; $80E110  20 2A F9     mx
    BRA L_80E17B                    ; $80E113  80 66        mx
L_80E115:
    SEP #$30                        ; $80E115  E2 30        mx
    LDX $0BD0                       ; $80E117  AE D0 0B     mx
    LDA $0E53,X                     ; $80E11A  BD 53 0E     mx
    BEQ L_80E124                    ; $80E11D  F0 05        mx
    DEC $0E53,X                     ; $80E11F  DE 53 0E     mx
    BRA L_80E183                    ; $80E122  80 5F        mx
L_80E124:
    LDA $0EB1,X                     ; $80E124  BD B1 0E     mx
    BEQ L_80E183                    ; $80E127  F0 5A        mx
    LDA $0E91,X                     ; $80E129  BD 91 0E     mx
    BNE L_80E13B                    ; $80E12C  D0 0D        mx
    REP #$30                        ; $80E12E  C2 30        mx
    LDA #$00A3                      ; $80E130  A9 A3 00     MX
    JSL L_81DE31                    ; $80E133  22 31 DE 81  MX
    SEP #$30                        ; $80E137  E2 30        MX
    BRA L_80E183                    ; $80E139  80 48        mx
L_80E13B:
    REP #$30                        ; $80E13B  C2 30        mx
    LDX $126A                       ; $80E13D  AE 6A 12     MX
    LDY $126C                       ; $80E140  AC 6C 12     MX
    LDA #$0004                      ; $80E143  A9 04 00     MX
    JSR L_80E328                    ; $80E146  20 28 E3     MX
    BCC L_80E169                    ; $80E149  90 1E        MX
    LDX $126A                       ; $80E14B  AE 6A 12     MX
    INX                             ; $80E14E  E8           MX
    LDY $126C                       ; $80E14F  AC 6C 12     MX
    LDA #$0004                      ; $80E152  A9 04 00     MX
    JSR L_80E328                    ; $80E155  20 28 E3     MX
    BCC L_80E169                    ; $80E158  90 0F        MX
    LDX $126A                       ; $80E15A  AE 6A 12     MX
    DEX                             ; $80E15D  CA           MX
    LDY $126C                       ; $80E15E  AC 6C 12     MX
    LDA #$0004                      ; $80E161  A9 04 00     MX
    JSR L_80E328                    ; $80E164  20 28 E3     MX
    BCS L_80E183                    ; $80E167  B0 1A        MX
L_80E169:
    SEP #$30                        ; $80E169  E2 30        MX
    LDX $0BD0                       ; $80E16B  AE D0 0B     mx
    DEC $0E91,X                     ; $80E16E  DE 91 0E     mx
    LDA #$03                        ; $80E171  A9 03        mx
    STA $0E53,X                     ; $80E173  9D 53 0E     mx
    LDA #$07                        ; $80E176  A9 07        mx
    JSR L_80F92A                    ; $80E178  20 2A F9     mx
L_80E17B:
    LDX $0BD0                       ; $80E17B  AE D0 0B     mx
    LDA #$14                        ; $80E17E  A9 14        mx
    STA $0CB9,X                     ; $80E180  9D B9 0C     mx
L_80E183:
    SEP #$30                        ; $80E183  E2 30        mx
    RTS                             ; $80E185  60           mx
L_80E186:
    STA $127A                       ; $80E186  8D 7A 12     MX
    STX $1276                       ; $80E189  8E 76 12     MX
    STY $1278                       ; $80E18C  8C 78 12     MX
    LDA $1276                       ; $80E18F  AD 76 12     MX
    SEC                             ; $80E192  38           MX
    SBC $0366                       ; $80E193  ED 66 03     MX
    CMP #$0024                      ; $80E196  C9 24 00     MX
    BCS L_80E1F6                    ; $80E199  B0 5B        MX
    STA $64                         ; $80E19B  85 64        MX
    LDA $1278                       ; $80E19D  AD 78 12     MX
    SEC                             ; $80E1A0  38           MX
    SBC $0368                       ; $80E1A1  ED 68 03     MX
    CMP #$001E                      ; $80E1A4  C9 1E 00     MX
    BCS L_80E1F6                    ; $80E1A7  B0 4D        MX
    STA $66                         ; $80E1A9  85 66        MX
    LDA $1325                       ; $80E1AB  AD 25 13     MX
    CMP #$0020                      ; $80E1AE  C9 20 00     MX
    BEQ L_80E1F6                    ; $80E1B1  F0 43        MX
    ASL                             ; $80E1B3  0A           MX
    TAY                             ; $80E1B4  A8           MX
    LDX #$1000                      ; $80E1B5  A2 00 10     MX
    LDA $0366                       ; $80E1B8  AD 66 03     MX
    AND #$003F                      ; $80E1BB  29 3F 00     MX
    CLC                             ; $80E1BE  18           MX
    ADC $64                         ; $80E1BF  65 64        MX
    AND #$003F                      ; $80E1C1  29 3F 00     MX
    CMP #$0020                      ; $80E1C4  C9 20 00     MX
    BCC L_80E1CF                    ; $80E1C7  90 06        MX
    LDX #$1400                      ; $80E1C9  A2 00 14     MX
    AND #$001F                      ; $80E1CC  29 1F 00     MX
L_80E1CF:
    CLC                             ; $80E1CF  18           MX
    STX $64                         ; $80E1D0  86 64        MX
    ADC $64                         ; $80E1D2  65 64        MX
    STA $64                         ; $80E1D4  85 64        MX
    LDA $0368                       ; $80E1D6  AD 68 03     MX
    AND #$001F                      ; $80E1D9  29 1F 00     MX
    CLC                             ; $80E1DC  18           MX
    ADC $66                         ; $80E1DD  65 66        MX
    AND #$001F                      ; $80E1DF  29 1F 00     MX
    ASL                             ; $80E1E2  0A           MX
    ASL                             ; $80E1E3  0A           MX
    ASL                             ; $80E1E4  0A           MX
    ASL                             ; $80E1E5  0A           MX
    ASL                             ; $80E1E6  0A           MX
    CLC                             ; $80E1E7  18           MX
    ADC $64                         ; $80E1E8  65 64        MX
    STA $1327,Y                     ; $80E1EA  99 27 13     MX
    LDA $127A                       ; $80E1ED  AD 7A 12     MX
    STA $1367,Y                     ; $80E1F0  99 67 13     MX
    INC $1325                       ; $80E1F3  EE 25 13     MX
L_80E1F6:
    LDA $1276                       ; $80E1F6  AD 76 12     MX
    SEC                             ; $80E1F9  38           MX
    SBC $036E                       ; $80E1FA  ED 6E 03     MX
    CMP #$0024                      ; $80E1FD  C9 24 00     MX
    BCS L_80E25D                    ; $80E200  B0 5B        MX
    STA $64                         ; $80E202  85 64        MX
    LDA $1278                       ; $80E204  AD 78 12     MX
    SEC                             ; $80E207  38           MX
    SBC $0370                       ; $80E208  ED 70 03     MX
    CMP #$001E                      ; $80E20B  C9 1E 00     MX
    BCS L_80E25D                    ; $80E20E  B0 4D        MX
    STA $66                         ; $80E210  85 66        MX
    LDA $1325                       ; $80E212  AD 25 13     MX
    CMP #$0020                      ; $80E215  C9 20 00     MX
    BEQ L_80E25D                    ; $80E218  F0 43        MX
    ASL                             ; $80E21A  0A           MX
    TAY                             ; $80E21B  A8           MX
    LDX #$1800                      ; $80E21C  A2 00 18     MX
    LDA $036E                       ; $80E21F  AD 6E 03     MX
    AND #$003F                      ; $80E222  29 3F 00     MX
    CLC                             ; $80E225  18           MX
    ADC $64                         ; $80E226  65 64        MX
    AND #$003F                      ; $80E228  29 3F 00     MX
    CMP #$0020                      ; $80E22B  C9 20 00     MX
    BCC L_80E236                    ; $80E22E  90 06        MX
    LDX #$1C00                      ; $80E230  A2 00 1C     MX
    AND #$001F                      ; $80E233  29 1F 00     MX
L_80E236:
    CLC                             ; $80E236  18           MX
    STX $64                         ; $80E237  86 64        MX
    ADC $64                         ; $80E239  65 64        MX
    STA $64                         ; $80E23B  85 64        MX
    LDA $0370                       ; $80E23D  AD 70 03     MX
    AND #$001F                      ; $80E240  29 1F 00     MX
    CLC                             ; $80E243  18           MX
    ADC $66                         ; $80E244  65 66        MX
    AND #$001F                      ; $80E246  29 1F 00     MX
    ASL                             ; $80E249  0A           MX
    ASL                             ; $80E24A  0A           MX
    ASL                             ; $80E24B  0A           MX
    ASL                             ; $80E24C  0A           MX
    ASL                             ; $80E24D  0A           MX
    CLC                             ; $80E24E  18           MX
    ADC $64                         ; $80E24F  65 64        MX
    STA $1327,Y                     ; $80E251  99 27 13     MX
    LDA $127A                       ; $80E254  AD 7A 12     MX
    STA $1367,Y                     ; $80E257  99 67 13     MX
    INC $1325                       ; $80E25A  EE 25 13     MX
L_80E25D:
    LDX $1276                       ; $80E25D  AE 76 12     MX
    LDY $1278                       ; $80E260  AC 78 12     MX
    RTS                             ; $80E263  60           MX
L_80E264:
    STX $126E                       ; $80E264  8E 6E 12     MX
    STY $1270                       ; $80E267  8C 70 12     MX
    TXA                             ; $80E26A  8A           MX
    AND #$0003                      ; $80E26B  29 03 00     MX
    ASL                             ; $80E26E  0A           MX
    STA $88                         ; $80E26F  85 88        MX
    JSR L_80E3A3                    ; $80E271  20 A3 E3     MX
    LDA $7F0000,X                   ; $80E274  BF 00 00 7F  MX
    TAX                             ; $80E278  AA           MX
    LDA $7F5DC0,X                   ; $80E279  BF C0 5D 7F  MX
    CLC                             ; $80E27D  18           MX
    ADC $88                         ; $80E27E  65 88        MX
    TAX                             ; $80E280  AA           MX
    LDA $7F89C0,X                   ; $80E281  BF C0 89 7F  MX
    BIT #$0001                      ; $80E285  89 01 00     MX
    BEQ L_80E28D                    ; $80E288  F0 03        MX
    DEC $126E                       ; $80E28A  CE 6E 12     MX
L_80E28D:
    LDX $126E                       ; $80E28D  AE 6E 12     MX
    JSR L_80E297                    ; $80E290  20 97 E2     MX
    INX                             ; $80E293  E8           MX
    JMP L_80E297                    ; $80E294  4C 97 E2     MX
L_80E297:
    PHX                             ; $80E297  DA           MX
    TXA                             ; $80E298  8A           MX
    AND #$0003                      ; $80E299  29 03 00     MX
    ASL                             ; $80E29C  0A           MX
    STA $88                         ; $80E29D  85 88        MX
    JSR L_80E3A3                    ; $80E29F  20 A3 E3     MX
    LDA $7F0000,X                   ; $80E2A2  BF 00 00 7F  MX
    TAX                             ; $80E2A6  AA           MX
    LDA $7F5DC0,X                   ; $80E2A7  BF C0 5D 7F  MX
    CLC                             ; $80E2AB  18           MX
    ADC $88                         ; $80E2AC  65 88        MX
    TAX                             ; $80E2AE  AA           MX
    LDA #$0000                      ; $80E2AF  A9 00 00     MX
    STA $7F89C0,X                   ; $80E2B2  9F C0 89 7F  MX
    PLX                             ; $80E2B6  FA           MX
    JMP L_80E186                    ; $80E2B7  4C 86 E1     MX
L_80E2BA:
    PHX                             ; $80E2BA  DA           MX
    LDA $7F0000,X                   ; $80E2BB  BF 00 00 7F  MX
    TAX                             ; $80E2BF  AA           MX
    LDA $7F5DC0,X                   ; $80E2C0  BF C0 5D 7F  MX
    TAX                             ; $80E2C4  AA           MX
    LDA $7F89C0,X                   ; $80E2C5  BF C0 89 7F  MX
    PHA                             ; $80E2C9  48           MX
    LDA $7F89C2,X                   ; $80E2CA  BF C2 89 7F  MX
    PHA                             ; $80E2CE  48           MX
    LDA $7F89C4,X                   ; $80E2CF  BF C4 89 7F  MX
    PHA                             ; $80E2D3  48           MX
    LDA $7F89C6,X                   ; $80E2D4  BF C6 89 7F  MX
    LDX $1266                       ; $80E2D8  AE 66 12     MX
    STA $7F89C6,X                   ; $80E2DB  9F C6 89 7F  MX
    PLA                             ; $80E2DF  68           MX
    STA $7F89C4,X                   ; $80E2E0  9F C4 89 7F  MX
    PLA                             ; $80E2E4  68           MX
    STA $7F89C2,X                   ; $80E2E5  9F C2 89 7F  MX
    PLA                             ; $80E2E9  68           MX
    STA $7F89C0,X                   ; $80E2EA  9F C0 89 7F  MX
    TXA                             ; $80E2EE  8A           MX
    CLC                             ; $80E2EF  18           MX
    ADC #$0008                      ; $80E2F0  69 08 00     MX
    STA $1266                       ; $80E2F3  8D 66 12     MX
    PLX                             ; $80E2F6  FA           MX
    LDA $1264                       ; $80E2F7  AD 64 12     MX
    STA $7F0000,X                   ; $80E2FA  9F 00 00 7F  MX
    CLC                             ; $80E2FE  18           MX
    ADC #$0002                      ; $80E2FF  69 02 00     MX
    STA $1264                       ; $80E302  8D 64 12     MX
    RTS                             ; $80E305  60           MX
L_80E306:
    PHX                             ; $80E306  DA           MX
    PHA                             ; $80E307  48           MX
    TXA                             ; $80E308  8A           MX
    AND #$0003                      ; $80E309  29 03 00     MX
    ASL                             ; $80E30C  0A           MX
    STA $88                         ; $80E30D  85 88        MX
    JSR L_80E3A3                    ; $80E30F  20 A3 E3     MX
    LDA $7F0000,X                   ; $80E312  BF 00 00 7F  MX
    TAX                             ; $80E316  AA           MX
    LDA $7F5DC0,X                   ; $80E317  BF C0 5D 7F  MX
    CLC                             ; $80E31B  18           MX
    ADC $88                         ; $80E31C  65 88        MX
    TAX                             ; $80E31E  AA           MX
    PLA                             ; $80E31F  68           MX
    STA $7F89C0,X                   ; $80E320  9F C0 89 7F  MX
    PLX                             ; $80E324  FA           MX
    JMP L_80E186                    ; $80E325  4C 86 E1     MX
L_80E328:
    STA $1268                       ; $80E328  8D 68 12     MX
    STX $126E                       ; $80E32B  8E 6E 12     MX
    STY $1270                       ; $80E32E  8C 70 12     MX
    JSR L_80F7F0                    ; $80E331  20 F0 F7     MX
    BCS L_80E38D                    ; $80E334  B0 57        MX
    AND #$3C00                      ; $80E336  29 00 3C     MX
    CMP #$0400                      ; $80E339  C9 00 04     MX
    BNE L_80E38D                    ; $80E33C  D0 4F        MX
    INX                             ; $80E33E  E8           MX
    JSR L_80F7F0                    ; $80E33F  20 F0 F7     MX
    BCS L_80E38D                    ; $80E342  B0 49        MX
    AND #$3C00                      ; $80E344  29 00 3C     MX
    CMP #$0400                      ; $80E347  C9 00 04     MX
    BNE L_80E38D                    ; $80E34A  D0 41        MX
    TXA                             ; $80E34C  8A           MX
    AND #$0003                      ; $80E34D  29 03 00     MX
    BNE L_80E361                    ; $80E350  D0 0F        MX
    JSR L_80E3A3                    ; $80E352  20 A3 E3     MX
    LDA $7F0000,X                   ; $80E355  BF 00 00 7F  MX
    CMP #$2800                      ; $80E359  C9 00 28     MX
    BCS L_80E361                    ; $80E35C  B0 03        MX
    JSR L_80E2BA                    ; $80E35E  20 BA E2     MX
L_80E361:
    LDX $126E                       ; $80E361  AE 6E 12     MX
    JSR L_80E3A3                    ; $80E364  20 A3 E3     MX
    LDA $7F0000,X                   ; $80E367  BF 00 00 7F  MX
    CMP #$2800                      ; $80E36B  C9 00 28     MX
    BCS L_80E373                    ; $80E36E  B0 03        MX
    JSR L_80E2BA                    ; $80E370  20 BA E2     MX
L_80E373:
    LDX $1268                       ; $80E373  AE 68 12     MX
    LDA $E38F,X                     ; $80E376  BD 8F E3     MX
    PHA                             ; $80E379  48           MX
    LDA $E391,X                     ; $80E37A  BD 91 E3     MX
    LDX $126E                       ; $80E37D  AE 6E 12     MX
    INX                             ; $80E380  E8           MX
    JSR L_80E306                    ; $80E381  20 06 E3     MX
    LDX $126E                       ; $80E384  AE 6E 12     MX
    PLA                             ; $80E387  68           MX
    JSR L_80E306                    ; $80E388  20 06 E3     MX
    CLC                             ; $80E38B  18           MX
    RTS                             ; $80E38C  60           MX
L_80E38D:
    SEC                             ; $80E38D  38           MX
    RTS                             ; $80E38E  60           MX
    db $F6,$23,$F7,$23,$F8,$23,$F9,$23,$FA,$23,$FB,$23,$FC,$23,$FD,$23 ; $80E38F
    db $FE,$23,$FF,$23                                                 ; $80E39F
L_80E3A3:
    PHX                             ; $80E3A3  DA           MX
    SEP #$30                        ; $80E3A4  E2 30        MX
    STY $4202                       ; $80E3A6  8C 02 42     mx
    LDA #$C0                        ; $80E3A9  A9 C0        mx
    STA $4203                       ; $80E3AB  8D 03 42     mx
    REP #$30                        ; $80E3AE  C2 30        mx
    PLA                             ; $80E3B0  68           MX
    LSR                             ; $80E3B1  4A           MX
    LSR                             ; $80E3B2  4A           MX
    ASL                             ; $80E3B3  0A           MX
    ADC $4216                       ; $80E3B4  6D 16 42     MX
    TAX                             ; $80E3B7  AA           MX
    RTS                             ; $80E3B8  60           MX
L_80E3B9:
    LDA $0CC1                       ; $80E3B9  AD C1 0C     mx
    BNE L_80E3C6                    ; $80E3BC  D0 08        mx
    LDX #$00                        ; $80E3BE  A2 00        mx
    JSR L_80E3E8                    ; $80E3C0  20 E8 E3     mx
    JSR L_80E478                    ; $80E3C3  20 78 E4     mx
L_80E3C6:
    LDA $0CC2                       ; $80E3C6  AD C2 0C     mx
    BNE L_80E3D3                    ; $80E3C9  D0 08        mx
    LDX #$01                        ; $80E3CB  A2 01        mx
    JSR L_80E3E8                    ; $80E3CD  20 E8 E3     mx
    JSR L_80E478                    ; $80E3D0  20 78 E4     mx
L_80E3D3:
    LDA $0CC3                       ; $80E3D3  AD C3 0C     mx
    BNE L_80E3DD                    ; $80E3D6  D0 05        mx
    LDX #$02                        ; $80E3D8  A2 02        mx
    JSR L_80E3E8                    ; $80E3DA  20 E8 E3     mx
L_80E3DD:
    LDA $0CC4                       ; $80E3DD  AD C4 0C     mx
    BNE L_80E3E7                    ; $80E3E0  D0 05        mx
    LDX #$03                        ; $80E3E2  A2 03        mx
    JSR L_80E3E8                    ; $80E3E4  20 E8 E3     mx
L_80E3E7:
    RTS                             ; $80E3E7  60           mx
L_80E3E8:
    LDA $0A1A,X                     ; $80E3E8  BD 1A 0A     mx
    BNE L_80E3F3                    ; $80E3EB  D0 06        mx
    LDA $0EDF,X                     ; $80E3ED  BD DF 0E     mx
    BNE L_80E3F6                    ; $80E3F0  D0 04        mx
    RTS                             ; $80E3F2  60           mx
L_80E3F3:
    JSR L_80E4D4                    ; $80E3F3  20 D4 E4     mx
L_80E3F6:
    LDA $80,X                       ; $80E3F6  B5 80        mx
    STA $50                         ; $80E3F8  85 50        mx
    LDA $84,X                       ; $80E3FA  B5 84        mx
    STA $53                         ; $80E3FC  85 53        mx
    STZ $51                         ; $80E3FE  64 51        mx
    STZ $54                         ; $80E400  64 54        mx
    STZ $52                         ; $80E402  64 52        mx
    STZ $55                         ; $80E404  64 55        mx
    LDA $50                         ; $80E406  A5 50        mx
    BPL L_80E40E                    ; $80E408  10 04        mx
    DEC $51                         ; $80E40A  C6 51        mx
    DEC $52                         ; $80E40C  C6 52        mx
L_80E40E:
    LDA $53                         ; $80E40E  A5 53        mx
    BPL L_80E416                    ; $80E410  10 04        mx
    DEC $54                         ; $80E412  C6 54        mx
    DEC $55                         ; $80E414  C6 55        mx
L_80E416:
    LDY #$06                        ; $80E416  A0 06        mx
L_80E418:
    ASL $50                         ; $80E418  06 50        mx
    ROL $51                         ; $80E41A  26 51        mx
    ROL $52                         ; $80E41C  26 52        mx
    DEY                             ; $80E41E  88           mx
    BNE L_80E418                    ; $80E41F  D0 F7        mx
    LDA $52                         ; $80E421  A5 52        mx
    BMI L_80E433                    ; $80E423  30 0E        mx
    LDA $51                         ; $80E425  A5 51        mx
    CMP #$10                        ; $80E427  C9 10        mx
    BCC L_80E43F                    ; $80E429  90 14        mx
    LDA #$10                        ; $80E42B  A9 10        mx
    STA $51                         ; $80E42D  85 51        mx
    STZ $50                         ; $80E42F  64 50        mx
    BRA L_80E43F                    ; $80E431  80 0C        mx
L_80E433:
    LDA $51                         ; $80E433  A5 51        mx
    CMP #$F0                        ; $80E435  C9 F0        mx
    BCS L_80E43F                    ; $80E437  B0 06        mx
    LDA #$F0                        ; $80E439  A9 F0        mx
    STA $51                         ; $80E43B  85 51        mx
    STZ $50                         ; $80E43D  64 50        mx
L_80E43F:
    LDY #$05                        ; $80E43F  A0 05        mx
L_80E441:
    ASL $53                         ; $80E441  06 53        mx
    ROL $54                         ; $80E443  26 54        mx
    ROL $55                         ; $80E445  26 55        mx
    DEY                             ; $80E447  88           mx
    BNE L_80E441                    ; $80E448  D0 F7        mx
    LDY $A024,X                     ; $80E44A  BC 24 A0     mx
    LDA $00DC,Y                     ; $80E44D  B9 DC 00     mx
    CLC                             ; $80E450  18           mx
    ADC $50                         ; $80E451  65 50        mx
    STA $00DC,Y                     ; $80E453  99 DC 00     mx
    REP #$30                        ; $80E456  C2 30        mx
    LDA $00DD,Y                     ; $80E458  B9 DD 00     MX
    ADC $51                         ; $80E45B  65 51        MX
    STA $00DD,Y                     ; $80E45D  99 DD 00     MX
    SEP #$30                        ; $80E460  E2 30        MX
    LDA $00EE,Y                     ; $80E462  B9 EE 00     mx
    CLC                             ; $80E465  18           mx
    ADC $53                         ; $80E466  65 53        mx
    STA $00EE,Y                     ; $80E468  99 EE 00     mx
    REP #$30                        ; $80E46B  C2 30        mx
    LDA $00EF,Y                     ; $80E46D  B9 EF 00     MX
    ADC $54                         ; $80E470  65 54        MX
    STA $00EF,Y                     ; $80E472  99 EF 00     MX
    SEP #$30                        ; $80E475  E2 30        MX
    RTS                             ; $80E477  60           mx
L_80E478:
    LDA $0A1A,X                     ; $80E478  BD 1A 0A     mx
    BNE L_80E482                    ; $80E47B  D0 05        mx
    LDA $0EDF,X                     ; $80E47D  BD DF 0E     mx
    BEQ L_80E4D3                    ; $80E480  F0 51        mx
L_80E482:
    PHX                             ; $80E482  DA           mx
    TXA                             ; $80E483  8A           mx
    ASL                             ; $80E484  0A           mx
    TAX                             ; $80E485  AA           mx
    ASL $50                         ; $80E486  06 50        mx
    ROL $51                         ; $80E488  26 51        mx
    ROL $52                         ; $80E48A  26 52        mx
    LDA $50                         ; $80E48C  A5 50        mx
    CLC                             ; $80E48E  18           mx
    ADC $000C,Y                     ; $80E48F  79 0C 00     mx
    STA $000C,Y                     ; $80E492  99 0C 00     mx
    STA $0376,Y                     ; $80E495  99 76 03     mx
    REP #$30                        ; $80E498  C2 30        mx
    LDA $51                         ; $80E49A  A5 51        MX
    ADC $0AE3,X                     ; $80E49C  7D E3 0A     MX
    SEC                             ; $80E49F  38           MX
    SBC $0ADB,X                     ; $80E4A0  FD DB 0A     MX
    CLC                             ; $80E4A3  18           MX
    ADC $000D,Y                     ; $80E4A4  79 0D 00     MX
    STA $000D,Y                     ; $80E4A7  99 0D 00     MX
    STA $0377,Y                     ; $80E4AA  99 77 03     MX
    SEP #$30                        ; $80E4AD  E2 30        MX
    LDA $0012,Y                     ; $80E4AF  B9 12 00     mx
    CLC                             ; $80E4B2  18           mx
    ADC $53                         ; $80E4B3  65 53        mx
    STA $0012,Y                     ; $80E4B5  99 12 00     mx
    STA $037C,Y                     ; $80E4B8  99 7C 03     mx
    REP #$30                        ; $80E4BB  C2 30        mx
    LDA $54                         ; $80E4BD  A5 54        MX
    ADC $0AE7,X                     ; $80E4BF  7D E7 0A     MX
    SEC                             ; $80E4C2  38           MX
    SBC $0ADF,X                     ; $80E4C3  FD DF 0A     MX
    CLC                             ; $80E4C6  18           MX
    ADC $0013,Y                     ; $80E4C7  79 13 00     MX
    STA $0013,Y                     ; $80E4CA  99 13 00     MX
    STA $037D,Y                     ; $80E4CD  99 7D 03     MX
    SEP #$30                        ; $80E4D0  E2 30        MX
    PLX                             ; $80E4D2  FA           mx
L_80E4D3:
    RTS                             ; $80E4D3  60           mx
L_80E4D4:
    PHY                             ; $80E4D4  5A           mx
    LDY $A024,X                     ; $80E4D5  BC 24 A0     mx
    REP #$20                        ; $80E4D8  C2 20        mx
    LDA $0C5B,Y                     ; $80E4DA  B9 5B 0C     Mx
    CMP $00DD,Y                     ; $80E4DD  D9 DD 00     Mx
    BNE L_80E4EA                    ; $80E4E0  D0 08        Mx
    LDA $0C67,Y                     ; $80E4E2  B9 67 0C     Mx
    CMP $00EF,Y                     ; $80E4E5  D9 EF 00     Mx
    BEQ L_80E55A                    ; $80E4E8  F0 70        Mx
L_80E4EA:
    LDA $0C5B,Y                     ; $80E4EA  B9 5B 0C     Mx
    SEC                             ; $80E4ED  38           Mx
    SBC $00DD,Y                     ; $80E4EE  F9 DD 00     Mx
    BEQ L_80E503                    ; $80E4F1  F0 10        Mx
    BMI L_80E508                    ; $80E4F3  30 13        Mx
    CMP #$0010                      ; $80E4F5  C9 10 00     Mx
    BCC L_80E4FF                    ; $80E4F8  90 05        Mx
    LDA #$0040                      ; $80E4FA  A9 40 00     Mx
    BRA L_80E51C                    ; $80E4FD  80 1D        Mx
L_80E4FF:
    ASL                             ; $80E4FF  0A           Mx
    ASL                             ; $80E500  0A           Mx
    BRA L_80E51C                    ; $80E501  80 19        Mx
L_80E503:
    LDA #$0000                      ; $80E503  A9 00 00     Mx
    BRA L_80E51C                    ; $80E506  80 14        Mx
L_80E508:
    CMP #$FFF0                      ; $80E508  C9 F0 FF     Mx
    BCC L_80E519                    ; $80E50B  90 0C        Mx
    EOR #$FFFF                      ; $80E50D  49 FF FF     Mx
    INC                             ; $80E510  1A           Mx
    ASL                             ; $80E511  0A           Mx
    ASL                             ; $80E512  0A           Mx
    EOR #$FFFF                      ; $80E513  49 FF FF     Mx
    INC                             ; $80E516  1A           Mx
    BRA L_80E51C                    ; $80E517  80 03        Mx
L_80E519:
    LDA #$00C0                      ; $80E519  A9 C0 00     Mx
L_80E51C:
    SEP #$20                        ; $80E51C  E2 20        Mx
    STA $80,X                       ; $80E51E  95 80        mx
    REP #$20                        ; $80E520  C2 20        mx
    LDA $0C67,Y                     ; $80E522  B9 67 0C     Mx
    SEC                             ; $80E525  38           Mx
    SBC $00EF,Y                     ; $80E526  F9 EF 00     Mx
    BEQ L_80E53B                    ; $80E529  F0 10        Mx
    BMI L_80E540                    ; $80E52B  30 13        Mx
    CMP #$0008                      ; $80E52D  C9 08 00     Mx
    BCC L_80E537                    ; $80E530  90 05        Mx
    LDA #$0040                      ; $80E532  A9 40 00     Mx
    BRA L_80E554                    ; $80E535  80 1D        Mx
L_80E537:
    ASL                             ; $80E537  0A           Mx
    ASL                             ; $80E538  0A           Mx
    BRA L_80E554                    ; $80E539  80 19        Mx
L_80E53B:
    LDA #$0000                      ; $80E53B  A9 00 00     Mx
    BRA L_80E554                    ; $80E53E  80 14        Mx
L_80E540:
    CMP #$FFF8                      ; $80E540  C9 F8 FF     Mx
    BCC L_80E551                    ; $80E543  90 0C        Mx
    EOR #$FFFF                      ; $80E545  49 FF FF     Mx
    INC                             ; $80E548  1A           Mx
    ASL                             ; $80E549  0A           Mx
    ASL                             ; $80E54A  0A           Mx
    EOR #$FFFF                      ; $80E54B  49 FF FF     Mx
    INC                             ; $80E54E  1A           Mx
    BRA L_80E554                    ; $80E54F  80 03        Mx
L_80E551:
    LDA #$00C0                      ; $80E551  A9 C0 00     Mx
L_80E554:
    SEP #$20                        ; $80E554  E2 20        Mx
    STA $84,X                       ; $80E556  95 84        mx
    BRA L_80E568                    ; $80E558  80 0E        mx
L_80E55A:
    SEP #$20                        ; $80E55A  E2 20        Mx
    STZ $80,X                       ; $80E55C  74 80        mx
    STZ $84,X                       ; $80E55E  74 84        mx
    STZ $0A1A,X                     ; $80E560  9E 1A 0A     mx
    LDA #$04                        ; $80E563  A9 04        mx
    STA $0ED3,X                     ; $80E565  9D D3 0E     mx
L_80E568:
    STZ $0C76,X                     ; $80E568  9E 76 0C     mx
    PLY                             ; $80E56B  7A           mx
    RTS                             ; $80E56C  60           mx
L_80E56D:
    ORA $0362                       ; $80E56D  0D 62 03     MX
    STA $0362                       ; $80E570  8D 62 03     MX
    RTS                             ; $80E573  60           MX
L_80E574:
    LDA $0D                         ; $80E574  A5 0D        MX
    STA $18                         ; $80E576  85 18        MX
    LDA $13                         ; $80E578  A5 13        MX
    STA $1A                         ; $80E57A  85 1A        MX
    LDA $0377                       ; $80E57C  AD 77 03     MX
    STA $0382                       ; $80E57F  8D 82 03     MX
    LDA $037D                       ; $80E582  AD 7D 03     MX
    STA $0384                       ; $80E585  8D 84 03     MX
    LDA $0362                       ; $80E588  AD 62 03     MX
    BEQ L_80E5B9                    ; $80E58B  F0 2C        MX
    BIT #$0001                      ; $80E58D  89 01 00     MX
    BEQ L_80E595                    ; $80E590  F0 03        MX
    JSR L_80EA6B                    ; $80E592  20 6B EA     MX
L_80E595:
    LDA $0362                       ; $80E595  AD 62 03     MX
    BIT #$0002                      ; $80E598  89 02 00     MX
    BEQ L_80E5A0                    ; $80E59B  F0 03        MX
    JSR L_80EB57                    ; $80E59D  20 57 EB     MX
L_80E5A0:
    LDA $0362                       ; $80E5A0  AD 62 03     MX
    BIT #$0004                      ; $80E5A3  89 04 00     MX
    BEQ L_80E5AB                    ; $80E5A6  F0 03        MX
    JSR L_80EE22                    ; $80E5A8  20 22 EE     MX
L_80E5AB:
    LDA $0362                       ; $80E5AB  AD 62 03     MX
    BIT #$0008                      ; $80E5AE  89 08 00     MX
    BEQ L_80E5B6                    ; $80E5B1  F0 03        MX
    JSR L_80EF0E                    ; $80E5B3  20 0E EF     MX
L_80E5B6:
    STZ $0362                       ; $80E5B6  9C 62 03     MX
L_80E5B9:
    RTS                             ; $80E5B9  60           MX
L_80E5BA:
    LDA $1A                         ; $80E5BA  A5 1A        MX
    AND #$FFF8                      ; $80E5BC  29 F8 FF     MX
    STA $88                         ; $80E5BF  85 88        MX
    LDA $13                         ; $80E5C1  A5 13        MX
    AND #$FFF8                      ; $80E5C3  29 F8 FF     MX
    SEC                             ; $80E5C6  38           MX
    SBC $88                         ; $80E5C7  E5 88        MX
    BEQ L_80E5D5                    ; $80E5C9  F0 0A        MX
    BPL L_80E5D2                    ; $80E5CB  10 05        MX
    JSR L_80E68D                    ; $80E5CD  20 8D E6     MX
    BRA L_80E5D5                    ; $80E5D0  80 03        MX
L_80E5D2:
    JSR L_80E63B                    ; $80E5D2  20 3B E6     MX
L_80E5D5:
    LDA $18                         ; $80E5D5  A5 18        MX
    AND #$FFE0                      ; $80E5D7  29 E0 FF     MX
    STA $88                         ; $80E5DA  85 88        MX
    LDA $0D                         ; $80E5DC  A5 0D        MX
    AND #$FFE0                      ; $80E5DE  29 E0 FF     MX
    SEC                             ; $80E5E1  38           MX
    SBC $88                         ; $80E5E2  E5 88        MX
    BEQ L_80E5F0                    ; $80E5E4  F0 0A        MX
    BPL L_80E5ED                    ; $80E5E6  10 05        MX
    JSR L_80E618                    ; $80E5E8  20 18 E6     MX
    BRA L_80E5F0                    ; $80E5EB  80 03        MX
L_80E5ED:
    JSR L_80E5F1                    ; $80E5ED  20 F1 E5     MX
L_80E5F0:
    RTS                             ; $80E5F0  60           MX
L_80E5F1:
    LDA $0366                       ; $80E5F1  AD 66 03     MX
    CLC                             ; $80E5F4  18           MX
    ADC #$0004                      ; $80E5F5  69 04 00     MX
    STA $0366                       ; $80E5F8  8D 66 03     MX
    CLC                             ; $80E5FB  18           MX
    ADC #$0020                      ; $80E5FC  69 20 00     MX
    TAX                             ; $80E5FF  AA           MX
    LDY $0368                       ; $80E600  AC 68 03     MX
    LDA $13                         ; $80E603  A5 13        MX
    AND #$0008                      ; $80E605  29 08 00     MX
    BNE L_80E60C                    ; $80E608  D0 02        MX
    DEY                             ; $80E60A  88           MX
    DEY                             ; $80E60B  88           MX
L_80E60C:
    LDA #$0020                      ; $80E60C  A9 20 00     MX
    JSR L_80E755                    ; $80E60F  20 55 E7     MX
    LDA #$0001                      ; $80E612  A9 01 00     MX
    JMP L_80E56D                    ; $80E615  4C 6D E5     MX
L_80E618:
    LDA $0366                       ; $80E618  AD 66 03     MX
    SEC                             ; $80E61B  38           MX
    SBC #$0004                      ; $80E61C  E9 04 00     MX
    STA $0366                       ; $80E61F  8D 66 03     MX
    TAX                             ; $80E622  AA           MX
    LDY $0368                       ; $80E623  AC 68 03     MX
    LDA $13                         ; $80E626  A5 13        MX
    AND #$0008                      ; $80E628  29 08 00     MX
    BNE L_80E62F                    ; $80E62B  D0 02        MX
    DEY                             ; $80E62D  88           MX
    DEY                             ; $80E62E  88           MX
L_80E62F:
    LDA #$0000                      ; $80E62F  A9 00 00     MX
    JSR L_80E755                    ; $80E632  20 55 E7     MX
    LDA #$0001                      ; $80E635  A9 01 00     MX
    JMP L_80E56D                    ; $80E638  4C 6D E5     MX
L_80E63B:
    LDA $13                         ; $80E63B  A5 13        MX
    LSR                             ; $80E63D  4A           MX
    LSR                             ; $80E63E  4A           MX
    LSR                             ; $80E63F  4A           MX
    AND #$FFFE                      ; $80E640  29 FE FF     MX
    LDX $13                         ; $80E643  A6 13        MX
    BPL L_80E64A                    ; $80E645  10 03        MX
    ORA #$E000                      ; $80E647  09 00 E0     MX
L_80E64A:
    STA $0368                       ; $80E64A  8D 68 03     MX
    LDA $13                         ; $80E64D  A5 13        MX
    AND #$0008                      ; $80E64F  29 08 00     MX
    BEQ L_80E66B                    ; $80E652  F0 17        MX
    LDA $0368                       ; $80E654  AD 68 03     MX
    CLC                             ; $80E657  18           MX
    ADC #$001E                      ; $80E658  69 1E 00     MX
    TAY                             ; $80E65B  A8           MX
    LDX $0366                       ; $80E65C  AE 66 03     MX
    LDA #$001E                      ; $80E65F  A9 1E 00     MX
    JSR L_80E8E0                    ; $80E662  20 E0 E8     MX
    LDA #$0002                      ; $80E665  A9 02 00     MX
    JMP L_80E56D                    ; $80E668  4C 6D E5     MX
L_80E66B:
    LDA $13                         ; $80E66B  A5 13        MX
    SEC                             ; $80E66D  38           MX
    SBC $1A                         ; $80E66E  E5 1A        MX
    CMP #$0009                      ; $80E670  C9 09 00     MX
    BCC L_80E68C                    ; $80E673  90 17        MX
    LDA $0368                       ; $80E675  AD 68 03     MX
    CLC                             ; $80E678  18           MX
    ADC #$001C                      ; $80E679  69 1C 00     MX
    TAY                             ; $80E67C  A8           MX
    LDX $0366                       ; $80E67D  AE 66 03     MX
    LDA #$001C                      ; $80E680  A9 1C 00     MX
    JSR L_80E8E0                    ; $80E683  20 E0 E8     MX
    LDA #$0002                      ; $80E686  A9 02 00     MX
    JMP L_80E56D                    ; $80E689  4C 6D E5     MX
L_80E68C:
    RTS                             ; $80E68C  60           MX
L_80E68D:
    LDA $13                         ; $80E68D  A5 13        MX
    LSR                             ; $80E68F  4A           MX
    LSR                             ; $80E690  4A           MX
    LSR                             ; $80E691  4A           MX
    AND #$FFFE                      ; $80E692  29 FE FF     MX
    LDX $13                         ; $80E695  A6 13        MX
    BPL L_80E69C                    ; $80E697  10 03        MX
    ORA #$E000                      ; $80E699  09 00 E0     MX
L_80E69C:
    STA $0368                       ; $80E69C  8D 68 03     MX
    LDA $13                         ; $80E69F  A5 13        MX
    AND #$0008                      ; $80E6A1  29 08 00     MX
    BNE L_80E6BA                    ; $80E6A4  D0 14        MX
    LDY $0368                       ; $80E6A6  AC 68 03     MX
    DEY                             ; $80E6A9  88           MX
    DEY                             ; $80E6AA  88           MX
    LDX $0366                       ; $80E6AB  AE 66 03     MX
    LDA #$FFFE                      ; $80E6AE  A9 FE FF     MX
    JSR L_80E8E0                    ; $80E6B1  20 E0 E8     MX
    LDA #$0002                      ; $80E6B4  A9 02 00     MX
    JMP L_80E56D                    ; $80E6B7  4C 6D E5     MX
L_80E6BA:
    LDA $1A                         ; $80E6BA  A5 1A        MX
    SEC                             ; $80E6BC  38           MX
    SBC $13                         ; $80E6BD  E5 13        MX
    CMP #$0009                      ; $80E6BF  C9 09 00     MX
    BCC L_80E6D6                    ; $80E6C2  90 12        MX
    LDX $0366                       ; $80E6C4  AE 66 03     MX
    LDY $0368                       ; $80E6C7  AC 68 03     MX
    LDA #$0000                      ; $80E6CA  A9 00 00     MX
    JSR L_80E8E0                    ; $80E6CD  20 E0 E8     MX
    LDA #$0002                      ; $80E6D0  A9 02 00     MX
    JMP L_80E56D                    ; $80E6D3  4C 6D E5     MX
L_80E6D6:
    RTS                             ; $80E6D6  60           MX
L_80E6D7:
    STZ $0C                         ; $80E6D7  64 0C        MX
    STZ $12                         ; $80E6D9  64 12        MX
    STZ $0376                       ; $80E6DB  9C 76 03     MX
    STZ $037C                       ; $80E6DE  9C 7C 03     MX
    STZ $0362                       ; $80E6E1  9C 62 03     MX
    LDA $4C                         ; $80E6E4  A5 4C        MX
    AND #$00FF                      ; $80E6E6  29 FF 00     MX
    ASL                             ; $80E6E9  0A           MX
    ASL                             ; $80E6EA  0A           MX
    ASL                             ; $80E6EB  0A           MX
    ASL                             ; $80E6EC  0A           MX
    STA $0D                         ; $80E6ED  85 0D        MX
    STA $18                         ; $80E6EF  85 18        MX
    STA $0377                       ; $80E6F1  8D 77 03     MX
    STA $0382                       ; $80E6F4  8D 82 03     MX
    LSR                             ; $80E6F7  4A           MX
    LSR                             ; $80E6F8  4A           MX
    LSR                             ; $80E6F9  4A           MX
    AND #$FFFC                      ; $80E6FA  29 FC FF     MX
    STA $0366                       ; $80E6FD  8D 66 03     MX
    STA $036A                       ; $80E700  8D 6A 03     MX
    TAX                             ; $80E703  AA           MX
    LDA $4E                         ; $80E704  A5 4E        MX
    AND #$00FF                      ; $80E706  29 FF 00     MX
    ASL                             ; $80E709  0A           MX
    ASL                             ; $80E70A  0A           MX
    ASL                             ; $80E70B  0A           MX
    STA $13                         ; $80E70C  85 13        MX
    STA $1A                         ; $80E70E  85 1A        MX
    STA $037D                       ; $80E710  8D 7D 03     MX
    STA $0384                       ; $80E713  8D 84 03     MX
    LSR                             ; $80E716  4A           MX
    LSR                             ; $80E717  4A           MX
    LSR                             ; $80E718  4A           MX
    AND #$FFFE                      ; $80E719  29 FE FF     MX
    STA $0368                       ; $80E71C  8D 68 03     MX
    STA $036C                       ; $80E71F  8D 6C 03     MX
    TAY                             ; $80E722  A8           MX
    LDA $13                         ; $80E723  A5 13        MX
    BIT #$0008                      ; $80E725  89 08 00     MX
    BNE L_80E72C                    ; $80E728  D0 02        MX
    DEY                             ; $80E72A  88           MX
    DEY                             ; $80E72B  88           MX
L_80E72C:
    LDA #$0000                      ; $80E72C  A9 00 00     MX
L_80E72F:
    PHX                             ; $80E72F  DA           MX
    PHY                             ; $80E730  5A           MX
    PHA                             ; $80E731  48           MX
    JSR L_80E755                    ; $80E732  20 55 E7     MX
    JSR L_80EA6B                    ; $80E735  20 6B EA     MX
    PLA                             ; $80E738  68           MX
    PLY                             ; $80E739  7A           MX
    PLX                             ; $80E73A  FA           MX
    PHX                             ; $80E73B  DA           MX
    PHY                             ; $80E73C  5A           MX
    PHA                             ; $80E73D  48           MX
    JSR L_80ED3D                    ; $80E73E  20 3D ED     MX
    JSR L_80EE22                    ; $80E741  20 22 EE     MX
    PLA                             ; $80E744  68           MX
    PLY                             ; $80E745  7A           MX
    PLX                             ; $80E746  FA           MX
    INX                             ; $80E747  E8           MX
    INX                             ; $80E748  E8           MX
    INX                             ; $80E749  E8           MX
    INX                             ; $80E74A  E8           MX
    INC                             ; $80E74B  1A           MX
    INC                             ; $80E74C  1A           MX
    INC                             ; $80E74D  1A           MX
    INC                             ; $80E74E  1A           MX
    CMP #$0024                      ; $80E74F  C9 24 00     MX
    BNE L_80E72F                    ; $80E752  D0 DB        MX
    RTS                             ; $80E754  60           MX
L_80E755:
    PHY                             ; $80E755  5A           MX
    PHA                             ; $80E756  48           MX
    LDA #$3500                      ; $80E757  A9 00 35     MX
    STA $04                         ; $80E75A  85 04        MX
    LDA #$007E                      ; $80E75C  A9 7E 00     MX
    STA $06                         ; $80E75F  85 06        MX
    LDA #$0000                      ; $80E761  A9 00 00     MX
    STA $9C                         ; $80E764  85 9C        MX
    JSR L_80E7B0                    ; $80E766  20 B0 E7     MX
    LDY #$0000                      ; $80E769  A0 00 00     MX
    PLA                             ; $80E76C  68           MX
    CLC                             ; $80E76D  18           MX
    ADC $0366                       ; $80E76E  6D 66 03     MX
    AND #$003F                      ; $80E771  29 3F 00     MX
    CMP #$0020                      ; $80E774  C9 20 00     MX
    BCC L_80E77F                    ; $80E777  90 06        MX
    LDY #$0400                      ; $80E779  A0 00 04     MX
    AND #$001F                      ; $80E77C  29 1F 00     MX
L_80E77F:
    STY $88                         ; $80E77F  84 88        MX
    CLC                             ; $80E781  18           MX
    ADC $88                         ; $80E782  65 88        MX
    STA $038A                       ; $80E784  8D 8A 03     MX
    STA $038C                       ; $80E787  8D 8C 03     MX
    PLA                             ; $80E78A  68           MX
    AND #$001F                      ; $80E78B  29 1F 00     MX
    ASL                             ; $80E78E  0A           MX
    STA $88                         ; $80E78F  85 88        MX
    TAY                             ; $80E791  A8           MX
    LDA $F86D,Y                     ; $80E792  B9 6D F8     MX
    CLC                             ; $80E795  18           MX
    ADC $038A                       ; $80E796  6D 8A 03     MX
    STA $038A                       ; $80E799  8D 8A 03     MX
    LDA #$0040                      ; $80E79C  A9 40 00     MX
    SEC                             ; $80E79F  38           MX
    SBC $88                         ; $80E7A0  E5 88        MX
    STA $038E                       ; $80E7A2  8D 8E 03     MX
    LDA #$0040                      ; $80E7A5  A9 40 00     MX
    SEC                             ; $80E7A8  38           MX
    SBC $038E                       ; $80E7A9  ED 8E 03     MX
    STA $0390                       ; $80E7AC  8D 90 03     MX
    RTS                             ; $80E7AF  60           MX
L_80E7B0:
    TXA                             ; $80E7B0  8A           MX
    ASL                             ; $80E7B1  0A           MX
    TXA                             ; $80E7B2  8A           MX
    ROR                             ; $80E7B3  6A           MX
    TAX                             ; $80E7B4  AA           MX
    TYA                             ; $80E7B5  98           MX
    ASL                             ; $80E7B6  0A           MX
    TYA                             ; $80E7B7  98           MX
    ROR                             ; $80E7B8  6A           MX
    TAY                             ; $80E7B9  A8           MX
    LDA #$0010                      ; $80E7BA  A9 10 00     MX
    STA $9E                         ; $80E7BD  85 9E        MX
L_80E7BF:
    JSR L_80E7D0                    ; $80E7BF  20 D0 E7     MX
    INY                             ; $80E7C2  C8           MX
    LDA $9C                         ; $80E7C3  A5 9C        MX
    CLC                             ; $80E7C5  18           MX
    ADC #$0004                      ; $80E7C6  69 04 00     MX
    STA $9C                         ; $80E7C9  85 9C        MX
    DEC $9E                         ; $80E7CB  C6 9E        MX
    BNE L_80E7BF                    ; $80E7CD  D0 F0        MX
    RTS                             ; $80E7CF  60           MX
L_80E7D0:
    STX $60                         ; $80E7D0  86 60        MX
    STY $62                         ; $80E7D2  84 62        MX
    CPX #$00C0                      ; $80E7D4  E0 C0 00     MX
    BCS L_80E7E1                    ; $80E7D7  B0 08        MX
    CPY #$0039                      ; $80E7D9  C0 39 00     MX
    BCS L_80E7E1                    ; $80E7DC  B0 03        MX
    BRL L_80E873                    ; $80E7DE  82 92 00     MX
L_80E7E1:
    LDY $9C                         ; $80E7E1  A4 9C        MX
    LDA $62                         ; $80E7E3  A5 62        MX
    LSR                             ; $80E7E5  4A           MX
    BCC L_80E82C                    ; $80E7E6  90 44        MX
    LDA $7F5DC8                     ; $80E7E8  AF C8 5D 7F  MX
    TAX                             ; $80E7EC  AA           MX
    LDA $7F89C0,X                   ; $80E7ED  BF C0 89 7F  MX
    STA $03DA,Y                     ; $80E7F1  99 DA 03     MX
    LDA $7F89C2,X                   ; $80E7F4  BF C2 89 7F  MX
    STA $05FA,Y                     ; $80E7F8  99 FA 05     MX
    LDA $7F89C4,X                   ; $80E7FB  BF C4 89 7F  MX
    STA $081A,Y                     ; $80E7FF  99 1A 08     MX
    LDA $7F89C6,X                   ; $80E802  BF C6 89 7F  MX
    STA $091A,Y                     ; $80E806  99 1A 09     MX
    LDA $7F5DCA                     ; $80E809  AF CA 5D 7F  MX
    TAX                             ; $80E80D  AA           MX
    LDA $7F89C0,X                   ; $80E80E  BF C0 89 7F  MX
    STA $03DC,Y                     ; $80E812  99 DC 03     MX
    LDA $7F89C2,X                   ; $80E815  BF C2 89 7F  MX
    STA $05FC,Y                     ; $80E819  99 FC 05     MX
    LDA $7F89C4,X                   ; $80E81C  BF C4 89 7F  MX
    STA $081C,Y                     ; $80E820  99 1C 08     MX
    LDA $7F89C6,X                   ; $80E823  BF C6 89 7F  MX
    STA $091C,Y                     ; $80E827  99 1C 09     MX
    BRA L_80E86E                    ; $80E82A  80 42        MX
L_80E82C:
    LDA $7F5DC4                     ; $80E82C  AF C4 5D 7F  MX
    TAX                             ; $80E830  AA           MX
    LDA $7F89C0,X                   ; $80E831  BF C0 89 7F  MX
    STA $03DA,Y                     ; $80E835  99 DA 03     MX
    LDA $7F89C2,X                   ; $80E838  BF C2 89 7F  MX
    STA $05FA,Y                     ; $80E83C  99 FA 05     MX
    LDA $7F89C4,X                   ; $80E83F  BF C4 89 7F  MX
    STA $081A,Y                     ; $80E843  99 1A 08     MX
    LDA $7F89C6,X                   ; $80E846  BF C6 89 7F  MX
    STA $091A,Y                     ; $80E84A  99 1A 09     MX
    LDA $7F5DC6                     ; $80E84D  AF C6 5D 7F  MX
    TAX                             ; $80E851  AA           MX
    LDA $7F89C0,X                   ; $80E852  BF C0 89 7F  MX
    STA $03DC,Y                     ; $80E856  99 DC 03     MX
    LDA $7F89C2,X                   ; $80E859  BF C2 89 7F  MX
    STA $05FC,Y                     ; $80E85D  99 FC 05     MX
    LDA $7F89C4,X                   ; $80E860  BF C4 89 7F  MX
    STA $081C,Y                     ; $80E864  99 1C 08     MX
    LDA $7F89C6,X                   ; $80E867  BF C6 89 7F  MX
    STA $091C,Y                     ; $80E86B  99 1C 09     MX
L_80E86E:
    LDX $60                         ; $80E86E  A6 60        MX
    LDY $62                         ; $80E870  A4 62        MX
    RTS                             ; $80E872  60           MX
L_80E873:
    SEP #$30                        ; $80E873  E2 30        MX
    TYA                             ; $80E875  98           mx
    ASL                             ; $80E876  0A           mx
    STA $4202                       ; $80E877  8D 02 42     mx
    LDA #$C0                        ; $80E87A  A9 C0        mx
    STA $4203                       ; $80E87C  8D 03 42     mx
    REP #$30                        ; $80E87F  C2 30        mx
    TXA                             ; $80E881  8A           MX
    LSR                             ; $80E882  4A           MX
    ASL                             ; $80E883  0A           MX
    ADC $4216                       ; $80E884  6D 16 42     MX
    TAY                             ; $80E887  A8           MX
    PHY                             ; $80E888  5A           MX
    LDA [$04],Y                     ; $80E889  B7 04        MX
    TAX                             ; $80E88B  AA           MX
    LDA $7F5DC0,X                   ; $80E88C  BF C0 5D 7F  MX
    TAX                             ; $80E890  AA           MX
    LDY $9C                         ; $80E891  A4 9C        MX
    LDA $7F89C0,X                   ; $80E893  BF C0 89 7F  MX
    STA $03DA,Y                     ; $80E897  99 DA 03     MX
    LDA $7F89C2,X                   ; $80E89A  BF C2 89 7F  MX
    STA $05FA,Y                     ; $80E89E  99 FA 05     MX
    LDA $7F89C4,X                   ; $80E8A1  BF C4 89 7F  MX
    STA $081A,Y                     ; $80E8A5  99 1A 08     MX
    LDA $7F89C6,X                   ; $80E8A8  BF C6 89 7F  MX
    STA $091A,Y                     ; $80E8AC  99 1A 09     MX
    PLA                             ; $80E8AF  68           MX
    CLC                             ; $80E8B0  18           MX
    ADC #$00C0                      ; $80E8B1  69 C0 00     MX
    TAY                             ; $80E8B4  A8           MX
    LDA [$04],Y                     ; $80E8B5  B7 04        MX
    TAX                             ; $80E8B7  AA           MX
    LDA $7F5DC0,X                   ; $80E8B8  BF C0 5D 7F  MX
    TAX                             ; $80E8BC  AA           MX
    LDY $9C                         ; $80E8BD  A4 9C        MX
    LDA $7F89C0,X                   ; $80E8BF  BF C0 89 7F  MX
    STA $03DC,Y                     ; $80E8C3  99 DC 03     MX
    LDA $7F89C2,X                   ; $80E8C6  BF C2 89 7F  MX
    STA $05FC,Y                     ; $80E8CA  99 FC 05     MX
    LDA $7F89C4,X                   ; $80E8CD  BF C4 89 7F  MX
    STA $081C,Y                     ; $80E8D1  99 1C 08     MX
    LDA $7F89C6,X                   ; $80E8D4  BF C6 89 7F  MX
    STA $091C,Y                     ; $80E8D8  99 1C 09     MX
    LDX $60                         ; $80E8DB  A6 60        MX
    LDY $62                         ; $80E8DD  A4 62        MX
    RTS                             ; $80E8DF  60           MX
L_80E8E0:
    PHA                             ; $80E8E0  48           MX
    PHX                             ; $80E8E1  DA           MX
    LDA #$0100                      ; $80E8E2  A9 00 01     MX
    STA $9C                         ; $80E8E5  85 9C        MX
    LDA #$3500                      ; $80E8E7  A9 00 35     MX
    STA $04                         ; $80E8EA  85 04        MX
    LDA #$007E                      ; $80E8EC  A9 7E 00     MX
    STA $06                         ; $80E8EF  85 06        MX
    JSR L_80E96A                    ; $80E8F1  20 6A E9     MX
    LDX #$0000                      ; $80E8F4  A2 00 00     MX
    LDY #$0400                      ; $80E8F7  A0 00 04     MX
    PLA                             ; $80E8FA  68           MX
    AND #$003F                      ; $80E8FB  29 3F 00     MX
    CMP #$0020                      ; $80E8FE  C9 20 00     MX
    BCC L_80E90C                    ; $80E901  90 09        MX
    LDX #$0400                      ; $80E903  A2 00 04     MX
    LDY #$0000                      ; $80E906  A0 00 00     MX
    AND #$001F                      ; $80E909  29 1F 00     MX
L_80E90C:
    STA $88                         ; $80E90C  85 88        MX
    STX $0392                       ; $80E90E  8E 92 03     MX
    STX $0396                       ; $80E911  8E 96 03     MX
    STY $0394                       ; $80E914  8C 94 03     MX
    CLC                             ; $80E917  18           MX
    ADC $0392                       ; $80E918  6D 92 03     MX
    STA $0392                       ; $80E91B  8D 92 03     MX
    PLA                             ; $80E91E  68           MX
    CLC                             ; $80E91F  18           MX
    ADC $0368                       ; $80E920  6D 68 03     MX
    AND #$001F                      ; $80E923  29 1F 00     MX
    ASL                             ; $80E926  0A           MX
    TAY                             ; $80E927  A8           MX
    LDA $F86D,Y                     ; $80E928  B9 6D F8     MX
    TAX                             ; $80E92B  AA           MX
    ADC $0392                       ; $80E92C  6D 92 03     MX
    STA $0392                       ; $80E92F  8D 92 03     MX
    TXA                             ; $80E932  8A           MX
    ADC $0394                       ; $80E933  6D 94 03     MX
    STA $0394                       ; $80E936  8D 94 03     MX
    TXA                             ; $80E939  8A           MX
    ADC $0396                       ; $80E93A  6D 96 03     MX
    STA $0396                       ; $80E93D  8D 96 03     MX
    LDA #$0020                      ; $80E940  A9 20 00     MX
    SEC                             ; $80E943  38           MX
    SBC $88                         ; $80E944  E5 88        MX
    ASL                             ; $80E946  0A           MX
    STA $0398                       ; $80E947  8D 98 03     MX
    LDA #$0048                      ; $80E94A  A9 48 00     MX
    SEC                             ; $80E94D  38           MX
    SBC $0398                       ; $80E94E  ED 98 03     MX
    CMP #$0040                      ; $80E951  C9 40 00     MX
    BCC L_80E963                    ; $80E954  90 0D        MX
    AND #$003F                      ; $80E956  29 3F 00     MX
    STA $039C                       ; $80E959  8D 9C 03     MX
    LDA #$0040                      ; $80E95C  A9 40 00     MX
    STA $039A                       ; $80E95F  8D 9A 03     MX
    RTS                             ; $80E962  60           MX
L_80E963:
    STA $039A                       ; $80E963  8D 9A 03     MX
    STZ $039C                       ; $80E966  9C 9C 03     MX
    RTS                             ; $80E969  60           MX
L_80E96A:
    TXA                             ; $80E96A  8A           MX
    ASL                             ; $80E96B  0A           MX
    TXA                             ; $80E96C  8A           MX
    ROR                             ; $80E96D  6A           MX
    TAX                             ; $80E96E  AA           MX
    TYA                             ; $80E96F  98           MX
    ASL                             ; $80E970  0A           MX
    TYA                             ; $80E971  98           MX
    ROR                             ; $80E972  6A           MX
    TAY                             ; $80E973  A8           MX
    LDA #$0012                      ; $80E974  A9 12 00     MX
    STA $9E                         ; $80E977  85 9E        MX
L_80E979:
    JSR L_80E98A                    ; $80E979  20 8A E9     MX
    INX                             ; $80E97C  E8           MX
    LDA $9C                         ; $80E97D  A5 9C        MX
    CLC                             ; $80E97F  18           MX
    ADC #$0004                      ; $80E980  69 04 00     MX
    STA $9C                         ; $80E983  85 9C        MX
    DEC $9E                         ; $80E985  C6 9E        MX
    BNE L_80E979                    ; $80E987  D0 F0        MX
    RTS                             ; $80E989  60           MX
L_80E98A:
    STX $60                         ; $80E98A  86 60        MX
    STY $62                         ; $80E98C  84 62        MX
    CPX #$00C0                      ; $80E98E  E0 C0 00     MX
    BCS L_80E998                    ; $80E991  B0 05        MX
    CPY #$0039                      ; $80E993  C0 39 00     MX
    BCC L_80EA0A                    ; $80E996  90 72        MX
L_80E998:
    LDY #$0000                      ; $80E998  A0 00 00     MX
    TXA                             ; $80E99B  8A           MX
    LSR                             ; $80E99C  4A           MX
    BCC L_80E9A2                    ; $80E99D  90 03        MX
    LDY #$0004                      ; $80E99F  A0 04 00     MX
L_80E9A2:
    STY $64                         ; $80E9A2  84 64        MX
    LDY $9C                         ; $80E9A4  A4 9C        MX
    LDA $62                         ; $80E9A6  A5 62        MX
    LSR                             ; $80E9A8  4A           MX
    BCC L_80E9D9                    ; $80E9A9  90 2E        MX
    LDA $7F5DC8                     ; $80E9AB  AF C8 5D 7F  MX
    CLC                             ; $80E9AF  18           MX
    ADC $64                         ; $80E9B0  65 64        MX
    TAX                             ; $80E9B2  AA           MX
    LDA $7F89C0,X                   ; $80E9B3  BF C0 89 7F  MX
    STA $03DA,Y                     ; $80E9B7  99 DA 03     MX
    LDA $7F89C2,X                   ; $80E9BA  BF C2 89 7F  MX
    STA $03DC,Y                     ; $80E9BE  99 DC 03     MX
    LDA $7F5DCA                     ; $80E9C1  AF CA 5D 7F  MX
    CLC                             ; $80E9C5  18           MX
    ADC $64                         ; $80E9C6  65 64        MX
    TAX                             ; $80E9C8  AA           MX
    LDA $7F89C0,X                   ; $80E9C9  BF C0 89 7F  MX
    STA $05FA,Y                     ; $80E9CD  99 FA 05     MX
    LDA $7F89C2,X                   ; $80E9D0  BF C2 89 7F  MX
    STA $05FC,Y                     ; $80E9D4  99 FC 05     MX
    BRA L_80EA05                    ; $80E9D7  80 2C        MX
L_80E9D9:
    LDA $7F5DC4                     ; $80E9D9  AF C4 5D 7F  MX
    CLC                             ; $80E9DD  18           MX
    ADC $64                         ; $80E9DE  65 64        MX
    TAX                             ; $80E9E0  AA           MX
    LDA $7F89C0,X                   ; $80E9E1  BF C0 89 7F  MX
    STA $03DA,Y                     ; $80E9E5  99 DA 03     MX
    LDA $7F89C2,X                   ; $80E9E8  BF C2 89 7F  MX
    STA $03DC,Y                     ; $80E9EC  99 DC 03     MX
    LDA $7F5DC6                     ; $80E9EF  AF C6 5D 7F  MX
    CLC                             ; $80E9F3  18           MX
    ADC $64                         ; $80E9F4  65 64        MX
    TAX                             ; $80E9F6  AA           MX
    LDA $7F89C0,X                   ; $80E9F7  BF C0 89 7F  MX
    STA $05FA,Y                     ; $80E9FB  99 FA 05     MX
    LDA $7F89C2,X                   ; $80E9FE  BF C2 89 7F  MX
    STA $05FC,Y                     ; $80EA02  99 FC 05     MX
L_80EA05:
    LDX $60                         ; $80EA05  A6 60        MX
    LDY $62                         ; $80EA07  A4 62        MX
    RTS                             ; $80EA09  60           MX
L_80EA0A:
    SEP #$30                        ; $80EA0A  E2 30        MX
    TYA                             ; $80EA0C  98           mx
    ASL                             ; $80EA0D  0A           mx
    STA $4202                       ; $80EA0E  8D 02 42     mx
    LDA #$C0                        ; $80EA11  A9 C0        mx
    STA $4203                       ; $80EA13  8D 03 42     mx
    REP #$30                        ; $80EA16  C2 30        mx
    LDY #$0000                      ; $80EA18  A0 00 00     MX
    TXA                             ; $80EA1B  8A           MX
    LSR                             ; $80EA1C  4A           MX
    BCC L_80EA22                    ; $80EA1D  90 03        MX
    LDY #$0004                      ; $80EA1F  A0 04 00     MX
L_80EA22:
    STY $64                         ; $80EA22  84 64        MX
    ASL                             ; $80EA24  0A           MX
    ADC $4216                       ; $80EA25  6D 16 42     MX
    TAY                             ; $80EA28  A8           MX
    PHY                             ; $80EA29  5A           MX
    LDA [$04],Y                     ; $80EA2A  B7 04        MX
    TAX                             ; $80EA2C  AA           MX
    LDA $7F5DC0,X                   ; $80EA2D  BF C0 5D 7F  MX
    CLC                             ; $80EA31  18           MX
    ADC $64                         ; $80EA32  65 64        MX
    TAX                             ; $80EA34  AA           MX
    LDA $7F89C0,X                   ; $80EA35  BF C0 89 7F  MX
    LDY $9C                         ; $80EA39  A4 9C        MX
    STA $03DA,Y                     ; $80EA3B  99 DA 03     MX
    LDA $7F89C2,X                   ; $80EA3E  BF C2 89 7F  MX
    STA $03DC,Y                     ; $80EA42  99 DC 03     MX
    PLA                             ; $80EA45  68           MX
    CLC                             ; $80EA46  18           MX
    ADC #$00C0                      ; $80EA47  69 C0 00     MX
    TAY                             ; $80EA4A  A8           MX
    LDA [$04],Y                     ; $80EA4B  B7 04        MX
    TAX                             ; $80EA4D  AA           MX
    LDA $7F5DC0,X                   ; $80EA4E  BF C0 5D 7F  MX
    CLC                             ; $80EA52  18           MX
    ADC $64                         ; $80EA53  65 64        MX
    TAX                             ; $80EA55  AA           MX
    LDA $7F89C0,X                   ; $80EA56  BF C0 89 7F  MX
    LDY $9C                         ; $80EA5A  A4 9C        MX
    STA $05FA,Y                     ; $80EA5C  99 FA 05     MX
    LDA $7F89C2,X                   ; $80EA5F  BF C2 89 7F  MX
    STA $05FC,Y                     ; $80EA63  99 FC 05     MX
    LDX $60                         ; $80EA66  A6 60        MX
    LDY $62                         ; $80EA68  A4 62        MX
    RTS                             ; $80EA6A  60           MX
L_80EA6B:
    SEP #$30                        ; $80EA6B  E2 30        MX
    LDA #$81                        ; $80EA6D  A9 81        mx
    STA $2115                       ; $80EA6F  8D 15 21     mx
    LDA #$01                        ; $80EA72  A9 01        mx
    STA $4300                       ; $80EA74  8D 00 43     mx
    STA $4350                       ; $80EA77  8D 50 43     mx
    LDA #$18                        ; $80EA7A  A9 18        mx
    STA $4301                       ; $80EA7C  8D 01 43     mx
    STA $4351                       ; $80EA7F  8D 51 43     mx
    REP #$30                        ; $80EA82  C2 30        mx
    LDA $038A                       ; $80EA84  AD 8A 03     MX
    STA $2116                       ; $80EA87  8D 16 21     MX
    LDA #$03DA                      ; $80EA8A  A9 DA 03     MX
    STA $4302                       ; $80EA8D  8D 02 43     MX
    LDA #$081A                      ; $80EA90  A9 1A 08     MX
    STA $4352                       ; $80EA93  8D 52 43     MX
    LDA $038E                       ; $80EA96  AD 8E 03     MX
    STA $4305                       ; $80EA99  8D 05 43     MX
    STA $4355                       ; $80EA9C  8D 55 43     MX
    SEP #$30                        ; $80EA9F  E2 30        MX
    LDA #$7E                        ; $80EAA1  A9 7E        mx
    STA $4304                       ; $80EAA3  8D 04 43     mx
    STA $4354                       ; $80EAA6  8D 54 43     mx
    LDA #$01                        ; $80EAA9  A9 01        mx
    STA $420B                       ; $80EAAB  8D 0B 42     mx
    REP #$30                        ; $80EAAE  C2 30        mx
    LDA $038A                       ; $80EAB0  AD 8A 03     MX
    INC                             ; $80EAB3  1A           MX
    INC                             ; $80EAB4  1A           MX
    STA $2116                       ; $80EAB5  8D 16 21     MX
    SEP #$30                        ; $80EAB8  E2 30        MX
    LDA #$20                        ; $80EABA  A9 20        mx
    STA $420B                       ; $80EABC  8D 0B 42     mx
    LDA $0390                       ; $80EABF  AD 90 03     mx
    BEQ L_80EAED                    ; $80EAC2  F0 29        mx
    REP #$30                        ; $80EAC4  C2 30        mx
    LDA $038C                       ; $80EAC6  AD 8C 03     MX
    STA $2116                       ; $80EAC9  8D 16 21     MX
    LDA $0390                       ; $80EACC  AD 90 03     MX
    STA $4305                       ; $80EACF  8D 05 43     MX
    STA $4355                       ; $80EAD2  8D 55 43     MX
    SEP #$30                        ; $80EAD5  E2 30        MX
    LDA #$01                        ; $80EAD7  A9 01        mx
    STA $420B                       ; $80EAD9  8D 0B 42     mx
    REP #$30                        ; $80EADC  C2 30        mx
    LDA $038C                       ; $80EADE  AD 8C 03     MX
    INC                             ; $80EAE1  1A           MX
    INC                             ; $80EAE2  1A           MX
    STA $2116                       ; $80EAE3  8D 16 21     MX
    SEP #$30                        ; $80EAE6  E2 30        MX
    LDA #$20                        ; $80EAE8  A9 20        mx
    STA $420B                       ; $80EAEA  8D 0B 42     mx
L_80EAED:
    REP #$30                        ; $80EAED  C2 30        mx
    LDA $038A                       ; $80EAEF  AD 8A 03     MX
    INC                             ; $80EAF2  1A           MX
    STA $2116                       ; $80EAF3  8D 16 21     MX
    LDA #$05FA                      ; $80EAF6  A9 FA 05     MX
    STA $4302                       ; $80EAF9  8D 02 43     MX
    LDA #$091A                      ; $80EAFC  A9 1A 09     MX
    STA $4352                       ; $80EAFF  8D 52 43     MX
    LDA $038E                       ; $80EB02  AD 8E 03     MX
    STA $4305                       ; $80EB05  8D 05 43     MX
    STA $4355                       ; $80EB08  8D 55 43     MX
    SEP #$30                        ; $80EB0B  E2 30        MX
    LDA #$01                        ; $80EB0D  A9 01        mx
    STA $420B                       ; $80EB0F  8D 0B 42     mx
    REP #$30                        ; $80EB12  C2 30        mx
    LDA $038A                       ; $80EB14  AD 8A 03     MX
    INC                             ; $80EB17  1A           MX
    INC                             ; $80EB18  1A           MX
    INC                             ; $80EB19  1A           MX
    STA $2116                       ; $80EB1A  8D 16 21     MX
    SEP #$30                        ; $80EB1D  E2 30        MX
    LDA #$20                        ; $80EB1F  A9 20        mx
    STA $420B                       ; $80EB21  8D 0B 42     mx
    LDA $0390                       ; $80EB24  AD 90 03     mx
    BEQ L_80EB54                    ; $80EB27  F0 2B        mx
    REP #$30                        ; $80EB29  C2 30        mx
    LDA $038C                       ; $80EB2B  AD 8C 03     MX
    INC                             ; $80EB2E  1A           MX
    STA $2116                       ; $80EB2F  8D 16 21     MX
    LDA $0390                       ; $80EB32  AD 90 03     MX
    STA $4305                       ; $80EB35  8D 05 43     MX
    STA $4355                       ; $80EB38  8D 55 43     MX
    SEP #$30                        ; $80EB3B  E2 30        MX
    LDA #$01                        ; $80EB3D  A9 01        mx
    STA $420B                       ; $80EB3F  8D 0B 42     mx
    REP #$30                        ; $80EB42  C2 30        mx
    LDA $038C                       ; $80EB44  AD 8C 03     MX
    INC                             ; $80EB47  1A           MX
    INC                             ; $80EB48  1A           MX
    INC                             ; $80EB49  1A           MX
    STA $2116                       ; $80EB4A  8D 16 21     MX
    SEP #$30                        ; $80EB4D  E2 30        MX
    LDA #$20                        ; $80EB4F  A9 20        mx
    STA $420B                       ; $80EB51  8D 0B 42     mx
L_80EB54:
    REP #$30                        ; $80EB54  C2 30        mx
    RTS                             ; $80EB56  60           MX
L_80EB57:
    SEP #$30                        ; $80EB57  E2 30        MX
    LDA #$80                        ; $80EB59  A9 80        mx
    STA $2115                       ; $80EB5B  8D 15 21     mx
    LDA #$01                        ; $80EB5E  A9 01        mx
    STA $4300                       ; $80EB60  8D 00 43     mx
    LDA #$18                        ; $80EB63  A9 18        mx
    STA $4301                       ; $80EB65  8D 01 43     mx
    REP #$30                        ; $80EB68  C2 30        mx
    LDA $0392                       ; $80EB6A  AD 92 03     MX
    STA $2116                       ; $80EB6D  8D 16 21     MX
    LDA #$04DA                      ; $80EB70  A9 DA 04     MX
    STA $4302                       ; $80EB73  8D 02 43     MX
    LDA $0398                       ; $80EB76  AD 98 03     MX
    STA $4305                       ; $80EB79  8D 05 43     MX
    SEP #$30                        ; $80EB7C  E2 30        MX
    LDA #$7E                        ; $80EB7E  A9 7E        mx
    STA $4304                       ; $80EB80  8D 04 43     mx
    LDA #$01                        ; $80EB83  A9 01        mx
    STA $420B                       ; $80EB85  8D 0B 42     mx
    REP #$30                        ; $80EB88  C2 30        mx
    LDA $0394                       ; $80EB8A  AD 94 03     MX
    STA $2116                       ; $80EB8D  8D 16 21     MX
    LDA $039A                       ; $80EB90  AD 9A 03     MX
    STA $4305                       ; $80EB93  8D 05 43     MX
    SEP #$30                        ; $80EB96  E2 30        MX
    LDA #$01                        ; $80EB98  A9 01        mx
    STA $420B                       ; $80EB9A  8D 0B 42     mx
    LDA $039C                       ; $80EB9D  AD 9C 03     mx
    BEQ L_80EBB7                    ; $80EBA0  F0 15        mx
    REP #$30                        ; $80EBA2  C2 30        mx
    LDA $0396                       ; $80EBA4  AD 96 03     MX
    STA $2116                       ; $80EBA7  8D 16 21     MX
    LDA $039C                       ; $80EBAA  AD 9C 03     MX
    STA $4305                       ; $80EBAD  8D 05 43     MX
    SEP #$30                        ; $80EBB0  E2 30        MX
    LDA #$01                        ; $80EBB2  A9 01        mx
    STA $420B                       ; $80EBB4  8D 0B 42     mx
L_80EBB7:
    REP #$30                        ; $80EBB7  C2 30        mx
    LDA $0392                       ; $80EBB9  AD 92 03     MX
    CLC                             ; $80EBBC  18           MX
    ADC #$0020                      ; $80EBBD  69 20 00     MX
    STA $2116                       ; $80EBC0  8D 16 21     MX
    LDA #$06FA                      ; $80EBC3  A9 FA 06     MX
    STA $4302                       ; $80EBC6  8D 02 43     MX
    LDA $0398                       ; $80EBC9  AD 98 03     MX
    STA $4305                       ; $80EBCC  8D 05 43     MX
    SEP #$30                        ; $80EBCF  E2 30        MX
    LDA #$01                        ; $80EBD1  A9 01        mx
    STA $420B                       ; $80EBD3  8D 0B 42     mx
    REP #$30                        ; $80EBD6  C2 30        mx
    LDA $0394                       ; $80EBD8  AD 94 03     MX
    CLC                             ; $80EBDB  18           MX
    ADC #$0020                      ; $80EBDC  69 20 00     MX
    STA $2116                       ; $80EBDF  8D 16 21     MX
    LDA $039A                       ; $80EBE2  AD 9A 03     MX
    STA $4305                       ; $80EBE5  8D 05 43     MX
    SEP #$30                        ; $80EBE8  E2 30        MX
    LDA #$01                        ; $80EBEA  A9 01        mx
    STA $420B                       ; $80EBEC  8D 0B 42     mx
    LDA $039C                       ; $80EBEF  AD 9C 03     mx
    BEQ L_80EC0D                    ; $80EBF2  F0 19        mx
    REP #$30                        ; $80EBF4  C2 30        mx
    LDA $0396                       ; $80EBF6  AD 96 03     MX
    CLC                             ; $80EBF9  18           MX
    ADC #$0020                      ; $80EBFA  69 20 00     MX
    STA $2116                       ; $80EBFD  8D 16 21     MX
    LDA $039C                       ; $80EC00  AD 9C 03     MX
    STA $4305                       ; $80EC03  8D 05 43     MX
    SEP #$30                        ; $80EC06  E2 30        MX
    LDA #$01                        ; $80EC08  A9 01        mx
    STA $420B                       ; $80EC0A  8D 0B 42     mx
L_80EC0D:
    REP #$30                        ; $80EC0D  C2 30        mx
    RTS                             ; $80EC0F  60           MX
L_80EC10:
    LDA $0384                       ; $80EC10  AD 84 03     MX
    AND #$FFF8                      ; $80EC13  29 F8 FF     MX
    STA $88                         ; $80EC16  85 88        MX
    LDA $037D                       ; $80EC18  AD 7D 03     MX
    AND #$FFF8                      ; $80EC1B  29 F8 FF     MX
    SEC                             ; $80EC1E  38           MX
    SBC $88                         ; $80EC1F  E5 88        MX
    BEQ L_80EC2D                    ; $80EC21  F0 0A        MX
    BPL L_80EC2A                    ; $80EC23  10 05        MX
    JSR L_80ECEE                    ; $80EC25  20 EE EC     MX
    BRA L_80EC2D                    ; $80EC28  80 03        MX
L_80EC2A:
    JSR L_80EC97                    ; $80EC2A  20 97 EC     MX
L_80EC2D:
    LDA $0382                       ; $80EC2D  AD 82 03     MX
    AND #$FFE0                      ; $80EC30  29 E0 FF     MX
    STA $88                         ; $80EC33  85 88        MX
    LDA $0377                       ; $80EC35  AD 77 03     MX
    AND #$FFE0                      ; $80EC38  29 E0 FF     MX
    SEC                             ; $80EC3B  38           MX
    SBC $88                         ; $80EC3C  E5 88        MX
    BEQ L_80EC4A                    ; $80EC3E  F0 0A        MX
    BPL L_80EC47                    ; $80EC40  10 05        MX
    JSR L_80EC73                    ; $80EC42  20 73 EC     MX
    BRA L_80EC4A                    ; $80EC45  80 03        MX
L_80EC47:
    JSR L_80EC4B                    ; $80EC47  20 4B EC     MX
L_80EC4A:
    RTS                             ; $80EC4A  60           MX
L_80EC4B:
    LDA $036A                       ; $80EC4B  AD 6A 03     MX
    CLC                             ; $80EC4E  18           MX
    ADC #$0004                      ; $80EC4F  69 04 00     MX
    STA $036A                       ; $80EC52  8D 6A 03     MX
    CLC                             ; $80EC55  18           MX
    ADC #$0020                      ; $80EC56  69 20 00     MX
    TAX                             ; $80EC59  AA           MX
    LDY $036C                       ; $80EC5A  AC 6C 03     MX
    LDA $037D                       ; $80EC5D  AD 7D 03     MX
    AND #$0008                      ; $80EC60  29 08 00     MX
    BNE L_80EC67                    ; $80EC63  D0 02        MX
    DEY                             ; $80EC65  88           MX
    DEY                             ; $80EC66  88           MX
L_80EC67:
    LDA #$0020                      ; $80EC67  A9 20 00     MX
    JSR L_80ED3D                    ; $80EC6A  20 3D ED     MX
    LDA #$0004                      ; $80EC6D  A9 04 00     MX
    JMP L_80E56D                    ; $80EC70  4C 6D E5     MX
L_80EC73:
    LDA $036A                       ; $80EC73  AD 6A 03     MX
    SEC                             ; $80EC76  38           MX
    SBC #$0004                      ; $80EC77  E9 04 00     MX
    STA $036A                       ; $80EC7A  8D 6A 03     MX
    TAX                             ; $80EC7D  AA           MX
    LDY $036C                       ; $80EC7E  AC 6C 03     MX
    LDA $037D                       ; $80EC81  AD 7D 03     MX
    AND #$0008                      ; $80EC84  29 08 00     MX
    BNE L_80EC8B                    ; $80EC87  D0 02        MX
    DEY                             ; $80EC89  88           MX
    DEY                             ; $80EC8A  88           MX
L_80EC8B:
    LDA #$0000                      ; $80EC8B  A9 00 00     MX
    JSR L_80ED3D                    ; $80EC8E  20 3D ED     MX
    LDA #$0004                      ; $80EC91  A9 04 00     MX
    JMP L_80E56D                    ; $80EC94  4C 6D E5     MX
L_80EC97:
    LDA $037D                       ; $80EC97  AD 7D 03     MX
    LSR                             ; $80EC9A  4A           MX
    LSR                             ; $80EC9B  4A           MX
    LSR                             ; $80EC9C  4A           MX
    AND #$FFFE                      ; $80EC9D  29 FE FF     MX
    LDX $037D                       ; $80ECA0  AE 7D 03     MX
    BPL L_80ECA8                    ; $80ECA3  10 03        MX
    ORA #$E000                      ; $80ECA5  09 00 E0     MX
L_80ECA8:
    STA $036C                       ; $80ECA8  8D 6C 03     MX
    LDA $037D                       ; $80ECAB  AD 7D 03     MX
    AND #$0008                      ; $80ECAE  29 08 00     MX
    BEQ L_80ECCA                    ; $80ECB1  F0 17        MX
    LDA $036C                       ; $80ECB3  AD 6C 03     MX
    CLC                             ; $80ECB6  18           MX
    ADC #$001E                      ; $80ECB7  69 1E 00     MX
    TAY                             ; $80ECBA  A8           MX
    LDX $036A                       ; $80ECBB  AE 6A 03     MX
    LDA #$001E                      ; $80ECBE  A9 1E 00     MX
    JSR L_80ED98                    ; $80ECC1  20 98 ED     MX
    LDA #$0008                      ; $80ECC4  A9 08 00     MX
    JMP L_80E56D                    ; $80ECC7  4C 6D E5     MX
L_80ECCA:
    LDA $037D                       ; $80ECCA  AD 7D 03     MX
    SEC                             ; $80ECCD  38           MX
    SBC $0384                       ; $80ECCE  ED 84 03     MX
    CMP #$0009                      ; $80ECD1  C9 09 00     MX
    BCC L_80ECED                    ; $80ECD4  90 17        MX
    LDA $036C                       ; $80ECD6  AD 6C 03     MX
    CLC                             ; $80ECD9  18           MX
    ADC #$001C                      ; $80ECDA  69 1C 00     MX
    TAY                             ; $80ECDD  A8           MX
    LDX $036A                       ; $80ECDE  AE 6A 03     MX
    LDA #$001C                      ; $80ECE1  A9 1C 00     MX
    JSR L_80ED98                    ; $80ECE4  20 98 ED     MX
    LDA #$0008                      ; $80ECE7  A9 08 00     MX
    JMP L_80E56D                    ; $80ECEA  4C 6D E5     MX
L_80ECED:
    RTS                             ; $80ECED  60           MX
L_80ECEE:
    LDA $037D                       ; $80ECEE  AD 7D 03     MX
    LSR                             ; $80ECF1  4A           MX
    LSR                             ; $80ECF2  4A           MX
    LSR                             ; $80ECF3  4A           MX
    AND #$FFFE                      ; $80ECF4  29 FE FF     MX
    LDX $037D                       ; $80ECF7  AE 7D 03     MX
    BPL L_80ECFF                    ; $80ECFA  10 03        MX
    ORA #$E000                      ; $80ECFC  09 00 E0     MX
L_80ECFF:
    STA $036C                       ; $80ECFF  8D 6C 03     MX
    LDA $037D                       ; $80ED02  AD 7D 03     MX
    AND #$0008                      ; $80ED05  29 08 00     MX
    BNE L_80ED1E                    ; $80ED08  D0 14        MX
    LDY $036C                       ; $80ED0A  AC 6C 03     MX
    DEY                             ; $80ED0D  88           MX
    DEY                             ; $80ED0E  88           MX
    LDX $036A                       ; $80ED0F  AE 6A 03     MX
    LDA #$FFFE                      ; $80ED12  A9 FE FF     MX
    JSR L_80ED98                    ; $80ED15  20 98 ED     MX
    LDA #$0008                      ; $80ED18  A9 08 00     MX
    JMP L_80E56D                    ; $80ED1B  4C 6D E5     MX
L_80ED1E:
    LDA $0384                       ; $80ED1E  AD 84 03     MX
    SEC                             ; $80ED21  38           MX
    SBC $037D                       ; $80ED22  ED 7D 03     MX
    CMP #$0009                      ; $80ED25  C9 09 00     MX
    BCC L_80ED3C                    ; $80ED28  90 12        MX
    LDY $036C                       ; $80ED2A  AC 6C 03     MX
    LDX $036A                       ; $80ED2D  AE 6A 03     MX
    LDA #$0000                      ; $80ED30  A9 00 00     MX
    JSR L_80ED98                    ; $80ED33  20 98 ED     MX
    LDA #$0008                      ; $80ED36  A9 08 00     MX
    JMP L_80E56D                    ; $80ED39  4C 6D E5     MX
L_80ED3C:
    RTS                             ; $80ED3C  60           MX
L_80ED3D:
    PHY                             ; $80ED3D  5A           MX
    PHA                             ; $80ED3E  48           MX
    LDA #$0000                      ; $80ED3F  A9 00 00     MX
    STA $04                         ; $80ED42  85 04        MX
    LDA #$007F                      ; $80ED44  A9 7F 00     MX
    STA $06                         ; $80ED47  85 06        MX
    LDA #$0040                      ; $80ED49  A9 40 00     MX
    STA $9C                         ; $80ED4C  85 9C        MX
    JSR L_80E7B0                    ; $80ED4E  20 B0 E7     MX
    LDY #$1000                      ; $80ED51  A0 00 10     MX
    PLA                             ; $80ED54  68           MX
    CLC                             ; $80ED55  18           MX
    ADC $036A                       ; $80ED56  6D 6A 03     MX
    AND #$003F                      ; $80ED59  29 3F 00     MX
    CMP #$0020                      ; $80ED5C  C9 20 00     MX
    BCC L_80ED67                    ; $80ED5F  90 06        MX
    LDY #$1400                      ; $80ED61  A0 00 14     MX
    AND #$001F                      ; $80ED64  29 1F 00     MX
L_80ED67:
    STY $88                         ; $80ED67  84 88        MX
    CLC                             ; $80ED69  18           MX
    ADC $88                         ; $80ED6A  65 88        MX
    STA $039E                       ; $80ED6C  8D 9E 03     MX
    STA $03A0                       ; $80ED6F  8D A0 03     MX
    PLA                             ; $80ED72  68           MX
    AND #$001F                      ; $80ED73  29 1F 00     MX
    ASL                             ; $80ED76  0A           MX
    STA $88                         ; $80ED77  85 88        MX
    TAY                             ; $80ED79  A8           MX
    LDA $F86D,Y                     ; $80ED7A  B9 6D F8     MX
    CLC                             ; $80ED7D  18           MX
    ADC $039E                       ; $80ED7E  6D 9E 03     MX
    STA $039E                       ; $80ED81  8D 9E 03     MX
    LDA #$0040                      ; $80ED84  A9 40 00     MX
    SEC                             ; $80ED87  38           MX
    SBC $88                         ; $80ED88  E5 88        MX
    STA $03A2                       ; $80ED8A  8D A2 03     MX
    LDA #$0040                      ; $80ED8D  A9 40 00     MX
    SEC                             ; $80ED90  38           MX
    SBC $03A2                       ; $80ED91  ED A2 03     MX
    STA $03A4                       ; $80ED94  8D A4 03     MX
    RTS                             ; $80ED97  60           MX
L_80ED98:
    PHA                             ; $80ED98  48           MX
    PHX                             ; $80ED99  DA           MX
    LDA #$0148                      ; $80ED9A  A9 48 01     MX
    STA $9C                         ; $80ED9D  85 9C        MX
    LDA #$0000                      ; $80ED9F  A9 00 00     MX
    STA $04                         ; $80EDA2  85 04        MX
    LDA #$007F                      ; $80EDA4  A9 7F 00     MX
    STA $06                         ; $80EDA7  85 06        MX
    JSR L_80E96A                    ; $80EDA9  20 6A E9     MX
    LDX #$1000                      ; $80EDAC  A2 00 10     MX
    LDY #$1400                      ; $80EDAF  A0 00 14     MX
    PLA                             ; $80EDB2  68           MX
    AND #$003F                      ; $80EDB3  29 3F 00     MX
    CMP #$0020                      ; $80EDB6  C9 20 00     MX
    BCC L_80EDC4                    ; $80EDB9  90 09        MX
    LDX #$1400                      ; $80EDBB  A2 00 14     MX
    LDY #$1000                      ; $80EDBE  A0 00 10     MX
    AND #$001F                      ; $80EDC1  29 1F 00     MX
L_80EDC4:
    STA $88                         ; $80EDC4  85 88        MX
    STX $03A6                       ; $80EDC6  8E A6 03     MX
    STX $03AA                       ; $80EDC9  8E AA 03     MX
    STY $03A8                       ; $80EDCC  8C A8 03     MX
    CLC                             ; $80EDCF  18           MX
    ADC $03A6                       ; $80EDD0  6D A6 03     MX
    STA $03A6                       ; $80EDD3  8D A6 03     MX
    PLA                             ; $80EDD6  68           MX
    CLC                             ; $80EDD7  18           MX
    ADC $036C                       ; $80EDD8  6D 6C 03     MX
    AND #$001F                      ; $80EDDB  29 1F 00     MX
    ASL                             ; $80EDDE  0A           MX
    TAY                             ; $80EDDF  A8           MX
    LDA $F86D,Y                     ; $80EDE0  B9 6D F8     MX
    TAX                             ; $80EDE3  AA           MX
    ADC $03A6                       ; $80EDE4  6D A6 03     MX
    STA $03A6                       ; $80EDE7  8D A6 03     MX
    TXA                             ; $80EDEA  8A           MX
    ADC $03A8                       ; $80EDEB  6D A8 03     MX
    STA $03A8                       ; $80EDEE  8D A8 03     MX
    TXA                             ; $80EDF1  8A           MX
    ADC $03AA                       ; $80EDF2  6D AA 03     MX
    STA $03AA                       ; $80EDF5  8D AA 03     MX
    LDA #$0020                      ; $80EDF8  A9 20 00     MX
    SEC                             ; $80EDFB  38           MX
    SBC $88                         ; $80EDFC  E5 88        MX
    ASL                             ; $80EDFE  0A           MX
    STA $03AC                       ; $80EDFF  8D AC 03     MX
    LDA #$0048                      ; $80EE02  A9 48 00     MX
    SEC                             ; $80EE05  38           MX
    SBC $03AC                       ; $80EE06  ED AC 03     MX
    CMP #$0040                      ; $80EE09  C9 40 00     MX
    BCC L_80EE1B                    ; $80EE0C  90 0D        MX
    AND #$003F                      ; $80EE0E  29 3F 00     MX
    STA $03B0                       ; $80EE11  8D B0 03     MX
    LDA #$0040                      ; $80EE14  A9 40 00     MX
    STA $03AE                       ; $80EE17  8D AE 03     MX
    RTS                             ; $80EE1A  60           MX
L_80EE1B:
    STA $03AE                       ; $80EE1B  8D AE 03     MX
    STZ $03B0                       ; $80EE1E  9C B0 03     MX
    RTS                             ; $80EE21  60           MX
L_80EE22:
    SEP #$30                        ; $80EE22  E2 30        MX
    LDA #$81                        ; $80EE24  A9 81        mx
    STA $2115                       ; $80EE26  8D 15 21     mx
    LDA #$01                        ; $80EE29  A9 01        mx
    STA $4300                       ; $80EE2B  8D 00 43     mx
    STA $4350                       ; $80EE2E  8D 50 43     mx
    LDA #$18                        ; $80EE31  A9 18        mx
    STA $4301                       ; $80EE33  8D 01 43     mx
    STA $4351                       ; $80EE36  8D 51 43     mx
    REP #$30                        ; $80EE39  C2 30        mx
    LDA $039E                       ; $80EE3B  AD 9E 03     MX
    STA $2116                       ; $80EE3E  8D 16 21     MX
    LDA #$041A                      ; $80EE41  A9 1A 04     MX
    STA $4302                       ; $80EE44  8D 02 43     MX
    LDA #$085A                      ; $80EE47  A9 5A 08     MX
    STA $4352                       ; $80EE4A  8D 52 43     MX
    LDA $03A2                       ; $80EE4D  AD A2 03     MX
    STA $4305                       ; $80EE50  8D 05 43     MX
    STA $4355                       ; $80EE53  8D 55 43     MX
    SEP #$30                        ; $80EE56  E2 30        MX
    LDA #$7E                        ; $80EE58  A9 7E        mx
    STA $4304                       ; $80EE5A  8D 04 43     mx
    STA $4354                       ; $80EE5D  8D 54 43     mx
    LDA #$01                        ; $80EE60  A9 01        mx
    STA $420B                       ; $80EE62  8D 0B 42     mx
    REP #$30                        ; $80EE65  C2 30        mx
    LDA $039E                       ; $80EE67  AD 9E 03     MX
    INC                             ; $80EE6A  1A           MX
    INC                             ; $80EE6B  1A           MX
    STA $2116                       ; $80EE6C  8D 16 21     MX
    SEP #$30                        ; $80EE6F  E2 30        MX
    LDA #$20                        ; $80EE71  A9 20        mx
    STA $420B                       ; $80EE73  8D 0B 42     mx
    LDA $03A4                       ; $80EE76  AD A4 03     mx
    BEQ L_80EEA4                    ; $80EE79  F0 29        mx
    REP #$30                        ; $80EE7B  C2 30        mx
    LDA $03A0                       ; $80EE7D  AD A0 03     MX
    STA $2116                       ; $80EE80  8D 16 21     MX
    LDA $03A4                       ; $80EE83  AD A4 03     MX
    STA $4305                       ; $80EE86  8D 05 43     MX
    STA $4355                       ; $80EE89  8D 55 43     MX
    SEP #$30                        ; $80EE8C  E2 30        MX
    LDA #$01                        ; $80EE8E  A9 01        mx
    STA $420B                       ; $80EE90  8D 0B 42     mx
    REP #$30                        ; $80EE93  C2 30        mx
    LDA $03A0                       ; $80EE95  AD A0 03     MX
    INC                             ; $80EE98  1A           MX
    INC                             ; $80EE99  1A           MX
    STA $2116                       ; $80EE9A  8D 16 21     MX
    SEP #$30                        ; $80EE9D  E2 30        MX
    LDA #$20                        ; $80EE9F  A9 20        mx
    STA $420B                       ; $80EEA1  8D 0B 42     mx
L_80EEA4:
    REP #$30                        ; $80EEA4  C2 30        mx
    LDA $039E                       ; $80EEA6  AD 9E 03     MX
    INC                             ; $80EEA9  1A           MX
    STA $2116                       ; $80EEAA  8D 16 21     MX
    LDA #$063A                      ; $80EEAD  A9 3A 06     MX
    STA $4302                       ; $80EEB0  8D 02 43     MX
    LDA #$095A                      ; $80EEB3  A9 5A 09     MX
    STA $4352                       ; $80EEB6  8D 52 43     MX
    LDA $03A2                       ; $80EEB9  AD A2 03     MX
    STA $4305                       ; $80EEBC  8D 05 43     MX
    STA $4355                       ; $80EEBF  8D 55 43     MX
    SEP #$30                        ; $80EEC2  E2 30        MX
    LDA #$01                        ; $80EEC4  A9 01        mx
    STA $420B                       ; $80EEC6  8D 0B 42     mx
    REP #$30                        ; $80EEC9  C2 30        mx
    LDA $039E                       ; $80EECB  AD 9E 03     MX
    INC                             ; $80EECE  1A           MX
    INC                             ; $80EECF  1A           MX
    INC                             ; $80EED0  1A           MX
    STA $2116                       ; $80EED1  8D 16 21     MX
    SEP #$30                        ; $80EED4  E2 30        MX
    LDA #$20                        ; $80EED6  A9 20        mx
    STA $420B                       ; $80EED8  8D 0B 42     mx
    LDA $03A4                       ; $80EEDB  AD A4 03     mx
    BEQ L_80EF0B                    ; $80EEDE  F0 2B        mx
    REP #$30                        ; $80EEE0  C2 30        mx
    LDA $03A0                       ; $80EEE2  AD A0 03     MX
    INC                             ; $80EEE5  1A           MX
    STA $2116                       ; $80EEE6  8D 16 21     MX
    LDA $03A4                       ; $80EEE9  AD A4 03     MX
    STA $4305                       ; $80EEEC  8D 05 43     MX
    STA $4355                       ; $80EEEF  8D 55 43     MX
    SEP #$30                        ; $80EEF2  E2 30        MX
    LDA #$01                        ; $80EEF4  A9 01        mx
    STA $420B                       ; $80EEF6  8D 0B 42     mx
    REP #$30                        ; $80EEF9  C2 30        mx
    LDA $03A0                       ; $80EEFB  AD A0 03     MX
    INC                             ; $80EEFE  1A           MX
    INC                             ; $80EEFF  1A           MX
    INC                             ; $80EF00  1A           MX
    STA $2116                       ; $80EF01  8D 16 21     MX
    SEP #$30                        ; $80EF04  E2 30        MX
    LDA #$20                        ; $80EF06  A9 20        mx
    STA $420B                       ; $80EF08  8D 0B 42     mx
L_80EF0B:
    REP #$30                        ; $80EF0B  C2 30        mx
    RTS                             ; $80EF0D  60           MX
L_80EF0E:
    SEP #$30                        ; $80EF0E  E2 30        MX
    LDA #$80                        ; $80EF10  A9 80        mx
    STA $2115                       ; $80EF12  8D 15 21     mx
    LDA #$01                        ; $80EF15  A9 01        mx
    STA $4300                       ; $80EF17  8D 00 43     mx
    LDA #$18                        ; $80EF1A  A9 18        mx
    STA $4301                       ; $80EF1C  8D 01 43     mx
    REP #$30                        ; $80EF1F  C2 30        mx
    LDA $03A6                       ; $80EF21  AD A6 03     MX
    STA $2116                       ; $80EF24  8D 16 21     MX
    LDA #$0522                      ; $80EF27  A9 22 05     MX
    STA $4302                       ; $80EF2A  8D 02 43     MX
    LDA $03AC                       ; $80EF2D  AD AC 03     MX
    STA $4305                       ; $80EF30  8D 05 43     MX
    SEP #$30                        ; $80EF33  E2 30        MX
    LDA #$7E                        ; $80EF35  A9 7E        mx
    STA $4304                       ; $80EF37  8D 04 43     mx
    LDA #$01                        ; $80EF3A  A9 01        mx
    STA $420B                       ; $80EF3C  8D 0B 42     mx
    REP #$30                        ; $80EF3F  C2 30        mx
    LDA $03A8                       ; $80EF41  AD A8 03     MX
    STA $2116                       ; $80EF44  8D 16 21     MX
    LDA $03AE                       ; $80EF47  AD AE 03     MX
    STA $4305                       ; $80EF4A  8D 05 43     MX
    SEP #$30                        ; $80EF4D  E2 30        MX
    LDA #$01                        ; $80EF4F  A9 01        mx
    STA $420B                       ; $80EF51  8D 0B 42     mx
    LDA $03B0                       ; $80EF54  AD B0 03     mx
    BEQ L_80EF6E                    ; $80EF57  F0 15        mx
    REP #$30                        ; $80EF59  C2 30        mx
    LDA $03AA                       ; $80EF5B  AD AA 03     MX
    STA $2116                       ; $80EF5E  8D 16 21     MX
    LDA $03B0                       ; $80EF61  AD B0 03     MX
    STA $4305                       ; $80EF64  8D 05 43     MX
    SEP #$30                        ; $80EF67  E2 30        MX
    LDA #$01                        ; $80EF69  A9 01        mx
    STA $420B                       ; $80EF6B  8D 0B 42     mx
L_80EF6E:
    REP #$30                        ; $80EF6E  C2 30        mx
    LDA $03A6                       ; $80EF70  AD A6 03     MX
    CLC                             ; $80EF73  18           MX
    ADC #$0020                      ; $80EF74  69 20 00     MX
    STA $2116                       ; $80EF77  8D 16 21     MX
    LDA #$0742                      ; $80EF7A  A9 42 07     MX
    STA $4302                       ; $80EF7D  8D 02 43     MX
    LDA $03AC                       ; $80EF80  AD AC 03     MX
    STA $4305                       ; $80EF83  8D 05 43     MX
    SEP #$30                        ; $80EF86  E2 30        MX
    LDA #$01                        ; $80EF88  A9 01        mx
    STA $420B                       ; $80EF8A  8D 0B 42     mx
    REP #$30                        ; $80EF8D  C2 30        mx
    LDA $03A8                       ; $80EF8F  AD A8 03     MX
    CLC                             ; $80EF92  18           MX
    ADC #$0020                      ; $80EF93  69 20 00     MX
    STA $2116                       ; $80EF96  8D 16 21     MX
    LDA $03AE                       ; $80EF99  AD AE 03     MX
    STA $4305                       ; $80EF9C  8D 05 43     MX
    SEP #$30                        ; $80EF9F  E2 30        MX
    LDA #$01                        ; $80EFA1  A9 01        mx
    STA $420B                       ; $80EFA3  8D 0B 42     mx
    LDA $03B0                       ; $80EFA6  AD B0 03     mx
    BEQ L_80EFC4                    ; $80EFA9  F0 19        mx
    REP #$30                        ; $80EFAB  C2 30        mx
    LDA $03AA                       ; $80EFAD  AD AA 03     MX
    CLC                             ; $80EFB0  18           MX
    ADC #$0020                      ; $80EFB1  69 20 00     MX
    STA $2116                       ; $80EFB4  8D 16 21     MX
    LDA $03B0                       ; $80EFB7  AD B0 03     MX
    STA $4305                       ; $80EFBA  8D 05 43     MX
    SEP #$30                        ; $80EFBD  E2 30        MX
    LDA #$01                        ; $80EFBF  A9 01        mx
    STA $420B                       ; $80EFC1  8D 0B 42     mx
L_80EFC4:
    REP #$30                        ; $80EFC4  C2 30        mx
    RTS                             ; $80EFC6  60           MX
L_80EFC7:
    ORA $0364                       ; $80EFC7  0D 64 03     MX
    STA $0364                       ; $80EFCA  8D 64 03     MX
    RTS                             ; $80EFCD  60           MX
L_80EFCE:
    LDA $10                         ; $80EFCE  A5 10        MX
    STA $1C                         ; $80EFD0  85 1C        MX
    LDA $16                         ; $80EFD2  A5 16        MX
    STA $1E                         ; $80EFD4  85 1E        MX
    LDA $037A                       ; $80EFD6  AD 7A 03     MX
    STA $0386                       ; $80EFD9  8D 86 03     MX
    LDA $0380                       ; $80EFDC  AD 80 03     MX
    STA $0388                       ; $80EFDF  8D 88 03     MX
    LDA $0364                       ; $80EFE2  AD 64 03     MX
    BEQ L_80F013                    ; $80EFE5  F0 2C        MX
    BIT #$0001                      ; $80EFE7  89 01 00     MX
    BEQ L_80EFEF                    ; $80EFEA  F0 03        MX
    JSR L_80F294                    ; $80EFEC  20 94 F2     MX
L_80EFEF:
    LDA $0364                       ; $80EFEF  AD 64 03     MX
    BIT #$0002                      ; $80EFF2  89 02 00     MX
    BEQ L_80EFFA                    ; $80EFF5  F0 03        MX
    JSR L_80F380                    ; $80EFF7  20 80 F3     MX
L_80EFFA:
    LDA $0364                       ; $80EFFA  AD 64 03     MX
    BIT #$0004                      ; $80EFFD  89 04 00     MX
    BEQ L_80F005                    ; $80F000  F0 03        MX
    JSR L_80F64B                    ; $80F002  20 4B F6     MX
L_80F005:
    LDA $0364                       ; $80F005  AD 64 03     MX
    BIT #$0008                      ; $80F008  89 08 00     MX
    BEQ L_80F010                    ; $80F00B  F0 03        MX
    JSR L_80F737                    ; $80F00D  20 37 F7     MX
L_80F010:
    STZ $0364                       ; $80F010  9C 64 03     MX
L_80F013:
    RTS                             ; $80F013  60           MX
L_80F014:
    LDA $1E                         ; $80F014  A5 1E        MX
    AND #$FFF8                      ; $80F016  29 F8 FF     MX
    STA $88                         ; $80F019  85 88        MX
    LDA $16                         ; $80F01B  A5 16        MX
    AND #$FFF8                      ; $80F01D  29 F8 FF     MX
    SEC                             ; $80F020  38           MX
    SBC $88                         ; $80F021  E5 88        MX
    BEQ L_80F02F                    ; $80F023  F0 0A        MX
    BPL L_80F02C                    ; $80F025  10 05        MX
    JSR L_80F0E7                    ; $80F027  20 E7 F0     MX
    BRA L_80F02F                    ; $80F02A  80 03        MX
L_80F02C:
    JSR L_80F095                    ; $80F02C  20 95 F0     MX
L_80F02F:
    LDA $1C                         ; $80F02F  A5 1C        MX
    AND #$FFE0                      ; $80F031  29 E0 FF     MX
    STA $88                         ; $80F034  85 88        MX
    LDA $10                         ; $80F036  A5 10        MX
    AND #$FFE0                      ; $80F038  29 E0 FF     MX
    SEC                             ; $80F03B  38           MX
    SBC $88                         ; $80F03C  E5 88        MX
    BEQ L_80F04A                    ; $80F03E  F0 0A        MX
    BPL L_80F047                    ; $80F040  10 05        MX
    JSR L_80F072                    ; $80F042  20 72 F0     MX
    BRA L_80F04A                    ; $80F045  80 03        MX
L_80F047:
    JSR L_80F04B                    ; $80F047  20 4B F0     MX
L_80F04A:
    RTS                             ; $80F04A  60           MX
L_80F04B:
    LDA $036E                       ; $80F04B  AD 6E 03     MX
    CLC                             ; $80F04E  18           MX
    ADC #$0004                      ; $80F04F  69 04 00     MX
    STA $036E                       ; $80F052  8D 6E 03     MX
    CLC                             ; $80F055  18           MX
    ADC #$0020                      ; $80F056  69 20 00     MX
    TAX                             ; $80F059  AA           MX
    LDY $0370                       ; $80F05A  AC 70 03     MX
    LDA $16                         ; $80F05D  A5 16        MX
    AND #$0008                      ; $80F05F  29 08 00     MX
    BNE L_80F066                    ; $80F062  D0 02        MX
    DEY                             ; $80F064  88           MX
    DEY                             ; $80F065  88           MX
L_80F066:
    LDA #$0020                      ; $80F066  A9 20 00     MX
    JSR L_80F1AF                    ; $80F069  20 AF F1     MX
    LDA #$0001                      ; $80F06C  A9 01 00     MX
    JMP L_80EFC7                    ; $80F06F  4C C7 EF     MX
L_80F072:
    LDA $036E                       ; $80F072  AD 6E 03     MX
    SEC                             ; $80F075  38           MX
    SBC #$0004                      ; $80F076  E9 04 00     MX
    STA $036E                       ; $80F079  8D 6E 03     MX
    TAX                             ; $80F07C  AA           MX
    LDY $0370                       ; $80F07D  AC 70 03     MX
    LDA $16                         ; $80F080  A5 16        MX
    AND #$0008                      ; $80F082  29 08 00     MX
    BNE L_80F089                    ; $80F085  D0 02        MX
    DEY                             ; $80F087  88           MX
    DEY                             ; $80F088  88           MX
L_80F089:
    LDA #$0000                      ; $80F089  A9 00 00     MX
    JSR L_80F1AF                    ; $80F08C  20 AF F1     MX
    LDA #$0001                      ; $80F08F  A9 01 00     MX
    JMP L_80EFC7                    ; $80F092  4C C7 EF     MX
L_80F095:
    LDA $16                         ; $80F095  A5 16        MX
    LSR                             ; $80F097  4A           MX
    LSR                             ; $80F098  4A           MX
    LSR                             ; $80F099  4A           MX
    AND #$FFFE                      ; $80F09A  29 FE FF     MX
    LDX $16                         ; $80F09D  A6 16        MX
    BPL L_80F0A4                    ; $80F09F  10 03        MX
    ORA #$E000                      ; $80F0A1  09 00 E0     MX
L_80F0A4:
    STA $0370                       ; $80F0A4  8D 70 03     MX
    LDA $16                         ; $80F0A7  A5 16        MX
    AND #$0008                      ; $80F0A9  29 08 00     MX
    BEQ L_80F0C5                    ; $80F0AC  F0 17        MX
    LDA $0370                       ; $80F0AE  AD 70 03     MX
    CLC                             ; $80F0B1  18           MX
    ADC #$001E                      ; $80F0B2  69 1E 00     MX
    TAY                             ; $80F0B5  A8           MX
    LDX $036E                       ; $80F0B6  AE 6E 03     MX
    LDA #$001E                      ; $80F0B9  A9 1E 00     MX
    JSR L_80F20A                    ; $80F0BC  20 0A F2     MX
    LDA #$0002                      ; $80F0BF  A9 02 00     MX
    JMP L_80EFC7                    ; $80F0C2  4C C7 EF     MX
L_80F0C5:
    LDA $16                         ; $80F0C5  A5 16        MX
    SEC                             ; $80F0C7  38           MX
    SBC $1E                         ; $80F0C8  E5 1E        MX
    CMP #$0009                      ; $80F0CA  C9 09 00     MX
    BCC L_80F0E6                    ; $80F0CD  90 17        MX
    LDA $0370                       ; $80F0CF  AD 70 03     MX
    CLC                             ; $80F0D2  18           MX
    ADC #$001C                      ; $80F0D3  69 1C 00     MX
    TAY                             ; $80F0D6  A8           MX
    LDX $036E                       ; $80F0D7  AE 6E 03     MX
    LDA #$001C                      ; $80F0DA  A9 1C 00     MX
    JSR L_80F20A                    ; $80F0DD  20 0A F2     MX
    LDA #$0002                      ; $80F0E0  A9 02 00     MX
    JMP L_80EFC7                    ; $80F0E3  4C C7 EF     MX
L_80F0E6:
    RTS                             ; $80F0E6  60           MX
L_80F0E7:
    LDA $16                         ; $80F0E7  A5 16        MX
    LSR                             ; $80F0E9  4A           MX
    LSR                             ; $80F0EA  4A           MX
    LSR                             ; $80F0EB  4A           MX
    AND #$FFFE                      ; $80F0EC  29 FE FF     MX
    LDX $16                         ; $80F0EF  A6 16        MX
    BPL L_80F0F6                    ; $80F0F1  10 03        MX
    ORA #$E000                      ; $80F0F3  09 00 E0     MX
L_80F0F6:
    STA $0370                       ; $80F0F6  8D 70 03     MX
    LDA $16                         ; $80F0F9  A5 16        MX
    AND #$0008                      ; $80F0FB  29 08 00     MX
    BNE L_80F114                    ; $80F0FE  D0 14        MX
    LDY $0370                       ; $80F100  AC 70 03     MX
    DEY                             ; $80F103  88           MX
    DEY                             ; $80F104  88           MX
    LDX $036E                       ; $80F105  AE 6E 03     MX
    LDA #$FFFE                      ; $80F108  A9 FE FF     MX
    JSR L_80F20A                    ; $80F10B  20 0A F2     MX
    LDA #$0002                      ; $80F10E  A9 02 00     MX
    JMP L_80EFC7                    ; $80F111  4C C7 EF     MX
L_80F114:
    LDA $1E                         ; $80F114  A5 1E        MX
    SEC                             ; $80F116  38           MX
    SBC $16                         ; $80F117  E5 16        MX
    CMP #$0009                      ; $80F119  C9 09 00     MX
    BCC L_80F130                    ; $80F11C  90 12        MX
    LDX $036E                       ; $80F11E  AE 6E 03     MX
    LDY $0370                       ; $80F121  AC 70 03     MX
    LDA #$0000                      ; $80F124  A9 00 00     MX
    JSR L_80F20A                    ; $80F127  20 0A F2     MX
    LDA #$0002                      ; $80F12A  A9 02 00     MX
    JMP L_80EFC7                    ; $80F12D  4C C7 EF     MX
L_80F130:
    RTS                             ; $80F130  60           MX
L_80F131:
    STZ $0F                         ; $80F131  64 0F        MX
    STZ $15                         ; $80F133  64 15        MX
    STZ $0379                       ; $80F135  9C 79 03     MX
    STZ $037F                       ; $80F138  9C 7F 03     MX
    STZ $0364                       ; $80F13B  9C 64 03     MX
    LDA $4D                         ; $80F13E  A5 4D        MX
    AND #$00FF                      ; $80F140  29 FF 00     MX
    ASL                             ; $80F143  0A           MX
    ASL                             ; $80F144  0A           MX
    ASL                             ; $80F145  0A           MX
    ASL                             ; $80F146  0A           MX
    STA $10                         ; $80F147  85 10        MX
    STA $1C                         ; $80F149  85 1C        MX
    STA $037A                       ; $80F14B  8D 7A 03     MX
    STA $0386                       ; $80F14E  8D 86 03     MX
    LSR                             ; $80F151  4A           MX
    LSR                             ; $80F152  4A           MX
    LSR                             ; $80F153  4A           MX
    AND #$FFFC                      ; $80F154  29 FC FF     MX
    STA $036E                       ; $80F157  8D 6E 03     MX
    STA $0372                       ; $80F15A  8D 72 03     MX
    TAX                             ; $80F15D  AA           MX
    LDA $4F                         ; $80F15E  A5 4F        MX
    AND #$00FF                      ; $80F160  29 FF 00     MX
    ASL                             ; $80F163  0A           MX
    ASL                             ; $80F164  0A           MX
    ASL                             ; $80F165  0A           MX
    STA $16                         ; $80F166  85 16        MX
    STA $1E                         ; $80F168  85 1E        MX
    STA $0380                       ; $80F16A  8D 80 03     MX
    STA $0388                       ; $80F16D  8D 88 03     MX
    LSR                             ; $80F170  4A           MX
    LSR                             ; $80F171  4A           MX
    LSR                             ; $80F172  4A           MX
    AND #$FFFE                      ; $80F173  29 FE FF     MX
    STA $0370                       ; $80F176  8D 70 03     MX
    STA $0374                       ; $80F179  8D 74 03     MX
    TAY                             ; $80F17C  A8           MX
    LDA $16                         ; $80F17D  A5 16        MX
    BIT #$0008                      ; $80F17F  89 08 00     MX
    BNE L_80F186                    ; $80F182  D0 02        MX
    DEY                             ; $80F184  88           MX
    DEY                             ; $80F185  88           MX
L_80F186:
    LDA #$0000                      ; $80F186  A9 00 00     MX
L_80F189:
    PHX                             ; $80F189  DA           MX
    PHY                             ; $80F18A  5A           MX
    PHA                             ; $80F18B  48           MX
    JSR L_80F1AF                    ; $80F18C  20 AF F1     MX
    JSR L_80F294                    ; $80F18F  20 94 F2     MX
    PLA                             ; $80F192  68           MX
    PLY                             ; $80F193  7A           MX
    PLX                             ; $80F194  FA           MX
    PHX                             ; $80F195  DA           MX
    PHY                             ; $80F196  5A           MX
    PHA                             ; $80F197  48           MX
    JSR L_80F566                    ; $80F198  20 66 F5     MX
    JSR L_80F64B                    ; $80F19B  20 4B F6     MX
    PLA                             ; $80F19E  68           MX
    PLY                             ; $80F19F  7A           MX
    PLX                             ; $80F1A0  FA           MX
    INX                             ; $80F1A1  E8           MX
    INX                             ; $80F1A2  E8           MX
    INX                             ; $80F1A3  E8           MX
    INX                             ; $80F1A4  E8           MX
    INC                             ; $80F1A5  1A           MX
    INC                             ; $80F1A6  1A           MX
    INC                             ; $80F1A7  1A           MX
    INC                             ; $80F1A8  1A           MX
    CMP #$0024                      ; $80F1A9  C9 24 00     MX
    BNE L_80F189                    ; $80F1AC  D0 DB        MX
    RTS                             ; $80F1AE  60           MX
L_80F1AF:
    PHY                             ; $80F1AF  5A           MX
    PHA                             ; $80F1B0  48           MX
    LDA #$3500                      ; $80F1B1  A9 00 35     MX
    STA $04                         ; $80F1B4  85 04        MX
    LDA #$007E                      ; $80F1B6  A9 7E 00     MX
    STA $06                         ; $80F1B9  85 06        MX
    LDA #$0080                      ; $80F1BB  A9 80 00     MX
    STA $9C                         ; $80F1BE  85 9C        MX
    JSR L_80E7B0                    ; $80F1C0  20 B0 E7     MX
    LDY #$0800                      ; $80F1C3  A0 00 08     MX
    PLA                             ; $80F1C6  68           MX
    CLC                             ; $80F1C7  18           MX
    ADC $036E                       ; $80F1C8  6D 6E 03     MX
    AND #$003F                      ; $80F1CB  29 3F 00     MX
    CMP #$0020                      ; $80F1CE  C9 20 00     MX
    BCC L_80F1D9                    ; $80F1D1  90 06        MX
    LDY #$0C00                      ; $80F1D3  A0 00 0C     MX
    AND #$001F                      ; $80F1D6  29 1F 00     MX
L_80F1D9:
    STY $88                         ; $80F1D9  84 88        MX
    CLC                             ; $80F1DB  18           MX
    ADC $88                         ; $80F1DC  65 88        MX
    STA $03B2                       ; $80F1DE  8D B2 03     MX
    STA $03B4                       ; $80F1E1  8D B4 03     MX
    PLA                             ; $80F1E4  68           MX
    AND #$001F                      ; $80F1E5  29 1F 00     MX
    ASL                             ; $80F1E8  0A           MX
    STA $88                         ; $80F1E9  85 88        MX
    TAY                             ; $80F1EB  A8           MX
    LDA $F86D,Y                     ; $80F1EC  B9 6D F8     MX
    CLC                             ; $80F1EF  18           MX
    ADC $03B2                       ; $80F1F0  6D B2 03     MX
    STA $03B2                       ; $80F1F3  8D B2 03     MX
    LDA #$0040                      ; $80F1F6  A9 40 00     MX
    SEC                             ; $80F1F9  38           MX
    SBC $88                         ; $80F1FA  E5 88        MX
    STA $03B6                       ; $80F1FC  8D B6 03     MX
    LDA #$0040                      ; $80F1FF  A9 40 00     MX
    SEC                             ; $80F202  38           MX
    SBC $03B6                       ; $80F203  ED B6 03     MX
    STA $03B8                       ; $80F206  8D B8 03     MX
    RTS                             ; $80F209  60           MX
L_80F20A:
    PHA                             ; $80F20A  48           MX
    PHX                             ; $80F20B  DA           MX
    LDA #$0190                      ; $80F20C  A9 90 01     MX
    STA $9C                         ; $80F20F  85 9C        MX
    LDA #$3500                      ; $80F211  A9 00 35     MX
    STA $04                         ; $80F214  85 04        MX
    LDA #$007E                      ; $80F216  A9 7E 00     MX
    STA $06                         ; $80F219  85 06        MX
    JSR L_80E96A                    ; $80F21B  20 6A E9     MX
    LDX #$0800                      ; $80F21E  A2 00 08     MX
    LDY #$0C00                      ; $80F221  A0 00 0C     MX
    PLA                             ; $80F224  68           MX
    AND #$003F                      ; $80F225  29 3F 00     MX
    CMP #$0020                      ; $80F228  C9 20 00     MX
    BCC L_80F236                    ; $80F22B  90 09        MX
    LDX #$0C00                      ; $80F22D  A2 00 0C     MX
    LDY #$0800                      ; $80F230  A0 00 08     MX
    AND #$001F                      ; $80F233  29 1F 00     MX
L_80F236:
    STA $88                         ; $80F236  85 88        MX
    STX $03BA                       ; $80F238  8E BA 03     MX
    STX $03BE                       ; $80F23B  8E BE 03     MX
    STY $03BC                       ; $80F23E  8C BC 03     MX
    CLC                             ; $80F241  18           MX
    ADC $03BA                       ; $80F242  6D BA 03     MX
    STA $03BA                       ; $80F245  8D BA 03     MX
    PLA                             ; $80F248  68           MX
    CLC                             ; $80F249  18           MX
    ADC $0370                       ; $80F24A  6D 70 03     MX
    AND #$001F                      ; $80F24D  29 1F 00     MX
    ASL                             ; $80F250  0A           MX
    TAY                             ; $80F251  A8           MX
    LDA $F86D,Y                     ; $80F252  B9 6D F8     MX
    TAX                             ; $80F255  AA           MX
    ADC $03BA                       ; $80F256  6D BA 03     MX
    STA $03BA                       ; $80F259  8D BA 03     MX
    TXA                             ; $80F25C  8A           MX
    ADC $03BC                       ; $80F25D  6D BC 03     MX
    STA $03BC                       ; $80F260  8D BC 03     MX
    TXA                             ; $80F263  8A           MX
    ADC $03BE                       ; $80F264  6D BE 03     MX
    STA $03BE                       ; $80F267  8D BE 03     MX
    LDA #$0020                      ; $80F26A  A9 20 00     MX
    SEC                             ; $80F26D  38           MX
    SBC $88                         ; $80F26E  E5 88        MX
    ASL                             ; $80F270  0A           MX
    STA $03C0                       ; $80F271  8D C0 03     MX
    LDA #$0048                      ; $80F274  A9 48 00     MX
    SEC                             ; $80F277  38           MX
    SBC $03C0                       ; $80F278  ED C0 03     MX
    CMP #$0040                      ; $80F27B  C9 40 00     MX
    BCC L_80F28D                    ; $80F27E  90 0D        MX
    AND #$003F                      ; $80F280  29 3F 00     MX
    STA $03C4                       ; $80F283  8D C4 03     MX
    LDA #$0040                      ; $80F286  A9 40 00     MX
    STA $03C2                       ; $80F289  8D C2 03     MX
    RTS                             ; $80F28C  60           MX
L_80F28D:
    STA $03C2                       ; $80F28D  8D C2 03     MX
    STZ $03C4                       ; $80F290  9C C4 03     MX
    RTS                             ; $80F293  60           MX
L_80F294:
    SEP #$30                        ; $80F294  E2 30        MX
    LDA #$81                        ; $80F296  A9 81        mx
    STA $2115                       ; $80F298  8D 15 21     mx
    LDA #$01                        ; $80F29B  A9 01        mx
    STA $4300                       ; $80F29D  8D 00 43     mx
    STA $4350                       ; $80F2A0  8D 50 43     mx
    LDA #$18                        ; $80F2A3  A9 18        mx
    STA $4301                       ; $80F2A5  8D 01 43     mx
    STA $4351                       ; $80F2A8  8D 51 43     mx
    REP #$30                        ; $80F2AB  C2 30        mx
    LDA $03B2                       ; $80F2AD  AD B2 03     MX
    STA $2116                       ; $80F2B0  8D 16 21     MX
    LDA #$045A                      ; $80F2B3  A9 5A 04     MX
    STA $4302                       ; $80F2B6  8D 02 43     MX
    LDA #$089A                      ; $80F2B9  A9 9A 08     MX
    STA $4352                       ; $80F2BC  8D 52 43     MX
    LDA $03B6                       ; $80F2BF  AD B6 03     MX
    STA $4305                       ; $80F2C2  8D 05 43     MX
    STA $4355                       ; $80F2C5  8D 55 43     MX
    SEP #$30                        ; $80F2C8  E2 30        MX
    LDA #$7E                        ; $80F2CA  A9 7E        mx
    STA $4304                       ; $80F2CC  8D 04 43     mx
    STA $4354                       ; $80F2CF  8D 54 43     mx
    LDA #$01                        ; $80F2D2  A9 01        mx
    STA $420B                       ; $80F2D4  8D 0B 42     mx
    REP #$30                        ; $80F2D7  C2 30        mx
    LDA $03B2                       ; $80F2D9  AD B2 03     MX
    INC                             ; $80F2DC  1A           MX
    INC                             ; $80F2DD  1A           MX
    STA $2116                       ; $80F2DE  8D 16 21     MX
    SEP #$30                        ; $80F2E1  E2 30        MX
    LDA #$20                        ; $80F2E3  A9 20        mx
    STA $420B                       ; $80F2E5  8D 0B 42     mx
    LDA $03B8                       ; $80F2E8  AD B8 03     mx
    BEQ L_80F316                    ; $80F2EB  F0 29        mx
    REP #$30                        ; $80F2ED  C2 30        mx
    LDA $03B4                       ; $80F2EF  AD B4 03     MX
    STA $2116                       ; $80F2F2  8D 16 21     MX
    LDA $03B8                       ; $80F2F5  AD B8 03     MX
    STA $4305                       ; $80F2F8  8D 05 43     MX
    STA $4355                       ; $80F2FB  8D 55 43     MX
    SEP #$30                        ; $80F2FE  E2 30        MX
    LDA #$01                        ; $80F300  A9 01        mx
    STA $420B                       ; $80F302  8D 0B 42     mx
    REP #$30                        ; $80F305  C2 30        mx
    LDA $03B4                       ; $80F307  AD B4 03     MX
    INC                             ; $80F30A  1A           MX
    INC                             ; $80F30B  1A           MX
    STA $2116                       ; $80F30C  8D 16 21     MX
    SEP #$30                        ; $80F30F  E2 30        MX
    LDA #$20                        ; $80F311  A9 20        mx
    STA $420B                       ; $80F313  8D 0B 42     mx
L_80F316:
    REP #$30                        ; $80F316  C2 30        mx
    LDA $03B2                       ; $80F318  AD B2 03     MX
    INC                             ; $80F31B  1A           MX
    STA $2116                       ; $80F31C  8D 16 21     MX
    LDA #$067A                      ; $80F31F  A9 7A 06     MX
    STA $4302                       ; $80F322  8D 02 43     MX
    LDA #$099A                      ; $80F325  A9 9A 09     MX
    STA $4352                       ; $80F328  8D 52 43     MX
    LDA $03B6                       ; $80F32B  AD B6 03     MX
    STA $4305                       ; $80F32E  8D 05 43     MX
    STA $4355                       ; $80F331  8D 55 43     MX
    SEP #$30                        ; $80F334  E2 30        MX
    LDA #$01                        ; $80F336  A9 01        mx
    STA $420B                       ; $80F338  8D 0B 42     mx
    REP #$30                        ; $80F33B  C2 30        mx
    LDA $03B2                       ; $80F33D  AD B2 03     MX
    INC                             ; $80F340  1A           MX
    INC                             ; $80F341  1A           MX
    INC                             ; $80F342  1A           MX
    STA $2116                       ; $80F343  8D 16 21     MX
    SEP #$30                        ; $80F346  E2 30        MX
    LDA #$20                        ; $80F348  A9 20        mx
    STA $420B                       ; $80F34A  8D 0B 42     mx
    LDA $03B8                       ; $80F34D  AD B8 03     mx
    BEQ L_80F37D                    ; $80F350  F0 2B        mx
    REP #$30                        ; $80F352  C2 30        mx
    LDA $03B4                       ; $80F354  AD B4 03     MX
    INC                             ; $80F357  1A           MX
    STA $2116                       ; $80F358  8D 16 21     MX
    LDA $03B8                       ; $80F35B  AD B8 03     MX
    STA $4305                       ; $80F35E  8D 05 43     MX
    STA $4355                       ; $80F361  8D 55 43     MX
    SEP #$30                        ; $80F364  E2 30        MX
    LDA #$01                        ; $80F366  A9 01        mx
    STA $420B                       ; $80F368  8D 0B 42     mx
    REP #$30                        ; $80F36B  C2 30        mx
    LDA $03B4                       ; $80F36D  AD B4 03     MX
    INC                             ; $80F370  1A           MX
    INC                             ; $80F371  1A           MX
    INC                             ; $80F372  1A           MX
    STA $2116                       ; $80F373  8D 16 21     MX
    SEP #$30                        ; $80F376  E2 30        MX
    LDA #$20                        ; $80F378  A9 20        mx
    STA $420B                       ; $80F37A  8D 0B 42     mx
L_80F37D:
    REP #$30                        ; $80F37D  C2 30        mx
    RTS                             ; $80F37F  60           MX
L_80F380:
    SEP #$30                        ; $80F380  E2 30        MX
    LDA #$80                        ; $80F382  A9 80        mx
    STA $2115                       ; $80F384  8D 15 21     mx
    LDA #$01                        ; $80F387  A9 01        mx
    STA $4300                       ; $80F389  8D 00 43     mx
    LDA #$18                        ; $80F38C  A9 18        mx
    STA $4301                       ; $80F38E  8D 01 43     mx
    REP #$30                        ; $80F391  C2 30        mx
    LDA $03BA                       ; $80F393  AD BA 03     MX
    STA $2116                       ; $80F396  8D 16 21     MX
    LDA #$056A                      ; $80F399  A9 6A 05     MX
    STA $4302                       ; $80F39C  8D 02 43     MX
    LDA $03C0                       ; $80F39F  AD C0 03     MX
    STA $4305                       ; $80F3A2  8D 05 43     MX
    SEP #$30                        ; $80F3A5  E2 30        MX
    LDA #$7E                        ; $80F3A7  A9 7E        mx
    STA $4304                       ; $80F3A9  8D 04 43     mx
    LDA #$01                        ; $80F3AC  A9 01        mx
    STA $420B                       ; $80F3AE  8D 0B 42     mx
    REP #$30                        ; $80F3B1  C2 30        mx
    LDA $03BC                       ; $80F3B3  AD BC 03     MX
    STA $2116                       ; $80F3B6  8D 16 21     MX
    LDA $03C2                       ; $80F3B9  AD C2 03     MX
    STA $4305                       ; $80F3BC  8D 05 43     MX
    SEP #$30                        ; $80F3BF  E2 30        MX
    LDA #$01                        ; $80F3C1  A9 01        mx
    STA $420B                       ; $80F3C3  8D 0B 42     mx
    LDA $03C4                       ; $80F3C6  AD C4 03     mx
    BEQ L_80F3E0                    ; $80F3C9  F0 15        mx
    REP #$30                        ; $80F3CB  C2 30        mx
    LDA $03BE                       ; $80F3CD  AD BE 03     MX
    STA $2116                       ; $80F3D0  8D 16 21     MX
    LDA $03C4                       ; $80F3D3  AD C4 03     MX
    STA $4305                       ; $80F3D6  8D 05 43     MX
    SEP #$30                        ; $80F3D9  E2 30        MX
    LDA #$01                        ; $80F3DB  A9 01        mx
    STA $420B                       ; $80F3DD  8D 0B 42     mx
L_80F3E0:
    REP #$30                        ; $80F3E0  C2 30        mx
    LDA $03BA                       ; $80F3E2  AD BA 03     MX
    CLC                             ; $80F3E5  18           MX
    ADC #$0020                      ; $80F3E6  69 20 00     MX
    STA $2116                       ; $80F3E9  8D 16 21     MX
    LDA #$078A                      ; $80F3EC  A9 8A 07     MX
    STA $4302                       ; $80F3EF  8D 02 43     MX
    LDA $03C0                       ; $80F3F2  AD C0 03     MX
    STA $4305                       ; $80F3F5  8D 05 43     MX
    SEP #$30                        ; $80F3F8  E2 30        MX
    LDA #$01                        ; $80F3FA  A9 01        mx
    STA $420B                       ; $80F3FC  8D 0B 42     mx
    REP #$30                        ; $80F3FF  C2 30        mx
    LDA $03BC                       ; $80F401  AD BC 03     MX
    CLC                             ; $80F404  18           MX
    ADC #$0020                      ; $80F405  69 20 00     MX
    STA $2116                       ; $80F408  8D 16 21     MX
    LDA $03C2                       ; $80F40B  AD C2 03     MX
    STA $4305                       ; $80F40E  8D 05 43     MX
    SEP #$30                        ; $80F411  E2 30        MX
    LDA #$01                        ; $80F413  A9 01        mx
    STA $420B                       ; $80F415  8D 0B 42     mx
    LDA $03C4                       ; $80F418  AD C4 03     mx
    BEQ L_80F436                    ; $80F41B  F0 19        mx
    REP #$30                        ; $80F41D  C2 30        mx
    LDA $03BE                       ; $80F41F  AD BE 03     MX
    CLC                             ; $80F422  18           MX
    ADC #$0020                      ; $80F423  69 20 00     MX
    STA $2116                       ; $80F426  8D 16 21     MX
    LDA $03C4                       ; $80F429  AD C4 03     MX
    STA $4305                       ; $80F42C  8D 05 43     MX
    SEP #$30                        ; $80F42F  E2 30        MX
    LDA #$01                        ; $80F431  A9 01        mx
    STA $420B                       ; $80F433  8D 0B 42     mx
L_80F436:
    REP #$30                        ; $80F436  C2 30        mx
    RTS                             ; $80F438  60           MX
L_80F439:
    LDA $0388                       ; $80F439  AD 88 03     MX
    AND #$FFF8                      ; $80F43C  29 F8 FF     MX
    STA $88                         ; $80F43F  85 88        MX
    LDA $0380                       ; $80F441  AD 80 03     MX
    AND #$FFF8                      ; $80F444  29 F8 FF     MX
    SEC                             ; $80F447  38           MX
    SBC $88                         ; $80F448  E5 88        MX
    BEQ L_80F456                    ; $80F44A  F0 0A        MX
    BPL L_80F453                    ; $80F44C  10 05        MX
    JSR L_80F517                    ; $80F44E  20 17 F5     MX
    BRA L_80F456                    ; $80F451  80 03        MX
L_80F453:
    JSR L_80F4C0                    ; $80F453  20 C0 F4     MX
L_80F456:
    LDA $0386                       ; $80F456  AD 86 03     MX
    AND #$FFE0                      ; $80F459  29 E0 FF     MX
    STA $88                         ; $80F45C  85 88        MX
    LDA $037A                       ; $80F45E  AD 7A 03     MX
    AND #$FFE0                      ; $80F461  29 E0 FF     MX
    SEC                             ; $80F464  38           MX
    SBC $88                         ; $80F465  E5 88        MX
    BEQ L_80F473                    ; $80F467  F0 0A        MX
    BPL L_80F470                    ; $80F469  10 05        MX
    JSR L_80F49C                    ; $80F46B  20 9C F4     MX
    BRA L_80F473                    ; $80F46E  80 03        MX
L_80F470:
    JSR L_80F474                    ; $80F470  20 74 F4     MX
L_80F473:
    RTS                             ; $80F473  60           MX
L_80F474:
    LDA $0372                       ; $80F474  AD 72 03     MX
    CLC                             ; $80F477  18           MX
    ADC #$0004                      ; $80F478  69 04 00     MX
    STA $0372                       ; $80F47B  8D 72 03     MX
    CLC                             ; $80F47E  18           MX
    ADC #$0020                      ; $80F47F  69 20 00     MX
    TAX                             ; $80F482  AA           MX
    LDY $0374                       ; $80F483  AC 74 03     MX
    LDA $0380                       ; $80F486  AD 80 03     MX
    AND #$0008                      ; $80F489  29 08 00     MX
    BNE L_80F490                    ; $80F48C  D0 02        MX
    DEY                             ; $80F48E  88           MX
    DEY                             ; $80F48F  88           MX
L_80F490:
    LDA #$0020                      ; $80F490  A9 20 00     MX
    JSR L_80F566                    ; $80F493  20 66 F5     MX
    LDA #$0004                      ; $80F496  A9 04 00     MX
    JMP L_80EFC7                    ; $80F499  4C C7 EF     MX
L_80F49C:
    LDA $0372                       ; $80F49C  AD 72 03     MX
    SEC                             ; $80F49F  38           MX
    SBC #$0004                      ; $80F4A0  E9 04 00     MX
    STA $0372                       ; $80F4A3  8D 72 03     MX
    TAX                             ; $80F4A6  AA           MX
    LDY $0374                       ; $80F4A7  AC 74 03     MX
    LDA $0380                       ; $80F4AA  AD 80 03     MX
    AND #$0008                      ; $80F4AD  29 08 00     MX
    BNE L_80F4B4                    ; $80F4B0  D0 02        MX
    DEY                             ; $80F4B2  88           MX
    DEY                             ; $80F4B3  88           MX
L_80F4B4:
    LDA #$0000                      ; $80F4B4  A9 00 00     MX
    JSR L_80F566                    ; $80F4B7  20 66 F5     MX
    LDA #$0004                      ; $80F4BA  A9 04 00     MX
    JMP L_80EFC7                    ; $80F4BD  4C C7 EF     MX
L_80F4C0:
    LDA $0380                       ; $80F4C0  AD 80 03     MX
    LSR                             ; $80F4C3  4A           MX
    LSR                             ; $80F4C4  4A           MX
    LSR                             ; $80F4C5  4A           MX
    AND #$FFFE                      ; $80F4C6  29 FE FF     MX
    LDX $0380                       ; $80F4C9  AE 80 03     MX
    BPL L_80F4D1                    ; $80F4CC  10 03        MX
    ORA #$E000                      ; $80F4CE  09 00 E0     MX
L_80F4D1:
    STA $0374                       ; $80F4D1  8D 74 03     MX
    LDA $0380                       ; $80F4D4  AD 80 03     MX
    AND #$0008                      ; $80F4D7  29 08 00     MX
    BEQ L_80F4F3                    ; $80F4DA  F0 17        MX
    LDA $0374                       ; $80F4DC  AD 74 03     MX
    CLC                             ; $80F4DF  18           MX
    ADC #$001E                      ; $80F4E0  69 1E 00     MX
    TAY                             ; $80F4E3  A8           MX
    LDX $0372                       ; $80F4E4  AE 72 03     MX
    LDA #$001E                      ; $80F4E7  A9 1E 00     MX
    JSR L_80F5C1                    ; $80F4EA  20 C1 F5     MX
    LDA #$0008                      ; $80F4ED  A9 08 00     MX
    JMP L_80EFC7                    ; $80F4F0  4C C7 EF     MX
L_80F4F3:
    LDA $0380                       ; $80F4F3  AD 80 03     MX
    SEC                             ; $80F4F6  38           MX
    SBC $0388                       ; $80F4F7  ED 88 03     MX
    CMP #$0009                      ; $80F4FA  C9 09 00     MX
    BCC L_80F516                    ; $80F4FD  90 17        MX
    LDA $0374                       ; $80F4FF  AD 74 03     MX
    CLC                             ; $80F502  18           MX
    ADC #$001C                      ; $80F503  69 1C 00     MX
    TAY                             ; $80F506  A8           MX
    LDX $0372                       ; $80F507  AE 72 03     MX
    LDA #$001C                      ; $80F50A  A9 1C 00     MX
    JSR L_80F5C1                    ; $80F50D  20 C1 F5     MX
    LDA #$0008                      ; $80F510  A9 08 00     MX
    JMP L_80EFC7                    ; $80F513  4C C7 EF     MX
L_80F516:
    RTS                             ; $80F516  60           MX
L_80F517:
    LDA $0380                       ; $80F517  AD 80 03     MX
    LSR                             ; $80F51A  4A           MX
    LSR                             ; $80F51B  4A           MX
    LSR                             ; $80F51C  4A           MX
    AND #$FFFE                      ; $80F51D  29 FE FF     MX
    LDX $0380                       ; $80F520  AE 80 03     MX
    BPL L_80F528                    ; $80F523  10 03        MX
    ORA #$E000                      ; $80F525  09 00 E0     MX
L_80F528:
    STA $0374                       ; $80F528  8D 74 03     MX
    LDA $0380                       ; $80F52B  AD 80 03     MX
    AND #$0008                      ; $80F52E  29 08 00     MX
    BNE L_80F547                    ; $80F531  D0 14        MX
    LDY $0374                       ; $80F533  AC 74 03     MX
    DEY                             ; $80F536  88           MX
    DEY                             ; $80F537  88           MX
    LDX $0372                       ; $80F538  AE 72 03     MX
    LDA #$FFFE                      ; $80F53B  A9 FE FF     MX
    JSR L_80F5C1                    ; $80F53E  20 C1 F5     MX
    LDA #$0008                      ; $80F541  A9 08 00     MX
    JMP L_80EFC7                    ; $80F544  4C C7 EF     MX
L_80F547:
    LDA $0388                       ; $80F547  AD 88 03     MX
    SEC                             ; $80F54A  38           MX
    SBC $0380                       ; $80F54B  ED 80 03     MX
    CMP #$0009                      ; $80F54E  C9 09 00     MX
    BCC L_80F565                    ; $80F551  90 12        MX
    LDX $0372                       ; $80F553  AE 72 03     MX
    LDY $0374                       ; $80F556  AC 74 03     MX
    LDA #$0000                      ; $80F559  A9 00 00     MX
    JSR L_80F5C1                    ; $80F55C  20 C1 F5     MX
    LDA #$0008                      ; $80F55F  A9 08 00     MX
    JMP L_80EFC7                    ; $80F562  4C C7 EF     MX
L_80F565:
    RTS                             ; $80F565  60           MX
L_80F566:
    PHY                             ; $80F566  5A           MX
    PHA                             ; $80F567  48           MX
    LDA #$0000                      ; $80F568  A9 00 00     MX
    STA $04                         ; $80F56B  85 04        MX
    LDA #$007F                      ; $80F56D  A9 7F 00     MX
    STA $06                         ; $80F570  85 06        MX
    LDA #$00C0                      ; $80F572  A9 C0 00     MX
    STA $9C                         ; $80F575  85 9C        MX
    JSR L_80E7B0                    ; $80F577  20 B0 E7     MX
    LDY #$1800                      ; $80F57A  A0 00 18     MX
    PLA                             ; $80F57D  68           MX
    CLC                             ; $80F57E  18           MX
    ADC $0372                       ; $80F57F  6D 72 03     MX
    AND #$003F                      ; $80F582  29 3F 00     MX
    CMP #$0020                      ; $80F585  C9 20 00     MX
    BCC L_80F590                    ; $80F588  90 06        MX
    LDY #$1C00                      ; $80F58A  A0 00 1C     MX
    AND #$001F                      ; $80F58D  29 1F 00     MX
L_80F590:
    STY $88                         ; $80F590  84 88        MX
    CLC                             ; $80F592  18           MX
    ADC $88                         ; $80F593  65 88        MX
    STA $03C6                       ; $80F595  8D C6 03     MX
    STA $03C8                       ; $80F598  8D C8 03     MX
    PLA                             ; $80F59B  68           MX
    AND #$001F                      ; $80F59C  29 1F 00     MX
    ASL                             ; $80F59F  0A           MX
    STA $88                         ; $80F5A0  85 88        MX
    TAY                             ; $80F5A2  A8           MX
    LDA $F86D,Y                     ; $80F5A3  B9 6D F8     MX
    CLC                             ; $80F5A6  18           MX
    ADC $03C6                       ; $80F5A7  6D C6 03     MX
    STA $03C6                       ; $80F5AA  8D C6 03     MX
    LDA #$0040                      ; $80F5AD  A9 40 00     MX
    SEC                             ; $80F5B0  38           MX
    SBC $88                         ; $80F5B1  E5 88        MX
    STA $03CA                       ; $80F5B3  8D CA 03     MX
    LDA #$0040                      ; $80F5B6  A9 40 00     MX
    SEC                             ; $80F5B9  38           MX
    SBC $03CA                       ; $80F5BA  ED CA 03     MX
    STA $03CC                       ; $80F5BD  8D CC 03     MX
    RTS                             ; $80F5C0  60           MX
L_80F5C1:
    PHA                             ; $80F5C1  48           MX
    PHX                             ; $80F5C2  DA           MX
    LDA #$01D8                      ; $80F5C3  A9 D8 01     MX
    STA $9C                         ; $80F5C6  85 9C        MX
    LDA #$0000                      ; $80F5C8  A9 00 00     MX
    STA $04                         ; $80F5CB  85 04        MX
    LDA #$007F                      ; $80F5CD  A9 7F 00     MX
    STA $06                         ; $80F5D0  85 06        MX
    JSR L_80E96A                    ; $80F5D2  20 6A E9     MX
    LDX #$1800                      ; $80F5D5  A2 00 18     MX
    LDY #$1C00                      ; $80F5D8  A0 00 1C     MX
    PLA                             ; $80F5DB  68           MX
    AND #$003F                      ; $80F5DC  29 3F 00     MX
    CMP #$0020                      ; $80F5DF  C9 20 00     MX
    BCC L_80F5ED                    ; $80F5E2  90 09        MX
    LDX #$1C00                      ; $80F5E4  A2 00 1C     MX
    LDY #$1800                      ; $80F5E7  A0 00 18     MX
    AND #$001F                      ; $80F5EA  29 1F 00     MX
L_80F5ED:
    STA $88                         ; $80F5ED  85 88        MX
    STX $03CE                       ; $80F5EF  8E CE 03     MX
    STX $03D2                       ; $80F5F2  8E D2 03     MX
    STY $03D0                       ; $80F5F5  8C D0 03     MX
    CLC                             ; $80F5F8  18           MX
    ADC $03CE                       ; $80F5F9  6D CE 03     MX
    STA $03CE                       ; $80F5FC  8D CE 03     MX
    PLA                             ; $80F5FF  68           MX
    CLC                             ; $80F600  18           MX
    ADC $0374                       ; $80F601  6D 74 03     MX
    AND #$001F                      ; $80F604  29 1F 00     MX
    ASL                             ; $80F607  0A           MX
    TAY                             ; $80F608  A8           MX
    LDA $F86D,Y                     ; $80F609  B9 6D F8     MX
    TAX                             ; $80F60C  AA           MX
    ADC $03CE                       ; $80F60D  6D CE 03     MX
    STA $03CE                       ; $80F610  8D CE 03     MX
    TXA                             ; $80F613  8A           MX
    ADC $03D0                       ; $80F614  6D D0 03     MX
    STA $03D0                       ; $80F617  8D D0 03     MX
    TXA                             ; $80F61A  8A           MX
    ADC $03D2                       ; $80F61B  6D D2 03     MX
    STA $03D2                       ; $80F61E  8D D2 03     MX
    LDA #$0020                      ; $80F621  A9 20 00     MX
    SEC                             ; $80F624  38           MX
    SBC $88                         ; $80F625  E5 88        MX
    ASL                             ; $80F627  0A           MX
    STA $03D4                       ; $80F628  8D D4 03     MX
    LDA #$0048                      ; $80F62B  A9 48 00     MX
    SEC                             ; $80F62E  38           MX
    SBC $03D4                       ; $80F62F  ED D4 03     MX
    CMP #$0040                      ; $80F632  C9 40 00     MX
    BCC L_80F644                    ; $80F635  90 0D        MX
    AND #$003F                      ; $80F637  29 3F 00     MX
    STA $03D8                       ; $80F63A  8D D8 03     MX
    LDA #$0040                      ; $80F63D  A9 40 00     MX
    STA $03D6                       ; $80F640  8D D6 03     MX
    RTS                             ; $80F643  60           MX
L_80F644:
    STA $03D6                       ; $80F644  8D D6 03     MX
    STZ $03D8                       ; $80F647  9C D8 03     MX
    RTS                             ; $80F64A  60           MX
L_80F64B:
    SEP #$30                        ; $80F64B  E2 30        MX
    LDA #$81                        ; $80F64D  A9 81        mx
    STA $2115                       ; $80F64F  8D 15 21     mx
    LDA #$01                        ; $80F652  A9 01        mx
    STA $4300                       ; $80F654  8D 00 43     mx
    STA $4350                       ; $80F657  8D 50 43     mx
    LDA #$18                        ; $80F65A  A9 18        mx
    STA $4301                       ; $80F65C  8D 01 43     mx
    STA $4351                       ; $80F65F  8D 51 43     mx
    REP #$30                        ; $80F662  C2 30        mx
    LDA $03C6                       ; $80F664  AD C6 03     MX
    STA $2116                       ; $80F667  8D 16 21     MX
    LDA #$049A                      ; $80F66A  A9 9A 04     MX
    STA $4302                       ; $80F66D  8D 02 43     MX
    LDA #$08DA                      ; $80F670  A9 DA 08     MX
    STA $4352                       ; $80F673  8D 52 43     MX
    LDA $03CA                       ; $80F676  AD CA 03     MX
    STA $4305                       ; $80F679  8D 05 43     MX
    STA $4355                       ; $80F67C  8D 55 43     MX
    SEP #$30                        ; $80F67F  E2 30        MX
    LDA #$7E                        ; $80F681  A9 7E        mx
    STA $4304                       ; $80F683  8D 04 43     mx
    STA $4354                       ; $80F686  8D 54 43     mx
    LDA #$01                        ; $80F689  A9 01        mx
    STA $420B                       ; $80F68B  8D 0B 42     mx
    REP #$30                        ; $80F68E  C2 30        mx
    LDA $03C6                       ; $80F690  AD C6 03     MX
    INC                             ; $80F693  1A           MX
    INC                             ; $80F694  1A           MX
    STA $2116                       ; $80F695  8D 16 21     MX
    SEP #$30                        ; $80F698  E2 30        MX
    LDA #$20                        ; $80F69A  A9 20        mx
    STA $420B                       ; $80F69C  8D 0B 42     mx
    LDA $03CC                       ; $80F69F  AD CC 03     mx
    BEQ L_80F6CD                    ; $80F6A2  F0 29        mx
    REP #$30                        ; $80F6A4  C2 30        mx
    LDA $03C8                       ; $80F6A6  AD C8 03     MX
    STA $2116                       ; $80F6A9  8D 16 21     MX
    LDA $03CC                       ; $80F6AC  AD CC 03     MX
    STA $4305                       ; $80F6AF  8D 05 43     MX
    STA $4355                       ; $80F6B2  8D 55 43     MX
    SEP #$30                        ; $80F6B5  E2 30        MX
    LDA #$01                        ; $80F6B7  A9 01        mx
    STA $420B                       ; $80F6B9  8D 0B 42     mx
    REP #$30                        ; $80F6BC  C2 30        mx
    LDA $03C8                       ; $80F6BE  AD C8 03     MX
    INC                             ; $80F6C1  1A           MX
    INC                             ; $80F6C2  1A           MX
    STA $2116                       ; $80F6C3  8D 16 21     MX
    SEP #$30                        ; $80F6C6  E2 30        MX
    LDA #$20                        ; $80F6C8  A9 20        mx
    STA $420B                       ; $80F6CA  8D 0B 42     mx
L_80F6CD:
    REP #$30                        ; $80F6CD  C2 30        mx
    LDA $03C6                       ; $80F6CF  AD C6 03     MX
    INC                             ; $80F6D2  1A           MX
    STA $2116                       ; $80F6D3  8D 16 21     MX
    LDA #$06BA                      ; $80F6D6  A9 BA 06     MX
    STA $4302                       ; $80F6D9  8D 02 43     MX
    LDA #$09DA                      ; $80F6DC  A9 DA 09     MX
    STA $4352                       ; $80F6DF  8D 52 43     MX
    LDA $03CA                       ; $80F6E2  AD CA 03     MX
    STA $4305                       ; $80F6E5  8D 05 43     MX
    STA $4355                       ; $80F6E8  8D 55 43     MX
    SEP #$30                        ; $80F6EB  E2 30        MX
    LDA #$01                        ; $80F6ED  A9 01        mx
    STA $420B                       ; $80F6EF  8D 0B 42     mx
    REP #$30                        ; $80F6F2  C2 30        mx
    LDA $03C6                       ; $80F6F4  AD C6 03     MX
    INC                             ; $80F6F7  1A           MX
    INC                             ; $80F6F8  1A           MX
    INC                             ; $80F6F9  1A           MX
    STA $2116                       ; $80F6FA  8D 16 21     MX
    SEP #$30                        ; $80F6FD  E2 30        MX
    LDA #$20                        ; $80F6FF  A9 20        mx
    STA $420B                       ; $80F701  8D 0B 42     mx
    LDA $03CC                       ; $80F704  AD CC 03     mx
    BEQ L_80F734                    ; $80F707  F0 2B        mx
    REP #$30                        ; $80F709  C2 30        mx
    LDA $03C8                       ; $80F70B  AD C8 03     MX
    INC                             ; $80F70E  1A           MX
    STA $2116                       ; $80F70F  8D 16 21     MX
    LDA $03CC                       ; $80F712  AD CC 03     MX
    STA $4305                       ; $80F715  8D 05 43     MX
    STA $4355                       ; $80F718  8D 55 43     MX
    SEP #$30                        ; $80F71B  E2 30        MX
    LDA #$01                        ; $80F71D  A9 01        mx
    STA $420B                       ; $80F71F  8D 0B 42     mx
    REP #$30                        ; $80F722  C2 30        mx
    LDA $03C8                       ; $80F724  AD C8 03     MX
    INC                             ; $80F727  1A           MX
    INC                             ; $80F728  1A           MX
    INC                             ; $80F729  1A           MX
    STA $2116                       ; $80F72A  8D 16 21     MX
    SEP #$30                        ; $80F72D  E2 30        MX
    LDA #$20                        ; $80F72F  A9 20        mx
    STA $420B                       ; $80F731  8D 0B 42     mx
L_80F734:
    REP #$30                        ; $80F734  C2 30        mx
    RTS                             ; $80F736  60           MX
L_80F737:
    SEP #$30                        ; $80F737  E2 30        MX
    LDA #$80                        ; $80F739  A9 80        mx
    STA $2115                       ; $80F73B  8D 15 21     mx
    LDA #$01                        ; $80F73E  A9 01        mx
    STA $4300                       ; $80F740  8D 00 43     mx
    LDA #$18                        ; $80F743  A9 18        mx
    STA $4301                       ; $80F745  8D 01 43     mx
    REP #$30                        ; $80F748  C2 30        mx
    LDA $03CE                       ; $80F74A  AD CE 03     MX
    STA $2116                       ; $80F74D  8D 16 21     MX
    LDA #$05B2                      ; $80F750  A9 B2 05     MX
    STA $4302                       ; $80F753  8D 02 43     MX
    LDA $03D4                       ; $80F756  AD D4 03     MX
    STA $4305                       ; $80F759  8D 05 43     MX
    SEP #$30                        ; $80F75C  E2 30        MX
    LDA #$7E                        ; $80F75E  A9 7E        mx
    STA $4304                       ; $80F760  8D 04 43     mx
    LDA #$01                        ; $80F763  A9 01        mx
    STA $420B                       ; $80F765  8D 0B 42     mx
    REP #$30                        ; $80F768  C2 30        mx
    LDA $03D0                       ; $80F76A  AD D0 03     MX
    STA $2116                       ; $80F76D  8D 16 21     MX
    LDA $03D6                       ; $80F770  AD D6 03     MX
    STA $4305                       ; $80F773  8D 05 43     MX
    SEP #$30                        ; $80F776  E2 30        MX
    LDA #$01                        ; $80F778  A9 01        mx
    STA $420B                       ; $80F77A  8D 0B 42     mx
    LDA $03D8                       ; $80F77D  AD D8 03     mx
    BEQ L_80F797                    ; $80F780  F0 15        mx
    REP #$30                        ; $80F782  C2 30        mx
    LDA $03D2                       ; $80F784  AD D2 03     MX
    STA $2116                       ; $80F787  8D 16 21     MX
    LDA $03D8                       ; $80F78A  AD D8 03     MX
    STA $4305                       ; $80F78D  8D 05 43     MX
    SEP #$30                        ; $80F790  E2 30        MX
    LDA #$01                        ; $80F792  A9 01        mx
    STA $420B                       ; $80F794  8D 0B 42     mx
L_80F797:
    REP #$30                        ; $80F797  C2 30        mx
    LDA $03CE                       ; $80F799  AD CE 03     MX
    CLC                             ; $80F79C  18           MX
    ADC #$0020                      ; $80F79D  69 20 00     MX
    STA $2116                       ; $80F7A0  8D 16 21     MX
    LDA #$07D2                      ; $80F7A3  A9 D2 07     MX
    STA $4302                       ; $80F7A6  8D 02 43     MX
    LDA $03D4                       ; $80F7A9  AD D4 03     MX
    STA $4305                       ; $80F7AC  8D 05 43     MX
    SEP #$30                        ; $80F7AF  E2 30        MX
    LDA #$01                        ; $80F7B1  A9 01        mx
    STA $420B                       ; $80F7B3  8D 0B 42     mx
    REP #$30                        ; $80F7B6  C2 30        mx
    LDA $03D0                       ; $80F7B8  AD D0 03     MX
    CLC                             ; $80F7BB  18           MX
    ADC #$0020                      ; $80F7BC  69 20 00     MX
    STA $2116                       ; $80F7BF  8D 16 21     MX
    LDA $03D6                       ; $80F7C2  AD D6 03     MX
    STA $4305                       ; $80F7C5  8D 05 43     MX
    SEP #$30                        ; $80F7C8  E2 30        MX
    LDA #$01                        ; $80F7CA  A9 01        mx
    STA $420B                       ; $80F7CC  8D 0B 42     mx
    LDA $03D8                       ; $80F7CF  AD D8 03     mx
    BEQ L_80F7ED                    ; $80F7D2  F0 19        mx
    REP #$30                        ; $80F7D4  C2 30        mx
    LDA $03D2                       ; $80F7D6  AD D2 03     MX
    CLC                             ; $80F7D9  18           MX
    ADC #$0020                      ; $80F7DA  69 20 00     MX
    STA $2116                       ; $80F7DD  8D 16 21     MX
    LDA $03D8                       ; $80F7E0  AD D8 03     MX
    STA $4305                       ; $80F7E3  8D 05 43     MX
    SEP #$30                        ; $80F7E6  E2 30        MX
    LDA #$01                        ; $80F7E8  A9 01        mx
    STA $420B                       ; $80F7EA  8D 0B 42     mx
L_80F7ED:
    REP #$30                        ; $80F7ED  C2 30        mx
    RTS                             ; $80F7EF  60           MX
L_80F7F0:
    STX $60                         ; $80F7F0  86 60        MX
    STY $62                         ; $80F7F2  84 62        MX
    CPY #$0073                      ; $80F7F4  C0 73 00     MX
    BCS L_80F7FE                    ; $80F7F7  B0 05        MX
    CPX #$0180                      ; $80F7F9  E0 80 01     MX
    BCC L_80F805                    ; $80F7FC  90 07        MX
L_80F7FE:
    LDA #$0000                      ; $80F7FE  A9 00 00     MX
    STA $B8                         ; $80F801  85 B8        MX
    CLC                             ; $80F803  18           MX
    RTS                             ; $80F804  60           MX
L_80F805:
    TXA                             ; $80F805  8A           MX
    AND #$0003                      ; $80F806  29 03 00     MX
    ASL                             ; $80F809  0A           MX
    STA $64                         ; $80F80A  85 64        MX
    SEP #$30                        ; $80F80C  E2 30        MX
    STY $4202                       ; $80F80E  8C 02 42     mx
    LDA #$C0                        ; $80F811  A9 C0        mx
    STA $4203                       ; $80F813  8D 03 42     mx
    REP #$30                        ; $80F816  C2 30        mx
    LDA $60                         ; $80F818  A5 60        MX
    LSR                             ; $80F81A  4A           MX
    LSR                             ; $80F81B  4A           MX
    ASL                             ; $80F81C  0A           MX
    ADC $4216                       ; $80F81D  6D 16 42     MX
    TAX                             ; $80F820  AA           MX
    PHX                             ; $80F821  DA           MX
    LDA $7F0000,X                   ; $80F822  BF 00 00 7F  MX
    TAX                             ; $80F826  AA           MX
    LDA $7F5DC0,X                   ; $80F827  BF C0 5D 7F  MX
    CLC                             ; $80F82B  18           MX
    ADC $64                         ; $80F82C  65 64        MX
    TAX                             ; $80F82E  AA           MX
    LDA $7F89C0,X                   ; $80F82F  BF C0 89 7F  MX
    PLX                             ; $80F833  FA           MX
    BIT #$2000                      ; $80F834  89 00 20     MX
    BEQ L_80F854                    ; $80F837  F0 1B        MX
    AND #$03FF                      ; $80F839  29 FF 03     MX
    CMP #$03F6                      ; $80F83C  C9 F6 03     MX
    BCC L_80F849                    ; $80F83F  90 08        MX
    STA $B8                         ; $80F841  85 B8        MX
    LDX $60                         ; $80F843  A6 60        MX
    LDY $62                         ; $80F845  A4 62        MX
    SEC                             ; $80F847  38           MX
    RTS                             ; $80F848  60           MX
L_80F849:
    ORA #$2000                      ; $80F849  09 00 20     MX
    STA $B8                         ; $80F84C  85 B8        MX
    LDX $60                         ; $80F84E  A6 60        MX
    LDY $62                         ; $80F850  A4 62        MX
    CLC                             ; $80F852  18           MX
    RTS                             ; $80F853  60           MX
L_80F854:
    LDA $7E3500,X                   ; $80F854  BF 00 35 7E  MX
    TAX                             ; $80F858  AA           MX
    LDA $7F5DC0,X                   ; $80F859  BF C0 5D 7F  MX
    CLC                             ; $80F85D  18           MX
    ADC $64                         ; $80F85E  65 64        MX
    TAX                             ; $80F860  AA           MX
    LDA $7F89C0,X                   ; $80F861  BF C0 89 7F  MX
    STA $B8                         ; $80F865  85 B8        MX
    LDX $60                         ; $80F867  A6 60        MX
    LDY $62                         ; $80F869  A4 62        MX
    CLC                             ; $80F86B  18           MX
    RTS                             ; $80F86C  60           MX
    db $00,$00,$20,$00,$40,$00,$60,$00,$80,$00,$A0,$00,$C0,$00,$E0,$00 ; $80F86D
    db $00,$01,$20,$01,$40,$01,$60,$01,$80,$01,$A0,$01,$C0,$01,$E0,$01 ; $80F87D
    db $00,$02,$20,$02,$40,$02,$60,$02,$80,$02,$A0,$02,$C0,$02,$E0,$02 ; $80F88D
    db $00,$03,$20,$03,$40,$03,$60,$03,$80,$03,$A0,$03,$C0,$03,$E0,$03 ; $80F89D
L_80F8AD:
    LDA $0A5B,X                     ; $80F8AD  BD 5B 0A     mx
    BEQ L_80F8B7                    ; $80F8B0  F0 05        mx
    DEC                             ; $80F8B2  3A           mx
    STA $0A5B,X                     ; $80F8B3  9D 5B 0A     mx
    RTS                             ; $80F8B6  60           mx
L_80F8B7:
    LDA $0C35,X                     ; $80F8B7  BD 35 0C     mx
    CMP #$14                        ; $80F8BA  C9 14        mx
    BEQ L_80F8D1                    ; $80F8BC  F0 13        mx
    LDA $0C31,X                     ; $80F8BE  BD 31 0C     mx
    TAY                             ; $80F8C1  A8           mx
    SEC                             ; $80F8C2  38           mx
    SBC $0A99,Y                     ; $80F8C3  F9 99 0A     mx
    CLC                             ; $80F8C6  18           mx
    ADC #$08                        ; $80F8C7  69 08        mx
    LSR                             ; $80F8C9  4A           mx
    TAY                             ; $80F8CA  A8           mx
    LDA $F8D2,Y                     ; $80F8CB  B9 D2 F8     mx
    STA $0BCC                       ; $80F8CE  8D CC 0B     mx
L_80F8D1:
    RTS                             ; $80F8D1  60           mx
    db $14,$00,$00,$1C,$0C,$00,$00,$00,$04                             ; $80F8D2
L_80F8DB:
    JSR L_80FB2F                    ; $80F8DB  20 2F FB     mx
    LDX #$00                        ; $80F8DE  A2 00        mx
    JSR L_80FA38                    ; $80F8E0  20 38 FA     mx
    LDX #$01                        ; $80F8E3  A2 01        mx
    JSR L_80FA38                    ; $80F8E5  20 38 FA     mx
    LDX #$02                        ; $80F8E8  A2 02        mx
    JSR L_80FA38                    ; $80F8EA  20 38 FA     mx
    LDX #$03                        ; $80F8ED  A2 03        mx
    JSR L_80FA38                    ; $80F8EF  20 38 FA     mx
    LDA #$02                        ; $80F8F2  A9 02        mx
    STA $1AEC                       ; $80F8F4  8D EC 1A     mx
    LDA #$01                        ; $80F8F7  A9 01        mx
    STA $1AED                       ; $80F8F9  8D ED 1A     mx
    STZ $1AEE                       ; $80F8FC  9C EE 1A     mx
    RTS                             ; $80F8FF  60           mx
L_80F900:
    JSR L_80F904                    ; $80F900  20 04 F9     mx
    RTL                             ; $80F903  6B           mx
L_80F904:
    LDA $0334                       ; $80F904  AD 34 03     mx
    BNE L_80F918                    ; $80F907  D0 0F        mx
    CPX #$00                        ; $80F909  E0 00        mx
    BEQ L_80F910                    ; $80F90B  F0 03        mx
    JSR L_80FA38                    ; $80F90D  20 38 FA     mx
L_80F910:
    LDA #$02                        ; $80F910  A9 02        mx
    XBA                             ; $80F912  EB           mx
    LDA #$01                        ; $80F913  A9 01        mx
    JSR L_80F9C2                    ; $80F915  20 C2 F9     mx
L_80F918:
    RTS                             ; $80F918  60           mx
L_80F919:
    JSR L_80F91D                    ; $80F919  20 1D F9     mx
    RTL                             ; $80F91C  6B           mx
L_80F91D:
    LDA #$01                        ; $80F91D  A9 01        mx
    XBA                             ; $80F91F  EB           mx
    LDA #$01                        ; $80F920  A9 01        mx
    JSR L_80F9C2                    ; $80F922  20 C2 F9     mx
    RTS                             ; $80F925  60           mx
L_80F926:
    JSR L_80F92A                    ; $80F926  20 2A F9     mx
    RTL                             ; $80F929  6B           mx
L_80F92A:
    PHX                             ; $80F92A  DA           mx
    PHP                             ; $80F92B  08           mx
    SEP #$20                        ; $80F92C  E2 20        mx
    LDX $0333                       ; $80F92E  AE 33 03     mx
    BNE L_80F93D                    ; $80F931  D0 0A        mx
    CMP #$32                        ; $80F933  C9 32        mx
    BCS L_80F940                    ; $80F935  B0 09        mx
    XBA                             ; $80F937  EB           mx
    LDA #$02                        ; $80F938  A9 02        mx
L_80F93A:
    JSR L_80F9C2                    ; $80F93A  20 C2 F9     mx
L_80F93D:
    PLP                             ; $80F93D  28           mx
    PLX                             ; $80F93E  FA           mx
    RTS                             ; $80F93F  60           mx
L_80F940:
    SEC                             ; $80F940  38           mx
    SBC #$32                        ; $80F941  E9 32        mx
    XBA                             ; $80F943  EB           mx
    LDA #$0B                        ; $80F944  A9 0B        mx
    BRA L_80F93A                    ; $80F946  80 F2        mx
L_80F948:
    JSR L_80F94C                    ; $80F948  20 4C F9     mx
    RTL                             ; $80F94B  6B           mx
L_80F94C:
    PHP                             ; $80F94C  08           mx
    SEP #$20                        ; $80F94D  E2 20        mx
    XBA                             ; $80F94F  EB           mx
    LDA #$0C                        ; $80F950  A9 0C        mx
    JSR L_80F9C2                    ; $80F952  20 C2 F9     mx
    PLP                             ; $80F955  28           mx
    RTS                             ; $80F956  60           mx
L_80F957:
    JSR L_80F95B                    ; $80F957  20 5B F9     mx
    RTL                             ; $80F95A  6B           mx
L_80F95B:
    PHP                             ; $80F95B  08           mx
    SEP #$20                        ; $80F95C  E2 20        mx
    XBA                             ; $80F95E  EB           mx
    LDA #$0D                        ; $80F95F  A9 0D        mx
    JSR L_80F9C2                    ; $80F961  20 C2 F9     mx
    PLP                             ; $80F964  28           mx
    RTS                             ; $80F965  60           mx
L_80F966:
    PHY                             ; $80F966  5A           mx
    PHP                             ; $80F967  08           mx
    LDY $032E                       ; $80F968  AC 2E 03     mx
    BEQ L_80F971                    ; $80F96B  F0 04        mx
    CPX #$01                        ; $80F96D  E0 01        mx
    BCS L_80F978                    ; $80F96F  B0 07        mx
L_80F971:
    CPX #$02                        ; $80F971  E0 02        mx
    BCS L_80F978                    ; $80F973  B0 03        mx
    JSR L_80F92A                    ; $80F975  20 2A F9     mx
L_80F978:
    PLP                             ; $80F978  28           mx
    PLY                             ; $80F979  7A           mx
    RTS                             ; $80F97A  60           mx
L_80F97B:
    XBA                             ; $80F97B  EB           mx
    LDA #$07                        ; $80F97C  A9 07        mx
    JSR L_80F9C2                    ; $80F97E  20 C2 F9     mx
    RTS                             ; $80F981  60           mx
L_80F982:
    JSR L_80F986                    ; $80F982  20 86 F9     mx
    RTL                             ; $80F985  6B           mx
L_80F986:
    PHP                             ; $80F986  08           mx
    REP #$20                        ; $80F987  C2 20        mx
L_80F989:
    LDA $1A5C                       ; $80F989  AD 5C 1A     Mx
    CMP $1A5E                       ; $80F98C  CD 5E 1A     Mx
    BEQ L_80F996                    ; $80F98F  F0 05        Mx
    JSR L_80F9F6                    ; $80F991  20 F6 F9     Mx
    BRA L_80F989                    ; $80F994  80 F3        Mx
L_80F996:
    PLP                             ; $80F996  28           Mx
    RTS                             ; $80F997  60           mx
L_80F998:
    PHP                             ; $80F998  08           mx
    SEP #$10                        ; $80F999  E2 10        mx
    LDX $1AE6                       ; $80F99B  AE E6 1A     mx
    BNE L_80F9A3                    ; $80F99E  D0 03        mx
    JSR L_80FBAD                    ; $80F9A0  20 AD FB     mx
L_80F9A3:
    PLP                             ; $80F9A3  28           mx
    RTS                             ; $80F9A4  60           mx
L_80F9A5:
    PHB                             ; $80F9A5  8B           mx
    PHK                             ; $80F9A6  4B           mx
    PLB                             ; $80F9A7  AB           mx
    JSR L_80F9AD                    ; $80F9A8  20 AD F9     mx
    PLB                             ; $80F9AB  AB           mx
    RTL                             ; $80F9AC  6B           mx
L_80F9AD:
    PHX                             ; $80F9AD  DA           mx
    PHY                             ; $80F9AE  5A           mx
    LDY $032E                       ; $80F9AF  AC 2E 03     mx
    BEQ L_80F9B8                    ; $80F9B2  F0 04        mx
    CPX #$01                        ; $80F9B4  E0 01        mx
    BCS L_80F9BF                    ; $80F9B6  B0 07        mx
L_80F9B8:
    CPX #$02                        ; $80F9B8  E0 02        mx
    BCS L_80F9BF                    ; $80F9BA  B0 03        mx
    JSR L_80F998                    ; $80F9BC  20 98 F9     mx
L_80F9BF:
    PLY                             ; $80F9BF  7A           mx
    PLX                             ; $80F9C0  FA           mx
    RTS                             ; $80F9C1  60           mx
L_80F9C2:
    PHP                             ; $80F9C2  08           mx
    REP #$30                        ; $80F9C3  C2 30        mx
    PHX                             ; $80F9C5  DA           MX
    PHY                             ; $80F9C6  5A           MX
    PHA                             ; $80F9C7  48           MX
    SEP #$30                        ; $80F9C8  E2 30        MX
    LDA $1A5E                       ; $80F9CA  AD 5E 1A     mx
    TAX                             ; $80F9CD  AA           mx
    INC                             ; $80F9CE  1A           mx
    AND #$3F                        ; $80F9CF  29 3F        mx
    CMP $1A5C                       ; $80F9D1  CD 5C 1A     mx
    BEQ L_80F9EB                    ; $80F9D4  F0 15        mx
    PLA                             ; $80F9D6  68           mx
    STA $1AA2,X                     ; $80F9D7  9D A2 1A     mx
    PLA                             ; $80F9DA  68           mx
    STA $1A62,X                     ; $80F9DB  9D 62 1A     mx
    INX                             ; $80F9DE  E8           mx
    TXA                             ; $80F9DF  8A           mx
    AND #$3F                        ; $80F9E0  29 3F        mx
    STA $1A5E                       ; $80F9E2  8D 5E 1A     mx
    REP #$30                        ; $80F9E5  C2 30        mx
    PLY                             ; $80F9E7  7A           MX
    PLX                             ; $80F9E8  FA           MX
    PLP                             ; $80F9E9  28           MX
    RTS                             ; $80F9EA  60           mx
L_80F9EB:
    REP #$30                        ; $80F9EB  C2 30        mx
    PLA                             ; $80F9ED  68           MX
    PLY                             ; $80F9EE  7A           MX
    PLX                             ; $80F9EF  FA           MX
    PLP                             ; $80F9F0  28           MX
    RTS                             ; $80F9F1  60           mx
L_80F9F2:
    JSR L_80F9F6                    ; $80F9F2  20 F6 F9     mx
    RTL                             ; $80F9F5  6B           mx
L_80F9F6:
    PHP                             ; $80F9F6  08           Mx
    REP #$30                        ; $80F9F7  C2 30        Mx
    PHX                             ; $80F9F9  DA           MX
    PHY                             ; $80F9FA  5A           MX
    SEP #$30                        ; $80F9FB  E2 30        MX
    LDA $2142                       ; $80F9FD  AD 42 21     mx
    CMP $1A60                       ; $80FA00  CD 60 1A     mx
    BNE L_80FA31                    ; $80FA03  D0 2C        mx
    XBA                             ; $80FA05  EB           mx
    LDA $1A5C                       ; $80FA06  AD 5C 1A     mx
    CMP $1A5E                       ; $80FA09  CD 5E 1A     mx
    BEQ L_80FA31                    ; $80FA0C  F0 23        mx
    TAX                             ; $80FA0E  AA           mx
    LDA $1A62,X                     ; $80FA0F  BD 62 1A     mx
    PHA                             ; $80FA12  48           mx
    XBA                             ; $80FA13  EB           mx
    EOR #$C0                        ; $80FA14  49 C0        mx
    STA $1A60                       ; $80FA16  8D 60 1A     mx
    ORA $1AA2,X                     ; $80FA19  1D A2 1A     mx
    PHA                             ; $80FA1C  48           mx
    TXA                             ; $80FA1D  8A           mx
    INC                             ; $80FA1E  1A           mx
    AND #$3F                        ; $80FA1F  29 3F        mx
    STA $1A5C                       ; $80FA21  8D 5C 1A     mx
    REP #$20                        ; $80FA24  C2 20        mx
    PLA                             ; $80FA26  68           Mx
    STA $2142                       ; $80FA27  8D 42 21     Mx
    REP #$30                        ; $80FA2A  C2 30        Mx
    PLY                             ; $80FA2C  7A           MX
    PLX                             ; $80FA2D  FA           MX
    PLP                             ; $80FA2E  28           MX
    CLC                             ; $80FA2F  18           Mx
    RTS                             ; $80FA30  60           Mx
L_80FA31:
    REP #$30                        ; $80FA31  C2 30        mx
    PLY                             ; $80FA33  7A           MX
    PLX                             ; $80FA34  FA           MX
    PLP                             ; $80FA35  28           MX
    SEC                             ; $80FA36  38           Mx
    RTS                             ; $80FA37  60           Mx
L_80FA38:
    PHP                             ; $80FA38  08           mx
    REP #$30                        ; $80FA39  C2 30        mx
    PHA                             ; $80FA3B  48           MX
    PHX                             ; $80FA3C  DA           MX
    PHY                             ; $80FA3D  5A           MX
    SEP #$20                        ; $80FA3E  E2 20        MX
    LDA #$FF                        ; $80FA40  A9 FF        mX
    STA $2140                       ; $80FA42  8D 40 21     mX
    JSR L_80FAEA                    ; $80FA45  20 EA FA     mX
    REP #$30                        ; $80FA48  C2 30        mX
    LDA #$BBAA                      ; $80FA4A  A9 AA BB     MX
L_80FA4D:
    CMP $2140                       ; $80FA4D  CD 40 21     MX
    BNE L_80FA4D                    ; $80FA50  D0 FB        MX
    LDA [$91]                       ; $80FA52  A7 91        MX
    TAX                             ; $80FA54  AA           MX
    JSR L_80FB1D                    ; $80FA55  20 1D FB     MX
    JSR L_80FB1D                    ; $80FA58  20 1D FB     MX
    SEP #$20                        ; $80FA5B  E2 20        MX
    STZ $90                         ; $80FA5D  64 90        mX
    LDA [$91]                       ; $80FA5F  A7 91        mX
    STA $2142                       ; $80FA61  8D 42 21     mX
    JSR L_80FB1D                    ; $80FA64  20 1D FB     mX
    LDA [$91]                       ; $80FA67  A7 91        mX
    STA $2143                       ; $80FA69  8D 43 21     mX
    JSR L_80FB1D                    ; $80FA6C  20 1D FB     mX
    REP #$20                        ; $80FA6F  C2 20        mX
    LDA [$91]                       ; $80FA71  A7 91        MX
    PHA                             ; $80FA73  48           MX
    SEP #$20                        ; $80FA74  E2 20        MX
    JSR L_80FB1D                    ; $80FA76  20 1D FB     mX
    LDA #$01                        ; $80FA79  A9 01        mX
    STA $2141                       ; $80FA7B  8D 41 21     mX
L_80FA7E:
    LDA #$CC                        ; $80FA7E  A9 CC        mX
    STA $2140                       ; $80FA80  8D 40 21     mX
    CMP $2140                       ; $80FA83  CD 40 21     mX
    BNE L_80FA7E                    ; $80FA86  D0 F6        mX
L_80FA88:
    JSR L_80FB1D                    ; $80FA88  20 1D FB     mX
    LDA [$91]                       ; $80FA8B  A7 91        mX
    STA $2141                       ; $80FA8D  8D 41 21     mX
    LDA $90                         ; $80FA90  A5 90        mX
    STA $2140                       ; $80FA92  8D 40 21     mX
L_80FA95:
    CMP $2140                       ; $80FA95  CD 40 21     mX
    BNE L_80FA95                    ; $80FA98  D0 FB        mX
    INC $90                         ; $80FA9A  E6 90        mX
    DEX                             ; $80FA9C  CA           mX
    BNE L_80FA88                    ; $80FA9D  D0 E9        mX
    REP #$20                        ; $80FA9F  C2 20        mX
    PLA                             ; $80FAA1  68           MX
    BNE L_80FAA7                    ; $80FAA2  D0 03        MX
    LDA #$FFC0                      ; $80FAA4  A9 C0 FF     MX
L_80FAA7:
    PHA                             ; $80FAA7  48           MX
    STA $2142                       ; $80FAA8  8D 42 21     MX
    SEP #$20                        ; $80FAAB  E2 20        MX
    STZ $2141                       ; $80FAAD  9C 41 21     mX
    LDA $90                         ; $80FAB0  A5 90        mX
    CLC                             ; $80FAB2  18           mX
    ADC #$03                        ; $80FAB3  69 03        mX
    STA $2140                       ; $80FAB5  8D 40 21     mX
    REP #$20                        ; $80FAB8  C2 20        mX
    PLX                             ; $80FABA  FA           MX
    CPX #$FFC0                      ; $80FABB  E0 C0 FF     MX
    BEQ L_80FADC                    ; $80FABE  F0 1C        MX
    SEP #$20                        ; $80FAC0  E2 20        MX
    LDA #$80                        ; $80FAC2  A9 80        mX
L_80FAC4:
    CMP $2142                       ; $80FAC4  CD 42 21     mX
    BNE L_80FAC4                    ; $80FAC7  D0 FB        mX
    STA $1A60                       ; $80FAC9  8D 60 1A     mX
    STA $2142                       ; $80FACC  8D 42 21     mX
    REP #$20                        ; $80FACF  C2 20        mX
    LDA #$0001                      ; $80FAD1  A9 01 00     MX
    STA $1A5C                       ; $80FAD4  8D 5C 1A     MX
    STA $1A5E                       ; $80FAD7  8D 5E 1A     MX
    BRA L_80FAE3                    ; $80FADA  80 07        MX
L_80FADC:
    SEP #$20                        ; $80FADC  E2 20        MX
L_80FADE:
    CMP $2140                       ; $80FADE  CD 40 21     mX
    BNE L_80FADE                    ; $80FAE1  D0 FB        mX
L_80FAE3:
    REP #$20                        ; $80FAE3  C2 20        MX
    PLY                             ; $80FAE5  7A           MX
    PLX                             ; $80FAE6  FA           MX
    PLA                             ; $80FAE7  68           MX
    PLP                             ; $80FAE8  28           MX
    RTS                             ; $80FAE9  60           mx
L_80FAEA:
    PHP                             ; $80FAEA  08           MX
    SEP #$20                        ; $80FAEB  E2 20        MX
    LDA #$82                        ; $80FAED  A9 82        mX
    STA $93                         ; $80FAEF  85 93        mX
    REP #$30                        ; $80FAF1  C2 30        mX
    TXA                             ; $80FAF3  8A           MX
    AND #$00FF                      ; $80FAF4  29 FF 00     MX
    TAX                             ; $80FAF7  AA           MX
    LDA #$8000                      ; $80FAF8  A9 00 80     MX
    STA $91                         ; $80FAFB  85 91        MX
L_80FAFD:
    DEX                             ; $80FAFD  CA           MX
    BMI L_80FB1B                    ; $80FAFE  30 1B        MX
    CLC                             ; $80FB00  18           MX
    ADC [$91]                       ; $80FB01  67 91        MX
    BCC L_80FB0B                    ; $80FB03  90 06        MX
    INC $93                         ; $80FB05  E6 93        MX
    SEC                             ; $80FB07  38           MX
    SBC #$8000                      ; $80FB08  E9 00 80     MX
L_80FB0B:
    CLC                             ; $80FB0B  18           MX
    ADC #$0006                      ; $80FB0C  69 06 00     MX
    BCC L_80FB17                    ; $80FB0F  90 06        MX
    INC $93                         ; $80FB11  E6 93        MX
    SEC                             ; $80FB13  38           MX
    SBC #$8000                      ; $80FB14  E9 00 80     MX
L_80FB17:
    STA $91                         ; $80FB17  85 91        MX
    BRA L_80FAFD                    ; $80FB19  80 E2        MX
L_80FB1B:
    PLP                             ; $80FB1B  28           MX
    RTS                             ; $80FB1C  60           MX
L_80FB1D:
    PHP                             ; $80FB1D  08           mX
    REP #$30                        ; $80FB1E  C2 30        mX
    INC $91                         ; $80FB20  E6 91        MX
    BNE L_80FB2D                    ; $80FB22  D0 09        MX
    LDA #$8000                      ; $80FB24  A9 00 80     MX
    STA $91                         ; $80FB27  85 91        MX
    SEP #$20                        ; $80FB29  E2 20        MX
    INC $93                         ; $80FB2B  E6 93        mX
L_80FB2D:
    PLP                             ; $80FB2D  28           mX
    RTS                             ; $80FB2E  60           mX
L_80FB2F:
    PHP                             ; $80FB2F  08           mx
    SEP #$20                        ; $80FB30  E2 20        mx
    STZ $DB                         ; $80FB32  64 DB        mx
    REP #$20                        ; $80FB34  C2 20        mx
    STZ $1AE6                       ; $80FB36  9C E6 1A     Mx
    STZ $1AE4                       ; $80FB39  9C E4 1A     Mx
    PLP                             ; $80FB3C  28           Mx
    RTS                             ; $80FB3D  60           mx
L_80FB3E:
    JSR L_80FB42                    ; $80FB3E  20 42 FB     mx
    RTL                             ; $80FB41  6B           mx
L_80FB42:
    LDA #$02                        ; $80FB42  A9 02        mx
    JSR L_80F92A                    ; $80FB44  20 2A F9     mx
    RTS                             ; $80FB47  60           mx
L_80FB48:
    JSR L_80FB4C                    ; $80FB48  20 4C FB     mx
    RTL                             ; $80FB4B  6B           mx
L_80FB4C:
    LDA #$03                        ; $80FB4C  A9 03        mx
    JSR L_80F92A                    ; $80FB4E  20 2A F9     mx
    RTS                             ; $80FB51  60           mx
L_80FB52:
    JSR L_80FB56                    ; $80FB52  20 56 FB     mx
    RTL                             ; $80FB55  6B           mx
L_80FB56:
    LDA #$01                        ; $80FB56  A9 01        mX
    JSR L_80F92A                    ; $80FB58  20 2A F9     mX
    RTS                             ; $80FB5B  60           mX
L_80FB5C:
    PHP                             ; $80FB5C  08           MX
    SEP #$20                        ; $80FB5D  E2 20        MX
    LDA $DB                         ; $80FB5F  A5 DB        mX
    BNE L_80FB66                    ; $80FB61  D0 03        mX
    STX $1AE4                       ; $80FB63  8E E4 1A     mX
L_80FB66:
    PLP                             ; $80FB66  28           mX
    RTL                             ; $80FB67  6B           MX
L_80FB68:
    PHB                             ; $80FB68  8B           mx
    PHK                             ; $80FB69  4B           mx
    PLB                             ; $80FB6A  AB           mx
    JSR L_80FB70                    ; $80FB6B  20 70 FB     mx
    PLB                             ; $80FB6E  AB           mx
    RTL                             ; $80FB6F  6B           mx
L_80FB70:
    PHX                             ; $80FB70  DA           mx
    STA $88                         ; $80FB71  85 88        mx
    LDA $1AE4                       ; $80FB73  AD E4 1A     mx
    BNE L_80FBA3                    ; $80FB76  D0 2B        mx
    LDA $1AE5                       ; $80FB78  AD E5 1A     mx
    BNE L_80FBA3                    ; $80FB7B  D0 26        mx
    LDA $032E                       ; $80FB7D  AD 2E 03     mx
    BEQ L_80FB86                    ; $80FB80  F0 04        mx
    CPX #$01                        ; $80FB82  E0 01        mx
    BCS L_80FBA3                    ; $80FB84  B0 1D        mx
L_80FB86:
    CPX #$02                        ; $80FB86  E0 02        mx
    BCS L_80FBA3                    ; $80FB88  B0 19        mx
    LDX $88                         ; $80FB8A  A6 88        mx
    REP #$30                        ; $80FB8C  C2 30        mx
    STX $0202                       ; $80FB8E  8E 02 02     MX
    STY $0204                       ; $80FB91  8C 04 02     MX
    LDA #$FFFF                      ; $80FB94  A9 FF FF     MX
    STA $0206                       ; $80FB97  8D 06 02     MX
    LDX #$0202                      ; $80FB9A  A2 02 02     MX
    JSL L_80FB5C                    ; $80FB9D  22 5C FB 80  MX
    SEP #$30                        ; $80FBA1  E2 30        MX
L_80FBA3:
    PLX                             ; $80FBA3  FA           mx
    RTS                             ; $80FBA4  60           mx
L_80FBA5:
    PHB                             ; $80FBA5  8B           mx
    PHK                             ; $80FBA6  4B           mx
    PLB                             ; $80FBA7  AB           mx
    JSR L_80FBAD                    ; $80FBA8  20 AD FB     mx
    PLB                             ; $80FBAB  AB           mx
    RTL                             ; $80FBAC  6B           mx
L_80FBAD:
    PHP                             ; $80FBAD  08           MX
    SEP #$10                        ; $80FBAE  E2 10        MX
    LDX $0335                       ; $80FBB0  AE 35 03     Mx
    BNE L_80FC1A                    ; $80FBB3  D0 65        Mx
    REP #$30                        ; $80FBB5  C2 30        Mx
    STA $1AE9                       ; $80FBB7  8D E9 1A     MX
    ASL                             ; $80FBBA  0A           MX
    CLC                             ; $80FBBB  18           MX
    ADC $1AE9                       ; $80FBBC  6D E9 1A     MX
    STA $1AE9                       ; $80FBBF  8D E9 1A     MX
    STZ $1AEA                       ; $80FBC2  9C EA 1A     MX
    LDX #$0008                      ; $80FBC5  A2 08 00     MX
    JSR L_80FAEA                    ; $80FBC8  20 EA FA     MX
    LDY $1AE9                       ; $80FBCB  AC E9 1A     MX
    LDA [$91],Y                     ; $80FBCE  B7 91        MX
    AND #$7FFF                      ; $80FBD0  29 FF 7F     MX
    CLC                             ; $80FBD3  18           MX
    ADC $91                         ; $80FBD4  65 91        MX
    BCC L_80FBE3                    ; $80FBD6  90 0B        MX
    SEC                             ; $80FBD8  38           MX
    SBC #$8000                      ; $80FBD9  E9 00 80     MX
    SEP #$20                        ; $80FBDC  E2 20        MX
    INC $1AEB                       ; $80FBDE  EE EB 1A     mX
    REP #$20                        ; $80FBE1  C2 20        mX
L_80FBE3:
    STA $1AE9                       ; $80FBE3  8D E9 1A     MX
    INY                             ; $80FBE6  C8           MX
    LDA [$91],Y                     ; $80FBE7  B7 91        MX
    AND #$FF80                      ; $80FBE9  29 80 FF     MX
    ASL                             ; $80FBEC  0A           MX
    SEP #$20                        ; $80FBED  E2 20        MX
    XBA                             ; $80FBEF  EB           mX
    CLC                             ; $80FBF0  18           mX
    ADC $1AEB                       ; $80FBF1  6D EB 1A     mX
    ADC $93                         ; $80FBF4  65 93        mX
    STA $1AEB                       ; $80FBF6  8D EB 1A     mX
    REP #$20                        ; $80FBF9  C2 20        mX
    INY                             ; $80FBFB  C8           MX
    INY                             ; $80FBFC  C8           MX
    LDA [$91],Y                     ; $80FBFD  B7 91        MX
    DEY                             ; $80FBFF  88           MX
    DEY                             ; $80FC00  88           MX
    DEY                             ; $80FC01  88           MX
    SEC                             ; $80FC02  38           MX
    SBC [$91],Y                     ; $80FC03  F7 91        MX
    STA $1AE7                       ; $80FC05  8D E7 1A     MX
    LDA $1AE9                       ; $80FC08  AD E9 1A     MX
    STA $D9                         ; $80FC0B  85 D9        MX
    SEP #$20                        ; $80FC0D  E2 20        MX
    LDX #$0001                      ; $80FC0F  A2 01 00     mX
    STX $1AE6                       ; $80FC12  8E E6 1A     mX
    LDA $1AEB                       ; $80FC15  AD EB 1A     mX
    STA $DB                         ; $80FC18  85 DB        mX
L_80FC1A:
    PLP                             ; $80FC1A  28           mX
    RTS                             ; $80FC1B  60           MX
L_80FC1C:
    PHP                             ; $80FC1C  08           mx
    SEP #$30                        ; $80FC1D  E2 30        mx
    LDA $1AE6                       ; $80FC1F  AD E6 1A     mx
    ASL                             ; $80FC22  0A           mx
    TAX                             ; $80FC23  AA           mx
    JSR ($FC29,X)                   ; $80FC24  FC 29 FC     mx
    PLP                             ; $80FC27  28           mx
L_80FC28:
    RTS                             ; $80FC28  60           mx
    db $28,$FC,$3B,$FC,$46,$FC,$4F,$FC,$94,$FC,$3B,$FC,$94,$FC,$94,$FC ; $80FC29
    db $BC,$FC                                                         ; $80FC39
L_80FC3B:
    SEP #$20                        ; $80FC3B  E2 20        mx
    LDA #$FD                        ; $80FC3D  A9 FD        mx
    JSR L_80FCAE                    ; $80FC3F  20 AE FC     mx
    INC $1AE6                       ; $80FC42  EE E6 1A     mx
    RTS                             ; $80FC45  60           mx
L_80FC46:
    LDA #$FE                        ; $80FC46  A9 FE        mx
    JSR L_80FCAE                    ; $80FC48  20 AE FC     mx
    INC $1AE6                       ; $80FC4B  EE E6 1A     mx
    RTS                             ; $80FC4E  60           mx
L_80FC4F:
    SEP #$30                        ; $80FC4F  E2 30        mx
    LDA $DB                         ; $80FC51  A5 DB        mx
    BEQ L_80FC93                    ; $80FC53  F0 3E        mx
    LDY #$58                        ; $80FC55  A0 58        mx
    LDX #$01                        ; $80FC57  A2 01        mx
L_80FC59:
    LDA [$D9]                       ; $80FC59  A7 D9        mx
    STA $2141                       ; $80FC5B  8D 41 21     mx
    STX $2140                       ; $80FC5E  8E 40 21     mx
    INC $D9                         ; $80FC61  E6 D9        mx
    BNE L_80FC6F                    ; $80FC63  D0 0A        mx
    INC $DA                         ; $80FC65  E6 DA        mx
    BNE L_80FC6F                    ; $80FC67  D0 06        mx
    INC $DB                         ; $80FC69  E6 DB        mx
    LDA #$80                        ; $80FC6B  A9 80        mx
    STA $DA                         ; $80FC6D  85 DA        mx
L_80FC6F:
    CPX $2140                       ; $80FC6F  EC 40 21     mx
    BNE L_80FC6F                    ; $80FC72  D0 FB        mx
    INX                             ; $80FC74  E8           mx
    DEY                             ; $80FC75  88           mx
    BNE L_80FC59                    ; $80FC76  D0 E1        mx
    STZ $2141                       ; $80FC78  9C 41 21     mx
    STZ $2140                       ; $80FC7B  9C 40 21     mx
    REP #$30                        ; $80FC7E  C2 30        mx
    LDA $1AE7                       ; $80FC80  AD E7 1A     MX
    SEC                             ; $80FC83  38           MX
    SBC #$0058                      ; $80FC84  E9 58 00     MX
    STA $1AE7                       ; $80FC87  8D E7 1A     MX
    BPL L_80FC93                    ; $80FC8A  10 07        MX
    SEP #$20                        ; $80FC8C  E2 20        MX
    STZ $DB                         ; $80FC8E  64 DB        mX
    INC $1AE6                       ; $80FC90  EE E6 1A     mX
L_80FC93:
    RTS                             ; $80FC93  60           mX
L_80FC94:
    LDY #$58                        ; $80FC94  A0 58        mx
    LDX #$01                        ; $80FC96  A2 01        mx
    STZ $2141                       ; $80FC98  9C 41 21     mx
L_80FC9B:
    STX $2140                       ; $80FC9B  8E 40 21     mx
L_80FC9E:
    CPX $2140                       ; $80FC9E  EC 40 21     mx
    BNE L_80FC9E                    ; $80FCA1  D0 FB        mx
    INX                             ; $80FCA3  E8           mx
    DEY                             ; $80FCA4  88           mx
    BNE L_80FC9B                    ; $80FCA5  D0 F4        mx
    STZ $2140                       ; $80FCA7  9C 40 21     mx
    INC $1AE6                       ; $80FCAA  EE E6 1A     mx
    RTS                             ; $80FCAD  60           mx
L_80FCAE:
    SEP #$30                        ; $80FCAE  E2 30        mx
    STA $2140                       ; $80FCB0  8D 40 21     mx
L_80FCB3:
    CMP $2140                       ; $80FCB3  CD 40 21     mx
    BNE L_80FCB3                    ; $80FCB6  D0 FB        mx
    STZ $2140                       ; $80FCB8  9C 40 21     mx
    RTS                             ; $80FCBB  60           mx
L_80FCBC:
    STZ $1AE6                       ; $80FCBC  9C E6 1A     mx
    RTS                             ; $80FCBF  60           mx
L_80FCC0:
    PHP                             ; $80FCC0  08           mx
    PHB                             ; $80FCC1  8B           mx
    PHK                             ; $80FCC2  4B           mx
    PLB                             ; $80FCC3  AB           mx
    SEP #$20                        ; $80FCC4  E2 20        mx
    LDA $1AE6                       ; $80FCC6  AD E6 1A     mx
    BNE L_80FCEB                    ; $80FCC9  D0 20        mx
    REP #$30                        ; $80FCCB  C2 30        mx
    LDX $1AE4                       ; $80FCCD  AE E4 1A     MX
    BEQ L_80FCEB                    ; $80FCD0  F0 19        MX
    LDA $0000,X                     ; $80FCD2  BD 00 00     MX
    CMP #$FFFF                      ; $80FCD5  C9 FF FF     MX
    BNE L_80FCE2                    ; $80FCD8  D0 08        MX
    LDX #$0000                      ; $80FCDA  A2 00 00     MX
    STX $1AE4                       ; $80FCDD  8E E4 1A     MX
    BRA L_80FCEB                    ; $80FCE0  80 09        MX
L_80FCE2:
    JSR L_80FBAD                    ; $80FCE2  20 AD FB     MX
    INC $1AE4                       ; $80FCE5  EE E4 1A     MX
    INC $1AE4                       ; $80FCE8  EE E4 1A     MX
L_80FCEB:
    PLB                             ; $80FCEB  AB           MX
    PLP                             ; $80FCEC  28           MX
    RTL                             ; $80FCED  6B           mx
L_80FCEE:
    PHP                             ; $80FCEE  08           mx
    REP #$20                        ; $80FCEF  C2 20        mx
    STZ $1AE4                       ; $80FCF1  9C E4 1A     Mx
    SEP #$20                        ; $80FCF4  E2 20        Mx
    LDA #$05                        ; $80FCF6  A9 05        mx
    STZ $DB                         ; $80FCF8  64 DB        mx
    STA $1AE6                       ; $80FCFA  8D E6 1A     mx
    PLP                             ; $80FCFD  28           mx
    RTS                             ; $80FCFE  60           mx
L_80FCFF:
    LDX #$03                        ; $80FCFF  A2 03        mx
L_80FD01:
    LDA $0C8F,X                     ; $80FD01  BD 8F 0C     mx
    BEQ L_80FD09                    ; $80FD04  F0 03        mx
    DEC $0C8F,X                     ; $80FD06  DE 8F 0C     mx
L_80FD09:
    DEX                             ; $80FD09  CA           mx
    BPL L_80FD01                    ; $80FD0A  10 F5        mx
    LDX #$00                        ; $80FD0C  A2 00        mx
    LDY #$01                        ; $80FD0E  A0 01        mx
    STX $0B6D                       ; $80FD10  8E 6D 0B     mx
    STY $0B6E                       ; $80FD13  8C 6E 0B     mx
L_80FD16:
    LDX $0B6D                       ; $80FD16  AE 6D 0B     mx
    LDY $0B6E                       ; $80FD19  AC 6E 0B     mx
    LDA $0C8F,X                     ; $80FD1C  BD 8F 0C     mx
    ORA $0C8F,Y                     ; $80FD1F  19 8F 0C     mx
    BNE L_80FD7F                    ; $80FD22  D0 5B        mx
    LDA $0EDF,X                     ; $80FD24  BD DF 0E     mx
    BEQ L_80FD7F                    ; $80FD27  F0 56        mx
    LDA $0EDF,Y                     ; $80FD29  B9 DF 0E     mx
    BEQ L_80FD7F                    ; $80FD2C  F0 51        mx
    LDA $0EF1,X                     ; $80FD2E  BD F1 0E     mx
    BEQ L_80FD7F                    ; $80FD31  F0 4C        mx
    LDA $0EF1,Y                     ; $80FD33  B9 F1 0E     mx
    BEQ L_80FD7F                    ; $80FD36  F0 47        mx
    LDA $A024,X                     ; $80FD38  BD 24 A0     mx
    TAX                             ; $80FD3B  AA           mx
    LDA $A024,Y                     ; $80FD3C  B9 24 A0     mx
    TAY                             ; $80FD3F  A8           mx
    REP #$30                        ; $80FD40  C2 30        mx
    LDA $DD,X                       ; $80FD42  B5 DD        MX
    SEC                             ; $80FD44  38           MX
    SBC $00DD,Y                     ; $80FD45  F9 DD 00     MX
    JSR L_80FDA5                    ; $80FD48  20 A5 FD     MX
    CMP #$000E                      ; $80FD4B  C9 0E 00     MX
    BCS L_80FD7F                    ; $80FD4E  B0 2F        MX
    LDA $EF,X                       ; $80FD50  B5 EF        MX
    SEC                             ; $80FD52  38           MX
    SBC $00EF,Y                     ; $80FD53  F9 EF 00     MX
    JSR L_80FDA5                    ; $80FD56  20 A5 FD     MX
    CMP #$0007                      ; $80FD59  C9 07 00     MX
    BCS L_80FD7F                    ; $80FD5C  B0 21        MX
    SEP #$30                        ; $80FD5E  E2 30        MX
    LDX $0B6D                       ; $80FD60  AE 6D 0B     mx
    LDY $0B6E                       ; $80FD63  AC 6E 0B     mx
    LDA $0A45,X                     ; $80FD66  BD 45 0A     mx
    SEC                             ; $80FD69  38           mx
    SBC $0A45,Y                     ; $80FD6A  F9 45 0A     mx
    JSR L_80FD9D                    ; $80FD6D  20 9D FD     mx
    CMP #$04                        ; $80FD70  C9 04        mx
    BCS L_80FD7F                    ; $80FD72  B0 0B        mx
    LDA #$0F                        ; $80FD74  A9 0F        mx
    STA $0C8F,X                     ; $80FD76  9D 8F 0C     mx
    STA $0C8F,Y                     ; $80FD79  99 8F 0C     mx
    JSR L_80FDAF                    ; $80FD7C  20 AF FD     mx
L_80FD7F:
    SEP #$30                        ; $80FD7F  E2 30        mx
    INC $0B6E                       ; $80FD81  EE 6E 0B     mx
    LDA $0B6E                       ; $80FD84  AD 6E 0B     mx
    CMP #$04                        ; $80FD87  C9 04        mx
    BCC L_80FD16                    ; $80FD89  90 8B        mx
    INC $0B6D                       ; $80FD8B  EE 6D 0B     mx
    LDA $0B6D                       ; $80FD8E  AD 6D 0B     mx
    INC                             ; $80FD91  1A           mx
    STA $0B6E                       ; $80FD92  8D 6E 0B     mx
    CMP #$04                        ; $80FD95  C9 04        mx
    BCS L_80FD9C                    ; $80FD97  B0 03        mx
    JMP L_80FD16                    ; $80FD99  4C 16 FD     mx
L_80FD9C:
    RTS                             ; $80FD9C  60           mx
L_80FD9D:
    BIT #$80                        ; $80FD9D  89 80        mx
    BEQ L_80FDA4                    ; $80FD9F  F0 03        mx
    EOR #$FF                        ; $80FDA1  49 FF        mx
    INC                             ; $80FDA3  1A           mx
L_80FDA4:
    RTS                             ; $80FDA4  60           mx
L_80FDA5:
    BIT #$8000                      ; $80FDA5  89 00 80     MX
    BEQ L_80FDAE                    ; $80FDA8  F0 04        MX
    EOR #$FFFF                      ; $80FDAA  49 FF FF     MX
    INC                             ; $80FDAD  1A           MX
L_80FDAE:
    RTS                             ; $80FDAE  60           MX
L_80FDAF:
    LDA #$0C                        ; $80FDAF  A9 0C        mx
    JSR L_80F966                    ; $80FDB1  20 66 F9     mx
    LDA #$00                        ; $80FDB4  A9 00        mx
    STA $13AB,X                     ; $80FDB6  9D AB 13     mx
    STA $13AB,Y                     ; $80FDB9  99 AB 13     mx
    STA $0CBD,X                     ; $80FDBC  9D BD 0C     mx
    STA $0CBD,Y                     ; $80FDBF  99 BD 0C     mx
    LDA $0048,Y                     ; $80FDC2  B9 48 00     mx
    SEC                             ; $80FDC5  38           mx
    SBC $48,X                       ; $80FDC6  F5 48        mx
    LDA #$00                        ; $80FDC8  A9 00        mx
    ADC #$00                        ; $80FDCA  69 00        mx
    STA $0B6F,Y                     ; $80FDCC  99 6F 0B     mx
    EOR #$01                        ; $80FDCF  49 01        mx
    STA $0B6F,X                     ; $80FDD1  9D 6F 0B     mx
    LDA $80,X                       ; $80FDD4  B5 80        mx
    STA $0B7F                       ; $80FDD6  8D 7F 0B     mx
    LDA $0080,Y                     ; $80FDD9  B9 80 00     mx
    STA $0B80                       ; $80FDDC  8D 80 0B     mx
    JSR L_80FE7E                    ; $80FDDF  20 7E FE     mx
    LDA $0B81                       ; $80FDE2  AD 81 0B     mx
    STA $80,X                       ; $80FDE5  95 80        mx
    LDA $0B82                       ; $80FDE7  AD 82 0B     mx
    STA $0080,Y                     ; $80FDEA  99 80 00     mx
    LDX $0B81                       ; $80FDED  AE 81 0B     mx
    LDY $0B7F                       ; $80FDF0  AC 7F 0B     mx
    JSR L_80FEC2                    ; $80FDF3  20 C2 FE     mx
    LDA $0B6D                       ; $80FDF6  AD 6D 0B     mx
    LDY $0B6E                       ; $80FDF9  AC 6E 0B     mx
    JSR ($FF00,X)                   ; $80FDFC  FC 00 FF     mx
    LDX $0B82                       ; $80FDFF  AE 82 0B     mx
    LDY $0B80                       ; $80FE02  AC 80 0B     mx
    JSR L_80FEC2                    ; $80FE05  20 C2 FE     mx
    LDA $0B6E                       ; $80FE08  AD 6E 0B     mx
    LDY $0B6D                       ; $80FE0B  AC 6D 0B     mx
    JSR ($FF00,X)                   ; $80FE0E  FC 00 FF     mx
    LDX $0B6D                       ; $80FE11  AE 6D 0B     mx
    LDY $0B6E                       ; $80FE14  AC 6E 0B     mx
    LDA $84,X                       ; $80FE17  B5 84        mx
    STA $0B7F                       ; $80FE19  8D 7F 0B     mx
    LDA $0084,Y                     ; $80FE1C  B9 84 00     mx
    STA $0B80                       ; $80FE1F  8D 80 0B     mx
    JSR L_80FE7E                    ; $80FE22  20 7E FE     mx
    LDA $0B81                       ; $80FE25  AD 81 0B     mx
    STA $84,X                       ; $80FE28  95 84        mx
    LDA $0B82                       ; $80FE2A  AD 82 0B     mx
    STA $0084,Y                     ; $80FE2D  99 84 00     mx
    DEC $80,X                       ; $80FE30  D6 80        mx
    DEC $80,X                       ; $80FE32  D6 80        mx
    INC $84,X                       ; $80FE34  F6 84        mx
    INC $84,X                       ; $80FE36  F6 84        mx
    LDA $0080,Y                     ; $80FE38  B9 80 00     mx
    INC                             ; $80FE3B  1A           mx
    INC                             ; $80FE3C  1A           mx
    STA $0080,Y                     ; $80FE3D  99 80 00     mx
    LDA $0084,Y                     ; $80FE40  B9 84 00     mx
    DEC                             ; $80FE43  3A           mx
    DEC                             ; $80FE44  3A           mx
    STA $0084,Y                     ; $80FE45  99 84 00     mx
    LDA #$0A                        ; $80FE48  A9 0A        mx
    STA $0CBD,X                     ; $80FE4A  9D BD 0C     mx
    STA $0CBD,Y                     ; $80FE4D  99 BD 0C     mx
    LDA $0B6D                       ; $80FE50  AD 6D 0B     mx
    JSR L_80FF17                    ; $80FE53  20 17 FF     mx
    LDA $0B6E                       ; $80FE56  AD 6E 0B     mx
    JMP L_80FF17                    ; $80FE59  4C 17 FF     mx
L_80FE5C:
    TAX                             ; $80FE5C  AA           mx
    INC $0C7A,X                     ; $80FE5D  FE 7A 0C     mx
    LDA $0C7A,X                     ; $80FE60  BD 7A 0C     mx
    AND #$1F                        ; $80FE63  29 1F        mx
    STA $0C7A,X                     ; $80FE65  9D 7A 0C     mx
    RTS                             ; $80FE68  60           mx
L_80FE69:
    TAX                             ; $80FE69  AA           mx
L_80FE6A:
    LDA $0B6F,X                     ; $80FE6A  BD 6F 0B     mx
    BNE L_80FE76                    ; $80FE6D  D0 07        mx
    LDA $0EDF,X                     ; $80FE6F  BD DF 0E     mx
    DEC                             ; $80FE72  3A           mx
    STA $0EDF,X                     ; $80FE73  9D DF 0E     mx
L_80FE76:
    RTS                             ; $80FE76  60           mx
L_80FE77:
    TAX                             ; $80FE77  AA           mx
    JSR L_80FE6A                    ; $80FE78  20 6A FE     mx
    JMP L_80FE6A                    ; $80FE7B  4C 6A FE     mx
L_80FE7E:
    PHX                             ; $80FE7E  DA           mx
    PHY                             ; $80FE7F  5A           mx
    LDA $0EF9,Y                     ; $80FE80  B9 F9 0E     mx
    SEC                             ; $80FE83  38           mx
    SBC $0EF9,X                     ; $80FE84  FD F9 0E     mx
    STA $0B84                       ; $80FE87  8D 84 0B     mx
    LDA $0B80                       ; $80FE8A  AD 80 0B     mx
    SEC                             ; $80FE8D  38           mx
    SBC $0B7F                       ; $80FE8E  ED 7F 0B     mx
    STA $0B83                       ; $80FE91  8D 83 0B     mx
    JSR L_809DF6                    ; $80FE94  20 F6 9D     mx
    LDA $0EF9,Y                     ; $80FE97  B9 F9 0E     mx
    CLC                             ; $80FE9A  18           mx
    ADC $0EF9,X                     ; $80FE9B  7D F9 0E     mx
    INC                             ; $80FE9E  1A           mx
    STA $0B77                       ; $80FE9F  8D 77 0B     mx
    JSR L_809E50                    ; $80FEA2  20 50 9E     mx
    LDA $0B75                       ; $80FEA5  AD 75 0B     mx
    CLC                             ; $80FEA8  18           mx
    ADC $0B80                       ; $80FEA9  6D 80 0B     mx
    JSR L_80FF06                    ; $80FEAC  20 06 FF     mx
    STA $0B81                       ; $80FEAF  8D 81 0B     mx
    LDA $0B75                       ; $80FEB2  AD 75 0B     mx
    CLC                             ; $80FEB5  18           mx
    ADC $0B7F                       ; $80FEB6  6D 7F 0B     mx
    JSR L_80FF06                    ; $80FEB9  20 06 FF     mx
    STA $0B82                       ; $80FEBC  8D 82 0B     mx
    PLY                             ; $80FEBF  7A           mx
    PLX                             ; $80FEC0  FA           mx
    RTS                             ; $80FEC1  60           mx
L_80FEC2:
    STZ $0B7C                       ; $80FEC2  9C 7C 0B     mx
    STZ $0B7D                       ; $80FEC5  9C 7D 0B     mx
    TXA                             ; $80FEC8  8A           mx
    BPL L_80FECE                    ; $80FEC9  10 03        mx
    DEC $0B7C                       ; $80FECB  CE 7C 0B     mx
L_80FECE:
    STA $0B7E                       ; $80FECE  8D 7E 0B     mx
    TYA                             ; $80FED1  98           mx
    BPL L_80FED7                    ; $80FED2  10 03        mx
    DEC $0B7D                       ; $80FED4  CE 7D 0B     mx
L_80FED7:
    SEC                             ; $80FED7  38           mx
    SBC $0B7E                       ; $80FED8  ED 7E 0B     mx
    TAY                             ; $80FEDB  A8           mx
    LDA $0B7D                       ; $80FEDC  AD 7D 0B     mx
    LDX #$00                        ; $80FEDF  A2 00        mx
    SBC $0B7C                       ; $80FEE1  ED 7C 0B     mx
    BMI L_80FEF3                    ; $80FEE4  30 0D        mx
    CPY #$08                        ; $80FEE6  C0 08        mx
    BCC L_80FEF2                    ; $80FEE8  90 08        mx
    INX                             ; $80FEEA  E8           mx
    INX                             ; $80FEEB  E8           mx
    CPY #$1E                        ; $80FEEC  C0 1E        mx
    BCC L_80FEF2                    ; $80FEEE  90 02        mx
    INX                             ; $80FEF0  E8           mx
    INX                             ; $80FEF1  E8           mx
L_80FEF2:
    RTS                             ; $80FEF2  60           mx
L_80FEF3:
    CPY #$F8                        ; $80FEF3  C0 F8        mx
    BCS L_80FEF2                    ; $80FEF5  B0 FB        mx
    INX                             ; $80FEF7  E8           mx
    INX                             ; $80FEF8  E8           mx
    CPY #$E2                        ; $80FEF9  C0 E2        mx
    BCS L_80FEF2                    ; $80FEFB  B0 F5        mx
    INX                             ; $80FEFD  E8           mx
    INX                             ; $80FEFE  E8           mx
    RTS                             ; $80FEFF  60           mx
    db $5C,$FE,$69,$FE,$77,$FE                                         ; $80FF00
L_80FF06:
    TAX                             ; $80FF06  AA           mx
    BPL L_80FF10                    ; $80FF07  10 07        mx
    CMP #$C0                        ; $80FF09  C9 C0        mx
    BCS L_80FF16                    ; $80FF0B  B0 09        mx
    LDA #$BE                        ; $80FF0D  A9 BE        mx
    RTS                             ; $80FF0F  60           mx
L_80FF10:
    CMP #$40                        ; $80FF10  C9 40        mx
    BCC L_80FF16                    ; $80FF12  90 02        mx
    LDA #$3E                        ; $80FF14  A9 3E        mx
L_80FF16:
    RTS                             ; $80FF16  60           mx
L_80FF17:
    LDY #$03                        ; $80FF17  A0 03        mx
L_80FF19:
    LDA $0EDF,Y                     ; $80FF19  B9 DF 0E     mx
    BPL L_80FF23                    ; $80FF1C  10 05        mx
    LDA #$00                        ; $80FF1E  A9 00        mx
    STA $0EDF,Y                     ; $80FF20  99 DF 0E     mx
L_80FF23:
    DEY                             ; $80FF23  88           mx
    BPL L_80FF19                    ; $80FF24  10 F3        mx
    RTS                             ; $80FF26  60           mx
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $80FF27
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $80FF37
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $80FF47
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $80FF57
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $80FF67
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $80FF77
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $80FF87
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $80FF97
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $80FFA7
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$52,$4F,$43,$4B,$20,$4E,$27 ; $80FFB7
    db $20,$52,$4F,$4C,$4C,$20,$52,$41,$43,$49,$4E,$47,$20,$20,$30,$00 ; $80FFC7
    db $0A,$00,$01,$71,$00,$AA,$A0,$55,$5F,$00,$00,$00,$00,$BB,$81,$BB ; $80FFD7
    db $81,$BB,$81,$66,$81,$00,$00,$FD,$81,$00,$00,$00,$00,$BB,$81,$00 ; $80FFE7
    db $00,$BB,$81,$66,$81,$00,$80,$FD,$81                             ; $80FFF7
