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
					['<C-Space>'] = require('cmp').mapping.complete(),
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

	-- DAP (debug adapter protocol)
	use { 'mfussenegger/nvim-dap', config = function()
		require('dap').defaults.fallback.terminal_win_cmd = 'vnew'
	end }
	use { 'rcarriga/cmp-dap', config = function()
		require("cmp").setup({
			enabled = function()
				return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
				    or require("cmp_dap").is_dap_buffer()
			end
		})
		require("cmp").setup.filetype({ "dap-repl" }, {
			sources = {
				{ name = "dap" },
			},
		})
	end }
	use { 'jay-babu/mason-nvim-dap.nvim', config = function()
		require("mason-nvim-dap").setup {
			handlers = {},
		}
	end }
	use { 'theHamsta/nvim-dap-virtual-text', config = function()
		require("nvim-dap-virtual-text").setup()
	end }

	-- project
	use { "ahmedkhalf/project.nvim", config = function()
		require("project_nvim").setup()
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

	-- le rotelle
       use { "folke/which-key.nvim", config = function()
               vim.o.timeout = true
               vim.o.timeoutlen = 300
               require("which-key").setup {
                       icons = {
                               breadcrumb = "/",
                               separator = "-",
                               group = "+",
                       },
               }
       end }

	-- colorscheme
	use { "EdenEast/nightfox.nvim", config = function()
		require('nightfox').setup { options = { transparent = true } }
		vim.cmd("colorscheme carbonfox")
		vim.api.nvim_set_hl(0, 'WinSeparator', { link = 'LineNr' })
		vim.fn.sign_define('DapBreakpoint', { text = 'BR', texthl = 'Error', numhl = 'Error' })
	end }

	-- statusline
	use { 'nvim-lualine/lualine.nvim', config = function()
		require('lualine').setup {
			options = {
				theme = 'modus-vivendi',
				icons_enabled = false,
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
			},
		}
	end }

	-- plugins over this
	if packer_bootstrap then
		require('packer').sync()
	end
end)
