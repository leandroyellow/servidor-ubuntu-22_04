#!/bin/bash
# Autor: Leandro Queiroz Trepador
# Data de criação: 08/05/2023
# Data de atualização: 08/05/2023
# Versão: 0.01
# Testado e homologado para a versão do Ubuntu Server 22.04.x LTS x64
#
# Desligando e reinicializando o servidor com halt
sudo hatl -p (Poweroff)
sudo halt --reboot
#
# Desligando e reinicializando o servidor com poweroff
sudo poweroff
sudo poweroff --reboot
#
# Desligando e reinicializando o servidor com init
sudo init 0
sudo init 6
#
# Desligando e reinicializando o servidor com reboot
sudo reboot --halt (Poweroff)
sudo reboot
#
# Desligando e reinicializando o servidor com shutdown
sudo shutdown -P (Poweroff)
sudo shutdown -h (Halt padrão de desligamento em 60 segundos)
sudo shutdown -h now
sudo shutdown -r now
sudo shutdown -h 19:50 Servidor será desligado
sudo shutdown -c (Para cancelar o agendamento)
sudo date