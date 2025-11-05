docker build --platform="linux/amd64" -t frkr/cursor-sandbox .
docker run -e CURSOR_API_KEY=$CURSOR_API_KEY frkr/cursor-sandbox "descreva os arquivos em /home"