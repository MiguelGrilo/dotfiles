function claude --wraps='ollama run qwen2.5-coder' --description 'alias claude=ollama run qwen2.5-coder'
    ollama run qwen2.5-coder $argv
end
