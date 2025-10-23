# Limpeza-Config
Script seguro e interativo para apagar arquivos de configuração órfãos no Arch Linux.

# 🧹 Limpeza de Configurações Órfãs

> Script interativo e seguro para apagar arquivos de configuração órfãos no **Arch Linux**.

![License: MIT](https://img.shields.io/badge/License-MIT-green) ![Shell](https://img.shields.io/badge/Shell-Bash-yellow)

---

## ✨ Funcionalidades

- 🔍 Busca por diretórios órfãos em:
  - `~/.config`
  - `~/.local/share`
- 📊 Exibe:
  - Tamanho do diretório
  - Última modificação
- ✅ Pergunta antes de apagar cada diretório
- 🛡️ Seguro e interativo, evitando exclusões acidentais

---

## 🛠️ Requisitos

- Arch Linux (ou derivados)
- Bash
- Pacman

---

## 🚀 Como usar

1. Clone o repositório:

git clone https://github.com/Danielbompanda/Limpeza-Config.git
cd Limpeza-config
Torne o script executável:

chmod +x limpeza-config.sh
Execute:

./limpeza-config.sh
O script irá listar os diretórios órfãos e perguntar se deseja apagá-los um a um.

📸 Exemplo de saída
arduino
Copiar código
Diretório: /home/usuario/.config/nvim
Tamanho: 50M
Última modificação: 2025-10-22 18:45:12
Deseja apagar este diretório? [s/N]:
⚠️ Avisos
Apaga apenas diretórios de configuração de pacotes não instalados via pacman.

Sempre revise os diretórios antes de confirmar a exclusão.

🤝 Contribuição
Contribuições são bem-vindas! Abra issues ou pull requests para melhorias e sugestões.

