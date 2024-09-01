return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- A list of servers to automatically install if they're not already installed.
				-- This setting has no relation with the `automatic_installation` setting.
				ensure_installed = { "lua_ls", "texlab", "clangd", "basedpyright", "ruff", "rust_analyzer", "jdtls" },
			})
		end,
	},
	{
		{
			"neovim/nvim-lspconfig",
			config = function()
				local capabilities = require("cmp_nvim_lsp").default_capabilities()

				-- setup all lsps here; add more as you need
				local lspconfig = require("lspconfig")
				lspconfig.lua_ls.setup({ capabilities = capabilities })
				lspconfig.texlab.setup({ capabilities = capabilities })
				lspconfig.clangd.setup({ capabilities = capabilities })
				lspconfig.ruff.setup({ capabilities = capabilities })
				lspconfig.basedpyright.setup({ capabilities = capabilities })
				lspconfig.rust_analyzer.setup({ capabilities = capabilities })
				lspconfig.jdtls.setup({ capabilities = capabilities })

				vim.keymap.set("n", "<leaderq", function()
					require("telescope.builtin").diagnostics({
						bufnr = 0,
						line_width = 0,
						layout_strategy = "horizontal",
						layout_config = {
							width = function(_, max_columns)
								local percentage = 0.6
								local max = 100
								return math.min(math.floor(percentage * max_columns), max)
							end,
							height = 0.4,
							prompt_position = "top",
							preview_width = 0.5,
						},
						sorting_strategy = "ascending",
					})
				end, {})

				-- Use LspAttach autocommand to only map the following keys
				-- after the language server attaches to the current buffer
				vim.api.nvim_create_autocmd("LspAttach", {
					group = vim.api.nvim_create_augroup("UserLspConfig", {}),
					callback = function()
						-- Mappings
						vim.keymap.set("n", "<leader>gd", function()
							require("telescope.builtin").lsp_definitions({
								bufnr = 0,
								line_width = 0,
								layout_strategy = "horizontal",
								layout_config = {
									width = 0.6,
									height = 0.6,
									prompt_position = "top",
									preview_width = 0.7,
								},
								sorting_strategy = "ascending",
							})
						end, --[[ vim.lsp.buf.type_definition ]] {})
						vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
						vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
						vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
						vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
						vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
						vim.keymap.set("n", "<leader>gr", function()
							require("telescope.builtin").lsp_references({
								layout_strategy = "cursor",
								layout_config = {
									width = function(_, max_columns)
										local percentage = 0.7
										local max = 80
										return math.min(math.floor(percentage * max_columns), max)
									end,
									preview_cutoff = 60,
									preview_width = 0.5,
									height = 0.4,
								},
								sorting_strategy = "ascending",
								show_line = false,
								trim_text = true,
							})
						end, { noremap = true, silent = true })

						-- move between diagnostics
						local diagnostic_goto = function(next, severity)
							local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
							severity = severity and vim.diagnostic.severity[severity] or nil
							return function()
								go({ severity = severity })
							end
						end
						vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
						vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
						vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
						vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
						vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
						vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
						vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
					end,
				})

				-- change highlight appearance for errors, warnings, etc
				local hl_groups = {
					"ErrorText",
					"WarningText",
					"HintText",
					"InfoText",
					"DiagnosticUnderlineError",
					"DiagnosticUnderlineWarn",
					"DiagnosticUnderlineHint",
					"DiagnosticUnderlineInfo",
				}
				for _, hl in ipairs(hl_groups) do
					vim.cmd.highlight(hl .. " gui=underline")
				end
			end,
		},
	},
}
