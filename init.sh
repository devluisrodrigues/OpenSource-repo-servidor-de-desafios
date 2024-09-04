#!/bin/bash

if [ ! -f "./data/quiz.db" ]; then
    echo "Banco de dados não encontrado. Criando banco de dados..."

    if [ -f "./src/quiz.sql" ]; then
        echo "Executando script SQL..."
        sqlite3 data/quiz.db < src/quiz.sql
        echo "Banco de dados criado com sucesso!"
    else
        echo "Arquivo quiz.sql não encontrado!"
        exit 1
    fi

    if [ -f "./src/users.csv" ]; then
        echo "Adicionando usuários do arquivo users.csv..."
        python src/adduser.py
    else
        echo "Arquivo users.csv não encontrado!"
    fi
else
    echo "Banco de dados encontrado."
fi

# Iniciar o servidor Flask
flask run
