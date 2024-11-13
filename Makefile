RASMFLAGS := -Iinclude -twe -utf8 -xr -fq -cprquiet -void -mml -map -sw

ifeq ($(OS),Windows_NT)
RASM := lib/windows/rasm.exe
DELETE := del /f /q bin

else ifeq ($(shell uname -s),Linux)
RASM := lib/linux/rasm
DELETE := rm -f bin/*.bin

else ifeq ($(shell uname -s),Darwin)
RASM := lib/mac/rasm
DELETE := rm -f bin/*.bin

else
error:
	echo "Don't Support"
	
endif

bin/ZMLE.bin: src/ZMLE.asm include/ZM.asm include/ZL.asm include/ZE.asm
	$(RASM) $(RASMFLAGS) $< -oc $@

.PHONY: clean

clean:
	$(DELETE)