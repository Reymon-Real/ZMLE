;; CRTC Amstrad CPC

;; CRTC ZX Spectrum

;; CRTC configuration

;; Label for config CRTC
module CRTC_SET_VALUE
    out (CRTC_INDEX), a
    ld a, b
    out (CRTC_DATA), a

;; Math
module pow
    push hl
    ex de, hl
    pop hl
loop
    cp b
    jp z, done
    add hl, de
    jp c, done
    dec a
    jp loop
done
    ret

module sqrt
    ld a, h
    or l
    jp po, done
    ld bc, hl
    inc bc
    ld de, bc
loop
    ld a, b
    cp d
    jp c, done
    ld bc, de
    push hl
    add hl, bc
    ex de, hl
    pop hl
    jp loop
done
    ret