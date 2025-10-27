# Elasticsearch Training Website

A comprehensive training website for learning Elasticsearch, built with Quarto and managed with uv.

## Overview

This interactive training guide covers Elasticsearch from basics to advanced topics, including:

- **Getting Started**: Installation and setup
- **Core Concepts**: Indices, documents, mappings, and architecture
- **Indexing & Documents**: CRUD operations and bulk indexing
- **Search & Queries**: Full-text search, filtering, and query DSL
- **Aggregations**: Analytics and data summarization
- **Advanced Topics**: Clustering, optimization, and production best practices

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
quarto render --profile english
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
- `indexing.ipynb` - Document and index management
- `search.ipynb` - Search queries and filtering
- `aggregations.ipynb` - Data analytics and aggregations

Download individual notebooks from each section's page, or visit the **Downloads** page for all notebooks at once.

## Prerequisites

- Python 3.13 or higher
- [uv](https://github.com/astral-sh/uv) package manager
- [Quarto](https://quarto.org/docs/get-started/) (for rendering the website)
- (Optional) Docker for running Elasticsearch locally

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
quarto preview
```

This will start a local server (usually at http://localhost:4200) and open the website in your browser. Changes to `.qmd` files will automatically refresh the preview.

### Render the Website

To build the static website:

```bash
quarto render
```

The rendered HTML files will be in the `_site/` directory.

## Running with Elasticsearch

To get the most out of the training, you should have an Elasticsearch instance running.

### Quick Start with Docker

```bash
# Pull and run Elasticsearch
docker run -d \
  --name elasticsearch \
  -p 9200:9200 \
  -p 9300:9300 \
  -e "discovery.type=single-node" \
  -e "xpack.security.enabled=false" \
  docker.elastic.co/elasticsearch/elasticsearch:8.11.0

# Verify it's running
curl http://localhost:9200
```

### Test Connection

```python
from elasticsearch import Elasticsearch

es = Elasticsearch(['http://localhost:9200'])
print(es.info())
```

## Using Jupyter Notebooks

After rendering the website, Jupyter notebooks are available in the `_site/` directory.

### Running Notebooks Locally

1. **Render the website** (generates the notebooks):
```bash
quarto render
```

2. **Activate the virtual environment**:
```bash
source .venv/bin/activate  # On Unix/macOS
# or
.venv\Scripts\activate     # On Windows
```

3. **Start Jupyter**:
```bash
jupyter notebook
```

4. **Open a notebook** from the `_site/` directory:
- French notebooks: `_site/fr/content/*.ipynb`
  - `_site/fr/content/getting-started.ipynb`
  - `_site/fr/content/indexing.ipynb`
  - `_site/fr/content/search.ipynb`
  - `_site/fr/content/aggregations.ipynb`
- English notebooks: `_site/en/content/*.ipynb`
  - `_site/en/content/getting-started.ipynb`
  - `_site/en/content/indexing.ipynb`
  - `_site/en/content/search.ipynb`
  - `_site/en/content/aggregations.ipynb`

5. **Run the cells** and experiment with the examples!

## Project Structure

```
elasticsearch-basics/
├── _quarto.yml              # Base Quarto configuration with profiles
├── _quarto-french.yml       # French language profile
├── _quarto-english.yml      # English language profile
├── render_all.sh            # Render script (Unix/macOS/Linux)
├── render_all.ps1           # Render script (Windows PowerShell)
├── render_all.bat           # Render script (Windows CMD)
├── styles.css               # Custom styles
├── fr/                      # French content (default language)
│   ├── index.qmd            # French homepage
│   └── content/             # French content pages
│       ├── getting-started.qmd  # Installation et configuration (generates .ipynb)
│       ├── core-concepts.qmd    # Concepts fondamentaux
│       ├── indexing.qmd         # Indexation & Documents (generates .ipynb)
│       ├── search.qmd           # Recherche & Requêtes (generates .ipynb)
│       ├── aggregations.qmd     # Agrégations (generates .ipynb)
│       ├── advanced.qmd         # Sujets Avancés
│       └── downloads.qmd        # Page de téléchargements
├── en/                      # English content
│   ├── index.qmd            # English homepage
│   └── content/             # English content pages
│       ├── getting-started.qmd  # Installation and setup (generates .ipynb)
│       ├── core-concepts.qmd    # Fundamental concepts
│       ├── indexing.qmd         # Document management (generates .ipynb)
│       ├── search.qmd           # Search and queries (generates .ipynb)
│       ├── aggregations.qmd     # Data analytics (generates .ipynb)
│       ├── advanced.qmd         # Advanced topics
│       └── downloads.qmd        # Notebooks download page
├── pyproject.toml           # Python dependencies (uv)
├── README.md                # This file
└── _site/                   # Generated website (after render)
    ├── _redirects           # Deployment redirects
    ├── fr/                  # French site
    │   ├── index.html
    │   ├── content/
    │   │   ├── getting-started.html
    │   │   ├── getting-started.ipynb
    │   │   ├── indexing.html
    │   │   ├── indexing.ipynb
    │   │   ├── search.html
    │   │   ├── search.ipynb
    │   │   ├── aggregations.html
    │   │   └── aggregations.ipynb
    │   └── ...
    └── en/                  # English site
        ├── index.html
        ├── content/
        │   ├── getting-started.html
        │   ├── getting-started.ipynb
        │   ├── indexing.html
        │   ├── indexing.ipynb
        │   ├── search.html
        │   ├── search.ipynb
        │   ├── aggregations.html
        │   └── aggregations.ipynb
        └── ...
```

## Development

### Running Code Examples

The website includes executable Python code blocks. To run them:

1. Ensure Elasticsearch is running (see above)
2. Activate the virtual environment:

```bash
source .venv/bin/activate  # On Unix/macOS
# or
.venv\Scripts\activate     # On Windows
```

3. Run individual Python scripts or use Jupyter:

```bash
jupyter notebook
```

### Modifying Content

Content pages are organized by language:
- French content: `fr/content/` directory
- English content: `en/content/` directory

All `.qmd` (Quarto Markdown) files support:
- Markdown formatting
- Executable Python code blocks
- LaTeX math
- Cross-references
- And more

To modify content in both languages, edit the corresponding files in both `fr/content/` and `en/content/`.

Example code block syntax:

````markdown
```{python}
#| echo: true
#| eval: false
from elasticsearch import Elasticsearch
es = Elasticsearch(['http://localhost:9200'])
```
````

## Publishing

To publish the website:

1. **GitHub Pages**: Push the `_site/` directory to a `gh-pages` branch
2. **Netlify/Vercel**: Connect your repository and deploy
3. **Custom Server**: Upload the `_site/` directory

## Contributing

To add new sections or improve existing content:

1. Create or modify `.qmd` files in both `fr/content/` and `en/content/` directories
2. Update `_quarto-french.yml` and `_quarto-english.yml` if adding new pages
3. Test with `quarto preview --profile french` and `quarto preview --profile english`
4. Build with `./render_all.sh` or render profiles individually

## Resources

- [Elasticsearch Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html)
- [Quarto Documentation](https://quarto.org/docs/guide/)
- [uv Package Manager](https://github.com/astral-sh/uv)
- [Elasticsearch Python Client](https://elasticsearch-py.readthedocs.io/)

## License

This training material is provided for educational purposes.

## Troubleshooting

### Quarto not found

Make sure Quarto is installed and in your PATH:

```bash
quarto --version
```

### Python dependencies issues

Reinstall dependencies:

```bash
uv sync --reinstall
```

### Elasticsearch connection errors

Verify Elasticsearch is running:

```bash
curl http://localhost:9200
```

Check Docker container status:

```bash
docker ps
docker logs elasticsearch
```

## Next Steps

1. Start with the **Getting Started** section to set up Elasticsearch
2. Work through each section in order
3. Experiment with the code examples
4. Try the exercises and build your own queries
5. Explore the advanced topics for production use cases

Happy learning!
