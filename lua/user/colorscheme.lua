local colorscheme = "gruvbox"

-- gruvbox setting
vim.g.gruvbox_contrast_dark = "hard"
vim.o.background = "dark"

-- gruvbox-material setting
-- vim.g.gruvbox_material_palette = 'mix'
-- vim.g.gruvbox_material_background = 'hard'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
