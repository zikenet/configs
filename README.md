![tmux screenshot](./images/tmux.png)
![wezterm and neovim screenshot](./images/wezterm.png)

## Contents

- vim (Neovim) config
- tmux config
- PowerShell config
- Starship prompt config

## Neovim setup

### Requirements

- Neovim >= **0.9.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- [LazyVim](https://www.lazyvim.org/)
- a [Nerd Font](https://www.nerdfonts.com/)(v3.0 or greater) **_(optional, but
  needed to display some icons)_** (I use Jetbrains)
- [lazygit](https://github.com/jesseduffield/lazygit) **_(optional)_**
- a **C** compiler for `nvim-treesitter`.
  See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
- for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  **_(optional)_**
  - **live grep**: [ripgrep](https://github.com/BurntSushi/ripgrep)
  - **find files**: [fd](https://github.com/sharkdp/fd)
- a terminal that support true color and *undercurl*:
  - [iterm2](https://iterm2.com/) **_(Macos)_** I use iterm2 but [ kitty,
    wezterm, alacritty ] can be used
- [Catppuccin](https://github.com/catppuccin/nvim)

## PowerShell setup (Windows)

- [Scoop](https://scoop.sh/) - A command-line installer
- [Git for Windows](https://gitforwindows.org/)
- [Oh My Posh](https://ohmyposh.dev/) - Prompt theme engine
- [Terminal Icons](https://github.com/devblackops/Terminal-Icons) - Folder and
  file icons
- [PSReadLine](https://docs.microsoft.com/en-us/powershell/module/psreadline/) -
  Cmdlets for customizing the editing environment, used for autocompletion
- [z](https://www.powershellgallery.com/packages/z) - Directory jumper
- [PSFzf](https://github.com/kelleyma49/PSFzf) - Fuzzy finder
- [Nerd Font](https://www.nerdfonts.com/)(v3.0 or greater) **_(optional, but
  needed to display some icons)_** (I use Jetbrains)

## Starship prompt

- [Starship-prompt](https://starship.rs/) - The minimal, blazing-fast, and infinitely customizable prompt for any shell!
