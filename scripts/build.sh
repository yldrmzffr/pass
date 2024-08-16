#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Ensure we're in the project root
cd "$(dirname "$0")/.."

# Create bin directory if it doesn't exist
mkdir -p bin

# Clean the bin directory
rm -rf bin/*

echo -e "${YELLOW}Building pass for multiple platforms...${NC}"

# Build for macOS
echo -e "${YELLOW}Building for macOS...${NC}"
GOOS=darwin GOARCH=amd64 go build -o bin/pass_macos src/main.go
if [ $? -eq 0 ]; then
    echo -e "${GREEN}macOS build successful${NC}"
else
    echo -e "${RED}macOS build failed${NC}"
    exit 1
fi

# Build for Linux
echo -e "${YELLOW}Building for Linux...${NC}"
GOOS=linux GOARCH=amd64 go build -o bin/pass_linux src/main.go
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Linux build successful${NC}"
else
    echo -e "${RED}Linux build failed${NC}"
    exit 1
fi

echo -e "${GREEN}All builds completed successfully!${NC}"