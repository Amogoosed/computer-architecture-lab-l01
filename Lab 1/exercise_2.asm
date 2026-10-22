# Exercise 2: read five integers and display the selected element.
# The index is assumed to be in [0, 4], as stated in the exercise.
# MARS 4.5, Default memory configuration. Basic instructions only.
.data 0x10010000
array: .space 20
.data 0x10010100
prompt0: .asciiz "Please input element 0: "
.data 0x10010140
prompt1: .asciiz "Please input element 1: "
.data 0x10010180
prompt2: .asciiz "Please input element 2: "
.data 0x100101c0
prompt3: .asciiz "Please input element 3: "
.data 0x10010200
prompt4: .asciiz "Please input element 4: "
.data 0x10010240
index_prompt: .asciiz "Please enter index: "
.data 0x10010280
newline: .asciiz "\n"

.macro read_element (%prompt_offset, %element_offset)
    addiu $a0, $s0, %prompt_offset
    addiu $v0, $zero, 4
    syscall
    addiu $v0, $zero, 5
    syscall
    sw    $v0, %element_offset($s0)
.end_macro

.text
.globl main
main:
    lui   $s0, 0x1001
    read_element (256, 0)
    read_element (320, 4)
    read_element (384, 8)
    read_element (448, 12)
    read_element (512, 16)

    addiu $a0, $s0, 576
    addiu $v0, $zero, 4
    syscall
    addiu $v0, $zero, 5
    syscall
    addu  $s1, $v0, $zero

    addiu $t0, $zero, 4
    mult  $s1, $t0
    mflo  $t1
    addu  $t1, $s0, $t1
    lw    $a0, 0($t1)
    addiu $v0, $zero, 1
    syscall

    addiu $a0, $s0, 640
    addiu $v0, $zero, 4
    syscall
    addiu $v0, $zero, 10
    syscall
