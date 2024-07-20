vim.opt.guicursor = ""
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 15
vim.g.paste = true
vim.o.autoindent = true
vim.g.autowrite = true
vim.g.autowriteall = true
vim.o.hlsearch = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false
vim.o.mouse = 'a'
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.wrap = false
vim.g.filetype = "on"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.title = true
vim.opt.laststatus = 3
vim.o.pumheight = 10
vim.opt.showmode = false
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.o.cursorline = true

vim.api.nvim_set_hl(0, 'CopilotSuggestion', { link = 'Folded' })
vim.api.nvim_set_hl(0, 'Normal', { ctermbg='none' })
vim.api.nvim_set_hl(0, 'DiagnosticError', { bg='NvimDarkRed', fg='NvimLightRed' })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { bg='NvimDarkYellow', fg='NvimLightYellow' })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { bg='NvimDarkCyan', fg='NvimLightCyan' })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { bg='NvimDarkBlue', fg='NvimLightBlue' })
vim.api.nvim_set_hl(0, 'DiagnosticOk', { bg='NvimDarkGreen', fg='NvimLightGreen' })
vim.fn.sign_define('DapBreakpoint', { text = 'BR', texthl = 'Error', numhl = 'Error' })

vim.api.nvim_create_autocmd('TermOpen', { command = 'setlocal nonumber norelativenumber | startinsert' })
vim.api.nvim_create_autocmd('FileType', { pattern = 'qf', command = "setlocal nonumber norelativenumber" })
