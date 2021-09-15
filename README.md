![alt text](https://raw.githubusercontent.com/alejunio/ansible-wordpress/main/img/ansible-wordpress.png)

# 🚀  Automação Servidor WordPress AWS : CloudFormation e Packer c/ AMI Personalizada (Em Desenvolvimento)

Criação de servidor EC2 para hospedagem de sites WordPress automatizado e personalizado para dev e testes.


## Objetivo da Stack

O objetivo dessa stack é configurar rapidamente um ambiente de hospedagem para sites em WordPress, sendo ambiente de **Desenvolvimento**, embora possa ser utilizado em produção, mas por conta e risco do usuário.

O fato de não recomendarmos nesse momento o uso em produção se dá justamente por não termos focado em segurança, e sim, no **ambiente mínimo** para que um site WordPress funcione.

# Stack
A Stack é baseada em:

* CloudFormation (Automacao criacao do EC2)
* Packer (Geracao de AMI personalizada)
* Ansible (Automacao na configuração do LEMP)


## Requisitos

A Stack está funcional seguindo os requisitos abaixo:
* Packer instalado na máquina
* AWS Credentials 



## Serviços e Consultoria
* https://alexjunio.com.br

