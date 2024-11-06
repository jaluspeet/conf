vim.g.mapleader = ' '

-- open
vim.keymap.set({ 'n', 'v' }, '<leader>n', vim.cmd.noh, { desc = "Clear" })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-b>', function() vim.cmd.Lexplore{ bang = true } end, { desc = "Sidebar" })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-s>', require('toggleterm').toggle, { desc = "Terminal" })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-x>', ":Telescope make<CR>", { desc = "Make" })

-- search
vim.keymap.set({ 'n', 'v' }, '<leader><leader>', require('telescope.builtin').builtin, { desc = "Search" })
vim.keymap.set({ 'n', 'v' }, '<leader>f', require('telescope.builtin').find_files, { desc = "Find" })
vim.keymap.set({ 'n', 'v' }, '<leader>s', require('telescope.builtin').live_grep, { desc = "Grep" })
vim.keymap.set({ 'n', 'v' }, '<leader>c', require('telescope.builtin').commands, { desc = "Commands" })
vim.keymap.set({ 'n', 'v' }, '<leader>b', require('telescope.builtin').buffers, { desc = "Buffers" })
vim.keymap.set({ 'n', 'v' }, '<leader>o', require('telescope.builtin').lsp_document_symbols, { desc = "Outline" })

-- lsp
vim.keymap.set({ 'n', 'v' }, '<leader>e', vim.diagnostic.setqflist, { desc = "Errors" })
vim.keymap.set({ 'n', 'v' }, '<leader>r', vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, { desc = "Action" })
vim.keymap.set({ 'n', 'v' }, 'K', vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set({ 'n', 'v' }, 'ge', vim.diagnostic.goto_prev, { desc = 'Prev error' })
vim.keymap.set({ 'n', 'v' }, 'gE', vim.diagnostic.goto_next, { desc = 'Next error' })
vim.keymap.set({ 'n', 'v' }, 'gi', require('telescope.builtin').lsp_implementations, { desc = "Implementation" })
vim.keymap.set({ 'n', 'v' }, 'gt', require('telescope.builtin').lsp_type_definitions, { desc = "Type definition" })
vim.keymap.set({ 'n', 'v' }, 'gd', require('telescope.builtin').lsp_definitions, { desc = "Definition" })
vim.keymap.set({ 'n', 'v' }, 'gr', require('telescope.builtin').lsp_references, { desc = "References" })
vim.keymap.set({ 'n', 'v' }, 'gs', vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set({ 'n', 'v' }, 'gD', vim.lsp.buf.declaration, { desc = "Declaration" })
-- vim.keymap.set("i", "<C-Space>", 'copilot#Accept("<CR>")', { silent = true, expr = true, replace_keycodes = false, desc = "Copilot" })

-- move
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-q>', vim.cmd.x, { desc = "Close" })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-Tab>', vim.cmd.tabnext, { desc = "Next tab" })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-S-Tab>', vim.cmd.tabprevious, { desc = "Prev tab" })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-t>', vim.cmd.tabnew, { desc = "New tab" })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-h>', function() vim.cmd.wincmd('h') end, { desc = 'Move left' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-j>', function() vim.cmd.wincmd('j') end, { desc = 'Move down' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-k>', function() vim.cmd.wincmd('k') end, { desc = 'Move up' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-l>', function() vim.cmd.wincmd('l') end, { desc = 'Move right' })
