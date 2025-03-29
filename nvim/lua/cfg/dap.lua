local dap = require("dap")
local dapui = require("dapui")
local dapgo = require("dap-go")
local dappy = require("dap-python")

-- Setup extensions
dapui.setup()
dapgo.setup()
dappy.setup("python3")
dappy.test_runner = "pytest"

-- Setup dapui
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- Keybinds
require("lib.keys").setKb({
	{
		"<leader>dt",
		action = dap.toggle_breakpoint,
		desc = "Debugger toggle breakpoint",
		modes = { "n" },
	},
	{
		"<leader>dc",
		action = dap.continue,
		desc = "Debugger continue",
		modes = { "n" },
	},
	{
		"<leader>de",
		action = dapui.eval,
		desc = "Debugger evaluate",
		modes = { "v" },
	},
	{
		"<leader>dso",
		action = dap.step_over,
		desc = "Debugger step over",
		modes = { "n" },
	},
	{
		"<leader>dsi",
		action = dap.step_into,
		desc = "Debugger step over",
		modes = { "n" },
	},
	{
		"<leader>dse",
		action = dap.step_out,
		desc = "Debugger step out",
		modes = { "n" },
	},
	{
		"<leader>dr",
		action = dap.repl.open,
		desc = "Debugger start repl",
		modes = { "n" },
	},
	{
		"<leader>dut",
		action = dapui.toggle,
		desc = "Debugger ui toggle",
		modes = { "n" },
	},
	{
		"<leader>duo",
		action = dapui.open,
		desc = "Debugger ui open",
		modes = { "n" },
	},
	{
		"<leader>duc",
		action = dapui.close,
		desc = "Debugger ui close",
		modes = { "n" },
	},
})
