function stremio --wraps='flatpak run com.stremio.Stremio' --description 'alias stremio=flatpak run com.stremio.Stremio'
    flatpak run com.stremio.Stremio $argv
end
