.data
	#Mensagens
	#Programa para efetuar a troca dos valores dos registradores
	msg1: .asciiz "Digite o primeiro valor: "
	msg2: .asciiz "Digite o segundo valor: "
	msg3: .asciiz "Sequencia antes da troca: "
	space: .asciiz ", "
	msg4: .asciiz "\nO resultado da troca do primeiro para o segundo registrador e: "
.text
	main:
	#Entrada dos dados
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	
	#Exibindo os valores antes de efetuar a troca
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	#Troca dos registradores
	move $s0, $t0
	move $s1, $t1
	
	move $t0, $s1 
	move $t1, $s0
	
	#Exibindo resultado
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	#encerrar programa
	li $v0, 10
	syscall