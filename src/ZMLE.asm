ifdef __ZMLE__TEST__

buildcpr
bank 0

undef __ZMLE__TEST__

endif

ifndef __ZMLE__ASM__
__ZMLE__ASM__ = 1

include "ZE.asm"
include "ZM.asm"
include "ZL.asm"

endif
