set date brit
set epoch to 1940
set scoreboard off
set color to G/N

do while .t.

   Clear

   @ 01,01 to 04,40 double
   @ 02,02 say "ESCREVA SEU NOME:           [ENTER] "
   @ 03,02 say "REPETICOES......:"
// VARIAVEIS
   cNome      := space(08)
   nContador  := 1
   nRepeticao := 0
   nColuna    := 0
   nLinha     := 0
   nInicio    := 1
   nFim       := 22
   nTeste     := 1
// GET
   @ 02,19 get cNome      picture "@!"  valid !empty(cNome) color("G/N")
   @ 03,19 get nRepeticao picture "999" valid !empty(nRepeticao) color("G/N")
   read

      if lastkey() == 27
         exit
      endif

   clear

   do while nTeste <= nRepeticao
// if else para mudar de coluna
      @ 22,54 clear to 22,65
         if nContador >= nInicio .and. nContador <= nFim
            nColuna := 02
            nLinha  := nContador
         elseif nContador >= nFim .and. nContador <= (2 * nFim)
            nColuna := 15
            nLinha  := nContador - nFim
         elseif nContador >= 1 + (2 * nFim) .and. nContador <= (3 * nFim)
            nColuna := 28
            nLinha  := nContador - (2 * nFim)
         elseif nContador >= 1 + (3 * nFim).and. nContador <= (4 * nFim)
            nColuna := 41
            nLinha  := nContador - (3 * nFim)
         elseif nContador >= 1 + (4 * nFim) .and. nContador <= (5 * nFim)
            nColuna := 54
            nLinha  := nContador - (4 * nFim)
         elseif nContador = 111
            nContador = 0
            @ 01,01 clear to 23,65
         else
             exit
         endif

      nContador++
      nTeste++
      @ nLinha,nColuna say alltrim(str(nTeste - 1)) + cNome
      Inkey(0.1)

   enddo

Inkey(0)

enddo
