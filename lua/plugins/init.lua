return {
	{
		"Wansmer/treesj", -- Split and join blocks of code
		dependencies = { "nvim-treesitter" },
		config = function()
			require("treesj").setup()
		end,
	},

	{ "tpope/vim-sleuth" }, -- automatically tries to adjust spacing based on file heuristics

	{ "chaoren/vim-wordmotion" }, -- changes word jumps for CamelCase and underscore

	{
		"lukas-reineke/indent-blankline.nvim", -- indentation guides
		main = "ibl",
		opts = {},
		config = function()
			local highlight = {
				"CursorColumn",
				"Whitespace",
			}
			require("ibl").setup()
			-- {
			--   indent = {highlight = highlight, char = "" },
			--   whitespace = { highlight = highlight, remove_blankline_trail = false },
			--   scope = { enabled = false }
			-- }
		end,
	},

	{
		"numToStr/Comment.nvim", -- comment toggling
		config = function()
			require("Comment").setup({
				toggler = {
					line = "<C-_>",
				},
				opleader = {
					line = "<C-_>",
				},
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim", -- Fancier statusline
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			local noir = require("noirbuddy.plugins.lualine")
			require("lualine").setup({
				options = {
					icons_enabled = true,
					-- theme = 'catppuccin',
					theme = noir.theme,
					component_separators = "|",
					section_separators = "",
				},
			})
		end,
	},

	{
		"kylechui/nvim-surround", -- Add/change/delete surrounding pairs
		config = function()
			require("nvim-surround").setup()
		end,
	},

	{
		"karb94/neoscroll.nvim", -- smooth scroll for things like C-u, C-d
		config = function()
			require("neoscroll").setup({
				easing_function = "sine",
			})
		end,
	},

	{
		"windwp/nvim-autopairs", -- auto closes brackets/qutoes
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
}
