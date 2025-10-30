# Elasticsearch Training Website

A comprehensive training website for learning Elasticsearch, built with Quarto.

## Overview

This interactive training guide covers Elasticsearch from basics to advanced topics, including:

- **Getting Started**: Installation and setup
- **Concepts & Architecture**: Distributed architecture, clusters, shards, and the inverted index
- **Index Configuration**: Mappings, field types, and text analysis
- **Indexing Documents**: How to put your documents into ElasticSearch
- **Query Languages**: Query DSL, aggregations, and ES|QL
- **Kibana Dashboards**: Data visualization and dashboard creation

## Multilingual Support

This website is available in **French** (default) and **English**.

### Language Structure

- **French**: `_site/fr/` (default language)
- **English**: `_site/en/` (translation)

### Previewing a Specific Language

```bash
# Preview French version
quarto preview --profile french

# Preview English version
quarto preview --profile english
```

### Rendering Both Languages

Use the provided render scripts to build both language versions:

```bash
# On Unix/macOS/Linux
./render_all.sh

# On Windows (PowerShell)
./render_all.ps1

# On Windows (Command Prompt)
render_all.bat
```

Or render individually:

```bash
quarto render --profile french
quarto render --profile english --no-clean
```

### How Translations Work

Content is organized in **separate language directories**:

- `fr/` - Complete French content (all pages and titles fully translated)
- `en/` - Complete English content

Each language has its own:
- Homepage: `fr/index.qmd` and `en/index.qmd`
- Content directory: `fr/content/` and `en/content/`
- Configuration: `_quarto-french.yml` and `_quarto-english.yml`

This approach provides complete separation between languages, making it easy to maintain independent translations with localized page titles, navigation, and content.

### Language Switcher

Each page includes a smart language switcher button that:
- Preserves the current page when switching languages
- Automatically updates `/fr/` to `/en/` (or vice versa) in the URL
- Falls back to the homepage if the current page doesn't exist in the target language

### Adding New Languages

To add a new language (e.g., Spanish):

1. Create `es/` directory with `es/index.qmd` and `es/content/` subdirectory
2. Translate all content files from `en/content/` to `es/content/`
3. Create `_quarto-spanish.yml` with `output-dir: _site/es` and appropriate settings
4. Update `_quarto.yml` to include `spanish` in the profile group
5. Update language switcher links in all profile configs' navbar
6. Run `quarto render --profile spanish`

## Jupyter Notebooks

The hands-on sections are available as downloadable Jupyter notebooks! Each notebook includes:
- Complete explanations and markdown text
- Executable Python code examples
- Interactive learning experience

When you render the website with `quarto render`, the following notebooks are automatically generated:
- `getting-started.ipynb` - Installation and connection setup
- `concepts-architecture.ipynb` - Elasticsearch architecture and concepts
- `index-configuration.ipynb` - Mappings, field types, and analyzers
- `query-languages.ipynb` - Query DSL, aggregations, and ES|QL
- `kibana-dashboards.ipynb` - Kibana visualizations and dashboards

Download individual notebooks from each section's page, or visit the **Downloads** page for all notebooks at once.


## Installation

### 1. Install Quarto

Download and install Quarto from [quarto.org](https://quarto.org/docs/get-started/):

```bash
# On macOS
brew install quarto

# On Linux (Debian/Ubuntu)
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.550/quarto-1.4.550-linux-amd64.deb
sudo dpkg -i quarto-1.4.550-linux-amd64.deb

# Or download from https://quarto.org/docs/get-started/
```

### 2. Install Python Dependencies

The project uses `uv` for package management:

```bash
# Install dependencies
uv sync
```

This will install:
- Jupyter (for executing code examples)
- Elasticsearch Python client
- Pandas, Matplotlib (for examples and visualizations)

## Building the Website

### Preview the Website

To preview the website locally with live reload:

```bash
uv run quarto preview
```

This will start a local server (usually at http://localhost:4200) and open the website in your browser. Changes to `.qmd` files will automatically refresh the preview.


## Running with Elasticsearch

To get the most out of the training, you should have an Elasticsearch instance running.

## Next Steps

1. Start with the **Getting Started** section to set up Elasticsearch
2. Work through each section in order
3. Experiment with the code examples
4. Try the exercises and build your own queries
5. Explore the advanced topics for production use cases

Happy learning!
