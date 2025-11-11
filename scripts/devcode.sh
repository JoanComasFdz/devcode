#!/bin/bash

# Get the target folder
FOLDER="${1:-.}"
FOLDER=$(cd "$FOLDER" && pwd)  # Convert to absolute path

# Verify folder exists
if [ ! -d "$FOLDER" ]; then
    echo "Error: Directory not found: $FOLDER" >&2
    exit 1
fi

# Check if devcontainer exists
if [ -f "$FOLDER/.devcontainer/devcontainer.json" ] || [ -f "$FOLDER/.devcontainer.json" ]; then
    echo "📦 Dev container detected. Opening in container..."

    # Encode the path in hex
    ENCODED_PATH=$(echo -n "$FOLDER" | xxd -plain | tr -d '\n')

    # Construct the VS Code remote URI
    URI="vscode-remote://dev-container+${ENCODED_PATH}${FOLDER}"

    # Launch VS Code with the container URI
    code --folder-uri "$URI"
else
    echo "📁 No dev container found. Opening normally..."
    code "$FOLDER"
fi
