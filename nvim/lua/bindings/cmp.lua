local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	return
end
local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
	return
end
-- nvim-cmp setup
local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = ""
}
cmp.setup {
	snippet = {
		--expand = function(args)
		--  luasnip.lsp_expand(args.body)
		--end,
		expand = function(args)
			-- For `vsnip`, uncomment the following.
			-- vim.fn["vsnip#anonymous"](args.body)
			-- For `luasnip`, uncomment the following.
			-- require('luasnip').lsp_expand(args.body)
			-- For snippy, uncomment the following.
			-- require('snippy').expand_snippet(args.body)
			-- For `ultisnips`
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) --Concatonate the icons with name of the item-kind
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				spell = "[Spellings]",
				zsh = "[Zsh]",
				buffer = "[Buffer]",
				ultisnips = "[Snip]",
				treesitter = "[Treesitter]",
				calc = "[Calculator]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				nvim_lsp_signature_help = "[Signature]",
				cmdline = "[Vim Command]"
			})[entry.source.name]
			return vim_item
		end,
	},
	mapping = cmp.mapping.preset.insert {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'ultisnips' }
	},
}
