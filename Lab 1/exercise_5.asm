# Exercise 5: print a fixed ten-element array in reverse order.
# MARS 4.5, Default memory configuration. Basic instructions only.
.data 0x10010000
array: .word 1, 2, 5, 8, 12, 44, 3, 9, 0, 10
.data 0x10010040
separator: .asciiz ", "
.data 0x10010050
newline: .asciiz "\n"

.macro print_element (%offset)
    lw    $a0, %offset($s0)
    addiu $v0, $zero, 1
    syscall
.end_macro

.macro print_separator
    addiu $a0, $s0, 64
    addiu $v0, $zero, 4
    syscall
.end_macro

.text
.globl main
main:
    lui   $s0, 0x1001
    print_element (36)
    print_separator
    print_element (32)
    print_separator
    print_element (28)
    print_separator
    print_element (24)
    print_separator
    print_element (20)
    print_separator
    print_element (16)
    print_separator
    print_element (12)
    print_separator
    print_element (8)
    print_separator
    print_element (4)
    print_separator
    print_element (0)
    addiu $a0, $s0, 80
    addiu $v0, $zero, 4
    syscall
    addiu $v0, $zero, 10
    syscall
