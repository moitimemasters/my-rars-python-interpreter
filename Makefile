all: raw-asm cleanup-asm fix-asm
all-debug: all debug-asm
all-run: all run-asm

raw-asm:
	riscv64-unknown-linux-gnu-g++ -std=c++20 -fverbose-asm -S main.cpp -o main -Os

cleanup-asm:
	python cleanup_asm.py

fix-asm:
	python fix_asm.py

run-asm:
	rars.jar rv64 sm smc fixed.asm

debug-asm:
	rars.jar fixed.asm g