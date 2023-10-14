local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end
dap.adapters.lldb = {
	type = 'executable',
	-- absolute path is important here, otherwise the argument in the `runInTerminal` request will default to $CWD/lldb-vscode
	command = '/usr/bin/lldb-vscode',
	name = "lldb"
}
dap.adapters.node2 = {
	type = 'executable',
	command = 'node',
	args = { os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}
dap.configurations.javascript = {
	{
		name = 'Launch',
		type = 'node2',
		request = 'launch',
		program = '${file}',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		console = 'integratedTerminal',
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = 'Attach to process',
		type = 'node2',
		request = 'attach',
		processId = require 'dap.utils'.pick_process,
	},
}
dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/debug', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},
		runInTerminal = false,
	},
}
