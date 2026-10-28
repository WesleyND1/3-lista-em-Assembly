.data
	#Mensagens
	msg1: .asciiz "Digite um numero: "
	msg2: .asciiz "Insira o segundo numero: "
	
	space: .asciiz ", "
	
	result1: .asciiz "Os valores digitados sao iguais: "
	result2: .asciiz "Os valores digitados sao diferentes: "
	
.text
	main:
	#1. Entrada de dados
	#primeiro numero
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	#segundo numero
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	#2. verificar se sao iguais ou diferentes
	beq $t0, $t1, iguais
	
	
	#se caso numeros diferente
	move $t2, $t1 #menor
	move $t3, $t0 #maior
	
	bgt $t1, $t0, t1_maior
	j diferente

t1_maior:
	move $t2, $t0 #menor
	move $t3, $t1 #maior
	
diferente:
	#mostra resultado
	li $v0, 4
	la $a0, result2
	syscall
	
	#imprime maior
	li $v0, 1
	move $a0, $t3
	syscall
	
	#imprime espaco
	li $v0, 4
	la $a0, space
	syscall
	
	#imprime menor
	li $v0, 1
	move $a0, $t2
	syscall
	
	j continua
	
iguais:
	li $v0, 4
	la $a0, result1
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	j continua

continua:
	#encerra programa
	li $v0, 10
	syscall