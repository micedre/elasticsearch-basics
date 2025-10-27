#!/bin/bash
echo "╔════════════════════════════════════════════╗"
echo "║  Rendering Multilingual Quarto Website    ║"
echo "╚════════════════════════════════════════════╝"
echo ""

echo "📝 Rendering French version..."
quarto render --profile french

echo ""
echo "📝 Rendering English version..."
quarto render --profile english --no-clean

echo ""
echo "✅ Both versions rendered successfully!"
echo ""
echo "Output directories:"
echo "  - French:  _site/fr/"
echo "  - English: _site/en/"
