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

	{ "tpope/vim-sleuth" },      -- automatically tries to adjust spacing based on file heuristics

	{ "chaoren/vim-wordmotion" }, -- changes word jumps for CamelCase and underscore

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
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = 'catppuccin',
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

	-- {
	-- 	"karb94/neoscroll.nvim", -- smooth scroll for things like C-u, C-d
	-- 	config = function()
	-- 		require("neoscroll").setup({
	-- 			easing_function = "sine",
	-- 		})
	-- 	end,
	-- },

	{
		"windwp/nvim-autopairs", -- auto closes brackets/qutoes
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000,  -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
		end,
	},
	{
		"b0o/schemastore.nvim"
	},
	-- {
	-- 	"j-hui/fidget.nvim",
	-- 	config = function()
	-- 		require("fidget").setup()
	-- 	end,
	-- },
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{ 'echasnovski/mini.align', version = false }
}
