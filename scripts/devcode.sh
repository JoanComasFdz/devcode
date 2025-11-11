#!/bin/bash

# Get the target folder
FOLDER="${1:-.}"
FOLDER=$(cd "$FOLDER" && pwd)  # Convert to absolute path

# Verify folder exists
if [ ! -d "$FOLDER" ]; then
    echo "Error: Directory not found: $FOLDER" >&2
    exit 1
fi

# Check if VS Code is available
if ! command -v code &> /dev/null; then
    echo "Error: VS Code 'code' command not found." >&2
    echo "Please ensure VS Code is installed and the 'code' command is in your PATH." >&2
    echo "Install VS Code from: https://code.visualstudio.com/" >&2
    exit 1
fi

# Check if devcontainer exists
if [ -f "$FOLDER/.devcontainer/devcontainer.json" ] || [ -f "$FOLDER/.devcontainer.json" ]; then
    echo "📦 Dev container detected. Opening in container..."

    # Encode the path in hex (using od for better portability)
    ENCODED_PATH=$(echo -n "$FOLDER" | od -A n -t x1 | tr -d ' \n')

    # Construct the VS Code remote URI
    URI="vscode-remote://dev-container+${ENCODED_PATH}${FOLDER}"

    # Launch VS Code with the container URI
    code --folder-uri "$URI"
else
    echo "📁 No dev container found. Opening normally..."
    code "$FOLDER"
fi
