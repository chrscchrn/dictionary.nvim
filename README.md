# Dictionary.nvim

A Neovim plugin for instantly looking up English word definitions using [dictionaryapi.dev](https://dictionaryapi.dev/). Shows definitions in a floating window, inspired by signature help popups.

---
[demo](demo.gif)
---

## Features
- Lookup definitions for the word under the cursor
- Asynchronous fetching from dictionaryapi.dev
- Non-blocking, native experience
- Shows results in a floating markdown popup
- Easy-to-use key mapping
- Minimal dependencies (uses only Neovim built-ins and curl)
- Logs lookups to a local file for debugging

---

## Installation

Use your favorite plugin manager. For example, with [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  'chrscchrn/dictionary.nvim',
  config = function()
    require('dictionary').setup()
  end,
}
```

Or with [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
  'chrscchrn/dictionary.nvim',
  config = function()
    require('dictionary').setup()
  end,
}
```

---

## Usage

- Place your cursor over any English word in normal mode.
- Press `<leader>d` (default mapping) to show its definition in a floating window.
- If no word is under the cursor, you'll get a warning.

---

## Configuration

This plugin is zero-config by default. To change the key mapping or customize further, call `require('dictionary').setup()` in your config and override the keymap as needed.

Example (change keymap to `<leader>w`):

```lua
require('dictionary').setup()
vim.keymap.set('n', '<leader>w', require('dictionary').lookup_word, { desc = 'Dictionary Lookup' })
```

---

## Logging

Lookups and errors are logged to `:echo stdpath('state') .. '/dictionary.log'` for debugging.

---

## Requirements
- Neovim 0.8+
- `curl` available in your system path

---

## License
MIT

---

## Credits
- [dictionaryapi.dev](https://dictionaryapi.dev/) for the free dictionary API
- Inspired by Neovim's floating signature help
