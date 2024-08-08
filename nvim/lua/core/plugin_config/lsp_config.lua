-- Import lspconfig
local lspconfig = require("lspconfig")

-- Configure lua_ls
lspconfig.lua_ls.setup({})

-- Configure rust_analyzer
lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {},
	},
})

-- Configure pyright
lspconfig.pyright.setup({})

-- Configure gopls
lspconfig.gopls.setup({})

-- Configure clangd
lspconfig.clangd.setup({})

local config = {
  cmd = {'java-lsp.sh'},  -- You'll need to create a script to start jdtls
  root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
  settings = {
    java = {}
  }
}

lspconfig.jdtls.setup(config)
