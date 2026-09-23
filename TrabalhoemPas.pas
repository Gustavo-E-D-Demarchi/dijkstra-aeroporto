program DijkstraAeroportos;

const
	N = 24;
	INFINITO = 9999;

type
	TVetorInt = array[1..N] of integer;
	TVetorNomes = array[1..N] of string;
	TMatriz = array[1..N, 1..N] of integer;

procedure IniciarAeroportos(var Aero : TVetorNomes);
begin
	Aero[1] := 'SFS';
	Aero[2] := 'SCCR';
	Aero[3] := 'DC';
	Aero[4] := 'SCPI';
	Aero[5] := 'SMO';
	Aero[6] := 'SCIA';
	Aero[7] := 'CP';
	Aero[8] := 'SCFA';
	Aero[9] := 'SJ';
	Aero[10] := 'SCJG';
	Aero[11] := 'SCLS';
	Aero[12] := 'SCCO';
	Aero[13] := 'SCXE';
	Aero[14] := 'SCJA';
	Aero[15] := 'SCCS';
	Aero[16] := 'SCVA';
	Aero[17] := 'SCLON';
	Aero[18] := 'SCCA';
	Aero[19] := 'TB';
	Aero[20] := 'SCBU';
	Aero[21] := 'RN';
	Aero[22] := 'SCFS';
	Aero[23] := 'SCJE';
	Aero[24] := 'SCNS';
end;


procedure DefinirAresta(a, b, pesoAresta: integer);
begin
	Peso[a,b] := pesoAresta;
	Peso[b,a] := pesoAresta;
end;


procedure IniciarMatriz();
var
	i, j: integer;
begin
	for i := 1 to N do
	begin
		for j := 1 to N do
		begin
			Peso[i,j] := 0;
		end;
	end;

	DefinirAresta(1,2,5);
	DefinirAresta(1,20,19);
	DefinirAresta(1,21,11);
	DefinirAresta(1,22,5);

	DefinirAresta(2,3,10);
	DefinirAresta(2,6,14);
	DefinirAresta(2,20,9);

	DefinirAresta(3,4,8);
	DefinirAresta(3,5,9);

	DefinirAresta(4,5,12);
	DefinirAresta(4,6,15);

	DefinirAresta(6,8,20);
	DefinirAresta(6,16,2);

	DefinirAresta(7,8,6);
	DefinirAresta(7,9,9);
	DefinirAresta(7,10,11);
	DefinirAresta(7,11,3);
	DefinirAresta(7,12,5);

	DefinirAresta(8,9,3);
	DefinirAresta(8,10,5);
	DefinirAresta(8,11,8);

	DefinirAresta(9,10,13);
	DefinirAresta(9,11,7);

	DefinirAresta(10,8,7);
	DefinirAresta(10,11,2);
	DefinirAresta(10,12,10);
	DefinirAresta(10,15,16);

	DefinirAresta(11,12,17);
	DefinirAresta(11,14,4);

	DefinirAresta(12,15,6);
	DefinirAresta(12,16,3);

	DefinirAresta(13,16,12);

	DefinirAresta(14,16,3);

	DefinirAresta(15,16,1);

	DefinirAresta(16,17,5);
	DefinirAresta(16,18,4);
	DefinirAresta(16,19,8);
	DefinirAresta(16,20,16);
	DefinirAresta(16,21,13);

	DefinirAresta(20,21,6);
	DefinirAresta(20,22,7);

	DefinirAresta(21,22,2);

	DefinirAresta(22,23,3);
	DefinirAresta(22,24,10);
end;


function ParaMaiusculas(s: string): string;
var
	i: integer;
begin
	for i := 1 to length(s) do
	begin
		s[i] := upcase(s[i]);
	end;

	ParaMaiusculas := s;
end;


function SemEspacos(s: string): string;
var
	i: integer;
	resultado: string;
begin
	resultado := '';

	for i := 1 to length(s) do
	begin
		if s[i] <> ' ' then
		begin
			resultado := resultado + s[i];
		end;
	end;

	SemEspacos := resultado;
end;


function IndiceAeroporto(nome: string): integer;
var
	i: integer;
	codigo: string;
begin
	codigo := ParaMaiusculas(SemEspacos(nome));

	for i := 1 to N do
	begin
		if Aeroportos[i] = codigo then
		begin
			IndiceAeroporto := i;
			exit;
		end;
	end;

	IndiceAeroporto := -1;
end;


function LerAeroportoValido(rotulo: string): integer;
var
	entrada: string;
	idx: integer;
begin
	idx := -1;

	while idx = -1 do
	begin
		write(rotulo, ': ');
		readln(entrada);

		idx := IndiceAeroporto(entrada);

		if idx = -1 then
		begin
			writeln('Codigo invalido!');
		end;
	end;

	LerAeroportoValido := idx;
end;


procedure Dijkstra(
	origemIdx: integer;
	var Dist: TVetorInt;
	var Predecessor: TVetorInt
);
var
	Visitado: array[1..N] of boolean;
	i: integer;
	u: integer;
	v: integer;
	menor: integer;
	novoDist: integer;
begin
	for i := 1 to N do
	begin
		Dist[i] := INFINITO;
		Predecessor[i] := -1;
		Visitado[i] := False;
	end;

	Dist[origemIdx] := 0;

	for i := 1 to N do
	begin
		u := -1;
		menor := INFINITO;

		for v := 1 to N do
		begin
			if (not Visitado[v]) and (Dist[v] < menor) then
			begin
				menor := Dist[v];
				u := v;
			end;
		end;

		if u <> -1 then
		begin
			Visitado[u] := True;

			for v := 1 to N do
			begin
				if (Peso[u,v] > 0) and (not Visitado[v]) then
				begin
					novoDist := Dist[u] + Peso[u,v];

					if novoDist < Dist[v] then
					begin
						Dist[v] := novoDist;
						Predecessor[v] := u;
					end;
				end;
			end;
		end;
	end;
end;


procedure MostrarCaminho(origem, destino: integer);
var
	caminho: TVetorInt;
	atual, qtd, i: integer;
begin
	if Dist[destino] = INFINITO then
	begin
		writeln('Nao existe caminho.');
	end
	else
	begin
		qtd := 0;
		atual := destino;

		while atual <> -1 do
		begin
			qtd := qtd + 1;
			caminho[qtd] := atual;

			if atual = origem then
				atual := -1
			else
				atual := Predecessor[atual];
		end;

		writeln;
		writeln('Caminho percorrido:');
		writeln;

		for i := qtd downto 1 do
		begin
			write(Aeroportos[caminho[i]]);

			if i > 1 then
			begin
				write(' -- ');
				write(Peso[caminho[i]][caminho[i - 1]]);
				write(' --> ');
			end;
		end;

		writeln;
		writeln;
		writeln('Distancia total: ', Dist[destino]);
	end;
end;


// Vou colocar uma procedure pro menu msm
procedure Menu;
var
	op: integer;
	Aeroportos: TVetorNomes;
	Peso: TMatriz;
	Dist: TVetorInt;
	Predecessor: TVetorInt;

	origemIdx: integer;
	destinoIdx: integer;
	i: integer;
begin
    writeln();

    readln(op);

	case op of
        
    end;
end;


var
	respostaContinuar: string;

begin
	IniciarAeroportos(Aeroportos);
	IniciarMatriz;

	respostaContinuar := 'S';

	while respostaContinuar = 'S' do
		menu();
	begin
		writeln('DIJKSTRA - REDE DE AEROPORTOS');

		writeln;
		writeln('Aeroportos disponiveis:');

		for i := 1 to N do
		begin
			write(Aeroportos[i], ' ');
		end;

		writeln;
		writeln;

		origemIdx := LerAeroportoValido('Origem');
		destinoIdx := LerAeroportoValido('Destino');

		writeln;

		Dijkstra(origemIdx, Dist, Predecessor);

		MostrarCaminho(origemIdx, destinoIdx);

		writeln;

		write('Deseja fazer outra consulta? (S/N): ');
		readln(respostaContinuar);

		writeln;
	end;

	writeln('Programa encerrado.');
end.