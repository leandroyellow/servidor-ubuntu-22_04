Autor: Leandro Queiroz Trepador<br>
Data de criação: 07/05/2023<br>
Data de atualização: 07/05/2023<br>
Versão: 0.01<br>
Testado e homologado no GNU/Linux Ubuntu Server 22.04.2 LTS

Primeira etapa: Download da ISO do Ubuntu Server 22.04.2 LTS

01. Link de download do Ubuntu Server: https://releases.ubuntu.com/22.04/
02. Versão do download Ubuntu Server: ubuntu-22.04.2-live-server-amd64.iso (07/05/2023)
03. Arquitetura do Ubuntu Server: AMD64 (64-bit)
04. Tipo de instalação: DVD Image (ISO) Installer

Segunda etapa: Criação e Configuração da Máquina Virtual no Oracle VirtualBOX<br>
Link de download do Oracle VirtualBOX: https://www.virtualbox.org/wiki/Downloads

	_ 01. Ferramentas;
	_		Novo
	_ 02. Nome e Sistema Operacional:
	_		Nome: Webserver-Ubuntu-22.04
	_		Pasta da Máquina: (deixar o padrão do sistema)
	_		Tipo: Linux
	_		Versão: Ubuntu (64-bit)
	_	<Próximo>
	_ 03. Tamanho da memória:
	_		Tamanho: 4096MB
	_	<Próximo>
	_ 04. Disco Rígido:
	_		Criar um novo disco rígido virtual agora
	_	<Criar>
	_ 05. Tipo de arquivo de disco rígido
	_		VDI (VirtualBOX Disk Image)
	_	<Próximo>
	_ 06. Armazenamento em disco rígido físico
	_		Dinamicamente alocado
	_	<Próximo>
	_ 07. Localização e tamanho do arquivo
	_		Localização: (deixar o padrão do sistema)
	_		Tamanho do disco: 50GB
	_	<Criar>
	_ 08. Configurações da Máquina Virtual Webserver-Ubuntu-22.04 (Propriedades/Configurações)
	_	Sistema
	_		Placa Mãe
	_			Recurso Estendidos
	_				Relógio da máquina retorno hora UTC: Desabilitar
	_		Processador
	_			Processadores: 02 CPUs
	_			Recursos Estendidos: Habilitar PAE/NX
	_ 			Recursos Estendidos: Habilitar VT-x/AMD-v Aninhado
	_	Monitor
	_		Tela
	_			Memória de Vídeo: 128MB
	_			Aceleração: Habilitar Aceleração 3D
	_	Áudio
	_		Habilitar Áudio: Desabilitar
	_	Rede
	_		Adaptador 1 (LAN)
	_			Habilitar Placa de Rede
	_			Conectado a: Rede Interna
	_			Nome: (deixar o padrão do sistema: intnet)
	_	<OK>

Terceira etapa: Iniciando a Instalação do Ubuntu Server 22.04.2 LTS (localizar a ISO)

	_ 01. VM Webserver-Ubuntu-22.04: Iniciar
	_ 02. Selecione o disco rígido de boot
	_ 		Selecionar um arquivo de disco óptico virtual
	_ 03. Seletor de Discos Ópticos
	_ 		Acrescentar
	_ 		Selecione o arquivo de disco óptico virtual: ubuntu-22.04.2-live-server-amd64.iso
	_ 	<Abrir>
	_ 04. Not Attached
	_ 		Selecionar: ubuntu-22.04.2-live-server-amd64.iso
	_ 	<Escolher>
	_ <Iniciar>

Quarta etapa: Instalação e Configuração do Ubuntu Server 22.04.2 LTS<br>
Instalação do Ubuntu Server: https://ubuntu.com/server/docs/installation

	_ 01. Use UP, DOWN and ENTER keys to select your language
	_ 		English - <Enter>
	_ 02. Installer update available
	_	<Continue without updating>
	_ 03. Keyboard configuration
	_ 		Layout: [English (US)] ou [Portuguese (Brazil)]
	_ 		Variant: [English (US)] ou [Portuguese (Brazil)]
	_ 	<Done>
  _ 04. Choose the base for the installation
        Ubuntu server
      <Done>
	_ 05. Network connections
	_ 		enp0s3 eth <Enter>
	_ 			Edit IPv4 <Enter>
	_ 				IPv4 Method: Manual <Enter>
	_ 					Subnet: 192.168.1.0/24 <Tab>
	_ 					Address: 192.168.1.201 <Tab>
	_ 					Gateway: 192.168.1.1 <Tab>
	_ 					Name servers: 8.8.8.8, 8.8.4.4 <Tab>
	_ 					Search domains: servidor.leandro
	_ 				<Save>
	_ 	<Done>
	_ 06. Configure proxy
	_	<Done>
	_ 07. Configure Ubuntu archive mirror
			Mirror: http://us.archive.ubuntu.com/ubuntu <-- resolve o problema de lentidão -->
		<Done>
	_ 08. Guided storage configuration
	_	(X) Use an entire disk
	_		[VBOX_HARDISK local disk 50.000G]
	_		(X) Set up this disk as an LVM group
	_	<Done>
	_ 09. Storage configuration
	_	USED DEVICES
	_		ubuntu-lv	new, to be formatted as ext4, mounted at /	24.498G 
	_			Edit
	_				Name: ubuntu-lv
	_				Size: 48.996G
	_				Format: ext4
	_				Mount: /
	_			<Save>
	_	<Done>
	_	Confirm destructive action
	_		<Continue>
	_ 10. Profile setup
	_ 		Your name: Leandro Queiroz Trepador <Tab>
	_ 		Your server's name: serverhome <Tab>
	_ 		Pick a username: leandro <Tab>
	_ 		Choose a passwords: senha123 <Tab>
	_ 		Confirm your passwords: senha123
	_ 	<Done>
  _ 11. Upgrade to Ubuntu Pro
        (x) Skip for now
      <Done>
	_ 12. SSH Setup
	_ 		Install OpenSSH server: ON <Space>
	_ 		Import SSH identity: No <Tab>
	_ 	<Done>
	_ 13. Featured Server Snaps
	_	<Done>
	_ 14. Install complete!
	_	<Reboot Now>
	_ 15. Please remove the installation medium, then press ENTER - <Enter>