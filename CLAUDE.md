# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Neovim configuration focused on web development, with extensive LSP support and modern plugin management using Lazy.nvim. The configuration is documented in Russian but follows standard Neovim conventions.

## Commands

### Plugin Management
- `:Lazy` - Open Lazy.nvim plugin manager
- `:Lazy sync` - Install/update all plugins
- `:Lazy clean` - Remove unused plugins

### LSP Operations
- `:LspInfo` - Show LSP server status
- `:LspRestart` - Restart LSP servers
- `:Mason` - Open LSP server installer (if available)

### Development
- `:ConformInfo` - Show formatter status
- `:lua vim.lsp.buf.format()` - Format current buffer
- `:Inspect` - Show highlight groups at cursor

## Architecture

### Core Structure
- **Entry Point**: `init.lua` - Sets leader key (Space) and loads core modules
- **Core Configuration**: `lua/core/` - Contains fundamental Neovim settings
  - `options.lua` - Vim options and settings
  - `mappings.lua` - Key mappings
  - `autocommands.lua` - Auto commands
  - `lsp.lua` - LSP configuration and keybindings
- **Plugin Management**: `lua/lazy_init.lua` - Initializes Lazy.nvim

### Plugin Organization
- Each plugin has its own configuration file in `lua/plugins/`
- Plugins are auto-loaded by Lazy.nvim
- Plugin specifications follow Lazy.nvim format with lazy loading

### LSP Configuration
- Individual LSP server configurations in `lsp/` directory
- Supported languages: Lua, HTML, CSS, TypeScript/JavaScript, Vue.js, Tailwind CSS
- LSP servers are enabled in `lua/core/lsp.lua`

## Key Technologies

### Plugin Manager
- **Lazy.nvim**: Modern plugin manager with lazy loading capabilities
- Configuration in `lua/lazy_init.lua`
- Plugin lockfile: `lazy-lock.json`

### Completion & Development
- **blink.cmp**: Modern completion engine
- **fzf-lua**: Fuzzy finding with extensive keybindings
- **conform.nvim**: Code formatting (manual mode, format on save disabled)
- **nvim-lint**: Linting support
- **nvim-treesitter**: Syntax highlighting and parsing

### UI/UX
- **Tokyo Night**: Colorscheme with auto dark mode switching
- **which-key.nvim**: Keybinding help system
- **gitsigns.nvim**: Git integration
- **peek.nvim**: Markdown preview (requires deno)

## Development Workflow

### File Navigation
- Leader key is Space
- fzf-lua provides fuzzy finding capabilities
- Built-in netrw is enhanced with line numbers

### LSP Features
- Auto-completion via blink.cmp
- Diagnostics with rounded borders
- Format on save is currently disabled (commented out in autocommands)

### Git Integration
- gitsigns.nvim for inline git information
- diffview.nvim for git diff visualization

## Configuration Notes

### Language Support
The configuration is optimized for web development with specific support for:
- Vue.js (with snippets in `lua/snippets/vue.json`)
- TypeScript/JavaScript
- HTML/CSS
- Tailwind CSS
- Emmet abbreviations

### Comments and Documentation
- Configuration contains Russian language comments
- README.md is in Russian and contains setup instructions

### External Dependencies
Some plugins require external tools:
- fzf-lua: fzf, fd, rg, bat, delta
- peek.nvim: deno (for building)

### Utilities
- `lua/utils/getApiKeyFromFile.lua` - Utility for reading API keys
- `lua/utils/os_utils.lua` - OS-specific utilities

## File Modification Guidelines

- Follow existing Russian comment conventions when adding comments
- Use lazy loading for new plugins
- Add LSP servers to `lsp/` directory with dedicated configuration files
- Keep plugin configurations in separate files under `lua/plugins/`
- External dependencies should be documented in README.md