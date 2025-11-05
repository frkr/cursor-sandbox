# Cursor Docker Sandbox

A Docker container that provides an isolated environment for running Cursor AI agent commands. This sandbox allows you to execute Cursor AI tasks without installing Cursor locally, making it perfect for CI/CD pipelines, automated workflows, or isolated development environments.

## Features

- **Isolated Environment**: Run Cursor AI commands in a clean, isolated Docker container
- **Pre-configured Tools**: Includes Cursor CLI, GitHub CLI (gh), and essential utilities (jq, curl, wget, git, zip, dos2unix)
- **Easy to Use**: Simple Docker command or alias to execute Cursor AI tasks
- **Flexible Configuration**: Support for environment variables for API keys and tokens
- **Cross-platform**: Built for Linux/amd64 architecture
- **Automated Setup**: Pre-configured with all necessary dependencies

## Prerequisites

- Docker installed and running on your system
- Cursor API key (required for using Cursor AI features)
- Optional: GitHub token (if you need to interact with GitHub repositories)

## Installation

### Build the Docker Image

```bash
docker build --platform="linux/amd64" -t frkr/cursor-sandbox .
```

### Set Up Alias (Optional)

For easier usage, add this alias to your shell configuration file (`.bashrc`, `.zshrc`, etc.):

```bash
alias cr='docker run -e CURSOR_API_KEY=$CURSOR_API_KEY -v "$PWD:/work" frkr/cursor-sandbox'
```

After adding the alias, reload your shell configuration:

```bash
source ~/.bashrc  # or source ~/.zshrc
```

## Usage

### Basic Usage

Run a Cursor AI command directly:

```bash
docker run -e CURSOR_API_KEY=$CURSOR_API_KEY -v "$PWD:/work" frkr/cursor-sandbox "your command here"
```

### Using the Alias

If you've set up the alias, you can use it more simply:

```bash
cr "update readme.md with features and how to use it following github readme best practices"
```

### With GitHub Token

If you need GitHub CLI functionality:

```bash
docker run -e CURSOR_API_KEY=$CURSOR_API_KEY -e GH_TOKEN=$GH_TOKEN -v "$PWD:/work" frkr/cursor-sandbox "your command here"
```

### Working with Your Code

The container mounts your current directory to `/work` inside the container, so all your files are accessible:

```bash
# From your project directory
docker run -e CURSOR_API_KEY=$CURSOR_API_KEY -v "$PWD:/work" frkr/cursor-sandbox "describe the files in this project"
```

## Configuration

### Environment Variables

- `CURSOR_API_KEY` (required): Your Cursor API key for authentication
- `GH_TOKEN` (optional): GitHub token for GitHub CLI operations

### Default Behavior

The container runs with these default parameters:
- Model: `auto` (automatically selects the best model)
- Output format: `text`
- Force mode: enabled
- Prompt mode: enabled

## Examples

### Update Documentation

```bash
cr "update readme.md with features and how to use it following github readme best practices"
```

### Analyze Code

```bash
cr "analyze the code structure and suggest improvements"
```

### Generate Code

```bash
cr "create a new Python function to calculate fibonacci numbers"
```

### Describe Files

```bash
cr "describe the files in /work"
```

## How It Works

1. The Docker container is built from Ubuntu 24.04
2. Cursor CLI and GitHub CLI are installed during the build process
3. When you run the container, it executes the `cursor-agent` command with your provided instruction
4. Your local directory is mounted to `/work` inside the container
5. The Cursor AI agent processes your command and returns the results

## Troubleshooting

### Permission Issues

If you encounter permission issues, ensure Docker has the necessary permissions to access your files.

### API Key Issues

Make sure your `CURSOR_API_KEY` environment variable is set:

```bash
export CURSOR_API_KEY=your_api_key_here
```

### Container Not Starting

Check if Docker is running:

```bash
docker ps
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Author

Davi Saranszky Mesquita
