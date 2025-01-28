RASMFLAGS := -Iinclude -twe -utf8 -xr -fq -cprquiet -void -mml -map -sw -D__ZMLE__TEST__=1

SYSTEM := $(shell uname -s)

SOURCE := src/ZMLE.asm include/ZM.asm include/ZL.asm include/ZE.asm

ifeq ($(OS),Windows_NT)

include mak/windows.mak

else ifeq ($(SYSTEM),Linux)

include mak/linux.mak

else ifeq ($(SYSTEM),Darwin)

include mak/macos.mak

else
error:
	echo "Don't Support"
endif

bin/ZMLE.bin: $(SOURCE)
	$(RASM) $(RASMFLAGS) $< -oc $@

.PHONY: clean

clean:
	$(DELETE)
