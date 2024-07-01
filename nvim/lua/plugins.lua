-- packer bootstrap
-- installs plugins on first run, :PackerSync to update

local ensure_packer = function()
	local install_path = vim.fn.stdpath('data') ..
	    '/site/pack/packer/start/packer.nvim'
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system({ 'git', 'clone', '--depth', '1',
			'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- plugins under this

	-- LSP (language server protocol)
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{ 'williamboman/mason.nvim' }, -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lsp-signature-help' }, -- Optional
			{ "L3MON4D3/LuaSnip", run = "make install_jsregexp" } -- Optional
		},

		config = function()
			require('lsp-zero').preset().nvim_workspace()
			require('lsp-zero').preset().ensure_installed { 'lua_ls' }
			require('lsp-zero').preset().set_sign_icons {
				error = 'x',
				warn = '!',
				hint = '~',
				info = '?'
			}

			vim.diagnostic.config {
				virtual_text = true,
				underline = true,
			}

			require('cmp').setup {
				sources = {
					{ name = 'path' },
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lsp_signature_help' }
				},
				mapping = {
					['<Tab>'] = require('lsp-zero').cmp_action().luasnip_supertab(),
					['<S-Tab>'] = require('lsp-zero').cmp_action().luasnip_shift_supertab(),
					['<CR>'] = require('cmp').mapping.confirm({ select = true }),
					['<S-Up>'] = require('cmp').mapping.scroll_docs(-4),
					['<S-Down>'] = require('cmp').mapping.scroll_docs(4),
				},
				preselect = 'item',
				autocomplete = true,
				completion = {
					completeopt = 'menu,menuone,noinsert'
				}
			}

			require('lsp-zero').preset().setup()
		end }

	-- treesitter
	use { 'nvim-treesitter/nvim-treesitter', config = function()
		require('nvim-treesitter.configs').setup {
			auto_install = true,
			highlight = { enable = true },
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"comment",
				"jsdoc",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"meson",
			}
		}
	end }

	-- git
	use { 'lewis6991/gitsigns.nvim', config = function()
		require('gitsigns').setup()
	end }

	-- comments (gc / gcc)
	use { 'numToStr/Comment.nvim', config = function()
		require('Comment').setup()
	end }

	-- telescope
	use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = function()
		require('telescope').setup {
			defaults = {
				results_title = false,
				dynamic_preview_title = true,
				borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
				layout_config = {
					preview_width = 0.65,
					height = vim.o.lines,
      					width = vim.o.columns,
				},
			}
		}
	end }

	-- terminal
	use { "akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup {
			open_mapping = [[<C-s>]],
			shade_terminals = false,
			close_on_exit = false,
		}
	end }

	-- indentation
	use 'Darazaki/indent-o-matic'

	-- statusline
	use { 'eduardo-antunes/plainline', config = function()
		require('plainline').setup()
	end }

	-- copilot
	use 'github/copilot.vim'

	-- plugins over this
	if packer_bootstrap then
		require('packer').sync()
	end
end)
