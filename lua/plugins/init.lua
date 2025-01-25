return {
	{
		"typed-rocks/ts-worksheet-neovim",
		opts = {
			severity = vim.diagnostic.severity.WARN,
		},
		config = function(_, opts)
			require("tsw").setup(opts)
		end,
	},
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
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			require("ibl").setup({ indent = { highlight = highlight } })
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
