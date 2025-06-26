local M = {}

-- Logging utility
local function log(msg)
  local logfile = vim.fn.stdpath('state') .. '/dictionary.log'
  local line = os.date('%Y-%m-%d %H:%M:%S') .. ' ' .. msg
  vim.fn.writefile({line}, logfile, 'a')
end

-- Get the word under the cursor
local function get_word_under_cursor()
  local word = vim.fn.expand("<cword>")
  log('Getting word under cursor: ' .. tostring(word))
  return word
end

-- Fetch definition from dictionaryapi.dev (async)
local function fetch_definition(word, callback)
  local url = string.format("https://api.dictionaryapi.dev/api/v2/entries/en/%s", word)
  log('Fetching definition for: ' .. tostring(word) .. ' from ' .. url)
  vim.fn.jobstart({
    "curl",
    "-s",
    url,
  }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
		log(data)
      if not data or #data == 0 then
        log('No definition found in API response for: ' .. tostring(word))
        callback("No definition found.")
        return
      end
      local ok, result = pcall(vim.fn.json_decode, table.concat(data, "\n"))
	  log(result)
      if not ok or not result or not result[1] or not result[1].meanings then
        log('API response could not be decoded for: ' .. tostring(word))
        callback("No definition found.")
        return
      end
      local defs = {}
      for _, meaning in ipairs(result[1].meanings) do
        for _, def in ipairs(meaning.definitions) do
          table.insert(defs, string.format("- %s", def.definition))
        end
      end
      log('Definition(s) found for ' .. tostring(word) .. ': ' .. table.concat(defs, "; "))
      callback(table.concat(defs, "\n"))
    end,
    on_stderr = function(_, data)
      if data and #data > 0 then
        log('Error fetching definition for ' .. tostring(word) .. ': ' .. table.concat(data, ' '))
        callback("Error fetching definition.")
      end
    end,
  })
end

-- Show definition in a floating window (signature help style)
local function show_definition_popup(word, definition)
  log('Showing popup for word: ' .. tostring(word))
  local lines = { string.format('Definition of "%s":', word) }
  for line in definition:gmatch("[^\n]+") do
    table.insert(lines, line)
  end
  vim.lsp.util.open_floating_preview(lines, "markdown", { border = "single" })
end

-- Main function to trigger lookup
function M.lookup_word()
	log('Looking up word')
  local word = get_word_under_cursor()
  if not word or word == "" then
    vim.notify("No word under cursor.", vim.log.levels.WARN)
    log('No word under cursor to look up')
    return
  end
  log('Looking up word: ' .. tostring(word))
  fetch_definition(word, function(definition)
    show_definition_popup(word, definition)
  end)
  log('end lookup word')
end

-- Setup keymap
function M.setup()
	vim.keymap.set("n", "<leader>d", M.lookup_word, { desc = "Dictionary Lookup (signature help)" })
end

return M
