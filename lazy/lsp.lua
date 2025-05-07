return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		{ "ms-jpq/coq_nvim", branch = "coq" },
		{ "ms-jpq/coq.artifacts", branch = "artifacts" },
		{ 'ms-jpq/coq.thirdparty', branch = "3p" },
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip"
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"gopls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup {}
				end
			}
		})
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

					-- For `mini.snippets` users:
					-- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
					-- insert({ body = args.body }) -- Insert at cursor
					-- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
					-- require("cmp.config").set_onetime({ sources = {} })
				end,
			},
			window = {},
			mapping = {
				["C-y"] = cmp.mapping.confirm({ select = true }),
				["C-x"] = cmp.mapping.abort(),
				["C-j"] = cmp.mapping.select_next_item(),
				["C-k"] = cmp.mapping.select_prev_item(),
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'vsnip' }, -- For vsnip users.
				-- { name = 'luasnip' }, -- For luasnip users.
				-- { name = 'ultisnips' }, -- For ultisnips users.
				-- { name = 'snippy' }, -- For snippy users.
			}, {
				{ name = 'buffer' },
			})
		})
	end,
}

