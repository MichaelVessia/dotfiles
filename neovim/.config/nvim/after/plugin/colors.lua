function SetColorTheme(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)
end

SetColorTheme()
