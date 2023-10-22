-- Compile debug binary
vim.keymap.set('n', '<C-p>', ':!cmake ./ && make<cr>', { remap = true, desc = "Compile C++ Debug Binary" })
vim.keymap.set('n', '<leader>cc', ':!g++ -g main.cpp -o debug<cr>', { remap = true, desc = "Compile C++ Debug Binary" })
vim.keymap.set('n', '<leader>cr', ':!./debug<cr>', { remap = true, desc = "Run Debug Binary" })
vim.keymap.set('n', '<leader>car', ':!g++ -g main.cpp -o debug && ./debug<cr>',
	{ remap = true, desc = "[C]ompile[A]nd[R]un C++ Debug Binary" })
--vim.keymap.set('n', "<leader>cad', ':!g++ -g main.cpp -o debug<cr>:lua require'dap'.continue()<cr>",
--	{ remap = true, desc = "[C]ompile[A]nd[D]ebug C++ Debug Binary" })
vim.keymap.set('n', '<leader>cap', ':!g++ -pg -g -o profile main.cpp && ./profile && gprof profile >> profile.out<cr>', {desc="Compile and profile"})
