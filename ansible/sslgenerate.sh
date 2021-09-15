#!/bin/bash 

clear
cd /home/projeto/ansible

start () {
echo "Iniciando a Instalacao do SSL"
echo " "
echo "Digite seu domínio sem (www), ex: site.com.br "
read dominio
echo "Digite um e-mail válido "
read email
sleep 3
clear 
echo "-------------------------------------"
echo "-------------------------------------"
echo "-------------------------------------"
echo "Confirme os dados inseridos "
echo "-------------------------------------"
echo "Aperte o número da opção desejada "
echo " "
echo "[1] Instalar SSL "
echo "[2] Digitei errado, quero iniciar novamente "
echo "[3] Sair "
read opcao 


if [ $opcao == 1 ]
then
    echo "-------------------------------------"
    echo "Instalando....."
    ansible-playbook ssl.yml --extra-vars "version=1.23.45 dominio_site=$dominio email=$email " 
fi

if [ $opcao == 2 ]
then
    echo "-------------------------------------"
    echo "Reiniciando....."
    start
     
fi

if [ $opcao == 3 ]
then
    echo "-------------------------------------"
    echo "Saindo....."
    exit 
fi

}

start