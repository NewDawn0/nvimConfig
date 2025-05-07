local M = {}

--- Optional list item
---@param feature string Name of the feature
---@param list table<any> Original list
---@param value any Item to insert
---@return [TODO:return]
M.optionalList = function(feature, list, value)
	local g = vim.g.ndnvim
	local enabled = g and g.features and g.features[feature] and g.features[feature].enable
	if enabled and list and value then
		table.insert(list, value)
	end
end

--- Optional callback function
---@param feature string Name of the feature
---@param callback function Function to execute
M.optionalCallback = function(feature, callback)
	local g = vim.g.ndnvim
	local enabled = g and g.features and g.features[feature] and g.features[feature].enable
	if enabled and type(callback) == "function" then
		callback()
	end
end

return M
