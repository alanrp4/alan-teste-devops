# Pré Requisitos #

1. Configurar Ip Fixo desejado, gateway, dns  no arquivo network-config
1. Configurar nome da placa ethernet no arquivo network-config
1. Configuarar nome do usuário na variavel username no script instalar.sh (opcional)

# Softwares e Versões instaladas # 

- nginx stable verion (1.16.0)
- php7.3 php7.3-fpm

# Exemplo de uso #

1. Ajustar permissão arquivo instlar.sh

```
chmod +x instalar.sh
```

1. Executar arquivo instalar.sh

```
bash instalar.sh
```

ou

```
./intalar.sh
```

1. Acessar remotamente servidor (utilizar chave.pem)

```
ssh -i chave.pem user1@ip-do-servidor
```

1. Acessar no browser pagina de perguntas

```
localhost/perguntas
```

ou

```
ip-do-servidor/perguntas
```

# Referências #

- https://launchpad.net/~nginx/+archive/ubuntu/stable
- https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/
- https://tecadmin.net/install-nginx-php-fpm-ubuntu-18-04/
- http://www.bosontreinamentos.com.br/linux/como-configurar-endereco-ip-estatico-no-linux-ubuntu-18-04-com-netplan/
- https://www.tecmint.com/disable-or-enable-ssh-root-login-and-limit-ssh-access-in-linux/
- https://www.it-swarm.dev/pt/scripts/scripting-netplan-para-endereco-ip-estatico/998271445/
