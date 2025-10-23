#!/bin/bash
# Script seguro e interativo para apagar configs órfãs no Arch Linux
# Mostra tamanho e data, pergunta antes de apagar

CONFIG_DIR="$HOME/.config"
LOCAL_SHARE_DIR="$HOME/.local/share"

echo "Procurando por configurações órfãs em $CONFIG_DIR e $LOCAL_SHARE_DIR..."

# Função para checar se existe pacote correspondente
check_orphan() {
    local dir="$1"
    local pkg=$(basename "$dir")
    if ! pacman -Qq | grep -qx "$pkg"; then
        echo "$dir"
    fi
}

# Buscar órfãos em ~/.config
orphan_configs=$(find "$CONFIG_DIR" -mindepth 1 -maxdepth 1 -type d | while read d; do check_orphan "$d"; done)

# Buscar órfãos em ~/.local/share
orphan_local=$(find "$LOCAL_SHARE_DIR" -mindepth 1 -maxdepth 1 -type d | while read d; do check_orphan "$d"; done)

# Combinar resultados
all_orphans=$(echo -e "$orphan_configs\n$orphan_local" | sort | uniq)

if [ -z "$all_orphans" ]; then
    echo "Nenhum arquivo de configuração órfão encontrado. 🎉"
    exit 0
fi

# Função para interagir com o usuário
for dir in $all_orphans; do
    if [ -d "$dir" ]; then
        size=$(du -sh "$dir" | cut -f1)
        modified=$(stat -c %y "$dir")
        echo -e "\nDiretório: $dir\nTamanho: $size\nÚltima modificação: $modified"
        read -p "Deseja apagar este diretório? [s/N]: " confirm
        if [[ "$confirm" =~ ^[Ss]$ ]]; then
            rm -rf "$dir"
            echo "Apagado ✅"
        else
            echo "Pulando ❌"
        fi
    fi
done

echo -e "\nLimpeza de arquivos órfãos concluída."

