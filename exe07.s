.data
	#Mensagens
	msg_input:  .asciiz "Digite um numero entre 100 e 999: "
	msg_erro:   .asciiz "\nNumero invalido! Tente novamente.\n"
	
	msg_cent:   .asciiz "CENTENA = "
	msg_dez:    .asciiz "\nDEZENA = "
	msg_und:    .asciiz "\nUNIDADE = "

.text
main:
ler_numero:
	# 1. Entrada do usuario
	li $v0, 4
	la $a0, msg_input
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0

	# 2. verificar se esta fora do intervalo [100, 999]
	blt $t0, 100, invalido   #Se < 100, vai para invalido
	bgt $t0, 999, invalido   #se > 999, vai para invalido
	
	# Se passou nos testes, segue para a decomposicao
	j decompor

invalido:
	li $v0, 4
	la $a0, msg_erro
	syscall
	j ler_numero #pede a entrada novamente

decompor:
	# 3. Calculo da centena e o resto
	li $t1, 100
	div $t0, $t1
	mfhi $t3 # $t3 = Resto (Dezena + Unidade)
	
	# 4. Calculo da dezena e unidade
	li $t1, 10
	div $t3, $t1
	mflo $t4
	mfhi $t5

	# 5. Exibir os resultados
	#Imprime CENTENA
	li $v0, 4
	la $a0, msg_cent
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	
	#imprime DEZENA
	li $v0, 4
	la $a0, msg_dez
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	
	#Imprime UNIDADE
	li $v0, 4
	la $a0, msg_und
	syscall
	li $v0, 1
	move $a0, $t5
	syscall

	# 6. Encerrar programa
	li $v0, 10
	syscall