#!/bin/bash
#Autor: Jean Rafael Lourenço
#script para notificação via webhook utilizando o Slack.
#Para enviar links na mensagem utilize ex: "Segue o link: <https://slack.com>"
#Mencionar usuários ex: "*Precisa ser validado por: * <@username>"
#Para hyperlinks ex: "A very important thing has occurred! <https://alert-system.com/alerts/1234|Click here> for details!"
#Quando o hook for para notificar usuario ao invés do grupo substituir as linhas 12 e 19:
# channel="nome_canal" por user="nome_usuario"
# e \"channel\": \"#$channel\", por \"user\": \"@$user\",

#Envia para um canal do Slack.
channel="nome_canal"
user_send="nome_usuario"
message="*Sua mensagem aqui!*"
webhook_URL="webhook_URL"
icon_emoji="emoji_aqui"

curl -X POST --data-urlencode "payload= {
 \"channel\": \"#$channel\",
  \"username\": \"$user_send\",
   \"text\": \"$message\",
    \"icon_emoji\": \":$icon_emoji:\"}" $webhook_URL;

                
