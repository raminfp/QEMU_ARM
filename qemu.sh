#!/usr/bin/bash
## tested : Ubuntu 16.10
## Author : Ramin Farajpour Cami

## install QEMU
apt-get install qemu
apt-get install qemu-kvm


## Compilation
arm-none-eabi-as -mcpu=arm926ej-s -g startup.s -o startup.o
arm-none-eabi-gcc -c -mcpu=arm926ej-s -g test.c -o test.o
arm-none-eabi-ld -T test.ld test.o startup.o -o test.elf
arm-none-eabi-objcopy -O binary test.elf test.bin

qemu-system-arm -M versatilepb -m 128M -nographic -kernel test.bin

## for TCP connection GDB
#qemu-system-arm -M versatilepb -m 128M -nographic -s -S -kernel test.bin
