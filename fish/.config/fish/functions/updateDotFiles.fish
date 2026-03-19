function updateDotFiles --description 'Sync new files and push it into GitHub'
    # 1. Garantir que as pastas existem no repositório
    mkdir -p ~/dotfiles/fish/.config/fish/functions
    mkdir -p ~/dotfiles/starship/.config
    mkdir -p ~/dotfiles/fastfetch/.config/fastfetch
    mkdir -p ~/dotfiles/nvim/.config/nvim
    
    # 2. Mover apenas ficheiros REAIS (ignora o que já é link simbólico)
    # Isto captura novas funções criadas com 'funcsave'
    for file in ~/.config/fish/functions/*.fish
        if not test -L $file
            mv $file ~/dotfiles/fish/.config/fish/functions/
            echo "Nova função detectada e movida: "(basename $file)
        end
    end
    
    # 3. Atualizar os links do Stow (apenas se houver ficheiros novos)
    cd ~/dotfiles
    stow --restow fish starship fastfetch nvim
    
    # 4. Git Push automático
    git add .
    # Só faz commit se houver alterações para evitar erros no log
    if not git diff-index --quiet HEAD --
        git commit -m "Update DotFiles: "(date "+%Y-%m-%d %H:%M")
        git push origin main
        echo "Dotfiles updated and pushed to GitHub."
    else
        echo "Nothing to update on Github."
    end
    
    cd -
end
