local M = {}

-- Default configuration
M.config = {
	enabled = true,
	exceptions = {}, -- Buffer types where line numbers should remain visible
}

-- Setup function to initialize the plugin
function M.setup(opts)
	-- Merge user config with defaults
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})

	-- Create autocommands
	local group = vim.api.nvim_create_augroup("TermLineHide", { clear = true })

	vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter" }, {
		group = group,
		callback = function()
			if M.config.enabled then
				-- Hide line numbers in terminal
				vim.wo.number = false
				vim.wo.relativenumber = false
			end
		end,
	})

	vim.api.nvim_create_autocmd("TermLeave", {
		group = group,
		callback = function()
			-- Restore line numbers when leaving terminal mode
			vim.wo.number = true
			vim.wo.relativenumber = true
		end,
	})
end

-- Command to toggle the plugin
function M.toggle()
	M.config.enabled = not M.config.enabled
	if M.config.enabled then
		print("TermLineHide enabled")
	else
		print("TermLineHide disabled")
	end
end

return M
