function ai-start
    if not pgrep -x ollama > /dev/null
        OLLAMA_HOST=0.0.0.0 ollama serve &
        sleep 2
    end
    if docker ps -a --format '{{.Names}}' | grep -q '^open-webui$'
        docker start open-webui
    else
        docker run -d \
                        -p 3000:8080 \
                        --add-host=host.docker.internal:host-gateway \
                        -v open-webui:/app/backend/data \
                        --name open-webui \
                        --restart always \
                        ghcr.io/open-webui/open-webui:main
    end
    sleep 3
    xdg-open http://localhost:3000
    echo "Open-WebUI running on  http://localhost:3000"
end
