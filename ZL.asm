if __ZM__ASM__
__ZL__ASM__ equ 1

if cpc_main ;; Amstrad CPC

elseif zx_main ;; Spectrum ZX

elseif main || start || _start ;; General

endif

;; Math
pow
    push hl :: push de
    ex de, hl :: pop hl
pow_while
    cp b :: jp z, pow_done
    add hl, de :: dec a
    jp pow_while
pow_done pop de :: ret

sqrt
sqrt_while
sqrt_done
    ret

endif