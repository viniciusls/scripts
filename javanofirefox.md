# **javanofirefox**

>Autor: Jean Rodrigues. 06.10.16
>
>Função: Configurar o java no firefox Ubuntu/Debian.
>
>**Obs: Execute os comandos como root usando: sudo -s.**

* 1- Crie uma pasta .java em "**/home/$USER**" (pode ser outro local):

  `mkdir -p /home/$USER/.java;`

* 2- Baixe o java em :  [Clicando aqui](https://www.java.com/pt_BR/download/linux_manual.jsp)

* 3- Extraia o arquivo baixado, deve criar uma pasta com o nome da versão (jre1.8.0_101), e copie para dentro da pasta .java que voce criou.


>**4-Copie e cole todos os comandos abaixo no terminal para configurar o java no firefox.**

    mkdir -p /usr/lib/firefox-addons/plugins;
    cd /usr/lib/firefox-addons/plugins;
    ln -s /home/$USER/.java/java_versao/lib/amd64/libnpjp2.so;
    
**Reinicie o browser e teste o Java**
