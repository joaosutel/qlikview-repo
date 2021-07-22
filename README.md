# Qlikview Repository
Repositório contendo os arquivos do Qlikview.

## Alias
Para facilitar a vida, criei um **"git alias"** com o script que faz todo o processo de preparo dos arquivos para o versionamento, removendo os dados do **QVW** e exportando o script de carga para **TXT**. Para isso, siga os passos abaixo:
- Clone o repositório em uma pasta de sua escolha,
- Abra o terminal de sua preferência na raiz do repositório,
- Execute o seguinte o comando `git config alias.prepare '!sh -c ./SCRIPTS/prepare.sh'`
- Seja feliz!

Lembrando que antes de executar o comando `git add`, certifique-se que o comando `git prepare` já foi executado!
> Manter o repositório sempre organizado e com arquivos com o menor tamanho possível também é uma responsabilidade sua!
