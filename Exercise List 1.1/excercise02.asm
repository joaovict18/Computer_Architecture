.data
msg1: .asciiz "Digite um numero inteiro: "
.text
.globl label1
# No interior do main existem algumas chamadas (syscalls) que
# irão alterar o valor do registo $ra o qual contém inicialmente
# endereço de retorno do main. Este necessita de ser guardado.
label1: li $v0, 4 # chamada sistema print_int
li $v0, 4 # chamada sistema print_str
la $a0, msg1 # endereço da string a imprimir
syscall
# obter o inteiro do utilizador
li $v0, 5 # chamada sistema read_int
syscall # coloca o inteiro em $v0
# realizar cálculos com o inteiro
addu $t0, $v0, $0 # mover o número para $t0
sll $t0, $t0, 2 #
# imprimir o resultado
li $v0, 1 # chamada sistema print_int
addu $a0, $t0, $0 # mover o número a imprimir para $a0
syscall
# repôr o endereço de retorno para o $ra e retornar do main
addu $ra, $0, $s0 # endereço de retorno de novo em $31
jr $ra # retornar do main
