## 🛠️ Development Environment Dotfiles

**Automated development environment setup with chezmoi + Ansible for cross-platform consistency**

## 🚀 Quick Start

**One-command setup on any machine:**

```bash
curl -fsSL https://raw.githubusercontent.com/FarizKesten/dotfiles/main/install.sh | bash
```

That's it! This will automatically:
- ✅ Install chezmoi and Ansible
- ✅ Configure your development tools
- ✅ Set up LazyVim with custom configuration  
- ✅ Install tmux with custom layouts via tmuxifier
- ✅ Configure shell with p10k theme
- ✅ Set up SSH and Git configurations

## 📋 What Gets Installed

### Core Development Tools
- **ripgrep** - Fast text search
- **fzf** - Fuzzy finder
- **neovim** - Modern text editor with LazyVim configuration
- **git** & **lazygit** - Version control
- **tmux** - Terminal multiplexer with custom configurations
- **zsh** - Shell with powerlevel10k theme
- **nodejs/node** - JavaScript runtime
- **fd/fd-find** - Fast file finder
- **tree-sitter-cli** - Syntax highlighting
- **jq** - JSON processor
- **curl** - HTTP client
- **w3m**, **lynx**, **links** - Terminal web browsers
- **bitwarden-cli** - Password manager CLI

### Applications & Configurations
- **LazyVim** - Pre-configured Neovim IDE setup
- **Ghostty** - Terminal emulator configuration  
- **Tmuxifier** - Tmux session layouts (includes "code" layout)
- **Powerlevel10k** - Zsh theme configuration
- **SSH** - Secure connection configurations
- **Git** - Global git settings

## 🏗️ Repository Structure

```
├── .chezmoi.toml.tmpl          # Main chezmoi configuration
├── .chezmoiignore              # Files to ignore
├── install.sh                  # One-command installer
├── developer-tools.yml         # Ansible playbook for tool installation
│
├── dot_gitconfig              # Git global configuration
├── dot_zshrc.tmpl             # Zsh shell configuration  
├── dot_tmux.conf              # Tmux configuration
├── dot_p10k.zsh               # Powerlevel10k theme settings
│
├── dot_config/
│   ├── nvim/                  # LazyVim configuration
│   ├── tmux/                  # Additional tmux settings
│   └── ghostty/               # Terminal emulator config
│
├── dot_tmuxifier/
│   └── layouts/               # Tmux session layouts
│
├── private_dot_ssh/           # SSH configuration (encrypted)
│
└── run_*_scripts.tmpl         # Automated setup scripts
    ├── run_once_lazyvim.sh.tmpl
    ├── run_onchange_install_global_tools.sh.tmpl
    ├── run_onchange_setup_tmux.sh.tmpl
    └── run_onchange_setup_zsh.sh.tmpl
```

## 🔧 How It Works

### 1. Cross-Platform Installation
The setup uses **Ansible** for cross-platform package management:
- **Ubuntu/Debian**: Uses `apt` package manager
- **macOS**: Uses `homebrew` package manager  
- **Automatic detection** of OS and appropriate tool installation

### 2. Smart Updates
- **`run_onchange_`** scripts only run when their associated files change
- **Hash-based tracking** ensures scripts run only when needed
- **Idempotent operations** - safe to run multiple times

### 3. Template-Based Configuration
- **Machine-specific settings** via chezmoi templates
- **Work vs personal** environment detection
- **Dynamic configuration** based on your responses during setup

## 🎯 Key Features

### LazyVim IDE Setup
- **Pre-configured Neovim** with LazyVim starter template
- **Custom configurations** in `dot_config/nvim/`
- **Automatic plugin management** with lazy.nvim
- **Language servers** and development tools integrated

### Tmux + Tmuxifier  
- **Custom tmux configuration** with enhanced keybindings
- **Tmuxifier layouts** for different development scenarios
- **"Code" layout** for development work
- **Session management** and window organization

### Shell Enhancement
- **Zsh with Powerlevel10k** theme for enhanced prompt
- **Custom aliases** and functions
- **Development tool integration** (fzf, ripgrep, fd)
- **Cross-shell compatibility**

### Secure Configuration Management
- **SSH configurations** managed securely with chezmoi encryption
- **Private files** handled with `private_` prefix
- **Git credentials** and personal information templated

## 📱 Supported Platforms

| Platform | Status | Package Manager |
|----------|--------|----------------|
| **Ubuntu/Debian** | ✅ Fully Supported | apt |
| **macOS** | ✅ Fully Supported | homebrew |
| **Other Linux** | ⚠️ Partial Support | Manual installation |

## 🔄 Updates and Maintenance

### Adding New Tools
1. **Edit `developer-tools.yml`** to add new packages
2. **Commit changes** - the `run_onchange_` script will automatically install them
3. **Push to repository** - other machines will get updates on next `chezmoi update`

### Updating Configurations
```bash
# Pull latest changes
chezmoi update

# Check what would change
chezmoi diff

# Apply changes
chezmoi apply
```

### Manual Operations
```bash
# Edit configurations
chezmoi edit ~/.zshrc

# Add new files
chezmoi add ~/.new-config-file

# Check status
chezmoi status

# Push changes
chezmoi cd && git add . && git commit -m "Update config" && git push
```

## 🛠️ Customization

### Personal vs Work Setup
The configuration prompts during first run:
- **Full name** and **email** for git configuration
- **Work computer** vs **personal computer** detection
- **Machine-specific** configurations applied automatically

### Custom Layouts
- **Tmuxifier layouts** in `dot_tmuxifier/layouts/`
- **Add new layouts** with `tmuxifier new-session <name>`
- **Custom development environments** for different projects

### Neovim Customization
- **LazyVim configuration** in `dot_config/nvim/`
- **Custom plugins** and settings
- **Language-specific** configurations
- **Personal keybindings** and preferences

## 🔍 Troubleshooting

### Reset Everything
```bash
# Complete reset
rm -rf ~/.local/share/chezmoi ~/.config/chezmoi ~/.cache/chezmoi
curl -fsSL https://raw.githubusercontent.com/FarizKesten/dotfiles/main/install.sh | bash
```

### Common Issues
- **Permission errors**: Ensure you have sudo access for package installation
- **Network issues**: Check internet connection for downloading packages
- **Missing dependencies**: The Ansible playbook will install required dependencies
- **SSH key issues**: Ensure SSH keys are properly configured for git operations

### Debug Mode
```bash
# Verbose chezmoi operations
chezmoi apply -v

# Check what chezmoi thinks should happen
chezmoi diff

# Verify configuration
chezmoi doctor
```

## 🤝 Contributing

1. **Fork** the repository
2. **Make changes** to configurations or add new tools
3. **Test** on your system
4. **Submit pull request** with description of changes

## 📄 License

This configuration is provided as-is for personal use. Feel free to fork and modify for your own needs.

---

**Happy coding! 🚀**

*This automated setup saves hours of manual configuration and ensures consistency across all your development machines.* dotfiles
