#!/bin/bash
# Autor: Leandro Queiroz Trepador
# Data de criação: 07/05/2023
# Data de atualização: 07/05/2023
# Versão: 0.01
# Testado e homologado para a versão do Ubuntu Server 22.04.x LTS x64

#Atualização das Listas do Apt-Get - Apt
sudo apt update

#Atualização dos Software instalados
sudo apt upgrade

#Atualização das Versões de Kernel
sudo apt dist-upgrade

#Nova opção de atualização, a mesma utilizada no Debian
sudo apt full-upgrade

#Verificando o Espaço em Disco
sudo df -h

#verificando o arquivo Swapfile
sudo ls -lh swapfile

#Analisando o conteúdo da arquivo OS-Release
sudo cat /etc/os-release

#Analisando o conteúdo do arquivo lsb-release
sudo cat /etc/lsb-release