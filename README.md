# Dictionary.nvim

A Neovim plugin for instantly looking up English word definitions using [dictionaryapi.dev](https://dictionaryapi.dev/). Shows definitions in a floating window, inspired by signature help popups.

---

## Screenshots

[demo](demo.gif)

[![Watch the demo](demo.gif)](https://private-user-images.githubusercontent.com/64811235/459752428-66b335f8-674d-47c4-b970-df5b70112688.mp4?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTA5OTc5NDUsIm5iZiI6MTc1MDk5NzY0NSwicGF0aCI6Ii82NDgxMTIzNS80NTk3NTI0MjgtNjZiMzM1ZjgtNjc0ZC00N2M0LWI5NzAtZGY1YjcwMTEyNjg4Lm1wND9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA2MjclMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNjI3VDA0MTQwNVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTU2NmU3OTYzYTRhYmFiYzRkMWNkY2M0NThhOGY2MGNjNDVhZTMwOGJhZDBlYTU5YzAyNmIxOWJhZDljNGFlMDMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.ytv6XnlMd-HcpByASmqUi_C1xD3whYUOdCLWD3pgVuY)

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
