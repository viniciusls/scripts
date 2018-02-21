#!/bin/bash
#Script para ajustar o valor de swap e criar um cron para esvaziar o cachê da memoria de tempos em tempos.
#para pcs de baixo desempenho.
#Recomendado reiniciar o pc e executar esse script antes de realizar qualquer tarefa na máquina.

#ESPECIFICANDO VALOR PERMANENTE DO SWAP VIA SYSCTL.CONF
#Deixar 'swappiness' com valor minimo =1.

sudo swapoff -a;

echo '''
#Tweak those values to alter disk syncing and swap behavior.
#vm.vfs_cache_pressure = 100
#vm.laptop_mode = 0
vm.swappiness = 10
#
''' >> /etc/sysctl.conf;

sudo swapon -a;
#end


#Esvaziando o cache da memória utilizando o cron
echo '''10 0    * * *   root    sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches;
#''' >> /etc/crontab;

#Htop para monitorar desempenho do processador e memoria.
sudo apt install htop -y;
