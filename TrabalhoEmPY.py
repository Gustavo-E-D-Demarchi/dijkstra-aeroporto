N = 24
INFINITO = 9999

aeroportos = [
    "",
    "SFS",
    "SCCR",
    "DC",
    "SCPI",
    "SMO",
    "SCIA",
    "CP",
    "SCFA",
    "SJ",
    "SCJG",
    "SCLS",
    "SCCO",
    "SCXE",
    "SCJA",
    "SCCS",
    "SCVA",
    "SCLON",
    "SCCA",
    "TB",
    "SCBU",
    "RN",
    "SCFS",
    "SCJE",
    "SCNS"
]

peso = [[0 for _ in range(N + 1)] for _ in range(N + 1)]


def definir_aresta(a, b, valor):
    peso[a][b] = valor
    peso[b][a] = valor


def iniciar_matriz():
    definir_aresta(1, 2, 5)
    definir_aresta(1, 20, 19)
    definir_aresta(1, 21, 11)
    definir_aresta(1, 22, 5)

    definir_aresta(2, 3, 10)
    definir_aresta(2, 6, 14)
    definir_aresta(2, 20, 9)

    definir_aresta(3, 4, 8)
    definir_aresta(3, 5, 9)

    definir_aresta(4, 5, 12)
    definir_aresta(4, 6, 15)

    definir_aresta(6, 8, 20)
    definir_aresta(6, 16, 2)

    definir_aresta(7, 8, 6)
    definir_aresta(7, 9, 9)
    definir_aresta(7, 10, 11)
    definir_aresta(7, 11, 3)
    definir_aresta(7, 12, 5)

    definir_aresta(8, 9, 3)
    definir_aresta(8, 11, 8)

    peso[8][10] = 5
    peso[10][8] = 7

    definir_aresta(9, 10, 13)
    definir_aresta(9, 11, 7)

    definir_aresta(10, 11, 2)
    definir_aresta(10, 12, 10)
    definir_aresta(10, 15, 16)

    definir_aresta(11, 12, 17)
    definir_aresta(11, 14, 4)

    definir_aresta(12, 15, 6)
    definir_aresta(12, 16, 3)

    definir_aresta(13, 16, 12)

    definir_aresta(14, 16, 3)

    definir_aresta(15, 16, 1)

    definir_aresta(16, 17, 5)
    definir_aresta(16, 18, 4)
    definir_aresta(16, 19, 8)
    definir_aresta(16, 20, 16)
    definir_aresta(16, 21, 13)

    definir_aresta(20, 21, 6)
    definir_aresta(20, 22, 7)

    definir_aresta(21, 22, 2)

    definir_aresta(22, 23, 3)
    definir_aresta(22, 24, 10)


def indice_aeroporto(nome):
    codigo = nome.replace(" ", "").upper()

    for i in range(1, N + 1):
        if aeroportos[i] == codigo:
            return i

    return -1


def ler_aeroporto(rotulo):
    while True:
        entrada = input(f"{rotulo}: ")
        indice = indice_aeroporto(entrada)

        if indice != -1:
            return indice

        print("Código inválido!")


def dijkstra(origem):
    distancia = [INFINITO] * (N + 1)
    predecessor = [-1] * (N + 1)
    visitado = [False] * (N + 1)

    distancia[origem] = 0

    for _ in range(N):
        u = -1
        menor = INFINITO

        for v in range(1, N + 1):
            if not visitado[v] and distancia[v] < menor:
                menor = distancia[v]
                u = v

        if u == -1:
            break

        visitado[u] = True

        for v in range(1, N + 1):
            if peso[u][v] > 0 and not visitado[v]:
                nova_distancia = distancia[u] + peso[u][v]

                if nova_distancia < distancia[v]:
                    distancia[v] = nova_distancia
                    predecessor[v] = u

    return distancia, predecessor


def mostrar_caminho(origem, destino, distancia, predecessor):
    if distancia[destino] == INFINITO:
        print(
            f"Não existe caminho entre "
            f"{aeroportos[origem]} e {aeroportos[destino]}."
        )
        return

    caminho = []
    atual = destino

    while atual != -1:
        caminho.append(atual)

        if atual == origem:
            break

        atual = predecessor[atual]

    caminho.reverse()

    nomes = [aeroportos[i] for i in caminho]

    print("Caminho:", " -> ".join(nomes))
    print("Distância total:", distancia[destino])


def main():
    iniciar_matriz()

    resposta = "S"

    while resposta == "S":
        print("=" * 42)
        print("     DIJKSTRA - REDE DE AEROPORTOS")
        print("=" * 42)

        print("\nAeroportos disponíveis:")
        print(" ".join(aeroportos[1:]))

        origem = ler_aeroporto("Origem")
        destino = ler_aeroporto("Destino")

        distancia, predecessor = dijkstra(origem)

        print()
        mostrar_caminho(
            origem,
            destino,
            distancia,
            predecessor
        )

        print()
        resposta = input(
            "Deseja fazer outra consulta? (S/N): "
        ).replace(" ", "").upper()

        print()

    print("Programa encerrado.")


main()