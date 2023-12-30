<span align="center"> 

</span>


<div align="center">
<img src="https://cdn.discordapp.com/attachments/1190325155373789274/1190615747186151544/image.png?ex=65a27252&is=658ffd52&hm=fc684a5a3a05ab2ea65500d99129ce33920d410ff83c21820c4669d901b1b312&" width="500px" />
</div>

# NetProbev2

Bem-vindo ao NetProbev2 - Uma ferramenta simples para descobrir dispositivos em sua rede e verificar portas abertas.

## Visão Geral

NetProbev2 é um script em Shell que utiliza o Nmap para realizar escaneamento de dispositivos na rede local, identifica portas abertas e fornece informações úteis sobre os dispositivos encontrados.

## Funcionalidades

- Descubra dispositivos na sua rede local.
- Verifique portas abertas nos dispositivos encontrados.
- Modo rápido com timeout para verificações rápidas.
- Opção de tentar se conectar a um dispositivo em uma porta específica.

## Instalação

1. Clone este repositório:
   ```bash
   git clone https://github.com/slayerkk/NetProbeV2.git
   ```

2. Navegue até o diretório NetProbeV2:
   ```bash
   cd NetProbeV2
   ```

3. Execute o script de instalação:
   ```bash
   sudo ./install.sh
   ```

Agora, você pode executar `netprobe` de qualquer lugar no sistema.

## Uso

- Para uma verificação rápida: 
  ```bash
  netprobe -r
  ```

- Para apontar um intervalo de rede específico:
  ```bash
  netprobe -a 192.168.1.0/24
  ```

- Para obter ajuda:
  ```bash
  netprobe -h
  ```

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir problemas, enviar pedidos de pull e melhorar este projeto.
