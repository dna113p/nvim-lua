return {
	{
		"lewis6991/gitsigns.nvim", -- git status in gutters
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				on_attach = function()
					local gitsigns = require("gitsigns")
					vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk)
					vim.keymap.set("n", "<leader>bl", gitsigns.blame_line)
				end,
			})
		end,
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},

	{
		"sindrets/diffview.nvim",
	},
}
