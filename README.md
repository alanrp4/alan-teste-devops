# Pré Requisitos #

1. Configurar Ip Fixo desejado, gateway e dns no arquivo network-config
1. Configurar o nome da placa ethernet no arquivo network-config
1. Configurar nome do usuário que vai ser adicionado, na variavel username no script instalar.sh (opcional)

# Softwares e Versões instaladas # 

- nginx stable version (1.16.0)
- php7.3 php7.3-fpm

# Exemplo de uso #

1. Ajustar permissões no script instalar.sh

```
chmod +x instalar.sh
```

2. Executar arquivo instalar.sh

```
bash instalar.sh
```

ou

```
./instalar.sh
```

3. Acesso remoto ao servidor via shh, necessário utilizar (chave.pem)

```
ssh -i chave.pem user1@ip-do-servidor
```

4. Acessar no browser pagina de perguntas

```
localhost/perguntas/?parametro=42
```

ou

```
ip-do-servidor/perguntas/?parametro=42
```


# Referências #

- https://launchpad.net/~nginx/+archive/ubuntu/stable
- https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/
- https://tecadmin.net/install-nginx-php-fpm-ubuntu-18-04/
- http://www.bosontreinamentos.com.br/linux/como-configurar-endereco-ip-estatico-no-linux-ubuntu-18-04-com-netplan/
- https://www.tecmint.com/disable-or-enable-ssh-root-login-and-limit-ssh-access-in-linux/
- https://www.it-swarm.dev/pt/scripts/scripting-netplan-para-endereco-ip-estatico/998271445/
