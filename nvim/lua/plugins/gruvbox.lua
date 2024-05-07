return {
    "ellisonleao/gruvbox.nvim",
    opts = {lazy = true}, 
	config = function(opts)
		vim.cmd.colorscheme("gruvbox")
		vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
   		vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
	end, 
}