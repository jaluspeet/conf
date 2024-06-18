vim.api.nvim_create_autocmd('TermOpen', { command = 'setlocal nonumber norelativenumber | startinsert' })
vim.api.nvim_create_autocmd('FileType', { pattern = 'qf', command = "setlocal nonumber norelativenumber" })

function Run(...)
	local command = table.concat({ ... }, " ")
	vim.api.nvim_command('TermExec go_back=0 cmd="' .. command .. '"')
end

vim.api.nvim_create_user_command('Run', "lua Run(<f-args>)", { nargs = "?", complete = "shellcmd" })
