.data
	#Mensagens
	#Programa calcula idade
	msg1: .asciiz "Digite o mes de nascimento: "
	msg2: .asciiz "Digite o ano de nascimento: "
	msg3: .asciiz "Insira o mes atual: "
	msg4: .asciiz "Insira o ano atual: "
	msg5: .asciiz "\nA idade em meses e: "
.text
	main:
	#1. Entrada de dados
	#Mes de nascimento
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	#Ano de nascimento
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Mes atual
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	#Ano atual
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 5
	syscall
	move $t3, $v0
	
	#2. Calcular idade (Total de meses) = [(Ano Atual} - (Ano Nascimento) * 12 ] + (Mês Atual) - (Mês Nascimento)
	#Mes atual - Mes nascimento
	sub $t6, $t2, $t0
	
	#Ano atual - Ano nascimento
	sub $t4, $t3, $t1
	
	li $t5, 12
	mul $t4, $t4, $t5
	
	add $t7, $t4, $t6
	
	#exibir resultado
	li $v0, 4
	la $a0, msg5
	syscall
	
	li $v0, 1
	move $a0, $t7
	syscall
	
	#encerrar programa
	li $v0, 10
	syscall
