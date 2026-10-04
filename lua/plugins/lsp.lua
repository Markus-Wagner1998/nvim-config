return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "jdtls",
                    "lua_ls",
                    "terraformls",
                    "ts_ls",
                    "dockerls",
                    "docker_compose_language_service",
                    "gh_actions_ls",
                    "bashls"
                }
            })
        end
    },
    {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- List of LSP servers to configure
		local servers = {
			"lua_ls",
			"ts_ls",
			"jdtls",
			"jsonls",
			"terraformls",
			"dockerls",
			"docker_compose_language_service",
			"gh_actions_ls",
			"bashls",
		}

		-- Apply default capabilities to all servers
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- Enable each server configuration
		for _, server in ipairs(servers) do
			vim.lsp.enable(server)
		end

		-- Set up keymaps and autocommands when LSP attaches
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(ev)
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { buffer = ev.buf, silent = true })

				local ok, builtin = pcall(require, "telescope.builtin")
				if ok then
					vim.keymap.set("n", "<leader>gr", builtin.lsp_references, opts)
					vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, opts)
					vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, opts)
				end
			end,
		})
	end,
}
}
