vim.g.netrw_banner = 0
vim.g.netrw_winsize = 15
vim.g.paste = true
vim.o.termguicolors = false
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
vim.o.cursorline = true
vim.wo.wrap = false
vim.g.filetype = "on"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.title = true
vim.opt.laststatus = 3
vim.o.pumheight = 10
vim.opt.showmode = false
vim.o.cmdheight = 0
vim.o.signcolumn = 'number'
vim.o.fillchars='eob: '
vim.cmd([[aunmenu PopUp.How-to\ disable\ mouse]])
vim.cmd([[aunmenu PopUp.-1-]])

vim.api.nvim_create_autocmd('TermOpen', { command = 'setlocal nonumber norelativenumber' })
vim.api.nvim_create_autocmd('FileType', { pattern = 'qf', command = 'setlocal norelativenumber' })
vim.api.nvim_create_autocmd('FileType', { pattern = 'dap-repl', command = 'setlocal nonumber norelativenumber | lua require("dap.ext.autocompl").attach()' })
vim.fn.sign_define('DapBreakpoint', { text = 'BR', texthl = 'DiffDelete', numhl = 'DiffDelete' })
