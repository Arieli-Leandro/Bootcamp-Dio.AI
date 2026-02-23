# Leitura da linha de identificadores de transações
# : Crie uma lista com as transações sem duplicatas, mantendo a ordem da primeira ocorrência
# Dica: Percorra cada transação e adicione à lista apenas se ainda não estiver presente
# print(' '.join(transacoes_unicas))  # Descomente após implementar a lógica


entrada = input()

lista_entrada = entrada.replace(" ", ",")
lista_entrada = lista_entrada.split(",")

transacoes_unicas = []
tamanho_lista = len(lista_entrada)
  
for i in range(0, tamanho_lista):

    qtd_aparece = lista_entrada.count(lista_entrada[i])
    if qtd_aparece > 1:
        string_duplicada = lista_entrada[i]
        if string_duplicada not in transacoes_unicas:
            transacoes_unicas.append(string_duplicada)
        else:
            continue

    else:
        transacoes_unicas.append(lista_entrada[i])

print(' '.join(transacoes_unicas))
