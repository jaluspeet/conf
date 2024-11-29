vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
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
vim.o.signcolumn = 'number'
vim.o.fillchars='eob: '
vim.cmd([[aunmenu PopUp.How-to\ disable\ mouse]])
vim.cmd([[aunmenu PopUp.-1-]])

vim.cmd.colorscheme 'lunaperche'
vim.api.nvim_set_hl(0, 'Normal', { bg='NONE', ctermbg='NONE' })
vim.api.nvim_set_hl(0, 'Function', { link = 'Changed' })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, fg = 'Red' })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { undercurl = true, fg = 'Orange' })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { undercurl = true, fg = 'LightBlue' })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { undercurl = true, fg = 'LightGrey' })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineOk', { undercurl = true, fg = 'LightGreen' })
vim.api.nvim_create_autocmd('TermOpen', { command = 'setlocal nonumber norelativenumber' })
vim.api.nvim_create_autocmd('FileType', { pattern = 'qf', command = 'setlocal nonumber norelativenumber' })
vim.api.nvim_create_autocmd('FileType', { pattern = 'dap-repl', command = 'setlocal nonumber norelativenumber' })
vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', numhl = '' })
