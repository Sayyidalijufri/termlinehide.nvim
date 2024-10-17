if vim.fn.has("nvim-0.7.0") == 0 then
	vim.api.nvim_err_writeln("TermLineHide requires at least Neovim v0.7.0")
	return
end

-- Prevent loading multiple times
if vim.g.loaded_termlinehide == 1 then
	return
end
vim.g.loaded_termlinehide = 1

-- Create user commands
vim.api.nvim_create_user_command("TermLineHideToggle", function()
	require("termlinehide").toggle()
end, {})
