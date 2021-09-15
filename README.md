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
* AWS Cli instalado na máquina
* AWS Credentials IAM

https://docs.aws.amazon.com/pt_br/cli/latest/userguide/install-cliv2.html </br>
https://docs.aws.amazon.com/pt_br/IAM/latest/UserGuide/id_users_create.html#id_users_create_console </br>
https://www.packer.io/downloads

## Utilização

Para utilizar a Stack basta seguir os passos abaixo.

### 1. Clonar o projeto
Diretamente no terminal você pode clonar o repositório do projeto para sua máquina local

```shell
git clone https://github.com/alejunio/wordpress-cloudformation-packer-devops.git
```
Após clonar o projeto você poderá acessar o diretório contendo todos os arquivos da Stack. 
Também aconselho abrir o VS Code ou seu editor favorito para editar alguns arquivos que veremos a seguir.

### 2. Geração AMI AWS
O primeiro passo para o deploy da nossa IAC é gerar a AMI personalizada para que possamos usar na AWS.
Você precisa ter nesse momento sua credencial IAM AWS, com permissões para criação de EC2 e CloudFormation.

* AWSCloudFormationFullAccess
* AmazonEC2FullAccess

Para gerar a AMI siga os passos:
```shell
# Abra a pasta Packer dentro do projeto clonado
cd Packer
# Inicializa Packer
packer init .
# Validacao de arquivos packer
packer validade .
# Deploy da AMI
packer build -var "aws_access_key=KEY" -var "aws_secret_key=KEY" -var "aws_ami=NAME" .
```
* aws_access_key= sua aws access_key
* aws_secret_key= sua aws secret_key
* aws_ami= nome para sua imagem

Após finalizar o processo de deploy da AMI você terá uma saida na tela com a informação do nome da AMI. </br>
Ex: ami-0f0d53513b402e9e7

```shell
==> Wait completed after 12 minutes 2 seconds
==> Builds finished. The artifacts of successful builds are:
--> amazon-ebs.ubuntu-bionic: AMIs were created:
<sensitive>: ami-0f0d53513b402e9e7
```
### 3. Deploy CloudFormation
O template responsável por configurar a nossa infraestrutura na AWS é o cf.yaml , e podemos realizar o deploy de duas formas.
* Diretamente na console CloudFormation
* Pelo terminal via aws-cli 

#### Deploy via Console AWS
Link:

#### Deploy via AWS CLI
Abra seu terminal e volte um diretório anterior, caso esteja dentro do diretório do Packer.

```shell
cd ../
```
Para realizar o deploy é crucial que já tenha instalado o AWS CLI e tenha logado com as credenciais. </br>
Execute o comando abaixo para iniciar o deploy.
```shell
aws cloudformation deploy --template-file ./cf.yaml --stack-name NomeStack --parameter-overrides AMI=ami-X KeyName=NameChaveSSH Subnets=subnet-X VpcId=vpc-X
```
Para remover a Stack CloudFormation 
```shell
aws cloudformation delete-stack --stack-name NomeStack
```

## Serviços e Consultoria
* https://alexjunio.com.br

