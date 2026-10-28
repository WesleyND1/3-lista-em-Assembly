.data
	#Mensagens
	msg1: .asciiz "Insira o salario atual: "
	msg2: .asciiz "O novo salario com 25% de aumento e de: R$"
.text
	main:
	#Entrada de dados
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	#Calculo do novo salario (acresimo de 25%)
	li $t1, 25
	mul $t2, $t0, $t1
	
	li $t3, 100
	div $t4, $t2, $t3
	
	add $s0, $t4, $t0
	
	#Mostra resultado
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	#encerrar programa
	li $v0, 10
	syscall