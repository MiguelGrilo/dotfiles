function aider --wraps='source ~/.venvs/aider/bin/activate.fish; and ~/.venvs/aider/bin/aider --model ollama/qwen2.5:7b' --wraps='source ~/.venvs/aider/bin/activate.fish; and ~/.venvs/aider/bin/aider --model ollama/qwen2.5-coder:latest' --description 'alias aider=source ~/.venvs/aider/bin/activate.fish; and ~/.venvs/aider/bin/aider --model ollama/qwen2.5-coder:latest'
    source ~/.venvs/aider/bin/activate.fish; and ~/.venvs/aider/bin/aider --model ollama/qwen2.5-coder:latest $argv
end
