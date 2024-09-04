#!/bin/bash

# Checar se o banco de dados já existe
if [ ! -f "./quiz.db" ]; then
    echo "Banco de dados não encontrado. Criando banco de dados..."

    sqlite3 quiz.db < quiz.sql

    if [ -f "./users.csv" ]; then
        echo "Adicionando usuários do arquivo users.csv..."
        python add_users.py
    fi
else
    echo "Banco de dados encontrado."
fi

# Iniciar o servidor Flask
flask run
