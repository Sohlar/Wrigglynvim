require("compiler-explorer").setup({
  url = "https://godbolt.org",
  infer_lang = true, -- Try to infer possible language based on file extension.
  line_match = {
    highlight = true, -- highlight the matching line(s) in the other buffer.
    jump = true, -- move the cursor in the other buffer to the first matching line.
  },
  open_qflist = false, --  Open qflist after compilation if there are diagnostics.
  split = "split", -- How to split the window after the second compile (split/vsplit).
  compiler_flags = "-O2 -Wall", -- Default flags passed to the compiler.
  job_timeout_ms = 25000, -- Timeout for libuv job in milliseconds.
  languages = { -- Language specific default compiler/flags
    cpp = {
      compiler = "g121",
      compiler_flags = "-O2 -Wall",
    },
  },
})
vim.keymap.set('n', '<leader>cec', ':CECompile compiler=g121 flags=-O2 flags=-Wall<cr>', { remap = true, desc = "Compiler Explorer Compile" })
vim.keymap.set('n', '<leader>cel', ':CECompile<cr>', { remap = true, desc = "Compiler Explorer Live Compilation" })
vim.keymap.set('n', '<S-j>', ':CEShowTooltip<cr>', { remap = true, desc = "Compiler Explorer Show Register/Op info" })
vim.keymap.set('n', '<shift-,>', ':CEDeleteCache<cr>', { remap = true, desc = "Compiler Explorer Delete Cache" })

