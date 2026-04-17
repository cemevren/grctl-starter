#!/usr/bin/env bash
set -e

echo "🚀 Downloading Ground Control Starter Project..."
if [ -d "grctl-starter" ]; then
    rm -rf grctl-starter
fi

if ! git clone -q --depth 1 https://github.com/cemevren/grctl-starter.git grctl-starter; then
    echo "❌ Failed to download the starter project."
    echo "Please check your internet connection or git credentials, and try again."
    exit 1
fi

echo "📦 Preparing project..."
rm -rf grctl-starter/.git

echo "✅ Project successfully created in ./grctl-starter"
echo ""

if ! command -v mise &> /dev/null; then
    echo "⚠️  'mise' is not found on your system."
    echo "We heavily recommend using mise to easily manage project tooling (like Python, UV, and the grctl CLI)."
    echo ""
    echo "To install mise, visit: https://mise.jdx.dev/getting-started.html"
    echo ""
    echo "If you prefer manual installation for the grctld server and grctl CLI, please see our manual installation documentation:"
    echo "👉 https://cemevren.github.io/grctl/quick_start/#manual-installation"
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
