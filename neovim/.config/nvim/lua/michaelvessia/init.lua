local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

-- load lazy
require("lazy").setup("michaelvessia.plugins", {
  install = { colorscheme = { "onedark", "habamax" } },
  checker = { enabled = true }
})
vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>")

require("michaelvessia.options")
require("michaelvessia.remap")

