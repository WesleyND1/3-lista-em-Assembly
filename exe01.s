.data
	#Mensagens
	msg1: .asciiz "Convesao de Real para Dolar\n"
	msg2: .asciiz "Digite um valor em real (R$): "
	result: .asciiz "O valor em Dolar e: "

.text
	main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	#1. Entrada de dados
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	#2. Conversao para Dolar (USD: R$5)
	li $t2, 5
	div $t1, $t0, $t2
	
	#3. Exibir resultado
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	#encerrar programa
	li $v0, 10
	syscall
