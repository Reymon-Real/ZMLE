if __ZC__ASM__
__ZC__ASM__ equ 1

;; Amstrad CPC
CPC_COLOR_DARK_BLUE equ #00
CPC_COLOR_LIGHT_BLUE equ #01
CPC_COLOR_YELLOW equ #02
CPC_COLOR_RED equ #03

CPC_START_CRTC equ #C000
CPC_END_CRTC equ #FFFF

;; Spectrum ZX

;; Portable macros
macro CRTC_PRINT_PIXEL dir, val
    if {val} <= 255
        ld a, {val}
        ld {dir}, a
    elseif {val} > 255
        ld hl, {val}
        ld {dir}, hl
    endif
mend

;; CRTC configuration

;; Equats for config CRTC
CRTC_INDEX equ #b4
CRTC_DATA equ #b5

;; Equats for registers from CRTC
CRTC_REG_Z      equ #00
CRTC_REG_I      equ #01
CRTC_REG_II     equ #02
CRTC_REG_III    equ #03
CRTC_REG_IV     equ #04
CRTC_REG_V      equ #05
CRTC_REG_VI     equ #06
CRTC_REG_VII    equ #07
CRTC_REG_VIII   equ #08
CRTC_REG_IX     equ #09
CRTC_REG_X      equ #0A
CRTC_REG_XI     equ #0B
CRTC_REG_XII    equ #0C
CRTC_REG_XIII   equ #0D
CRTC_REG_XIV    equ #0E
CRTC_REG_XV     equ #0F
CRTC_REG_XVI    equ #10
CRTC_REG_XVII   equ #11

;; Equats for standar config from CRTC
CRTC_STD_CONFIG_REG_Z       equ 63
CRTC_STD_CONFIG_REG_II      equ 40
CRTC_STD_CONFIG_REG_II      equ 46
CRTC_STD_CONFIG_REG_III     equ (128 +  14)
CRTC_STD_CONFIG_REG_IV      equ 38
CRTC_STD_CONFIG_REG_V       equ 00
CRTC_STD_CONFIG_REG_VI      equ 25
CRTC_STD_CONFIG_REG_VII     equ 30
CRTC_STD_CONFIG_REG_VIII    equ 00
CRTC_STD_CONFIG_REG_IX      equ 07
CRTC_STD_CONFIG_REG_X       equ 00
CRTC_STD_CONFIG_REG_XI      equ 00
CRTC_STD_CONFIG_REG_XII     equ 48
CRTC_STD_CONFIG_REG_XIII    equ 00
CRTC_STD_CONFIG_REG_XIV     equ 00
CRTC_STD_CONFIG_REG_XV      equ 00
CRTC_STD_CONFIG_REG_XVI     equ 00
CRTC_STD_CONFIG_REG_XVII    equ 00

;; Label for config CRTC
CRTC_SET_VALUE
    out (CRTC_INDEX), a
    ld a, b
    out (CRTC_DATA), a

;; Macro for config CRTC with CRTC_SET_VALUE
macro CRTC_CONFIG register, value
    ld a, {register}
    ld b, {value}
    call CRTC_SET_VALUE
mend

;; Macro for config CRTC without CRTC_SET_VALUE
macro CRTC_SET_REG register, value
    ld a, {register}
    out (CRTC_INDEX), a
    ld a, {value}
    out (CRTC_DATA), a
mend

endif