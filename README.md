# 🚀 koompivim.nvim

<div align="center">

```
██╗  ██╗ ██████╗  ██████╗ ███╗   ███╗██████╗ ██╗██╗   ██╗██╗███╗   ███╗
██║ ██╔╝██╔═══██╗██╔═══██╗████╗ ████║██╔══██╗██║██║   ██║██║████╗ ████║
█████╔╝ ██║   ██║██║   ██║██╔████╔██║██████╔╝██║██║   ██║██║██╔████╔██║
██╔═██╗ ██║   ██║██║   ██║██║╚██╔╝██║██╔═══╝ ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║  ██╗╚██████╔╝╚██████╔╝██║ ╚═╝ ██║██║     ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
```

**A modern, beautiful Neovim configuration**  
*Inspired by NvChad • VS Code-like experience • Built for developers*

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Neovim](https://img.shields.io/badge/Neovim-0.9+-green.svg)](https://neovim.io)

</div>

## ✨ Features

- 🎨 **Beautiful UI** - NvChad-inspired design with OneDark colorscheme for better readability
- 🏠 **Welcome Dashboard** - LazyVim-style startup screen with quick actions
- 📁 **VS Code-like File Explorer** - Neo-tree opens automatically like VS Code
- 🔄 **Text Wrapping** - Enabled by default for better readability
- ⚡ **Blazing Fast** - Optimized with lazy loading and performance tweaks
- 🌈 **Rich Syntax Highlighting** - Treesitter support for 20+ languages
- 🔍 **Powerful Search** - Telescope fuzzy finder with extensive keybindings
- 📊 **Modern Statusline** - Clean, informative lualine setup
- 🗂️ **Smart Bufferline** - Bufferline with intuitive tab management
- 🛠️ **Developer Tools** - Mini.nvim utilities for enhanced editing

## 📋 Requirements

- **Neovim** >= 0.9.0
- **Git** >= 2.19.0
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- **ripgrep** for Telescope live grep
- **make** for Telescope fzf extension (optional)

## 🚀 Installation

### Backup Existing Config

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### Install koompivim.nvim

```bash
git clone https://github.com/yourusername/koompivim.nvim.git ~/.config/nvim
```

### Launch Neovim

```bash
nvim
```

That's it! 🎉 Lazy.nvim will automatically install all plugins on first launch.

## ⌨️ Keybindings

<details>
<summary>Click to expand keybindings</summary>

### Dashboard (Welcome Screen)
| Key | Action |
|-----|--------|
| `f` | Find File |
|
| `r` | Recent Files |
| `g` | Find Text |
| `c` | Config |
| `l` | Lazy Plugin Manager |
| `q` | Quit |

### General
| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `jk` | Exit insert mode |
| `<Esc>` | Clear search highlights |
| `<C-s>` | Save file |

### File Explorer (Neo-tree)
| Key | Action |
|-----|--------|
| `<C-n>` | Toggle file explorer |
| `<leader>e` | Focus file explorer |

### Navigation
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate windows |
| `<S-h/l>` | Previous/Next buffer |
| `[b` / `]b` | Previous/Next buffer |

### Fuzzy Finding (Telescope)
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fw` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help tags |
| `<leader>fo` | Old files |
| `<C-p>` | Find files (VS Code style) |

### LSP (when available)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>ra` | Rename symbol |
| `[d` / `]d` | Previous/Next diagnostic |

### Editing
| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gsa` | Add surrounding |
| `gsd` | Delete surrounding |
| `gsr` | Replace surrounding |
| `<A-j/k>` | Move lines up/down |

</details>

## 🎨 Customization

koompi.nvim is designed to be easily customizable. The configuration is organized into logical modules:

```
~/.config/nvim/
├── init.lua              # Entry point
├── lua/
│   ├── config/           # Core configuration
│   │   ├── options.lua   # Neovim options
│   │   ├── keymaps.lua   # Key mappings
│   │   └── autocmds.lua  # Autocommands
│   ├── plugins/          # Plugin configurations
│   │   ├── colorscheme.lua
│   │   ├── neo-tree.lua
│   │   ├── telescope.lua
│   │   ├── treesitter.lua
│   │   └── mini.lua
│   └── ui/              # UI components
│       ├── statusline.lua
│       └── bufferline.lua
```

### Adding Plugins

Create a new file in `lua/plugins/` or add to existing ones:

```lua
-- lua/plugins/your-plugin.lua
return {
  "author/plugin-name",
  config = function()
    -- Plugin configuration
  end
}
```

### Changing Colorscheme

Edit `lua/plugins/colorscheme.lua` to use a different theme:

```lua
return {
  "your-preferred/colorscheme",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("your-colorscheme")
  end,
}
```

## 🌟 Philosophy

koompi.nvim follows these principles:

- **Simplicity**: Clean, readable configuration
- **Performance**: Fast startup and responsive editing
- **Familiarity**: VS Code-like experience for easy transition
- **Extensibility**: Easy to customize and extend
- **Modern**: Uses the latest Neovim features and best practices

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [NvChad](https://nvchad.com/) - For the inspiration and design principles
- [LazyVim](https://lazyvim.org/) - For plugin configuration patterns
- [Catppuccin](https://catppuccin.com/) - For the beautiful colorscheme
- All the amazing plugin authors who make Neovim awesome

---

<div align="center">

**Made with ❤️ for the Neovim community**

[⭐ Star this repo](https://github.com/yourusername/koompi.nvim) • [🐛 Report Bug](https://github.com/yourusername/koompi.nvim/issues) • [💡 Request Feature](https://github.com/yourusername/koompi.nvim/issues)

</div>
