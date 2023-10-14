.text
# Command to instruct 'gcc' to import stdlib 'printf'
.extern printf

# 'gcc' will start at main, not _start
.global main
main:
mov     x0, #13

bl      _fib


mov x1, x0
ldr x0, =string1
bl printf

mov x8, #93
mov x0, #0
svc #0

###     CODE START                      ###
_fib:
stp x29, x30, [sp, -128]!
add x29, sp, 0x0
str x0, [sp, 16]
str x19,[sp, 32]

cmp x0, 1
ble _returnN

sub x0, x0, 2
bl _fib
mov x19, x0

ldr x0, [sp,16]
sub x0, x0, 1
bl _fib
add x0, x0, x19


_returnN:
ldr x19, [sp,32]
ldp x29, x30, [sp], 128
ret



###     STATIC VARIABLE SECTION         ###
.data
# Printf string for printing a single character. %d is a single integer.
.global string1
string1:
        .asciz  "%d\n"

