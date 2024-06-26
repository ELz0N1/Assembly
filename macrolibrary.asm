.macro syscall %n
  li a7, %n
  ecall
.end_macro

.macro exit %ecode
  li a0, %ecode
  syscall 93
.end_macro

.macro error %str
.data
str: .asciz %str
.text
  la a0, str
  syscall 4
  exit 1
.end_macro

.macro push %r
  addi sp, sp, -4
  sw %r, 0(sp)
.end_macro

.macro pop %r
  lw %r, 0(sp)
  addi sp, sp, 4
.end_macro

.macro push2 %r1, %r2
  addi sp, sp, -8
  sw %r1, 0(sp)
  sw %r2, 4(sp)
.end_macro

.macro pop2 %r1, %r2
  lw %r1, 0(sp)
  lw %r2, 4(sp)
  addi sp, sp, 8
.end_macro

.macro push3 %r1, %r2, %r3
  addi sp, sp, -12
  sw %r1, 0(sp)
  sw %r2, 4(sp)
  sw %r3, 8(sp)
.end_macro

.macro pop3 %r1, %r2, %r3
  lw %r1, 0(sp)
  lw %r2, 4(sp)
  lw %r3, 8(sp)
  addi sp, sp, 12
.end_macro

.macro swap %r1, %r2
  xor %r1, %r1, %r2
  xor %r2, %r2, %r1
  xor %r1, %r1, %r2
.end_macro

.macro push4 %r1, %r2, %r3, %r4
  addi sp, sp, -16
  sw %r1, 0(sp)
  sw %r2, 4(sp)
  sw %r3, 8(sp)
  sw %r4, 12(sp)
.end_macro

.macro pop4 %r1, %r2, %r3, %r4
  lw %r1, 0(sp)
  lw %r2, 4(sp)
  lw %r3, 8(sp)
  lw %r4, 12(sp)
  addi sp, sp, 16
.end_macro

.macro push5 %r1, %r2, %r3, %r4, %r5
  addi sp, sp, -20
  sw %r1, 0(sp)
  sw %r2, 4(sp)
  sw %r3, 8(sp)
  sw %r4, 12(sp)
  sw %r5, 16(sp)
.end_macro

.macro pop5 %r1, %r2, %r3, %r4, %r5
  lw %r1, 0(sp)
  lw %r2, 4(sp)
  lw %r3, 8(sp)
  lw %r4, 12(sp)
  lw %r5, 16(sp)
  addi sp, sp, 20
.end_macro

.eqv scr t6
.macro bnei %r, %i, %label
  li scr, %i
  bne %r, scr, %label 
.end_macro

.eqv scr t6
.macro beqi %r, %i, %label
  li scr, %i
  beq %r, scr, %label 
.end_macro

.macro readch # result in a0[0:7]
  syscall 12
.end_macro

.macro printch # argument in a0[0:7]
  syscall 11
.end_macro

.macro newline # \n
  li a0, 10
  printch
.end_macro
