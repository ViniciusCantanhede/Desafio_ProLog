/*
* Amigas na Praia - Problema de Lógica
* Cinco amigas estão lado a lado aproveitando o sol para pegar um bronze
* na praia. Descubra qual protetor cada uma está usando, o picolé que
* cada uma gosta e outras coisas mais.
* São:
*   05 colunas
*   06 linhas
*   21 instruções
* Fonte: https://rachacuca.com.br/logica/problemas/amigas-na-praia/
*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Fatos
%% O que a gente tem de base de dados?

        %MOCHILAS
        biquini(amarelo).
        biquini(azul).
        biquini(branco).
        biquini(verde).
        biquini(vermelho).

        %NOMES
        nome(angela).
        nome(erica).
        nome(jessica).
        nome(marisa).
        nome(paloma).

        %MÊS
        protetor(fps30).
        protetor(fps35).
        protetor(fps40).
        protetor(fps45).
        protetor(fps50).


        %JOGOS
        picole(abacaxi).
        picole(chocolate).
        picole(goiaba).
        picole(maracuja).
        picole(uva).

        %MATÉRIAS
        idade(a20).
        idade(a21).
        idade(a22).
        idade(a23).
        idade(a24).

        %SUCOS
        hobby(cozinhar).
        hobby(dancar).
        hobby(fotografar).
        hobby(pescar).
        hobby(ler).


% Vamos estabelecemos uma regra com a função ALLDIFERENT
% podemos ter apenas um único resultado
% A restrição alldifferent garante que as variáveis ​​na lista devem
% ter valores diferentes

alldifferent([]).%define uma lista vazia (nenhum membro)
alldifferent([Elemento|Lista]):-
      not(member(Elemento,Lista)),% retorna TRUE se o elemento NÃO for membro da lista
      alldifferent(Lista).


% Qual o modelo que a gente quer chegar?
modelo([
        (Biquini_1, Nome_1, Protetor_1, Picole_1, Idade_1, Hobby_1),
        (Biquini_2, Nome_2, Protetor_2, Picole_2, Idade_2, Hobby_2),
        (Biquini_3, Nome_3, Protetor_3, Picole_3, Idade_3, Hobby_3),
        (Biquini_4, Nome_4, Protetor_4, Picole_4, Idade_4, Hobby_4),
        (Biquini_5, Nome_5, Protetor_5, Picole_5, Idade_5, Hobby_5)
       ]) :-

% Vamos analisar cada uma das instruções do problema,
% sem seguir uma ordem pré-definida

%%%%%%%%%%%%%%%%%%%%%%%% Picole
picole(Picole_1),
picole(Picole_2),
picole(Picole_3),
picole(Picole_4),
picole(Picole_5),

%1) Na terceira posição está a amiga que gosta de picolé de Chocolate
(Picole_3==chocolate),

%6) A amiga que gosta de picolé de Uva está exatamente à esquerda da
% mulher que gosta de picolé de Abacaxi.
(
(Picole_1==uva, Picole_2==abacaxi);
(Picole_2==uva, Picole_3==abacaxi);
(Picole_3==uva, Picole_4==abacaxi);
(Picole_4==uva, Picole_5==abacaxi)
),

alldifferent([Picole_1, Picole_2, Picole_3, Picole_4, Picole_5]),

%%%%%%%%%%%%%%%%%%%%%%%% Hobby
hobby(Hobby_1),
hobby(Hobby_2),
hobby(Hobby_3),
hobby(Hobby_4),
hobby(Hobby_5),

%14) Na segunda posição está a amiga que gosta de Ler.
(Hobby_2==ler),

%11) Em uma das pontas está a amiga que gosta de Fotografar.
(Hobby_1==fotografar; Hobby_5==fotografar),

alldifferent([Hobby_1, Hobby_2, Hobby_3, Hobby_4, Hobby_5]),

%%%%%%%%%%%%%%%%%%%%%%%% Idade
idade(Idade_1),
idade(Idade_2),
idade(Idade_3),
idade(Idade_4),
idade(Idade_5),


%15) A mulher de 22 anos está na terceira posição.
(Idade_3==a22),

alldifferent([Idade_1, Idade_2, Idade_3, Idade_4, Idade_5]),

%%%%%%%%%%%%%%%%%%%%%%%% Protetor
protetor(Protetor_1),
protetor(Protetor_2),
protetor(Protetor_3),
protetor(Protetor_4),
protetor(Protetor_5),


% 18) Quem está usando protetor de fator 35 está ao lado de quem está
% usando protetor de fator 50.
(
(Protetor_1==fps50, Protetor_2==fps35);
(Protetor_2==fps50, (Protetor_1==fps35; Protetor_3==fps35));
(Protetor_3==fps50, (Protetor_2==fps35; Protetor_4==fps35));
(Protetor_4==fps50, (Protetor_3==fps35; Protetor_5==fps35));
(Protetor_5==fps50, Protetor_4==fps35)
),

alldifferent([Protetor_1, Protetor_2, Protetor_3, Protetor_4, Protetor_5]),

% 2) Quem gosta de Dançar está ao lado de quem está usando protetor
% solar de fator 35.
(
(Hobby_1==dancar, Protetor_2==fps35);
(Hobby_2==dancar, (Protetor_1==fps35; Protetor_3==fps35));
(Hobby_3==dancar, (Protetor_2==fps35; Protetor_4==fps35));
(Hobby_4==dancar, (Protetor_3==fps35; Protetor_5==fps35));
(Hobby_5==dancar, Protetor_4==fps35)
),

biquini(Biquini_1),
biquini(Biquini_2),
biquini(Biquini_3),
biquini(Biquini_4),
biquini(Biquini_5),

alldifferent([Biquini_1, Biquini_2, Biquini_3, Biquini_4, Biquini_5]),


% 3) mulher de biquíni Verde está em algum lugar à esquerda da mulher
% mais nova.
(
(Idade_5==a20, (Biquini_4==verde; Biquini_3==verde; Biquini_2==verde ; Biquini_1==verde));
(Idade_4==a20, (Biquini_3==verde; Biquini_2==verde; Biquini_1==verde));
(Idade_3==a20, (Biquini_2==verde; Biquini_1==verde));
(Idade_2==a20, Biquini_1==verde)
),

%4) A amiga de biquíni Amarelo gosta de picolé de Maracujá.
(
(Biquini_1==amarelo, Picole_1==maracuja);
(Biquini_2==amarelo, Picole_2==maracuja);
(Biquini_3==amarelo, Picole_3==maracuja);
(Biquini_4==amarelo, Picole_4==maracuja);
(Biquini_5==amarelo, Picole_5==maracuja)
),

%5) A mulher que gosta de Fotografar está ao lado de quem está usando
% protetor de fator 35.
(
(Hobby_1==fotografar, Protetor_2==fps35);
(Hobby_2==fotografar, (Protetor_1==fps35; Protetor_3==fps35));
(Hobby_3==fotografar, (Protetor_2==fps35; Protetor_4==fps35));
(Hobby_4==fotografar, (Protetor_3==fps35; Protetor_5==fps35));
(Hobby_5==fotografar, Protetor_4==fps35)
),

%8) Quem está usando o protetor de fator 35 gosta de Pescar.
(
(Protetor_1==fps35, Hobby_1==pescar);
(Protetor_2==fps35, Hobby_2==pescar);
(Protetor_3==fps35, Hobby_3==pescar);
(Protetor_4==fps35, Hobby_4==pescar);
(Protetor_5==fps35, Hobby_5==pescar)
),

nome(Nome_1),
nome(Nome_2),
nome(Nome_3),
nome(Nome_4),
nome(Nome_5),

alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),

%9) Marisa está ao lado de quem está usando o protetor de fator 45.
(
(Nome_1==marisa, Protetor_2==fps45);
(Nome_2==marisa, (Protetor_1==fps45; Protetor_3==fps45));
(Nome_3==marisa, (Protetor_2==fps45; Protetor_4==fps45));
(Nome_4==marisa, (Protetor_3==fps45; Protetor_5==fps45));
(Nome_5==marisa, Protetor_4==fps45)
),

%10) A mulher de biquíni Vermelho gosta de picolé de Abacaxi.
(
(Biquini_1==vermelho, Picole_1==abacaxi);
(Biquini_2==vermelho, Picole_2==abacaxi);
(Biquini_3==vermelho, Picole_3==abacaxi);
(Biquini_4==vermelho, Picole_4==abacaxi);
(Biquini_5==vermelho, Picole_5==abacaxi)
),

% 13) Quem está usando o protetor de fator 45 está exatamente à esquerda
% de quem gosta de picolé de Chocolate.
(
(Picole_2==chocolate, Protetor_1==fps45);
(Picole_3==chocolate, Protetor_2==fps45);
(Picole_4==chocolate, Protetor_3==fps45);
(Picole_5==chocolate, Protetor_4==fps45)
),


%16) Ângela está usando um biquíni Verde.
(
(Biquini_1==verde, Nome_1==angela);
(Biquini_2==verde, Nome_2==angela);
(Biquini_3==verde, Nome_3==angela);
(Biquini_4==verde, Nome_4==angela);
(Biquini_5==verde, Nome_5==angela)
),

% 17) A amiga de 21 anos está em algum lugar à direita da amiga de
% biquíni Branco.
(
(Biquini_5==branco, (Idade_4==a23; Idade_3==a23; Idade_2==a23; Idade_1==a23));
(Biquini_4==branco, (Idade_3==a23; Idade_2==a23; Idade_1==a23));
(Biquini_3==branco, (Idade_2==a23; Idade_1==a23));
(Biquini_2==branco, Idade_1==a23)
),

%19) Érica está ao lado da amiga que gosta de Dançar.
(
(Nome_1==erica, Hobby_2==dancar);
(Nome_2==erica, (Hobby_1==dancar; Hobby_3==dancar));
(Nome_3==erica, (Hobby_2==dancar; Hobby_4==dancar));
(Nome_4==erica, (Hobby_3==dancar; Hobby_5==dancar));
(Nome_5==erica, Hobby_4==dancar)
),

% 20) A mulher que gosta de picolé de Chocolate está usando protetor de
% fator 40.
(
(Picole_1==chocolate, Protetor_1==fps40);
(Picole_2==chocolate, Protetor_2==fps40);
(Picole_3==chocolate, Protetor_3==fps40);
(Picole_4==chocolate, Protetor_4==fps40);
(Picole_5==chocolate, Protetor_5==fps40)
),

% 21) A mulher mais velha está em algum lugar à esquerda da mulher de
% biquíni Branco.
(
(Biquini_5==branco, (Idade_4==a24 ; Idade_3==a24 ; Idade_2==a24 ; Idade_1==a24));
(Biquini_4==branco, (Idade_3==a24 ; Idade_2==a24 ; Idade_1==a24));
(Biquini_3==branco, (Idade_2==a24 ; Idade_1==a24));
(Biquini_2==branco, Idade_1==a24)
),

% 12) A amiga de biquíni Amarelo está em algum lugar entre a Paloma e a
% amiga que gosta de Dançar, nessa ordem.
(
(Nome_1==paloma,(Biquini_2==amarelo; Biquini_3==amarelo; Biquini_4==amarelo),Hobby_5==dancar);
(Nome_1==paloma,(Biquini_2==amarelo; Biquini_3==amarelo),Hobby_4==dancar);
(Nome_1==paloma,(Biquini_2==amarelo),Hobby_3==dancar);
(Nome_2==paloma,(Biquini_3==amarelo; Biquini_4==amarelo),Hobby_5==dancar);
(Nome_2==paloma,(Biquini_3==amarelo),Hobby_4==dancar);
(Nome_3==paloma,(Biquini_4==amarelo),Hobby_5==dancar)
),

% 7) A mulher de biquíni Amarelo está em algum lugar entre a mulher de
% 23 anos e e a mulher que gosta de Fotografar, nessa ordem.
(
(Idade_1==a23,(Biquini_2==amarelo; Biquini_3==amarelo; Biquini_4==amarelo),Hobby_5==fotografar);
(Idade_1==a23,(Biquini_2==amarelo; Biquini_3==amarelo),Hobby_4==fotografar);
(Idade_1==a23,(Biquini_2==amarelo),Hobby_3==fotografar);
(Idade_2==a23,(Biquini_3==amarelo; Biquini_4==amarelo),Hobby_5==fotografar);
(Idade_2==a23,(Biquini_3==amarelo),Hobby_4==fotografar);
(Idade_3==a23,(Biquini_4==amarelo),Hobby_5==fotografar)
),

nl,%insere uma nova linha (coloca o cursor no início da linha de baixo)
write('CHEGAMOS AO FIM DO MODELO')
.% fechando o modelo

%%%%%%%%%%%%%%%%%%%%%%%% Imprimindo a lista
imprime_lista([]):- write('\n\n FIM do imprime_lista \n').
imprime_lista([H|T]):-
	write('\n......................................\n'),
	write(H), write(' : '),
              imprime_lista(T).

/**********************************************************/
%% main fornece ponto de entrada para scripts
main :-
   %% statistics mostra informações sobre o uso de recursos
   %% Obtém o tempo inicial baseado no Tempo de CPU desde que o thread foi iniciado (em milissegundos).
    statistics(cputime,Tempo_inicial),

    %%chama modelo
    %% lembrando que modelo foi definido como:
    %%  modelo([
    %%     (Biquini_1, Nome_1, Protetor_1, Picole_1, Idade_1, Hobby_1),
    %%     (Biquini_2, Nome_2, Protetor_2, Picole_2, Idade_2, Hobby_2),
    %%     (Biquini_3, Nome_3, Protetor_3, Picole_3, Idade_3, Hobby_3),
    %%     (Biquini_4, Nome_4, Protetor_4, Picole_4, Idade_4, Hobby_4),
    %%     (Biquini_5, Nome_5, Protetor_5, Picole_5, Idade_5, Hobby_5)
    %%  ])

    modelo(  [Coluna1, Coluna2, Coluna3, Coluna4,Coluna5]  ),

    %%chama imprime_lista
    imprime_lista(  [Coluna1, Coluna2, Coluna3, Coluna4, Coluna5]  ),

    %% Obtém o tempo final baseado no Tempo de CPU desde que o thread foi iniciado (em milissegundos).
    statistics(cputime ,Tempo_final),
    Tempo_BUSCA is Tempo_final - Tempo_inicial,

    %%define o formato do tempo na saída
    format('\n Tempo inicial: ~f \t Tempo final: ~f  msec', [Tempo_inicial, Tempo_final]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA),
    fail.
main :-

    nl,
    write('xxxx AQUI SOH PODE VIR UMA RESPOSTA ....'),
    nl,
    write('........ UFA apos o fail .......').











