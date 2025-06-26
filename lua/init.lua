local M = {}

-- Get the word under the cursor
local function get_word_under_cursor()
	return vim.fn.expand("<cword>")
end

-- Fetch definition from dictionaryapi.dev (async)
local function fetch_definition(word, callback)
	local url = string.format("https://api.dictionaryapi.dev/api/v2/entries/en/%s", word)
	vim.fn.jobstart({
		"curl",
		"-s",
		url,
	}, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			if not data or #data == 0 then
				callback("No definition found.")
				return
			end
			local ok, result = pcall(vim.fn.json_decode, table.concat(data, "\n"))
			if not ok or not result or not result[1] or not result[1].meanings then
				callback("No definition found.")
				return
			end
			local defs = {}
			for _, meaning in ipairs(result[1].meanings) do
				for _, def in ipairs(meaning.definitions) do
					table.insert(defs, string.format("- %s", def.definition))
				end
			end
			callback(table.concat(defs, "\n"))
		end,
		on_stderr = function(_, data)
			if data and #data > 0 then
				callback("Error fetching definition.")
			end
		end,
	})
end

-- Show definition in a floating window (signature help style)
local function show_definition_popup(word, definition)
	local lines = { string.format('Definition of "%s":', word) }
	for line in definition:gmatch("[^\n]+") do
		table.insert(lines, line)
	end
	vim.lsp.util.open_floating_preview(lines, "markdown", { border = "single" })
end

-- Main function to trigger lookup
function M.lookup_word()
	local word = get_word_under_cursor()
	if not word or word == "" then
		vim.notify("No word under cursor.", vim.log.levels.WARN)
		return
	end
	fetch_definition(word, function(definition)
		show_definition_popup(word, definition)
	end)
end

-- Setup keymap
function M.setup()
	vim.keymap.set("n", "<leader>d", M.lookup_word, { desc = "Dictionary Lookup (signature help)" })
end

return M
