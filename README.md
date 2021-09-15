![alt text](https://github.com/alejunio/wordpress-cloudformation-packer-devops/blob/main/img/iac-wordpress-aws-alexjunio.png?raw=true)

# 🚀  Automação Servidor WordPress AWS : CloudFormation e Packer c/ AMI Personalizada (Em Desenvolvimento)

Criação de servidor EC2 para hospedagem de sites WordPress automatizado e personalizado para dev e testes.


## Objetivo da Stack

O objetivo dessa stack é configurar rapidamente um ambiente de hospedagem para sites em WordPress, sendo ambiente de **Desenvolvimento**, embora possa ser utilizado em produção, mas por conta e risco do usuário.

O fato de não recomendarmos nesse momento o uso em produção se dá justamente por não termos focado em segurança, e sim, no **ambiente mínimo** para que um site WordPress funcione.

# Stack
A Stack é baseada em:

* CloudFormation (Automacao criação do EC2)
* Packer (Geracao de AMI personalizada)
* Ansible (Automacao na configuração do LEMP)


## Requisitos

A Stack está funcional seguindo os requisitos abaixo:
* Packer instalado na máquina
* AWS Credentials 

## Utilização

Para utilizar a Stack basta seguir os passos abaixo.

### 1. Clonar o projeto
Diretamente no terminal você pode clonar o repositório do projeto para sua máquina local

```shell
git clone https://github.com/alejunio/wordpress-cloudformation-packer-devops.git
```


## Serviços e Consultoria
* https://alexjunio.com.br

