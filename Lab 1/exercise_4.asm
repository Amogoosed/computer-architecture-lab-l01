# Exercise 4: display exactly four binary digits for 1 <= n <= 15.
# MARS 4.5, Default memory configuration. Basic instructions only.
.data 0x10010000
prompt: .asciiz "Please enter a positive integer less than 16: "
.data 0x10010040
result_text: .asciiz "Its binary form is: "
.data 0x10010060
newline: .asciiz "\n"

.macro print_digit (%value)
    addu  $a0, %value, $zero
    addiu $v0, $zero, 1
    syscall
.end_macro

.text
.globl main
main:
    lui   $s7, 0x1001
    addu  $a0, $s7, $zero
    addiu $v0, $zero, 4
    syscall
    addiu $v0, $zero, 5
    syscall
    addu  $s0, $v0, $zero

    addiu $a0, $s7, 64
    addiu $v0, $zero, 4
    syscall

    addiu $t1, $zero, 8
    div   $s0, $t1
    mflo  $t0
    mfhi  $s0
    print_digit ($t0)

    addiu $t1, $zero, 4
    div   $s0, $t1
    mflo  $t0
    mfhi  $s0
    print_digit ($t0)

    addiu $t1, $zero, 2
    div   $s0, $t1
    mflo  $t0
    mfhi  $s0
    print_digit ($t0)
    print_digit ($s0)

    addiu $a0, $s7, 96
    addiu $v0, $zero, 4
    syscall
    addiu $v0, $zero, 10
    syscall
