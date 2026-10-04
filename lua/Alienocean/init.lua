local Alienocean = {}
Alienocean.name = "Alienocean"
--- @class ColourConfig colorscheme options
local defaults = {
	transparent = false, -- set transparent bg hl
	aggressive_spell = false, -- display colors for spellcheck
	allowTextStyling = true,
	overrides = false,
}
Alienocean.opts = defaults
--- @param opts ColourConfig colorscheme opts
function Alienocean.setup(opts)
	Alienocean.opts = vim.tbl_deep_extend("force", {}, Alienocean.opts or defaults, opts or {})
end
--- @param opts ColourConfig  colorscheme opts
function Alienocean.init(opts)
	if opts then
		Alienocean.setup(opts)
	end
	vim.cmd("hi clear")
	vim.o.termguicolors = true
	vim.g.colors_name = Alienocean.name
	vim.o.background = "dark"
	vim.o.tgc = true

	local theme = require("Alienocean.theme")
	local highlights = theme.build()
	for group, attrs in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, attrs)
	end
	local palette = require("Alienocean.palette").Get()
	vim.g.terminal_color_0 = palette.bg
	vim.g.terminal_color_8 = palette.fg
	vim.g.terminal_color_1 = palette.red
	vim.g.terminal_color_9 = palette.cyan
	vim.g.terminal_color_2 = palette.pink
	vim.g.terminal_color_10 = palette.green
	vim.g.terminal_color_3 = palette.cyan
	vim.g.terminal_color_11 = palette.green
	vim.g.terminal_color_4 = palette.pink
	vim.g.terminal_color_12 = palette.purple
	vim.g.terminal_color_5 = palette.green
	vim.g.terminal_color_13 = palette.cyan
	vim.g.terminal_color_6 = palette.green
	vim.g.terminal_color_14 = palette.yellow
end
return Alienocean
