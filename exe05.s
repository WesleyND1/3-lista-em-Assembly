.data
	#mensagens
	msg1: .asciiz "Digite o coeficiente A: "
	msg2: .asciiz "Digite o coeficiente B: "
	msg3: .asciiz "Digite o coeficiente C: "
	
	result1: .asciiz "\nDUAS RAIZES REAIS"
	result2: .asciiz "\nUMA RAIZ REAL"
	result3: .asciiz "NAO EXISTEM RAIZES REAIS"
.text
	main:
	#1. Receber os coeficientes (A, B e C)
	# Valor de A
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	#Valor do coeficiente B
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Valor do coeficiente C
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	#2. Calculo do Delta (Delta = b^^ - 4*a*c)
	mul $t3, $t1, $t1 #B ao quadrado
	
	li $t4, 4
	mul $t5, $t4, $t0
	mul $t5, $t5, $t2
	
	sub $t6, $t3, $t5
	
	#3. Estrutura de decisao
	#SE Delta maior que Zero
	bgtz $t6, maior_que_zero
	
	#SE Delta igual a Zero
	beq $t6, $zero, igual_zero
	
	#SE Delta menor que Zero
menor_que_zero:
	li $v0, 4
	la $a0, result3
	syscall
	j continua
	
maior_que_zero:
		li $v0, 4
		la $a0, result1
		syscall
		
		j continua
igual_zero:
		li $v0, 4
		la $a0, result2
		syscall
		
		j continua

continua:
	#fim do programa
	li $v0, 10
	syscall