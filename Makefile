all: raw-asm cleanup-asm fix-asm
all-debug: all debug-asm
all-run: all run-asm

qbe: qbe-asm cleanup-asm fix-asm run-asm

qbe-asm:
	qbe main.il -t rv64 -o build/main

raw-asm:
	riscv64-unknown-linux-gnu-g++ -std=c++20 -fno-exceptions -fverbose-asm -S main.cpp -o build/main -O0 -static

cleanup-asm:
	python cleanup_asm.py

fix-asm:
	python fix_asm.py

run-asm:
	rars.jar rv64 sm smc build/fixed.asm

debug-asm:
	rars.jar build/fixed.asm g
