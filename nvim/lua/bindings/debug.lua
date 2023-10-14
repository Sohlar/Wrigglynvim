local status_ok, dui = pcall(require, "dapui")
if not status_ok then
	return
end
-- Toggle dapui window
local ToggleUI = true
function ToggleDBG()
	local dapui = require 'dapui'
	if ToggleUI then
		dapui.open({})
		ToggleUI = false
	else
		dapui.close({})
		ToggleUI = true
	end
end

--Vim debug keymaps
vim.keymap.set("n", "<A-1>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<A-2>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<A-3>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<A-4>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<A-5>", ":lua require'dap'.close()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil,nil,vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>od", ToggleDBG)
--vim.keymap.set("n", "<leader>ow", ":lua require'dapui'.float_element(scopes, {width=40, height=20, enter=true, position=right})<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>ae", ":lua require'dapui'.eval()<CR>")

function Wfloat()
	dui.float_element("watches",{enter=true, width=20, height=30, position="right"})
end
--dapui keymap
vim.keymap.set("n", "<leader>ow", Wfloat, {noremap=true,desc="Open window"})

--Vim debug settings
require('nvim-dap-virtual-text').setup({commented=true})
dui.setup({
	force_buffers=true,
	icons = { expanded = "", collapsed = "", current_frame = "" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- Use this to override mappings for specific elements
	element_mappings = {
		-- Example:
		-- stacks = {
		--   open = "<CR>",
		--   expand = "o",
		-- }
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has("nvim-0.7") == 1,
	-- Layouts define sections of the screen to place windows.
	-- The position can be "left", "right", "top" or "bottom".
	-- The size specifies the height/width depending on position. It can be an Int
	-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
	-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
	-- Elements are the elements shown in the layout (in order).
	-- Layouts are opened in order so that earlier layouts take priority in window sizing.
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				"watches",
				"breakpoints",
				{ id = "scopes", size = 0.25 },
			},
			size = 0.25, -- 40 columns
			position = "left",
		},
		{
			elements = {
				"repl",
				"stacks",
			},
			size = 0.15, -- 20%
			position = "bottom",
		},
	},
	controls = {
		-- Requires Neovim nightly (or 0.8 when released)
		enabled = true,
		-- Display controls in this element
		element = "repl",
		icons = {
			pause = "",
			play = "",
			step_into = "",
			step_over = "",
			step_out = "",
			step_back = "",
			run_last = "",
			terminate = "",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "rounded", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		indent = 2,
		max_type_length = nil, -- Can be integer or nil.
		max_value_lines = 100, -- Can be integer or nil.
	}
})
