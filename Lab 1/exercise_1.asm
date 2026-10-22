# Exercise 1: Hello, <name>!
# MARS 4.5, Default memory configuration. Basic instructions only.
# Up to 127 bytes are read; newline is removed using arithmetic only.
.data 0x10010000
name: .space 128
.data 0x10010100
prompt: .asciiz "Please enter your name: "
.data 0x10010140
greeting: .asciiz "Hello, "
.data 0x10010160
ending: .asciiz "!\n"

.macro remove_newline (%offset)
    lbu   $t0, %offset($s0)
    addiu $t1, $t0, 245
    divu  $t1, $s1
    mflo  $t2
    addiu $t1, $t1, 1
    divu  $t1, $s1
    mflo  $t3
    subu  $t3, $t3, $t2
    subu  $t3, $s2, $t3
    multu $t0, $t3
    mflo  $t0
    sb    $t0, %offset($s0)
.end_macro

.text
.globl main
main:
    lui   $s0, 0x1001
    addiu $a0, $s0, 256
    addiu $v0, $zero, 4
    syscall

    addu  $a0, $s0, $zero
    addiu $a1, $zero, 128
    addiu $v0, $zero, 8
    syscall

    addiu $s1, $zero, 256
    addiu $s2, $zero, 1
    # These macro uses expand into a straight-line instruction sequence.
    remove_newline (0)
    remove_newline (1)
    remove_newline (2)
    remove_newline (3)
    remove_newline (4)
    remove_newline (5)
    remove_newline (6)
    remove_newline (7)
    remove_newline (8)
    remove_newline (9)
    remove_newline (10)
    remove_newline (11)
    remove_newline (12)
    remove_newline (13)
    remove_newline (14)
    remove_newline (15)
    remove_newline (16)
    remove_newline (17)
    remove_newline (18)
    remove_newline (19)
    remove_newline (20)
    remove_newline (21)
    remove_newline (22)
    remove_newline (23)
    remove_newline (24)
    remove_newline (25)
    remove_newline (26)
    remove_newline (27)
    remove_newline (28)
    remove_newline (29)
    remove_newline (30)
    remove_newline (31)
    remove_newline (32)
    remove_newline (33)
    remove_newline (34)
    remove_newline (35)
    remove_newline (36)
    remove_newline (37)
    remove_newline (38)
    remove_newline (39)
    remove_newline (40)
    remove_newline (41)
    remove_newline (42)
    remove_newline (43)
    remove_newline (44)
    remove_newline (45)
    remove_newline (46)
    remove_newline (47)
    remove_newline (48)
    remove_newline (49)
    remove_newline (50)
    remove_newline (51)
    remove_newline (52)
    remove_newline (53)
    remove_newline (54)
    remove_newline (55)
    remove_newline (56)
    remove_newline (57)
    remove_newline (58)
    remove_newline (59)
    remove_newline (60)
    remove_newline (61)
    remove_newline (62)
    remove_newline (63)
    remove_newline (64)
    remove_newline (65)
    remove_newline (66)
    remove_newline (67)
    remove_newline (68)
    remove_newline (69)
    remove_newline (70)
    remove_newline (71)
    remove_newline (72)
    remove_newline (73)
    remove_newline (74)
    remove_newline (75)
    remove_newline (76)
    remove_newline (77)
    remove_newline (78)
    remove_newline (79)
    remove_newline (80)
    remove_newline (81)
    remove_newline (82)
    remove_newline (83)
    remove_newline (84)
    remove_newline (85)
    remove_newline (86)
    remove_newline (87)
    remove_newline (88)
    remove_newline (89)
    remove_newline (90)
    remove_newline (91)
    remove_newline (92)
    remove_newline (93)
    remove_newline (94)
    remove_newline (95)
    remove_newline (96)
    remove_newline (97)
    remove_newline (98)
    remove_newline (99)
    remove_newline (100)
    remove_newline (101)
    remove_newline (102)
    remove_newline (103)
    remove_newline (104)
    remove_newline (105)
    remove_newline (106)
    remove_newline (107)
    remove_newline (108)
    remove_newline (109)
    remove_newline (110)
    remove_newline (111)
    remove_newline (112)
    remove_newline (113)
    remove_newline (114)
    remove_newline (115)
    remove_newline (116)
    remove_newline (117)
    remove_newline (118)
    remove_newline (119)
    remove_newline (120)
    remove_newline (121)
    remove_newline (122)
    remove_newline (123)
    remove_newline (124)
    remove_newline (125)
    remove_newline (126)
    remove_newline (127)

    addiu $a0, $s0, 320
    addiu $v0, $zero, 4
    syscall
    addu  $a0, $s0, $zero
    addiu $v0, $zero, 4
    syscall
    addiu $a0, $s0, 352
    addiu $v0, $zero, 4
    syscall
    addiu $v0, $zero, 10
    syscall
