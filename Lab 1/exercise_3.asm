# Exercise 3: F = (a + 10)(b - d)(c - 2a) / (a + b + c).
# Print the signed integer quotient and remainder.
# Assume denominator != 0 and intermediate values fit signed 32 bits.
# MARS 4.5, Default memory configuration. Basic instructions only.
.data 0x10010000
prompt_a: .asciiz "Insert a: "
.data 0x10010040
prompt_b: .asciiz "Insert b: "
.data 0x10010080
prompt_c: .asciiz "Insert c: "
.data 0x100100c0
prompt_d: .asciiz "Insert d: "
.data 0x10010100
result_text: .asciiz "F = "
.data 0x10010120
remainder_text: .asciiz ", remainder "
.data 0x10010140
newline: .asciiz "\n"

.macro read_value (%prompt_offset, %dest)
    addiu $a0, $s7, %prompt_offset
    addiu $v0, $zero, 4
    syscall
    addiu $v0, $zero, 5
    syscall
    addu  %dest, $v0, $zero
.end_macro

.text
.globl main
main:
    lui   $s7, 0x1001
    read_value (0, $s0)
    read_value (64, $s1)
    read_value (128, $s2)
    read_value (192, $s3)

    addiu $t0, $s0, 10
    subu  $t1, $s1, $s3
    addu  $t2, $s0, $s0
    subu  $t2, $s2, $t2
    mult  $t0, $t1
    mflo  $t3
    mult  $t3, $t2
    mflo  $t3
    addu  $t4, $s0, $s1
    addu  $t4, $t4, $s2
    div   $t3, $t4
    mflo  $s4
    mfhi  $s5

    addiu $a0, $s7, 256
    addiu $v0, $zero, 4
    syscall
    addu  $a0, $s4, $zero
    addiu $v0, $zero, 1
    syscall
    addiu $a0, $s7, 288
    addiu $v0, $zero, 4
    syscall
    addu  $a0, $s5, $zero
    addiu $v0, $zero, 1
    syscall
    addiu $a0, $s7, 320
    addiu $v0, $zero, 4
    syscall
    addiu $v0, $zero, 10
    syscall
