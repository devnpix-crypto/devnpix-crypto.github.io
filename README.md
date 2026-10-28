# Slate: a modern dark theme for Utopia

A calm, modern dark theme for [Utopia](https://utopia-game.com/), with a phone layout: near-black slate panels, a clean system
font, tidy tables and form controls, and the chat box and intel-bot bars styled to match.

## Use it

In the game, click your username (top right) → **Account Settings** → **Custom Theme**, paste the theme URL
and click Apply. To go back to the classic look, tick **Remove Custom Theme**, or visit
<http://utopia-game.com/shared/reset_theme/>.

## How it is built

`theme.css` is the game's live classic theme, unchanged, followed by the Slate layer at the end of the file.
Every colour in the Slate layer comes from a handful of variables at its top, so a different palette is a
change to those lines only. Images live in `images/` and are referenced by relative path, as the game requires.

Licensed GPL-2.0, like the official template it derives from,
[utopia-theme-default.github.io](https://github.com/utopia-theme-default/utopia-theme-default.github.io).

## Phones

The game sends no mobile viewport tag, so a phone draws every page on a ~980px desktop canvas and shrinks it;
width-based media queries never see the phone. The responsive layer at the end of `theme.css` makes the layout
fluid at every size, and on a touch device with a small screen (`pointer: coarse` and `max-device-width: 480px`)
enlarges the page with `zoom: 2.4`, so the 980px canvas behaves like a ~410px phone layout: header links wrap,
the menu becomes rows of links, and the resource bar and wide tables scroll sideways inside their panels.
