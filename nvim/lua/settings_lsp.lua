-- start rust-tools with default settings
require('rust-tools').setup({})

-- local lsp_status = require('lsp-status')
-- lsp_status.register_progress()


local nvim_lsp = require'lspconfig'
local cmp = require'cmp'
local capabilities = require('cmp_nvim_lsp').default_capabilities()


-- setup completion plugin
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    -- beatify completion windows
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    -- use default mapping
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), 
    }),
    -- setup source from lsp and vsnip
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })

})

-- Your usual LSP setup
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o> (omnifunc setup is fallback)
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD'              , '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd'              , '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K'               , '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi'              , '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>'           , '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D'        , '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn'       , '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>a'        , '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr'              , '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e'        , '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '<space>q'        , '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f'        , "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- this require archived plugin
  --require'completion'.on_attach(client)
end

-- for rust-analzyer (only rust get special treatment lol)
local ranalyzeropts = {
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
}
nvim_lsp.rust_analyzer.setup(ranalyzeropts)

nvim_lsp.clangd.setup({
    on_attach=on_attach,
    capabilities=capabilities,
})

nvim_lsp.pylsp.setup({
    on_attach=on_attach,
    capabilities=capabilities,
})

nvim_lsp.dartls.setup({
    on_attach=on_attach,
    capabilities=capabilities,
})
nvim_lsp.tsserver.setup({
    on_attach=on_attach,
    capabilities=capabilities,
})
nvim_lsp.html.setup({
    on_attach=on_attach,
    capabilities=capabilities,
})
nvim_lsp.cssls.setup({
    on_attach=on_attach,
    capabilities=capabilities,
})
nvim_lsp.hls.setup({
    on_attach=on_attach,
    capabilities=capabilities,
})
nvim_lsp.astro.setup({
    on_attach=on_attach,
    capabilities=capabilities,
})

