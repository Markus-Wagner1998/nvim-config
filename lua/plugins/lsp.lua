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
                    "docker_compose_language_server",
                    "gh_actions_ls",
                    "bashls"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities();
            local lspconfig = require("lspconfig");
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            });
            lspconfig.ts_ls.setup({
                capabilities = capabilities
            });
            lspconfig.jdtls.setup({
                capabilities = capabilities
            });
            lspconfig.jsonls.setup({
                capabilities = capabilities
            });
            lspconfig.terraformls.setup({
                capabilities = capabilities
            });
            lspconfig.dockerls.setup({
                capabilities = capabilities
            });
            lspconfig.docker_compose_language_server.setup({
                capabilities = capabilities,
            });
            lspconfig.gh_actions_ls.setup({
                capabilities = capabilities,
            });
            lspconfig.bashls.setup({
                capabilities = capabilities,
            });
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
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
                    vim.api.nvim_set_keymap("i", "<C-Space>", "<C-x><C-o>", { noremap = true, silent = true })

                    local builtin = require("telescope.builtin")
                    vim.keymap.set("n", "<leader>gr", builtin.lsp_references, opts);
                    vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, opts);
                    vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, opts);
                end,
            })
        end
    }
}
