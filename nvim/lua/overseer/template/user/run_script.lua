return {
	name = "run script",
	builder = function()
		local file = vim.fn.expand("%:p")
		local cmd = { file }
		local ft = vim.bo.filetype
		if ft == "go" then
			cmd = { "go", "run", file }
		elseif ft == "python" then
			cmd = { "python", file }
		end
		return {
			cmd = cmd,
			components = {
				{ "on_output_quickfix", set_diagnostics = true },
				"on_result_diagnostics",
				"default",
			},
		}
	end,
	condition = {
		filetype = { "sh", "python", "go" },
	},
}
