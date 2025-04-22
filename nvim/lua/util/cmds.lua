local cmd = vim.cmd
local usrcmd = vim.api.nvim_create_user_command

-- Helper functions
--- Split string to words
--- @param line string 	-- line
--- @return table<string[]>
local function toWords(line)
	local out = {}
	for word in string.gmatch(line, "%S+") do
		table.insert(out, { word })
	end
	return out
end

--- Merge string words into single word
---@param words table<string[]>	-- words
---@return table<table<string>> -- merged words
local function mergeQuoted(words)
	local out = {}
	local inQuote = false
	local quoteCh = nil
	local current = {}
	-- Loop
	for _, wordTable in ipairs(words) do
		local word = wordTable[1]
		if not inQuote then
			local first = word:match("^[%w%p]*(['\"`])")
			if first then
				inQuote = true
				quoteCh = first
				table.insert(current, word)
			else
				table.insert(out, { word })
			end
		else
			table.insert(current, word)
			if word:find(quoteCh) then
				table.insert(out, { table.concat(current, " ") })
				current = {}
				inQuote = false
				quoteCh = nil
			end
		end
	end
	-- Handle unterminated quotes
	if #current > 0 then
		table.insert(out, { table.concat(current, " ") })
	end
	return out
end

--- Flatten {{...}, {...}} -> {...}
--- @param tbl table<table<string>>	-- Sorted words
--- @return table<string>						-- Flattened word vec
local function flatten(tbl)
	local flattened = {}
	for _, item in ipairs(tbl) do
		table.insert(flattened, table.concat(item, "\n"))
	end
	return flattened
end

--- Sorting function
--- @param tbl table<string|integer>	-- Thing to sort
--- @return table<string|integer> 		-- Sorted
local function sort(tbl)
	table.sort(tbl, function(a, b)
		return a < b
	end)
	return tbl
end

-- User-Commands
-- Emacs' scratch buffer
usrcmd("Scratch", function()
	cmd([[ split | ene | startinsert ]])
	vim.bo.bufhidden = "wipe"
	vim.bo.buftype = "nofile"
	vim.api.nvim_buf_set_name(0, "Scratch")
end, {
	desc = "Emacs' scratch buffer",
})

-- Word sorting
usrcmd("SortWords", function()
	-- Get text sel
	local pos0 = vim.fn.getpos("'<")
	local pos1 = vim.fn.getpos("'>")
	local col0 = pos0[3]
	local col1 = pos1[3]
	local lns = vim.api.nvim_buf_get_lines(0, pos0[2] - 1, pos1[2], false)
	-- Err if no selection
	if #lns == 0 then
		vim.notify("No selection to sort.", vim.log.levels.ERROR)
		return
	end
	-- Trim selection
	if #lns == 1 then
		lns[1] = lns[1]:sub(col0, col1)
	else
		lns[1] = lns[1]:sub(col0)
		lns[#lns] = lns[#lns]:sub(1, col1)
	end
	-- Sort words in line
	local out = {}
	for _, line in ipairs(lns) do
		table.insert(out, table.concat(sort(flatten(mergeQuoted(toWords(line)))), " "))
	end
	-- Insert selection into buffer
	vim.api.nvim_buf_set_lines(0, pos0[2] - 1, pos1[2], false, out)
end, {
	desc = ":sort but for words in a line",
	range = true,
})
