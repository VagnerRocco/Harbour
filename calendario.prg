// IDADE E PROXIMO ANIVERSARIO

set date brit
set epoch to 1940
set scoreboard off
set color to G/N

clear
// moldura
@ 01,01 to 03,60 double // titulo
@ 04,01 to 07,60 double // termos fixos tela 01
@ 08,01 to 15,60 double // resultados tela 02
@ 16,01 to 18,60 double // versao

// variaveis tela 01
cNome       := space(20)
dAtual      := Date()
dNascimento := CToD(" ")

// termos fixos tela 01
@ 02,02 say padc("IDADE E PROXIMO ANIVERSARIO",58)
@ 05,02 say "DIGITE SEU NOME......: "
@ 06,02 say "DATA DE NASCIMENTO...:                 DD/MM/AA "
@ 17,32 say "@moonlight syndicate v.A.01"
// get tela 01
@ 05,25 get cNome picture "@!" valid !empty(cNome) color("G/N")
@ 06,25 get dNascimento        valid dNascimento <= dAtual .and. !empty(dNascimento) color("G/N")
read

// variaveis tela 02

   // nascimento
nAno          := Year(dNascimento)
nMonth        := Month(dNascimento)
nDiaMes       := Day(dNascimento)
nDiaSem       := DoW(dNascimento)
   // data atual
nAnoAtual     := Year(dAtual)
nMonthAtual   := Month(dAtual)
nDiaMesAtua   := Day(dAtual)
nDiaSemAtua   := DoW(dAtual)
   // idade
nIdadeAno     := nAnoAtual - nAno
nIdadeMes     := nMonthAtual - nMonth
nIdadeDiaMes  := nDiaMesAtua - nDiaMes
nIdadeDiaSem  := nDiaSemAtua - nDiaSemAtua
   // signo
nCodigoSigno  := 0
nAnoTeste     := 0

// se ainda nao fez aniversario esse ano

   if nIdadeDiaMes < 0
      nIdadeDiaMes += 30
      nIdadeMes--
   endif

   if nIdadeMes < 0
      nIdadeMes += 12
      nIdadeAno--
   endif

// estrutura if MES
   if nMonth = 1
      cMes         := "Janeiro"
      nCodigoSigno := 0
      nCodigoMes   := 31
   elseif nMonth = 2
      cMes         := "Fevereiro"
      nCodigoSigno := 31
      nCodigoMes   := 28
   elseif nMonth = 3
      cMes         := "Marco"
      nCodigoSigno := 59
      nCodigoMes   := 31
   elseif nMonth = 4
      cMes         := "Abril"
      nCodigoSigno := 90
      nCodigoMes   := 30
   elseif nMonth = 5
      cMes         := "Maio"
      nCodigoSigno := 120
      nCodigoMes   := 31
   elseif nMonth = 6
      cMes         := "Junho"
      nCodigoSigno := 151
      nCodigoMes   := 30
   elseif nMonth = 7
      cMes         := "Julho"
      nCodigoSigno := 181
      nCodigoMes   := 31
   elseif nMonth = 8
      cMes         := "Agosto"
      nCodigoSigno := 212
      nCodigoMes   := 31
   elseif nMonth = 9
      cMes         := "Setembro"
      nCodigoSigno := 243
      nCodigoMes   := 30
   elseif nMonth = 10
      cMes         := "Outubro"
      nCodigoSigno := 273
      nCodigoMes   := 31
   elseif nMonth = 11
      cMes         := "Novembro"
      nCodigoSigno := 304
      nCodigoMes   := 30
   else
      cMes         := "Dezembro"
      nCodigoSigno := 334
      nCodigoMes   := 31
   endif

// proximo aniversario - mes
   if nMonth < nMonthAtual
      nAnoTeste := nAnoAtual + 1
   else
      nAnoTeste := nAnoAtual
   endif

// proximo aniversario - variaveis
nProxDia      := nCodigoMes - nIdadeDiaMes
nProxMes      := (12 - nIdadeMes) - 1
nPrimeiroDia  := CTod(transform(Day(dNascimento),'99') + "/" + transform(Month(dNascimento),'99') + str(nAnoTeste))
nProxSem      := Dow(nPrimeiroDia)

// estrutura if else - dia da semana
   if nDiaSem = 1
      cDiaSem  := "Domingo"
   elseif nDiaSem = 2
      cDiaSem  := "Segunda-Feira"
   elseif nDiaSem = 3
      cDiaSem  := "Terca-Feira"
   elseif nDiaSem = 4
      cDiaSem  := "Quarta-Feira"
   elseif nDiaSem = 5
      cDiaSem  := "Quinta-Feira"
   elseif nDiaSem = 6
      cDiaSem  := "Sexta-Feira"
   else
      cDiaSem  := "Sabado"
   endif

// proximo aniversario - dia da semana
   if nProxSem = 1
      cProxSem  := "Domingo"
      nColuna   := 30
   elseif nProxSem = 2
      cProxSem  := "Segunda-Feira"
      nColuna   := 33
   elseif nProxSem = 3
      cProxSem := "Terca-Feira"
      nColuna  := 36
   elseif nProxSem = 4
      cProxSem := "Quarta-Feira"
      nColuna  := 39
   elseif nProxSem = 5
      cProxSem := "Quinta-Feira"
      nColuna  :=  42
   elseif nProxSem = 6
      cProxSem := "Sexta-Feira"
      nColuna  := 45
   else
      cProxSem := "Sabado"
      nColuna  := 48
   endif

// signo - variaveis

nResultSigno  := nCodigoSigno + nDiaMes
cSigno        := space(20)

// signo - if else

   if nResultSigno = 1 .and. nResultSigno <= 20
      cSigno := "Capricornio"
   elseif nResultSigno >= 21 .and. nResultSigno <= 49
      cSigno := "Aquario"
   elseif nResultSigno >= 50 .and. nResultSigno <= 79
      cSigno := "Peixes"
   elseif nResultSigno >= 80 .and. nResultSigno <= 110
      cSigno := "Aries"
   elseif nResultSigno >= 111 .and. nResultSigno <= 140
      cSigno := "Touro"
   elseif nResultSigno >= 141 .and. nResultSigno <= 171
      cSigno := "Gemeos"
   elseif nResultSigno >= 172 .and. nResultSigno <= 203
      cSigno := "Cancer"
   elseif nResultSigno >= 204 .and. nResultSigno <= 234
      cSigno := "Leao"
   elseif nResultSigno >= 235 .and. nResultSigno <= 265
      cSigno := "Virgem"
   elseif nResultSigno >= 266 .and. nResultSigno <= 295
      cSigno := "Libra"
   elseif nResultSigno >= 296 .and. nResultSigno <= 325
      cSigno := "Escorpiao"
   elseif nResultSigno >= 326 .and. nResultSigno <= 355
      cSigno := "Sagitario"
   else
      cSigno := "Capricornio"
   endif

@ 09,02 say "Nascido em .................: " + str(nDiaMes) + " de " + cMes + " de" + str(nAno)
@ 10,02 say "Nascido em uma..............: " + cDiaSem
@ 11,02 say "Idade de....................: " + Alltrim(str(nIdadeAno)) + " anos, " + alltrim(str(nIdadeMes)) + " meses e " + alltrim(str(nIdadeDiaMes)) + " dias"
@ 12,02 say "Signo ......................: " + cSigno
@ 13,02 say "Proximo aniversario em......: " + Alltrim(str(nProxMes)) + " meses e " + alltrim(str(nProxDia)) + " dias"
@ 14,02 say "Proximo aniversario em uma..: " + cProxSem

Inkey(0)
