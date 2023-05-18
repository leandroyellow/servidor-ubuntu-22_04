#!/bin/bash
# Autor: Leandro Queiroz Trepador
# Data de criação: 16/05/2023
# Data de atualização: 16/05/2023
# Versão: 0.01
# Testado e homologado para a versão do Ubuntu Server 22.04.x LTS x64
# Testado e homologado para a versão do ISC DHCP Server v4.4.x
# Testado e homologado para a versão do Bind DNS Sever v9.16.x
#
# O Bind DNS Server BIND (Berkeley Internet Name Domain ou, como chamado previamente, 
# Berkeley Internet Name Daemon) é o servidor para o protocolo DNS mais utilizado na 
# Internet, especialmente em sistemas do tipo Unix, onde ele pode ser considerado um 
# padrão de facto. Foi criado por quatro estudantes de graduação, membros de um grupo 
# de pesquisas em ciência da computação da Universidade de Berkeley, e foi distribuído 
# pela primeira vez com o sistema operacional 4.3 BSD. Atualmente o BIND é suportado e 
# mantido pelo Internet Systems Consortium.
#
# Site Oficial do Projeto Bind: https://www.isc.org/bind/
#
# Soluções Open Source de Servidor de DNS
# Site Oficial do Projeto Dnsmasq: https://thekelleys.org.uk/dnsmasq/doc.html
# Site Oficial do Projeto Powerdns: https://www.powerdns.com/
#
# Testando o DNS no GNU/Linux ou Microsoft Windows
# Linux Mint Terminal: Ctrl+Alt+T 
#	nslookup servidor.leandro (query Internet name servers interactively)
#	dig servidor.leandro (DNS lookup utility)
#	host servidor.leandro (DNS lookup utility)
#	ping servidor.leandro (send ICMP ECHO_REQUEST to network hosts)
#
# Windows Powershell.: 
#	nslookup servidor.leandro
#	nslookup 192.168.1.201
#	nslookup servidorweb
#	nslookup servidorweb.servidor.leandro
#	ipconfig /displaydns
#	ping servidor.leandro
#	Resolve-DnsName servidor.leandro
#	Test-Connection servidor.leandro
#
# Arquivo de configuração dos parâmetros utilizados nesse script
source 00-parametros.sh
#
# Configuração da variável de Log utilizado nesse script
LOG=$LOGSCRIPT
#
# Verificando se o usuário é Root e se a Distribuição é >= 22.04.x 
# [ ] = teste de expressão, && = operador lógico AND, == comparação de string, exit 1 = A maioria 
# dos erros comuns na execução
echo -e "variavel ($LOGSCRIPT) "
exit 1
