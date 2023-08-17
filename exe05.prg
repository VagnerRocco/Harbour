// DESAFIO DA TROCA DE NUMEROS

clear

@ 01,01 to 03,60 double // titulo
@ 04,01 to 06,60 double // explicacao
@ 07,01 to 17,60 double // corpo

nVariavelA := 0
nVariavelB := 0

@ 02,02 say padc("TROCA DE VARIAVEIS",58)
@ 05,02 say padc("A variavel A vai receber o valor da variavel B",58)
@ 08,02 say "Digite o valor da var A: "
@ 09,02 say "Digite o valor da var B: "
@ 10,02 say "* * * CONFIRMANDO OS DADOS * * *"
@ 13,02 say "* * * VALORES TROCADOS * * *"

@ 08,26 get nVariavelA picture "99"
@ 09,26 get nVariavelB picture "99"
read

@ 11,02 say "A variavel A vale......: " + str(nVariavelA)
@ 12,02 say "A variavel B vale......: " + str(nVariavelB)

nVariavelC := nVariavelA
nVariavelA := nVariavelB
nVariavelB := nVariavelC

@ 14,02 say "A variavel A agora vale: " + str(nVariavelA)
@ 15,02 say "A variavel B agora vale: " + str(nVariavelB)

Inkey(0)
