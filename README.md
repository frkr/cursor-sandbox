# Cursor Docker Sandbox

```bash
alias cr='docker run -e CURSOR_API_KEY=$CURSOR_API_KEY -v "$PWD:/work" frkr/cursor-sandbox "$@"'
```