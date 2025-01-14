return {
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		tag = "v1.0.0",
		opts = {
			theme = {
				style = "dark", --  "dark" | "light"
				contrast = "default", -- "default" | "high"
				transparent = false, -- true | false
			},
			colors = {
				mode = "default", -- "default" | "dark" | "light"
				fluo = "pink", -- "pink" | "cyan" | "yellow" | "orange" | "green"
			},
			ui = {
				borders = "inverse", -- "theme" | "inverse" | "fluo" | "none"
				aggressive_spell = false, -- true | false
			},
		},
		-- config = function(_, opts)
		-- 	require("flow").setup(opts)
		-- 	vim.cmd("colorscheme flow")
		-- end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- config = function()
		-- 	vim.cmd("colorscheme rose-pine")
		-- end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
			-- vim.cmd([[colorscheme catppuccin]])
		end,
	},

	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		-- config = function()
		-- 	vim.cmd("colorscheme github_dark_default")
		-- end,
	},

	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
	},

	{
		"jesseleite/nvim-noirbuddy",
		dependencies = {
			{ "tjdevries/colorbuddy.nvim" },
		},
		lazy = false,
		priority = 1000,
		opts = {
			-- All of your `setup(opts)` will go here
		},
		config = function(_, opts)
			require("noirbuddy").setup()
			vim.cmd("colorscheme noirbuddy")
		end,
	},
}
