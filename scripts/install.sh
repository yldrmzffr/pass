#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
else
    echo -e "${RED}Unsupported operating system.${NC}"
    exit 1
fi

# Define the URL where the pre-compiled binary will be hosted
BINARY_URL="https://github.com/yldrmzffr/pass/raw/main/bin/pass_$OS"

# Create a directory for the pass
mkdir -p ~/pass
cd ~/pass

# Download the pre-compiled binary
echo -e "${YELLOW}Downloading pass for $OS...${NC}"
if command -v curl &> /dev/null; then
    curl -L -o pass "$BINARY_URL"
elif command -v wget &> /dev/null; then
    wget -O pass "$BINARY_URL"
else
    echo -e "${RED}Error: Neither curl nor wget is installed. Please install one of them and try again.${NC}"
    exit 1
fi

# Make the binary executable
chmod +x pass

# Add the binary to PATH
echo -e "${YELLOW}Adding pass to PATH...${NC}"
SHELL_CONFIG_FILE=""
if [[ "$SHELL" == */bash ]]; then
    SHELL_CONFIG_FILE="$HOME/.bashrc"
elif [[ "$SHELL" == */zsh ]]; then
    SHELL_CONFIG_FILE="$HOME/.zshrc"
else
    echo -e "${RED}Unsupported shell. Please add ~/pass to your PATH manually.${NC}"
    exit 1
fi

echo 'export PATH=$PATH:~/pass' >> "$SHELL_CONFIG_FILE"

echo -e "${GREEN}Pass installed successfully!${NC}"
echo -e "${YELLOW}Usage examples:${NC}"
echo -e "  pass -l 16 -u -w"
echo -e "  pass -l 8 -d -s"
echo -e "  pass -l 20 -u -w -d -s"
echo -e "${YELLOW}You may need to restart your terminal or run 'source $SHELL_CONFIG_FILE' for the changes to take effect.${NC}"