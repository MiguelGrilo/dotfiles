function ai-stop --wraps='docker stop open-webui; and pkill ollama; and echo "AI Stopped"' --description 'alias ai-stop=docker stop open-webui; and pkill ollama; and echo "AI Stopped"'
    docker stop open-webui; and pkill ollama; and echo "AI Stopped" $argv
end
