# 📚 Dictionary.nvim

> Instantly look up English word definitions in Neovim! Powered by [dictionaryapi.dev](https://dictionaryapi.dev/).

---

## Demo

[![Watch the demo](demo.gif)](https://private-user-images.githubusercontent.com/64811235/459752428-66b335f8-674d-47c4-b970-df5b70112688.mp4?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTA5OTc5NDUsIm5iZiI6MTc1MDk5NzY0NSwicGF0aCI6Ii82NDgxMTIzNS80NTk3NTI0MjgtNjZiMzM1ZjgtNjc0ZC00N2M0LWI5NzAtZGY1YjcwMTEyNjg4Lm1wND9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA2MjclMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNjI3VDA0MTQwNVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTU2NmU3OTYzYTRhYmFiYzRkMWNkY2M0NThhOGY2MGNjNDVhZTMwOGJhZDBlYTU5YzAyNmIxOWJhZDljNGFlMDMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.ytv6XnlMd-HcpByASmqUi_C1xD3whYUOdCLWD3pgVuY)

---

## Features

- **Quick lookup**: Get definitions for the word under your cursor
- **Async & non-blocking**: Never lose your editing flow

---

## Installation

<details>
<summary>lazy.nvim</summary>

```lua
{
  'chrscchrn/dictionary.nvim',
  config = function()
    require('dictionary').setup()
  end,
}
```
</details>

<details>
<summary>packer.nvim</summary>

```lua
use {
  'chrscchrn/dictionary.nvim',
  config = function()
    require('dictionary').setup()
  end,
}
```
</details>

---

## Usage

Press `<leader>d` (default) to summon the definition popup.

---

## Configuration

```lua
require('dictionary').setup()
```

---

## Requirements
- Neovim 0.8+
- `curl` in your system path

---

## Credits
- [dictionaryapi.dev](https://dictionaryapi.dev/) for the dictionary API
