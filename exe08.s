.data
	# Mensagens
	msg_compra:  .asciiz "Digite o valor da compra (1000 a 9999): R$ "
	msg_parcela: .asciiz "Digite o valor da parcela (100 a 500): R$ "
	msg_erro:    .asciiz "Valor invalido! Tente novamente.\n\n"
	
	# Mensagens de saida
	msg_total:   .asciiz "\nTotal de parcelas a pagar: "
	msg_ultima:  .asciiz "\n(Sendo a ultima parcela no valor de: R$ "
	fecha_par:   .asciiz ")"

.text
main:

# 1. Leitura e validacao do valor da compra (1000, 9999)
ler_compra:
	li $v0, 4
	la $a0, msg_compra
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	blt $t0, 1000, erro_compra
	bgt $t0, 9999, erro_compra
	j ler_parcela

erro_compra:
	li $v0, 4
	la $a0, msg_erro
	syscall
	j ler_compra

# 2. Leitura e validacao da parcela [100, 500]
ler_parcela:
	li $v0, 4
	la $a0, msg_parcela
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	blt $t1, 100, erro_parcela
	bgt $t1, 500, erro_parcela
	j calcular

erro_parcela:
	li $v0, 4
	la $a0, msg_erro
	syscall
	j ler_parcela

# 3. Calculo da quantidade de parcelas
calcular:
	div $t0, $t1             #Compra / Parcela
	mflo $t2
	mfhi $t3                 # $t3 = Resto da ultima parcela
	
	#verifica se sobrou resto (ultima parcela menor)
	beqz $t3, exibir_resultado #se resto == 0, nao precisa somar 1
	
	# Se resto > 0, adiciona +1 parcela
	addi $t2, $t2, 1

# 4. Exibicao dos resultados
exibir_resultado:
	#mostra total de parcelas
	li $v0, 4
	la $a0, msg_total
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	#se houve resto, imprime o valor exato da ultima parcela
	beqz $t3, encerar
	
	li $v0, 4
	la $a0, msg_ultima
	syscall
	
	li $v0, 1
	move $a0, $t3 #imprime o valor da ultima parcela (resto)
	syscall
	
	li $v0, 4
	la $a0, fecha_par
	syscall

encerar:
	li $v0, 10
	syscall