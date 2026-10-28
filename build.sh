#!/bin/sh
# Builds theme.css: the game's classic theme (src/classic.css, unchanged apart from the background picture),
# then the Slate layer, then the responsive layer. Edit the files in src/, never theme.css.
set -e
cd "$(dirname "$0")"
{
  printf '/*\n * Slate: a modern dark theme for Utopia (utopia-game.com), with a phone layout.\n'
  printf ' * Built by build.sh from src/: the live classic theme, then the Slate layer, then the responsive layer.\n'
  printf ' * Licence: GPL-2.0, as the official template utopia-theme-default.github.io.\n */\n\n/* ===== classic theme ===== */\n'
  sed 's|background-image: url(./images/bk.jpg);|background-image: none; /* Slate: classic background picture removed */|' src/classic.css
  printf '\n\n/* ===== Slate ===== */\n'; cat src/slate.css
  printf '\n\n'; cat src/responsive.css
} > theme.css
[ "$(grep -o '{' theme.css | wc -l)" = "$(grep -o '}' theme.css | wc -l)" ] || { echo "unbalanced braces" >&2; exit 1; }
grep -oE "url\(['\"]?\./[^)'\"]+" theme.css | sed -E "s/url\(['\"]?\.\///" | sort -u | while read f; do [ -f "$f" ] || { echo "missing image: $f" >&2; exit 1; }; done
echo "theme.css built"
