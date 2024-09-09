### Para construir a imagem

docker build -t flask_app .

### Para rodar a imagem

docker run -d -p 8080:8080 -v $(pwd)/data:/app/data flask_app

O parâmetro `-v $(pwd)/data:/app/data` monta um volume do host para o container. O comando refere-se ao diretório `data` no seu sistema local (onde `$(pwd)` é o diretório atual de trabalho). Esse diretório é montado no caminho `/app/data` dentro do container. Isso significa que qualquer dado criado ou modificado dentro do container no diretório `/app/data` será refletido no diretório `data` do host, e vice-versa.


### Para mudar o usuario

Altere o arquivo users.csv -> login,admin (altere o login para o seu login, ele será definido como seu usuario e o mesmo valor também é definido para a senha)

O admin criado por padrão é luis com senha luis

### Para acessar o site

Entre em
http://127.0.0.1:8080/
