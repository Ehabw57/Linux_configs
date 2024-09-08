# Linux Configs

This repository contains my personal configuration files for various tools and applications on Linux. It includes settings for commonly used applications, custom scripts, and an automated installation script to set up symlinks for config files.

## Contents

- **`.config/`**: A directory containing configuration files for different applications.
- **`tools_scripts/`**: Custom scripts for tasks like Docker management, monitor setup, and random wallpaper changes.
- **`install.sh`**: A script that automatically creates symbolic links for config files from this repository to `~/.config/`.
- **`packgaes.txt`**: A list of packages that are useful for my Linux environment, including development tools, system utilities, and more.
- **`README.md`**: This document.

## How to Use

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/Linux_configs.git
    ```
2. Run the installation script `install.sh` to create symlinks for the configuration files:
   ```bash
   cd Linux_configs
   ./install.sh
   ```
3. Review the list of packages in `packages.txt` and install them using your package manager (e.g., `apt`, `pacman`, `dnf`).

4. Imoprt `favorite_bookmarks.html` to your browser to get a list of my favorite bookmarks.

5. copy `xinitrc` to `~/.xinitrc` to use it as your xinitrc file.

6. copy `10-monitor.conf` to `/etc/X11/xorg.conf.d/` to use it as your monitor configuration fil

7. Explore `tools_scripts/` for custom scripts that you may find useful.


