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
			{ 'hrsh7th/nvim-cmp' },                            -- Required
			{ 'hrsh7th/cmp-nvim-lsp' },                        -- Required
			{ 'hrsh7th/cmp-path' },                            -- Optional
			{ 'hrsh7th/cmp-nvim-lsp-signature-help' },         -- Optional
			{ "L3MON4D3/LuaSnip",                   run = "make install_jsregexp" } -- Optional
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
				underline = true,
				virtual_text = true
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
					['<C-e>'] = require('cmp').mapping.abort(),
					['<C-b>'] = require('cmp').mapping.scroll_docs(-4),
					['<C-f>'] = require('cmp').mapping.scroll_docs(4),

				},

				autocomplete = true,
				completion = {
					completeopt = 'menu,menuone,noinsert,noselect'
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

	-- auto indent
	use { 'Darazaki/indent-o-matic', config = function()
		require('indent-o-matic').setup {}
	end }

	-- terminal
	use { "akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup {
			size = function(term)
				if term.direction == "horizontal" then
					return vim.o.lines * 0.2
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<C-s>]],
			close_on_exit = false,
		}
	end }

	-- statusline
	use { 'eduardo-antunes/plainline', config = function()
		require('plainline').setup()
	end }

	-- autosave
	use { 'Pocco81/auto-save.nvim', config = function()
		require("auto-save").setup()
	end }

	-- debug
	use { 'mfussenegger/nvim-dap' }
	use { 'jay-babu/mason-nvim-dap.nvim', config = function()
		require("mason-nvim-dap").setup {
			handlers = {}
		}
	end }
	use { 'theHamsta/nvim-dap-virtual-text', config = function()
		require("nvim-dap-virtual-text").setup {
			commented = true
		}
	end }
	use { "rcarriga/nvim-dap-ui", requires = { "nvim-neotest/nvim-nio" }, config = function()
		require("dapui").setup()
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end }

	-- file browser
	use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }, config = function()
		require("nvim-tree").setup()
	end }

	-- quickfix
	use { 'yorickpeterse/nvim-pqf', config = function()
		require('pqf').setup()
	end }

	-- indent lines
	use { "lukas-reineke/indent-blankline.nvim", config = function()
		require("ibl").setup()
	end }

	-- plugins over this
	if packer_bootstrap then
		require('packer').sync()
	end
end)
