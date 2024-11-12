ifndef __ZM__ASM__
__ZM__ASM__ equ 1

macro mov dir, val
  ld {dir}, {val}
mend

macro lda dir, val

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

endif
