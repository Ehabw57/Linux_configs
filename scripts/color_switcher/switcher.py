#!/usr/bin/env python
import os
import subprocess
from sys import argv
import yaml
from jinja2 import Environment, FileSystemLoader
import json
from PIL import Image

THEMES_DIR = os.path.expanduser('~/scripts/color_switcher/themes')
TEMPLATES_DIR = os.path.expanduser('~/scripts/color_switcher/templates/')

CONFIG_DIR = os.path.expanduser('~/.config')

CONFIG_PATHS = {
    'bspwm': os.path.join(CONFIG_DIR, 'bspwm', 'colorsrc'),
    'polybar': os.path.join(CONFIG_DIR, 'polybar', 'polybar_colors.ini'),
    'rofi': os.path.join(CONFIG_DIR, 'rofi', 'rofi_colors.rasi'),
    'alacritty': os.path.join(CONFIG_DIR, 'alacritty', 'colors.toml'),
    'gtk3': os.path.expanduser('~/.themes/FlatColor/colors3'),
    'gtk2': os.path.expanduser('~/.themes/FlatColor/colors2')
}


def load_theme(theme_name):
    """Load the theme from a .yaml file based on the theme name"""
    theme_path = os.path.join(THEMES_DIR, f'{theme_name}.yaml')
    print(f"loading theme{theme_path}")
    if not os.path.exists(theme_path):
        raise FileNotFoundError(f"Theme file '{theme_path}' not found.")
    with open(theme_path, 'r') as file:
        return yaml.safe_load(file)


def apply_theme(theme):
    """Apply theme to all configurations based on templates"""
    env = Environment(loader=FileSystemLoader(TEMPLATES_DIR))

    for app, config_path in CONFIG_PATHS.items():
        try:
            template = env.get_template(f'{app}.temp')
            config_content = template.render(theme=theme)

            os.makedirs(os.path.dirname(config_path), exist_ok=True)
            with open(config_path, 'w') as config_file:
                config_file.write(config_content)
        except Exception as e:
            print(f"Error applying theme to {app}: {e}")


def make_background(bg_color, logo_color):
    bg_color = tuple(int(bg_color[i:i+2], 16) for i in (1, 3, 5))
    logo_color = tuple(int(logo_color[i:i+2], 16) for i in (1, 3, 5))
    logo = Image.open(os.path.expanduser('~/logo.png')).convert("RGBA")
    fill = Image.new("RGBA", logo.size, logo_color)
    r, g, b, a = logo.split()
    logo.paste(fill, mask=a)
    with Image.new('RGB', (1920, 1080), bg_color) as background:
        center_x = int((background.width - logo.width) / 2)
        center_y = int((background.height - logo.height) / 2)
        background.paste(logo, (center_x, center_y), logo)
        background.save(os.path.expanduser('~/.cache/wallpaper.jpg'))
        logo.close()


def main():
    cache_path = os.path.expanduser('~/.cache/colors.json')

    try:
        with open(cache_path, 'r') as file:
            current_colors = json.load(file)
    except FileNotFoundError or json.JSONDecodeError:
        print(f"Somthing is not correct with '{cache_path}' file using default theme")
        current_colors = {"theme_name": "default", "dark": 'dark'}

    if len(argv) >= 2:
        theme_name = f"{argv[1]}/{current_colors['dark']}"
        current_colors['theme_name'] = argv[1]
    else:
        current_colors['dark'] = 'dark' if current_colors['dark'] == 'light' else 'light'
        theme_name = f"{current_colors['theme_name']}/{current_colors['dark']}"

    try:
        theme = load_theme(theme_name)
        apply_theme(theme)
        make_background(theme['background'], theme['foreground'])
    except Exception as e:
        print(f"error applying the theme: {e}")
        exit(1)

    try:
        with open(cache_path, 'w') as file:
            json.dump(current_colors, file, indent=4)
    except IOError as e:
        print(f"Error saving current theme settings to '{cache_path}': {e}")


if __name__ == '__main__':
    main()
    subprocess.run(["pkill", "polybar"])
    subprocess.run(["pkill", "xsettingsd"])
    subprocess.run(["bspc", "wm", "-r"])
    subprocess.run(["feh", "--bg-fill", os.path.expanduser("~/.cache/wallpaper.jpg")])
