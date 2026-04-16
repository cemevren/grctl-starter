#!/usr/bin/env bash
set -e

echo "🚀 Downloading Ground Control Starter Project..."
curl -sL "https://github.com/cemevren/grctl-starter/archive/refs/heads/main.zip" -o grctl-starter.zip

echo "📦 Unzipping project..."
unzip -q grctl-starter.zip
rm grctl-starter.zip

# GitHub archives are extracted into a directory named "<repo>-<branch>"
if [ -d "grctl-starter-main" ]; then
    # If the local grctl-starter dir already exists, remove it or rename to avoid collision 
    if [ -d "grctl-starter" ]; then
        rm -rf grctl-starter
    fi
    mv grctl-starter-main grctl-starter
fi

echo "✅ Project successfully created in ./grctl-starter"
echo ""

if ! command -v mise &> /dev/null; then
    echo "⚠️  'mise' is not found on your system."
    echo "We heavily recommend using mise to easily manage project tooling (like Python, UV, and the grctl CLI)."
    echo ""
    echo "To install mise, visit: https://mise.jdx.dev/getting-started.html"
    echo ""
    echo "If you prefer manual installation for the grctld server and grctl CLI, please see our manual installation documentation:"
    echo "👉 https://example.com/docs/manual-install"
else
    echo "🎉 'mise' is installed! You're ready to go."
    echo ""
    echo "First, navigate to your project and install the tooling:"
    echo "  cd grctl-starter"
    echo "  mise install"
    echo ""
    echo "To run the server:"
    echo "  grctld"
    echo ""
    echo "To run the worker:"
    echo "  mise run worker"
    echo ""
    echo "To trigger the workflow with the CLI:"
    echo "  grctl workflow start --type Hello --input '{\"name\": \"World\"}'"
fi

echo ""
echo "Happy hacking! 🚀"
