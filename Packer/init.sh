#/bin/bash

# INSTALACAO ANSIBLE
sudo apt update 
sudo apt-get install python3 git unzip htop -y
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y 

# CONFIGURACAO HOST ANSIBLE
cd /etc/ansible/ && sudo rm hosts
sudo cat > /etc/ansible/hosts <<END
[Control]
127.0.0.1 ansible_connection=local
END

# INSTALACAO CERTBOT 
sudo snap install core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot && sudo apt install nginx -y



# MODULOS ANSIBLE 
sudo ansible-galaxy collection install community.mysql
sudo ansible-galaxy collection install community.general



## GERADOR DE CREDENCIAIS
db_user_password=$(head -c 500 /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 25 | head -n 1)
mysql_root_password=$(head -c 500 /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 25 | head -n 1)
user_password=$(head -c 500 /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 25 | head -n 1)


## ARQUIVO DE CREDENCIAIS
ip_publico=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed 's/"//g')
sudo cat > /home/ubuntu/credentials<<EOF
# SENHAS DO MYSQL 

- Database default:   wordpress
- Usuario DB:         wordpress
- Senha DB WordPress: $db_user_password

- Senha DB Root:      $mysql_root_password



# CREDENCIAIS ACESSO SFTP/FTP

- Host:    $ip_publico
- Usuario: wpuser
- Senha:   $user_password
- Porta:   22
EOF

# CONFIGURANDO CREDENCIAIS
sudo sed -i "s/dbpass.*/${db_user_password}/" /home/projeto/ansible/vars/vars.yml
sudo sed -i "s/passdbroot.*/${mysql_root_password}/" /home/projeto/ansible/vars/vars.yml
sudo sed -i "s/passuser.*/${user_password}/" /home/projeto/ansible/vars/vars.yml


# CONFIGURANDO VARIAVEIS DE AMBIENTE
sudo cat > ~/.bash_aliases <<END
alias wpssl='sudo bash /home/projeto/ansible/sslgenerate.sh'
END

# CONFIGURACAO BANNER
sudo rm /etc/update-motd.d/00-header
sudo cat > /etc/update-motd.d/00-header<<EOF
printf "\n"
printf "## Stack WordPress Optimization // ALEX JUNIO IT\n"
printf "\n"
EOF
sudo chown root:root /etc/update-motd.d/00-header

sudo rm /etc/update-motd.d/10-help-text
sudo cat > /etc/update-motd.d/10-help-text<<EOF
printf "\n"
printf " * Support:        contato@alexjunio.com.br\n"
printf " * Website:        https://alexjunio.com.br\n"
EOF
sudo chown root:root /etc/update-motd.d/10-help-text

sudo rm /etc/update-motd.d/90-updates-available
sudo cat > /etc/update-motd.d/90-updates-available<<EOF
printf " * Command Install SSL Domain: sslwp\n"
printf " * Password MySQL: /home/ubuntu/credentials\n"
printf " * Password User SFTP: /home/ubuntu/credentials\n"
printf " * Folder WordPress: /home/wordpress/public_html\n"
printf "\n"
EOF
sudo chown root:root /etc/update-motd.d/90-updates-available
