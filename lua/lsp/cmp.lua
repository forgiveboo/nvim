require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require'lspconfig'.pyright.setup{
	on_attach = on_attach,
  flags = lsp_flags,
}
