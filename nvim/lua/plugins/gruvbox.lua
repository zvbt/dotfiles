return {
	"ellisonleao/gruvbox.nvim",
	opts = { lazy = true },
	config = function(opts)
		vim.cmd.colorscheme("gruvbox")
		vim.cmd [[
			highlight Normal guibg=none
			highlight NonText guibg=none
			highlight Normal ctermbg=none
			highlight NonText ctermbg=none
		]]
	end,
}