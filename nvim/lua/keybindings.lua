vim.g.mapleader = ' '

-- open
vim.keymap.set({ 'n', 'v' }, '<C-x>', ':Run<UP>', { silent = true, desc = "Run" })
vim.keymap.set({ 'n', 'v' }, '<C-n>', vim.cmd.noh, { silent = true, desc = "Clear" })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-b>', vim.cmd.Lex, { silent = true, desc = "Sidebar" })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-s>', require('toggleterm').toggle, { silent = true, desc = "Terminal" })

-- search
vim.keymap.set({ 'n', 'v' }, '<leader><leader>', require('telescope.builtin').builtin, { silent = true, desc = "Search" })
vim.keymap.set({ 'n', 'v' }, '<leader>f', require('telescope.builtin').find_files, { silent = true, desc = "Find" })
vim.keymap.set({ 'n', 'v' }, '<leader>s', require('telescope.builtin').live_grep, { silent = true, desc = "Grep" })
vim.keymap.set({ 'n', 'v' }, '<leader>c', require('telescope.builtin').commands, { silent = true, desc = "Commands" })
vim.keymap.set({ 'n', 'v' }, '<leader>b', require('telescope.builtin').buffers, { silent = true, desc = "Buffers" })
vim.keymap.set({ 'n', 'v' }, '<leader>g', require('telescope.builtin').git_status, { silent = true, desc = "Git" })

-- lsp
vim.keymap.set({ 'n', 'v' }, '<leader>e', vim.diagnostic.setqflist, { silent = true, desc = "Errors" })
vim.keymap.set({ 'n', 'v' }, '<leader>r', vim.lsp.buf.rename, { silent = true, desc = "Rename" })
vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, { silent = true, desc = "Action" })
vim.keymap.set({ 'n', 'v' }, 'K', vim.lsp.buf.hover, { silent = true, desc = "Hover" })
vim.keymap.set({ 'n', 'v' }, 'ge', vim.diagnostic.goto_prev, { silent = true, desc = 'Prev error' })
vim.keymap.set({ 'n', 'v' }, 'gE', vim.diagnostic.goto_next, { silent = true, desc = 'Next error' })
vim.keymap.set({ 'n', 'v' }, 'gi', require('telescope.builtin').lsp_implementations, { silent = true, desc = "Implementation" })
vim.keymap.set({ 'n', 'v' }, 'gt', require('telescope.builtin').lsp_type_definitions, { silent = true, desc = "Type definition" })
vim.keymap.set({ 'n', 'v' }, 'gd', require('telescope.builtin').lsp_definitions, { silent = true, desc = "Definition" })
vim.keymap.set({ 'n', 'v' }, 'gr', require('telescope.builtin').lsp_references, { silent = true, desc = "References" })
vim.keymap.set({ 'n', 'v' }, 'gs', vim.lsp.buf.signature_help, { silent = true, desc = "Signature help" })
vim.keymap.set({ 'n', 'v' }, 'gD', vim.lsp.buf.declaration, { silent = true, desc = "Declaration" })
vim.keymap.set("i", "<C-Space>", 'copilot#Accept("<CR>")', { silent = true, expr = true, replace_keycodes = false, desc = "Copilot" })

-- move
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-q>', vim.cmd.x, { silent = true, desc = "Close" })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-Tab>', vim.cmd.tabnext, { silent = true, desc = "Next tab" })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-S-Tab>', vim.cmd.tabprevious, { silent = true, desc = "Prev tab" })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-t>', vim.cmd.tabnew, { silent = true, desc = "New tab" })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-h>', function() vim.cmd.wincmd('h') end, { silent = true, desc = 'Move left' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-j>', function() vim.cmd.wincmd('j') end, { silent = true, desc = 'Move down' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-k>', function() vim.cmd.wincmd('k') end, { silent = true, desc = 'Move up' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-l>', function() vim.cmd.wincmd('l') end, { silent = true, desc = 'Move right' })
