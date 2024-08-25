#!/bin/bash

# Verifica se o script está sendo executado como root
if [ "$(id -u)" -ne "0" ]; then
    echo "Este script precisa ser executado como root." >&2
    exit 1
fi

# Mensagem de confirmação
read -p "Você tem certeza que deseja colocar o sistema em hibernação? (s/n): " resposta

# Converte a resposta para minúsculas para evitar problemas com a entrada do usuário
resposta=$(echo "$resposta" | tr '[:upper:]' '[:lower:]')

if [ "$resposta" = "s" ] || [ "$resposta" = "sim" ]; then
    echo "O sistema está entrando em hibernação."
    pm-hibernate
else
    echo "Ação cancelada. O sistema não será hibernado."
    read -p "Pressione Enter para sair..."
fi


