# 🌐 Forum-Telecom 🌐
<img align="left" alt="" height="190px" src="https://downloadcursos.gratis/wp-content/uploads/2022/10/forum-telecom-745x360.jpg">

Repositório direcionado aos alunos Fórum-Telecom, neste repositório irei deixar algumas ferramentas que vão ajudar vocês com o EVE-NG e orientações de boas práticas dentro do ambiente emulado. <br>

Desenvolvam noção básica de infraestrutura, vocês estão lidando com recursos de hardware virtualizados saibam segmentar e fazer bom uso do mesmo ou terão problemas de gargalos de memória e processamento ocasionando travamentos e desconexões no laboratório de vocês<br>

Recomendação mínima de recursos pro EVE-NG<br>
RAM: 4 GB<br>
CPU: 2 core

<br>

________________________________________

### 📥 INSTALAÇÃO 📥
```sh
git clone https://github.com/blacknesses/forum-telecom.git
```
```sh
cd forum-telecom; sudo chmod +x ./script_otimizacao.sh; ./script_otimizacao.sh
``` 

### ⚙️ SCRIPT DE OTIMIZAÇÃO DO KERNEL EVE-NG ⚙️
Esse script vai otimizar os seguintes seguimentos no kernel.

- Criação de memória swap
- Ajuste do Swappiness: configura RAM+SWAP para funcionar em conjunto
- Aceleração da CPU
- Redução de ruídos gráficos e erros no apache
- Otimização de disco
- Instalação das dependências necessárias para o troubleshooting

### 🕵 DICAS DE TROUBLESHOOTING 🕵
Independente do problema que ocorra temos que partir do inicio e entender o "porque" aquilo esta acontecendo... <br>

1 - SYSLOG <br>
Execute <br>
```sh
 sudo tail -f /var/log/syslog
```
Procure evidências e busque entender o que está ocorrendo ou ocasionando o problema. 

2 - HARDWARE <br>
Use uma das opções abaixo para monitorar o hardware do ambiente. <br>
```sh
watch free -m
```
```sh
 htop
```

3 - TESTES BÁSICOS <br>
Básico de tudo, teste o ping pro gateway, pro host e pro google, você pode usar o mtr que junta ping+traceroute. <br>
```sh
 mtr x.x.x.x
```

4 - EVE-NG <br>
Use os recursos de monitoramento que o EVE-NG fornece pra auxiliar no troubleshooting  <br>
![image](https://github.com/blacknesses/forum-telecom/blob/main/eve-ng/eve-ng.png)
![teste](https://github.com/blacknesses/forum-telecom/blob/main/eve-ng/resources.png)

### 🔰 SHIELDS 🔰
![](https://img.shields.io/github/license/blacknesses/forum-telecom)
![](https://img.shields.io/github/languages/top/blacknesses/forum-telecom)
