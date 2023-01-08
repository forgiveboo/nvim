require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local cmp = require'cmp'
local lspkind = require('lspkind')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspkind').init({
    mode = 'symbol_text',
    preset = 'codicons',
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})

require'cmp'.setup {
	snippet = {
    expand = function(args)
      -- For `luasnip` users.
       require('luasnip').lsp_expand(args.body)
    end,
  },
	sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
     }, 
		 { { name = 'buffer' },
       { name = 'path' },
 			 { name = 'cmdline' },
    }),
	formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- do not show text alongside icons
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      before = function (entry, vim_item)
        -- Source 显示提示来源
        vim_item.menu = "["..string.upper(entry.source.name).."]"
        return vim_item
      end
    })
  },
	mapping = {
	  ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ['<CR>'] = cmp.mapping({
      i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      c = function(fallback)
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true})
        else
          fallback()
        end
      end
    }),
	 }
}

--[[ cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
}) ]]

require'lspconfig'.pyright.setup{
	on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require 'lspconfig'.jdtls.setup{
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
}

--[[ require 'lspconfig'.lua_language_server.setup{
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
} ]]
