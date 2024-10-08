require("options")
require("keymaps")
require("autocmd")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Config and install plugins ]]
require("lazy").setup({
	-- performance = {
	-- 	startuptime = function()
	-- 		print("Neovim startup time: " .. vim.fn.reltimestr(vim.fn.getstartuptime()))
	-- 	end,
	-- },
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	{ "tpope/vim-sleuth", event = { "BufReadPre", "BufNewFile" } }, -- Detect tabstop and shiftwidth automatically

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				dim_inactive = false,
				-- contrast = "soft",
				transparent_mode = false,
				overrides = {
					MiniIndentscopeSymbol = { link = "GruvboxOrangeBold" },
					SignColumn = { link = "GruvboxBg0" },
					-- Keyword = { link = "GruvboxOrangeBold" },
					-- DiagnosticSignHint = { link = "GruvboxAqua" },
				},
			})
			vim.o.background = "dark" -- or "light" for light mode
			vim.cmd("colorscheme gruvbox")
		end,
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	optional = true,
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = "storm", -- 你可以选择 "storm", "moon", "night" 或 "day"
	-- 			light_style = "day", -- 当背景设置为浅色时使用的主题
	-- 			transparent = false, -- 启用透明背景
	-- 			terminal_colors = true, -- 配置打开 `:terminal` 时使用的颜色
	-- 		})
	-- 		vim.cmd([[colorscheme tokyonight]])
	-- 	end,
	-- },

	-- current best multicursor IMHO
	{ "mg979/vim-visual-multi", lazy = true, keys = { { "<C-n>", mode = { "n", "x" } } } },
	{
		"folke/todo-comments.nvim",
		event = { "BufRead", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ import = "plugins" },
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
