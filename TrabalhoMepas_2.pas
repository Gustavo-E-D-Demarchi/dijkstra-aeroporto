program pzim;
type
    TVetorInt = array[1..24] of integer;
    TVetorNomes = array[1..24] of integer
    TMatriz = array[1..24] of integer;

//como a funcao tem que carregar primeiro vou colocar aqui msm
function definirMaior(s : string) : string
var
    i : integer;
begin
    for i := 1 to length(s) do
    begin
        s[i] := upcase(s[i]);
    end;
    ParaMaiusculas := s;
end;

function SemEspacos(s : string) : string
var
    i : integer ;
    resl : string;
begin
    for i := 1 to length(s) do
    begin
        if (s <> ' ') then
        begin
            resl := resl + s[i]
        end;
    end;
    SemEspacos := resl;
end;

function IndiceAeroporto(nome : string) : string;
var
    i : integer;
    codigo : string;
begin
    codigo := ParaMaiusculas(SemEspacos(nome));

    for i:= 1 to 24 do
    begin
        if Aeroportos[i] = codigo
    end;
end;

function lerAeroValido(s : string) : string
var 
    entrada : string;
    idx : integer;

begin
    idx := -1 ;
    while idx = -1 do
    begin
        write(s , ' : ');
        readln(entrada);
        idx := IndiceAeroporto(entrada);
    end; 
end;



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

procedure DefinirAresta()
begin
    
end;

procedure IniciarAeroportos()
var 
    aero : TVetorNomes;

    origemIdx : integer ;
    destinoIdx : integer;

begin
    IniciarAeroportos(aero);
    
    origemIdx := lerAeroValido('Origem');
    destinoIdx := lerAeroValido('Destino');
end.