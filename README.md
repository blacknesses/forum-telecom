# 🌐 Forum-Telecom 🌐
<img align="left" alt="" height="190px" src="https://downloadcursos.gratis/wp-content/uploads/2022/10/forum-telecom-745x360.jpg">

Repositório direcionado aos alunos Fórum-Telecom, neste repositório irei deixar algumas ferramentas com vão ajudar vocês com o EVE-NG e orientações de boas práticas dentro do ambiente emulado.

Recomendção mínima de recursos pro EVE-NG<br>
RAM: 4G<br>
CPU: 2

<br>

________________________________________



### ⚙️ SCRIPT DE OTIMIZAÇÃO DO KERNEL EVE-NG ⚙️
Esse script vai otimizar os seguintes seguimentos no kernel.

- Criação de memória swap
- Ajuste do Swappiness: configura RAM+SWAP para funcionar em conjunto
- Aceleração da CPU
- Redução de ruídos gráficos e erros no apache
- Otimização de disco
- Instalação das dependências necessárias para o troubleshooting

### 📥 INSTALAÇÃO 📥
``` git clone https://github.com/blacknesses/forum-telecom.git``` <br>
``` ./script_otimizacao.sh ``` 

### ⚠️ ADVERTÊNCIA ⚠️
Esse script so terá efeito caso seu PC use SSD, pra quem tem HDD no PC não terá efeito positivo nem negativo. Contudo é possível ainda otimizar o scheduler I/O que prioriza a ordem de operações e processos em andamento, reduz o tempo de espera.
Copie e cole no EVE-NG o comando abaixo.<br>
```echo 'deadline' | sudo tee /sys/block/sdX/queue/scheduler```




### 🕵 DICAS DE TROUBLESHOOTING 🕵
Independete do problema que ocorra temos que partir do inicio e entender o "porque" aquilo esta acontecendo<br>

1 - SYSLOG <br>
Execute <br>
``` sudo tail -f /var/log/syslog``` <br>
Procure evidências e busque entender o que está ocorrendo ou ocasionando o problema. 

2 - HARDWARE <br>
Use uma das opções abaixo para monitorar o hardware do ambiente. <br>
``` watch free -m``` <br>
``` htop``` <br>

3 - TESTES BÁSICOS <br>
Básico de tudo, teste o ping pro gateway, pro host e pro google, você pode usar o mtr que junta ping+traceroute. <br>
``` mtr x.x.x.x``` <br>

4 - EVE-NG <br>
Use os recursos de monitoramento que o EVE-NG fornece pra auxiliar no troubleshooting
