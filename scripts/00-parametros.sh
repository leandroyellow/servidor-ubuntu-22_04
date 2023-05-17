#!/bin/bash
# Autor: Leandro Queiroz Trepador
# Data de criação: 07/05/2023
# Data de atualização: 15/05/2023
# Versão: 0.02
# Testado e homologado para a versão do Ubuntu Server 22.04.x LTS x64
#
# Parâmetros (variáveis de ambiente) utilizados nos scripts de instalação dos Serviços de Rede
# no Ubuntu Server 22.04.x LTS, antes de modificar esse arquivo, veja os arquivos: BUGS, NEW e
# CHANGELOG para mais informações.
#
#=============================================================================================
#                    VARIÁVEIS GLOBAIS UTILIZADAS EM TODOS OS SCRIPTS                        #
#=============================================================================================
#
# Declarando as variáveis utilizadas na verificação e validação da versão do Ubuntu Server 
#
# Variável da Hora Inicial do Script, utilizada para calcular o tempo de execução do script
# opção do comando date: +%T (Time)
HORAINICIAL=$(date +%T)
#
# Variáveis para validar o ambiente, verificando se o usuário é "Root" e versão do "Ubuntu"
# opções do comando id: -u (user)
# opções do comando: lsb_release: -r (release), -s (short), 
USUARIO=$(id -u)
UBUNTU=$(lsb_release -rs)
#
# Variável do Caminho e Nome do arquivo de Log utilizado em todos os script
# opção da variável de ambiente $0: Nome do comando/script executado
# opção do redirecionador | (piper): Conecta a saída padrão com a entrada padrão de outro comando
# opções do comando cut: -d (delimiter), -f (fields)
LOGSCRIPT="/var/log/$(echo $0 | cut -d'/' -f2)"
#
# Exportando o recurso de Noninteractive do Debconf para não solicitar telas de configuração e
# nenhuma interação durante a instalação ou atualização do sistema via Apt ou Apt-Get. Ele 
# aceita a resposta padrão para todas as perguntas.
export DEBIAN_FRONTEND="noninteractive"
#
#=============================================================================================
#              VARIÁVEIS DE REDE DO SERVIDOR UTILIZADAS EM TODOS OS SCRIPTS                  #
#=============================================================================================
#
# Declarando as variáveis utilizadas nas configurações de Rede do Servidor Ubuntu 
#
# Variável do Usuário padrão utilizado no Servidor Ubuntu desse curso
USUARIODEFAULT="leandro"
#
# Variável da Senha padrão utilizado no Servidor Ubuntu desse curso
# OBSERVAÇÃO IMPORTANTE: essa variável será utilizada em outras variáveis desse curso
SENHADEFAULT="senha123"
#
# Variável do Nome (Hostname) do Servidor Ubuntu desse curso
NOMESERVER="servidorweb"
#
# Variável do Nome de Domínio do Servidor Ubuntu desse curso
# OBSERVAÇÃO IMPORTANTE: essa variável será utilizada em outras variáveis desse curso
DOMINIOSERVER="servidor.leandro"
#
# Variável do Nome de Domínio NetBIOS do Servidor Ubuntu desse curso
# OBSERVAÇÃO IMPORTANTE: essa variável será utilizada em outras variáveis desse curso
# opção do redirecionador | (piper): Conecta a saída padrão com a entrada padrão de outro comando
# opções do comando cut: -d (delimiter), -f (fields)
DOMINIONETBIOS="$(echo $DOMINIOSERVER | cut -d'.' -f1)"
#
# Variável do Nome (Hostname) FQDN (Fully Qualified Domain Name) do Servidor Ubuntu desse curso
# OBSERVAÇÃO IMPORTANTE: essa variável será utilizada em outras variáveis desse curso
FQDNSERVER="$NOMESERVER.$DOMINIOSERVER"
#
# Variável do Endereço IPv4 principal (padrão) do Servidor Ubuntu desse curso
IPV4SERVER="192.168.1.201"
#
# Variável do Nome da Interface Lógica do Servidor Ubuntu Server desse curso
# CUIDADO!!! o nome da interface de rede pode mudar dependendo da instalação do Ubuntu Server,
# verificar o nome da interface com o comando: ip address show e mudar a variável INTERFACE com
# o nome correspondente.
INTERFACE="enp0s3"
#
# Variável do arquivo de configuração da Placa de Rede do Netplan do Servidor Ubuntu
# CUIDADO!!! o nome do arquivo de configuração da placa de rede pode mudar dependendo da 
# versão do Ubuntu Server, verificar o conteúdo do diretório: /etc/netplan para saber o nome 
# do arquivo de configuração do Netplan e mudar a variável NETPLAN com o nome correspondente.
NETPLAN="/etc/netplan/00-installer-config.yaml"
#
#=============================================================================================
#                        VARIÁVEIS UTILIZADAS NO SCRIPT: 01-openssh.sh                       #
#=============================================================================================
#
# Arquivos de configuração (conf) do Serviço de Rede OpenSSH utilizados nesse script
# 01. /etc/netplan/00-installer-config.yaml = arquivo de configuração da placa de rede
# 02. /etc/hostname = arquivo de configuração do Nome FQDN do Servidor
# 03. /etc/hosts = arquivo de configuração da pesquisa estática para nomes de host local
# 04. /etc/nsswitch.conf = arquivo de configuração do switch de serviço de nomes de serviço
# 05. /etc/ssh/sshd_config = arquivo de configuração do Servidor OpenSSH
# 06. /etc/hosts.allow = arquivo de configuração de liberação de hosts por serviço de rede
# 07. /etc/hosts.deny = arquivo de configuração de negação de hosts por serviço de rede
# 08. /etc/issue.net = arquivo de configuração do Banner utilizado pelo OpenSSH no login
# 09. /etc/default/shellinabox = arquivo de configuração da aplicação Shell-In-a-Box
# 10. /etc/neofetch/config.conf = arquivo de configuração da aplicação Neofetch
# 11. /etc/cron.d/neofetch-cron = arquivo de atualização do Banner Motd o Neofetch
# 12. /etc/motd = arquivo de mensagem do dia gerado pelo Neofetch utilizando o CRON
# 13. /etc/rsyslog.d/50-default.conf = arquivo de configuração do Syslog/Rsyslog
#
# Arquivos de monitoramento (log) do Serviço de Rede OpenSSH Server utilizados nesse script
# 01. sudo systemctl status ssh = status do serviço do OpenSSH
# 02. sudo journalctl -t sshd = todas as mensagens referente ao serviço do OpenSSH
# 03. tail -f /var/log/syslog | grep sshd = filtrando as mensagens do serviço do OpenSSH
# 04. tail -f /var/log/auth.log | grep ssh = filtrando as mensagens de autenticação do OpenSSH
# 05. tail -f /var/log/tcpwrappers-allow-ssh.log = filtrando as conexões permitidas do OpenSSH
# 06. tail -f /var/log/tcpwrappers-deny.log = filtrando as conexões negadas do OpenSSH
# 07. tail -f /var/log/cron.log = filtrando as mensagens do serviço do CRON
# 08. tail -f /var/log/01-openssh-sh = monitora a instalacão do script
#
# Variável das dependências do laço de loop do OpenSSH Server
SSHDEP="openssh-server openssh-client"
#
# Variável de instalação dos softwares extras do OpenSSH Server
SSHINSTALL="net-tools traceroute ipcalc nmap tree pwgen neofetch shellinabox"
#
# Variável da porta de conexão padrão do OpenSSH Server
PORTSSH="22"
#
# Variável da porta de conexão padrão do Shell-In-a-Box
PORTSHELLINABOX="4200"
#
#
#
#=============================================================================================
#                          VARIÁVEIS UTILIZADAS NO SCRIPT: 02-dns.sh                         #
#=============================================================================================
#
# Arquivos de configuração (conf) do Serviço de Rede BIND DNS Server utilizados nesse script
# 01. /etc/hostname = arquivo de configuração do Nome FQDN do Servidor
# 02. /etc/hosts = arquivo de configuração da pesquisa estática para nomes de host local
# 03. /etc/nsswitch.conf = arquivo de configuração do switch de serviço de nomes
# 04. /etc/netplan/00-installer-config.yaml = arquivo de configuração da placa de rede
# 05. /etc/bind/named.conf = arquivo de configuração da localização dos Confs do Bind9
# 06. /etc/bind/named.conf.local = arquivo de configuração das Zonas do Bind9
# 07. /etc/bind/named.conf.options = arquivo de configuração do Serviço do Bind9
# 08. /etc/bind/named.conf.default-zones = arquivo de configuração das Zonas Padrão do Bind9
# 09. /etc/bind/rndc.key = arquivo de configuração das Chaves RNDC de integração Bind9 e DHCP
# 10. /var/lib/bind/pti.intra.hosts = arquivo de configuração da Zona de Pesquisa Direta
# 11. /var/lib/bind/172.16.1.rev = arquivo de configuração da Zona de Pesquisa Reversas
# 12. /etc/default/named = arquivo de configuração do Daemon do Serviço do Bind9
# 13. /etc/cron.d/dnsupdate-cron = arquivo de configuração das atualizações de Ponteiros
# 14. /etc/cron.d/rndcupdate-cron = arquivo de configuração das atualizações das Estatísticas
# 15. /etc/logrotate.d/rndcstats = arquivo de configuração do Logrotate das Estatísticas
#
# Arquivos de monitoramento (log) do Serviço de Rede Bind DNS Server utilizados nesse script
# 01. sudo systemctl status bind9 = status do serviço do Bind DNS
# 02. sudo journalctl -t named = todas as mensagens referente ao serviço do Bind DNS
# 03. tail -f /var/log/syslog | grep named = filtrando as mensagens do serviço do Bind DNS
# 04. tail -f /var/log/named/* = vários arquivos de Log's dos serviços do Bind DNS
# 05. tail -f /var/log/cron.log = filtrando as mensagens do serviço do CRON
#
# Declarando as variáveis de Pesquisa Direta do Domínio, Reversa e Subrede do Bind DNS Server
#
# Variável do nome do Domínio do Servidor DNS (veja a linha: 64 desse arquivo)
DOMAIN=$DOMINIOSERVER
#
# Variável do nome da Pesquisa Reversa do Servidor de DNS
DOMAINREV="1.168.192.in-addr.arpa"
#
# Variável do endereço IPv4 da Subrede do Servidor de DNS
NETWORK="192.168.1."
#
# Variável de instalação do serviço de rede Bind DNS Server
DNSINSTALL="bind9 bind9utils bind9-doc dnsutils net-tools"
#
# Variáveis das portas de conexão padrão do Bind DNS Server
PORTDNS="53"
PORTRNDC="953"
#
#
#