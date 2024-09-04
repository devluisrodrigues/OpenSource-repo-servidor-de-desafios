FROM python:3.9-slim

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o arquivo de dependências e instalar
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todos os arquivos do projeto para o diretório de trabalho
COPY . .

# Expor a porta que o Flask usará
EXPOSE 8080

# Configurar variáveis de ambiente para o Flask
ENV FLASK_APP=src/softdes.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=8080

# Executar o script de inicialização e depois iniciar o servidor Flask
CMD ["sh", "init.sh"]
