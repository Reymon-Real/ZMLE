if __ZM__ASM__
__ZM__ASM__ equ 1


;; Macros for Z80

;; LDA = LEA
macro lda dir, val
  lea {dir}, val
mend

;; Macros for compatibility with RISC-V
macro addi dir, val_1, val_2
  if {val_1} == 0
    ld {dir}, {val_2}
  elseif {val_1} == 0 && {val_2} == 0
    ld {dir}, 0
  else
    push a
    ld a, {val_1}
    add a, {val_2}
    ld {dir}, a
    pop a
  endif
mend

;; Macros for compatibility with x86
macro mov dir, val
  ld {dir}, {val}
mend

macro lea dir, val

  if {dir} == sp
    ld sp, {val}
  elseif {dir} == hl
    ld hl, {val}
  elseif {dir} == bc
    ld bc, {val}
  elseif {dir} == de
    ld de, {val}
  elseif {dir} == ix
    ld ix, {val}
  elseif {dir} == iy
    ld iy, {val}
  endif

mend

;; Macros for print pixels
macro set_print_pixel pixels, dir, color
  if {pixels} == 4
    ld a, {color}
    ld ({dir}), a
  elseif {pixels} == 8
    ld hl, {color}
    ld ({dir}), hl
  endif
mend

endif
