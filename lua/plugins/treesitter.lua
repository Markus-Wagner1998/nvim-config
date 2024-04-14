return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "bash", "lua", "java", "javascript", "json", "jq", "terraform", "typescript", "yaml" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
