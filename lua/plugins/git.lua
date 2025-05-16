return {
	{
		"lewis6991/gitsigns.nvim", -- git status in gutters
		config = function()
			require("gitsigns").setup({
				signs = {
					add          = { text = '┃' },
					change       = { text = '┃' },
					delete       = { text = '_' },
					topdelete    = { text = '‾' },
					changedelete = { text = '~' },
					untracked    = { text = '┆' },
				},
				signs_staged = {
					add          = { text = '┃' },
					change       = { text = '┃' },
					delete       = { text = '_' },
					topdelete    = { text = '‾' },
					changedelete = { text = '~' },
					untracked    = { text = '┆' },
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

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua",           -- optional
			"echasnovski/mini.pick",      -- optional
			"folke/snacks.nvim",          -- optional
		},
	},

	{
		"sindrets/diffview.nvim",
	},
}
