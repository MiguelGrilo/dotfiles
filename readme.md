# 0. DotFiles

```
sudo pacman -S stow
cd ~/dotfiles
stow *
```

# 1. Essenciais do Sistema e Drivers

```
# Atualização inicial e ferramentas base
sudo pacman -Syu
sudo pacman -S --needed base-devel git yay

# Drivers e Kernel (Específicos do teu sistema CachyOS/Nvidia)
sudo pacman -S linux-cachyos linux-cachyos-headers
sudo pacman -S nvidia-cachyos nvidia-dkms nvidia-open-dkms cuda cudnn
```

# 2. Terminal, Shell e Utilitários

```
# Shell, Prompt e Ferramentas Modernas
sudo pacman -S fish starship figlet fastfetch htop bat eza zoxide fzf
sudo pacman -S ttf-jetbrains-mono-nerd

# Utilitários Adicionais
sudo pacman -S github-cli
yay -S ascii-image-converter-git
```

# 3. Programação e Desenvolvimento

```
# Linguagens e Ambientes
sudo pacman -S python python-pip nodejs npm ruby r dotnet-sdk aspnet-runtime

# Editores, IDEs e Ferramentas Dev
sudo pacman -S neovim lazygit
yay -S windsurf-bin cursor-bin jetbrains-toolbox rstudio-desktop-bin postman-bin
yay -S gitkraken-bin

# Language Servers (LSP)
sudo pacman -S bash-language-server yaml-language-server dockerfile-language-server eslint-lsp ocaml-lsp

# Docker
wget https://download.docker.com/linux/static/stable/x86_64/docker-29.2.1.tgz -qO- | tar xvfz - docker/docker --strip-components=1
sudo cp -rp ./docker /usr/local/bin/ && rm -r ./docker
sudo pacman -U ./docker-desktop-x86_64.pkg.tar.zst
systemctl --user enable docker-desktop
```

# 4. Áudio e Multimédia

```
# Servidor de Áudio e Controlos
sudo pacman -S pipewire-pulse pipewire-alsa pipewire-jack pavucontro

# Consumo de Multimédia
sudo pacman -S spotify vlc cava
sudo pacman -S gst-libav gst-plugins-bad gst-plugins-ugly libavif libheif
yay -S stremio-bin
```

# 5. Imagem e Gráficos

```
sudo pacman -S krita digikam rawtherapee darktable
yay -S ansel
```

# 6. Produtividade, Leitura e Documentação

```
# Office e LaTeX
sudo pacman -S texlive-full texstudio texlive-langportuguese

# Leitores de Livros/Manga e Markdown
sudo pacman -S foliate arianna
yay -S koodo-reader-bin thorium-reader-bin z-library-bin marktext-bin
```

# 7. Internet, Comunicação e Jogos

```
# Browsers e Comunicação
sudo pacman -S brave-bin discord
yay -S google-chrome zoom

# Jogos
sudo pacman -S steam
```

# 8. Pacotes Específicos (Python, Node, R)

```
# Python
pip install numpy matplotlib scipy pandas torch torchvision jupyter

# Node.js (Globais)
sudo npm install -g dockerfile-language-server-nodejs vscode-langservers-extracted

# R
R -e "install.packages('languageserver', repos='https://cloud.r-project.org')"
```
