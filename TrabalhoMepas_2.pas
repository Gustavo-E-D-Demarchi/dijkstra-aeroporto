program pzim;
<<<<<<< HEAD

type
    aInt = array[1..24] of integer;
    aString = array[1..24] of string;
    aBool = array[1..24] of boolean;
    aMatriz = array[1..24, 1..24] of integer;


function Maior(texto: string): string;
var
    i: integer;
begin
    for i := 1 to length(texto) do
        if (texto[i] >= 'a') and (texto[i] <= 'z') then
            texto[i] := chr(ord(texto[i]) - 32);

    Maior := texto;
end;


function encontrarAeoro(aeoro: aString;codigo: string): integer;
var
    i: integer;
begin
    encontrarAeoro := 0;

    codigo := Maior(codigo);

    for i := 1 to 24 do
        if aeoro[i] = codigo then
        begin
            encontrarAeoro := i;
        end;
end;


function encontrarMenorDistancia( Distancia: aInt; Visitado: aBool ): integer;
var
    i: integer;
    menor: integer;
    posicao: integer;
begin
    menor := 9999999;
    posicao := 0;

    for i := 1 to 24 do
        if (not Visitado[i]) and (Distancia[i] < menor) then
        begin
            menor := Distancia[i];
            posicao := i;
        end;

    encontrarMenorDistancia := posicao;
end;


procedure iniciaAeorporto(var aeoro: aString);
begin
    aeoro[1] := 'SFS';
    aeoro[2] := 'SCCR';
    aeoro[3] := 'DC';
    aeoro[4] := 'SCPI';
    aeoro[5] := 'SMO';
    aeoro[6] := 'SCIA';
    aeoro[7] := 'CP';
    aeoro[8] := 'SCFA';
    aeoro[9] := 'SJ';
    aeoro[10] := 'SCJG';
    aeoro[11] := 'SCLS';
    aeoro[12] := 'SCCO';
    aeoro[13] := 'SCXE';
    aeoro[14] := 'SCJA';
    aeoro[15] := 'SCCS';
    aeoro[16] := 'SCVA';
    aeoro[17] := 'SCLON';
    aeoro[18] := 'SCCA';
    aeoro[19] := 'TB';
    aeoro[20] := 'SCBU';
    aeoro[21] := 'RN';
    aeoro[22] := 'SCFS';
    aeoro[23] := 'SCJE';
    aeoro[24] := 'SCNS';
end;


procedure iniciaMatriz(var matriz: aMatriz);
var
    i, j: integer;
begin

    for i := 1 to 24 do
        for j := 1 to 24 do
            matriz[i,j] := 0;


    { SFS }

    matriz[1,2] := 5;
    matriz[2,1] := 5;

    matriz[1,20] := 19;
    matriz[20,1] := 19;

    matriz[1,21] := 11;
    matriz[21,1] := 11;

    matriz[1,22] := 5;
    matriz[22,1] := 5;


    { SCCR }

    matriz[2,3] := 10;
    matriz[3,2] := 10;

    matriz[2,6] := 14;
    matriz[6,2] := 14;

    matriz[2,20] := 9;
    matriz[20,2] := 9;


    { DC }

    matriz[3,4] := 8;
    matriz[4,3] := 8;

    matriz[3,5] := 9;
    matriz[5,3] := 9;


    { SCPI }

    matriz[4,5] := 12;
    matriz[5,4] := 12;

    matriz[4,6] := 15;
    matriz[6,4] := 15;


    { SCIA }

    matriz[6,8] := 20;
    matriz[8,6] := 20;

    matriz[6,16] := 2;
    matriz[16,6] := 2;


    { CP }

    matriz[7,8] := 6;
    matriz[8,7] := 6;

    matriz[7,9] := 9;
    matriz[9,7] := 9;

    matriz[7,10] := 11;
    matriz[10,7] := 11;

    matriz[7,11] := 3;
    matriz[11,7] := 3;

    matriz[7,12] := 5;
    matriz[12,7] := 5;


    { SCFA }

    matriz[8,9] := 3;
    matriz[9,8] := 3;

    matriz[8,11] := 8;
    matriz[11,8] := 8;

    { Rota direcionada }

    matriz[8,10] := 5;
    matriz[10,8] := 7;


    { SJ }

    matriz[9,10] := 13;
    matriz[10,9] := 13;

    matriz[9,11] := 7;
    matriz[11,9] := 7;


    { SCJG }

    matriz[10,11] := 2;
    matriz[11,10] := 2;

    matriz[10,12] := 10;
    matriz[12,10] := 10;

    matriz[10,15] := 16;
    matriz[15,10] := 16;


    { SCLS }

    matriz[11,12] := 17;
    matriz[12,11] := 17;

    matriz[11,14] := 4;
    matriz[14,11] := 4;


    { SCCO }

    matriz[12,15] := 6;
    matriz[15,12] := 6;

    matriz[12,16] := 3;
    matriz[16,12] := 3;


    { SCXE }

    matriz[13,16] := 12;
    matriz[16,13] := 12;


    { SCJA }

    matriz[14,16] := 3;
    matriz[16,14] := 3;


    { SCCS }

    matriz[15,16] := 1;
    matriz[16,15] := 1;


    { SCVA }

    matriz[16,17] := 5;
    matriz[17,16] := 5;

    matriz[16,18] := 4;
    matriz[18,16] := 4;

    matriz[16,19] := 8;
    matriz[19,16] := 8;

    matriz[16,20] := 16;
    matriz[20,16] := 16;

    matriz[16,21] := 13;
    matriz[21,16] := 13;


    { SCBU }

    matriz[20,21] := 6;
    matriz[21,20] := 6;

    matriz[20,22] := 7;
    matriz[22,20] := 7;


    { RN }

    matriz[21,22] := 2;
    matriz[22,21] := 2;


    { SCFS }

    matriz[22,23] := 3;
    matriz[23,22] := 3;

    matriz[22,24] := 10;
    matriz[24,22] := 10;

end;


procedure iniciaDijkstra(origem: integer;var Distancia: aInt;var Anterior: aInt;var Visitado: aBool);
var
    i: integer;
begin
    for i := 1 to 24 do
    begin
        Distancia[i] := 9999999;
        Anterior[i] := 0;
        Visitado[i] := false;
    end;

    Distancia[origem] := 0;
end;


procedure Dijkstra(Matriz: aMatriz;var Distancia: aInt;var Anterior: aInt;var Visitado: aBool;var OrdemPesquisa: aInt);
var
    atual: integer;
    i, vizinho: integer;
    novaDistancia: integer;
    quantidade: integer;
begin

    quantidade := 0;

    for i := 1 to 24 do
    begin
        atual := encontrarMenorDistancia(Distancia, Visitado);

        if atual <> 0 then
        begin
            quantidade := quantidade + 1;
            OrdemPesquisa[quantidade] := atual;

            Visitado[atual] := true;

            for vizinho := 1 to 24 do
            begin
                if Matriz[atual,vizinho] > 0 then
                begin

                    novaDistancia := Distancia[atual] + Matriz[atual,vizinho];

                    if novaDistancia < Distancia[vizinho] then
                    begin
                        Distancia[vizinho] := novaDistancia;
                        Anterior[vizinho] := atual;
                    end;
                end;
            end;
        end;
    end;
end;


procedure MostrarAeroportos(Aeroportos: aString);
var
    i: integer;
begin
    writeln;
    writeln('===================================');
    writeln('           AEROPORTOS');
    writeln('===================================');

    for i := 1 to 24 do
        writeln(i, ' - ', Aeroportos[i]);

    writeln('===================================');
    writeln;
end;


procedure MostrarCaminho(Aeroportos: aString;Anterior: aInt;origem: integer;destino: integer);
var
    caminho: aInt;
    quantidade: integer;
    atual: integer;
    i: integer;
begin
    quantidade := 0;
    atual := destino;

    while atual <> 0 do
    begin
        quantidade := quantidade + 1;
        caminho[quantidade] := atual;

        if atual = origem then
            atual := 0
        else
            atual := Anterior[atual];
    end;

    for i := quantidade downto 1 do
    begin
        write(Aeroportos[caminho[i]]);

        if i > 1 then
            write(' -> ');
    end;

    writeln;
end;


procedure MostrarPesquisa(Aeroportos: aString; OrdemPesquisa: aInt; V : aBool);
var
    i: integer;
begin
    writeln;
    writeln('Como foi a pesquisa:');

    for i := 1 to 24 do
    begin
        if OrdemPesquisa[i] <> 0 then
        begin
            write(Aeroportos[OrdemPesquisa[i]]);
            if (V[i]) then
                if (i < 24) and (OrdemPesquisa[i + 1] <> 0) then
                    write(' -> ');
        end;
    end;

    writeln;
end;

procedure Verificar(var O, D: integer;Aero: aString
);
var
    origem, destino: string;
begin

    while O = 0 do
    begin
        writeln;
        writeln('Valor de origem invalido!');
        write('Digite novamente o aeroporto de origem: ');
        readln(origem);

        O := encontrarAeoro(Aero, origem);
    end;

    while D = 0 do
    begin
        writeln;
        writeln('Valor de destino invalido!');
        write('Digite novamente o aeroporto de destino: ');
        readln(destino);

        D := encontrarAeoro(Aero, destino);
    end;
end;


procedure MostrarResultado(Aeroportos: aString; Distancia: aInt; Anterior: aInt; OrdemPesquisa: aInt; origem: integer; destino: integer; V :aBool);
begin
    writeln;
    writeln('===================================');
    writeln('             RESULTADO');
    writeln('===================================');

    writeln('Origem: ', Aeroportos[origem]);
    writeln('Destino: ', Aeroportos[destino]);

    writeln;
    writeln('Caminho encontrado:');
    MostrarCaminho(Aeroportos,Anterior,origem,destino);

    writeln;
    writeln('Distancia total: ', Distancia[destino]);

    MostrarPesquisa(Aeroportos,OrdemPesquisa,V);

    writeln('===================================');
    writeln;
end;


procedure MostrarMenu;
begin
    writeln;
    writeln('===================================');
    writeln('       SISTEMA DE AEROPORTOS');
    writeln('===================================');
    writeln('1 - Mostrar aeroportos');
    writeln('2 - Pesquisar rota');
    writeln('0 - Sair');
    writeln('===================================');
    write('Digite uma opcao: ');
end;

procedure MostrarCaminhoPeso(Dist,Ant: aInt; origem, destino: integer; Matriz: aMatriz; Aero :aString; V : aBool);
var
	caminho: aInt;
	atual, qtd, i: integer;
begin
	if Dist[destino] >= 1000 then
		writeln('Nao existe caminho.')
	else
	begin
		qtd := 0;
		atual := destino;

		while atual <> 0 do
		begin
			qtd := qtd + 1;
			caminho[qtd] := atual;

			if (atual = origem) and (V[atual]) then
			begin
                V[atual] = false;
                atual := 0
            end
			else
				atual := Ant[atual];
		end;

		writeln('Caminho percorrido:');
		writeln;

		for i := qtd downto 1 do
		begin
			write(Aero[caminho[i]]);

			if i > 1 then
			begin
				write(' -- ');
				write(Matriz[caminho[i]][caminho[i - 1]]);
				write(' --> ');
			end;
		end;

		writeln;
		writeln('Distancia total: ', Dist[destino]);

        MostrarCaminhoPeso(Dist,Ant,origem,destino,Matriz,Aero,V);
	end;
end;

var
    Distancia: aInt;
    Anterior: aInt;
    OrdemPesquisa: aInt;
    Aeroportos: aString;
    Visitado: aBool;
    Matriz: aMatriz;

    codigoOrigem: string;
    codigoDestino: string;
    op: integer;
    origem: integer;
    destino: integer;
=======

type
    aInt = array[1..24] of integer;
    aString = array[1..24] of string;
    aBool = array[1..24] of boolean;
    aMatriz = array[1..24, 1..24] of integer;


function Maior(texto: string): string;
var
    i: integer;
begin
    for i := 1 to length(texto) do
    begin
        if (texto[i] >= 'a') and (texto[i] <= 'z') then
        begin
            texto[i] := chr(ord(texto[i]) - 32);
        end;
    end;

    Maior := texto;
end;


function encontrarAeoro(
    aeoro: aString;
    codigo: string
): integer;
var
    i: integer;
begin
    encontrarAeoro := 0;

    codigo := Maior(codigo);

    for i := 1 to 24 do
    begin
        if aeoro[i] = codigo then
        begin
            encontrarAeoro := i;
        end;
    end;
end;

>>>>>>> dc122c4fd18fd2c78c2c247571b0465a5eba4ae2

function encontrarMenorDistancia(
    Distancia: aInt;
    Visitado: aBool
): integer;
var
    i: integer;
    menor: integer;
    posicao: integer;
begin
<<<<<<< HEAD

    iniciaAeorporto(Aeroportos);
    iniciaMatriz(Matriz);

    op := 1;

    while op <> 0 do
    begin
=======
    menor := 9999999;
    posicao := 0;

    for i := 1 to 24 do
    begin
        if (not Visitado[i]) and (Distancia[i] < menor) then
        begin
            menor := Distancia[i];
            posicao := i;
        end;
    end;

    encontrarMenorDistancia := posicao;
end;
>>>>>>> dc122c4fd18fd2c78c2c247571b0465a5eba4ae2

        MostrarMenu;
        readln(op);

<<<<<<< HEAD
		case op of 
			1 : MostrarAeroportos(Aeroportos);
			2 : begin 
				MostrarAeroportos(Aeroportos);

                writeln;
                writeln('===================================');
                writeln('          PESQUISAR ROTA');
                writeln('===================================');

                write('Digite o aeroporto de origem: ');
                readln(codigoOrigem);

                write('Digite o aeroporto do destino: ');
                readln(codigoDestino);

                origem := encontrarAeoro(Aeroportos,codigoOrigem);

                destino := encontrarAeoro(Aeroportos,codigoDestino);

                Verificar(origem,destino,Aeroportos);

                iniciaDijkstra(origem,Distancia,Anterior,Visitado);

                Dijkstra(Matriz,Distancia,Anterior,Visitado,OrdemPesquisa);

                MostrarResultado(Aeroportos,Distancia,Anterior,OrdemPesquisa,origem,destino,Visitado);

                MostrarCaminhoPeso(Distancia,Anterior,origem,destino,Matriz,Aeroportos,Visitado);
            end;

            3 : begin
                    writeln;
                    writeln('Opcao invalida!'); 
=======
procedure iniciaAeorporto(
    var aeoro: aString
);
begin
    aeoro[1] := 'SFS';
    aeoro[2] := 'SCCR';
    aeoro[3] := 'DC';
    aeoro[4] := 'SCPI';
    aeoro[5] := 'SMO';
    aeoro[6] := 'SCIA';
    aeoro[7] := 'CP';
    aeoro[8] := 'SCFA';
    aeoro[9] := 'SJ';
    aeoro[10] := 'SCJG';
    aeoro[11] := 'SCLS';
    aeoro[12] := 'SCCO';
    aeoro[13] := 'SCXE';
    aeoro[14] := 'SCJA';
    aeoro[15] := 'SCCS';
    aeoro[16] := 'SCVA';
    aeoro[17] := 'SCLON';
    aeoro[18] := 'SCCA';
    aeoro[19] := 'TB';
    aeoro[20] := 'SCBU';
    aeoro[21] := 'RN';
    aeoro[22] := 'SCFS';
    aeoro[23] := 'SCJE';
    aeoro[24] := 'SCNS';
end;


procedure iniciaMatriz(
    var matriz: aMatriz
);
var
    i, j: integer;
begin

    for i := 1 to 24 do
    begin
        for j := 1 to 24 do
        begin
            matriz[i,j] := 0;
        end;
    end;


    { SFS }

    matriz[1,2] := 5;
    matriz[2,1] := 5;

    matriz[1,20] := 19;
    matriz[20,1] := 19;

    matriz[1,21] := 11;
    matriz[21,1] := 11;

    matriz[1,22] := 5;
    matriz[22,1] := 5;


    { SCCR }

    matriz[2,3] := 10;
    matriz[3,2] := 10;

    matriz[2,6] := 14;
    matriz[6,2] := 14;

    matriz[2,20] := 9;
    matriz[20,2] := 9;


    { DC }

    matriz[3,4] := 8;
    matriz[4,3] := 8;

    matriz[3,5] := 9;
    matriz[5,3] := 9;


    { SCPI }

    matriz[4,5] := 12;
    matriz[5,4] := 12;

    matriz[4,6] := 15;
    matriz[6,4] := 15;


    { SCIA }

    matriz[6,8] := 20;
    matriz[8,6] := 20;

    matriz[6,16] := 2;
    matriz[16,6] := 2;


    { CP }

    matriz[7,8] := 6;
    matriz[8,7] := 6;

    matriz[7,9] := 9;
    matriz[9,7] := 9;

    matriz[7,10] := 11;
    matriz[10,7] := 11;

    matriz[7,11] := 3;
    matriz[11,7] := 3;

    matriz[7,12] := 5;
    matriz[12,7] := 5;


    { SCFA }

    matriz[8,9] := 3;
    matriz[9,8] := 3;

    matriz[8,11] := 8;
    matriz[11,8] := 8;

    { Rota direcionada }

    matriz[8,10] := 5;
    matriz[10,8] := 7;


    { SJ }

    matriz[9,10] := 13;
    matriz[10,9] := 13;

    matriz[9,11] := 7;
    matriz[11,9] := 7;


    { SCJG }

    matriz[10,11] := 2;
    matriz[11,10] := 2;

    matriz[10,12] := 10;
    matriz[12,10] := 10;

    matriz[10,15] := 16;
    matriz[15,10] := 16;


    { SCLS }

    matriz[11,12] := 17;
    matriz[12,11] := 17;

    matriz[11,14] := 4;
    matriz[14,11] := 4;


    { SCCO }

    matriz[12,15] := 6;
    matriz[15,12] := 6;

    matriz[12,16] := 3;
    matriz[16,12] := 3;


    { SCXE }

    matriz[13,16] := 12;
    matriz[16,13] := 12;


    { SCJA }

    matriz[14,16] := 3;
    matriz[16,14] := 3;


    { SCCS }

    matriz[15,16] := 1;
    matriz[16,15] := 1;


    { SCVA }

    matriz[16,17] := 5;
    matriz[17,16] := 5;

    matriz[16,18] := 4;
    matriz[18,16] := 4;

    matriz[16,19] := 8;
    matriz[19,16] := 8;

    matriz[16,20] := 16;
    matriz[20,16] := 16;

    matriz[16,21] := 13;
    matriz[21,16] := 13;


    { SCBU }

    matriz[20,21] := 6;
    matriz[21,20] := 6;

    matriz[20,22] := 7;
    matriz[22,20] := 7;


    { RN }

    matriz[21,22] := 2;
    matriz[22,21] := 2;


    { SCFS }

    matriz[22,23] := 3;
    matriz[23,22] := 3;

    matriz[22,24] := 10;
    matriz[24,22] := 10;

end;


procedure iniciaDijkstra(
    origem: integer;
    var Distancia: aInt;
    var Anterior: aInt;
    var Visitado: aBool
);
var
    i: integer;
begin
    for i := 1 to 24 do
    begin
        Distancia[i] := 9999999;
        Anterior[i] := 0;
        Visitado[i] := false;
    end;

    Distancia[origem] := 0;
end;


procedure Dijkstra(
    Matriz: aMatriz;
    var Distancia: aInt;
    var Anterior: aInt;
    var Visitado: aBool;
    var OrdemPesquisa: aInt
);
var
    atual: integer;
    i, vizinho: integer;
    novaDistancia: integer;
    quantidade: integer;
begin

    quantidade := 0;

    for i := 1 to 24 do
    begin
        atual := encontrarMenorDistancia(Distancia, Visitado);

        if atual <> 0 then
        begin
            quantidade := quantidade + 1;
            OrdemPesquisa[quantidade] := atual;

            Visitado[atual] := true;

            for vizinho := 1 to 24 do
            begin
                if Matriz[atual,vizinho] > 0 then
                begin
                    novaDistancia :=
                        Distancia[atual] + Matriz[atual,vizinho];

                    if novaDistancia < Distancia[vizinho] then
                    begin
                        Distancia[vizinho] := novaDistancia;
                        Anterior[vizinho] := atual;
                    end;
                end;
            end;
        end;
    end;
end;


procedure MostrarAeroportos(
    Aeroportos: aString
);
var
    i: integer;
begin
    writeln;
    writeln('===================================');
    writeln('           AEROPORTOS');
    writeln('===================================');

    for i := 1 to 24 do
    begin
        writeln(i, ' - ', Aeroportos[i]);
    end;

    writeln('===================================');
    writeln;
end;


procedure MostrarCaminho(
    Aeroportos: aString;
    Anterior: aInt;
    origem: integer;
    destino: integer
);
var
    caminho: aInt;
    quantidade: integer;
    atual: integer;
    i: integer;
begin
    quantidade := 0;
    atual := destino;

    while atual <> 0 do
    begin
        quantidade := quantidade + 1;
        caminho[quantidade] := atual;

        if atual = origem then
        begin
            atual := 0;
        end
        else
        begin
            atual := Anterior[atual];
        end;
    end;

    for i := quantidade downto 1 do
    begin
        write(Aeroportos[caminho[i]]);

        if i > 1 then
        begin
            write(' -> ');
        end;
    end;

    writeln;
end;


procedure MostrarPesquisa(
    Aeroportos: aString;
    OrdemPesquisa: aInt
);
var
    i: integer;
begin
    writeln;
    writeln('Como foi a pesquisa:');

    for i := 1 to 24 do
    begin
        if OrdemPesquisa[i] <> 0 then
        begin
            write(Aeroportos[OrdemPesquisa[i]]);

            if (i < 24) and (OrdemPesquisa[i + 1] <> 0) then
            begin
                write(' -> ');
>>>>>>> dc122c4fd18fd2c78c2c247571b0465a5eba4ae2
            end;
        end;
    end;

    writeln;
<<<<<<< HEAD
    writeln('Programa encerrado.');

end.
=======
end;


procedure Verificar(
    var O, D: integer;
    Aero: aString
);
var
    origem, destino: string;
begin

    while O = 0 do
    begin
        writeln;
        writeln('Valor de origem invalido!');
        write('Digite novamente o aeroporto de origem: ');
        readln(origem);

        O := encontrarAeoro(Aero, origem);
    end;

    while D = 0 do
    begin
        writeln;
        writeln('Valor de destino invalido!');
        write('Digite novamente o aeroporto de destino: ');
        readln(destino);

        D := encontrarAeoro(Aero, destino);
    end;
end;


procedure MostrarResultado(
    Aeroportos: aString;
    Distancia: aInt;
    Anterior: aInt;
    OrdemPesquisa: aInt;
    origem: integer;
    destino: integer
);
begin
    writeln;
    writeln('===================================');
    writeln('             RESULTADO');
    writeln('===================================');

    writeln('Origem: ', Aeroportos[origem]);
    writeln('Destino: ', Aeroportos[destino]);

    writeln;
    writeln('Caminho encontrado:');
    MostrarCaminho(
        Aeroportos,
        Anterior,
        origem,
        destino
    );

    writeln;
    writeln('Distancia total: ', Distancia[destino]);

    MostrarPesquisa(
        Aeroportos,
        OrdemPesquisa
    );

    writeln('===================================');
    writeln;
end;


procedure MostrarMenu;
begin
    writeln;
    writeln('===================================');
    writeln('       SISTEMA DE AEROPORTOS');
    writeln('===================================');
    writeln('1 - Mostrar aeroportos');
    writeln('2 - Pesquisar rota');
    writeln('0 - Sair');
    writeln('===================================');
    write('Digite uma opcao: ');
end;


var
    Distancia: aInt;
    Anterior: aInt;
    OrdemPesquisa: aInt;
    Aeroportos: aString;
    Visitado: aBool;
    Matriz: aMatriz;

    codigoOrigem: string;
    codigoDestino: string;
    op: string;
    origem: integer;
    destino: integer;

begin

    iniciaAeorporto(Aeroportos);
    iniciaMatriz(Matriz);

    op := '';

    while op <> '0' do
    begin

        MostrarMenu;
        readln(op);

				clrscr;

        if op = '1' then
        begin
            MostrarAeroportos(Aeroportos);
        end
        else
        begin
            if op = '2' then
            begin

                writeln;
                writeln('===================================');
                writeln('          PESQUISAR ROTA');
                writeln('===================================');

                write('Digite o aeroporto de origem: ');
                readln(codigoOrigem);

                write('Digite o aeroporto do destino: ');
                readln(codigoDestino);

                origem := encontrarAeoro(
                    Aeroportos,
                    codigoOrigem
                );

                destino := encontrarAeoro(
                    Aeroportos,
                    codigoDestino
                );

                Verificar(
                    origem,
                    destino,
                    Aeroportos
                );

                iniciaDijkstra(
                    origem,
                    Distancia,
                    Anterior,
                    Visitado
                );

                Dijkstra(
                    Matriz,
                    Distancia,
                    Anterior,
                    Visitado,
                    OrdemPesquisa
                );

                MostrarResultado(
                    Aeroportos,
                    Distancia,
                    Anterior,
                    OrdemPesquisa,
                    origem,
                    destino
                );

            end
            else
            begin
                if op <> '0' then
                begin
                    writeln;
                    writeln('Opcao invalida!');
                end;
            end;
        end;

    end;

    writeln;
    writeln('Programa encerrado.');

end.
>>>>>>> dc122c4fd18fd2c78c2c247571b0465a5eba4ae2
