
local nvim_lsp = vim.lsp.config
local cmp = require'cmp'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- setup completion plugin
cmp.setup({
    snippet = {
        expand = function(args)
            --vim.fn["vsnip#anonymous"](args.body)
            require('luasnip').lsp_expand(args.body)
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
      ['<CR>'] = cmp.mapping.confirm({ select = true }), 
    }),
    -- setup source from lsp and vsnip
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        --{ name = 'luasnip' },
    }, {
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help' },
    })

})

-- Your usual LSP setup
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o> (omnifunc setup is fallback)
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=false }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD'              , '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd'              , '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K'               , '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi'              , '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>'           , '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D'        , '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn'       , '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>a'        , '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr'              , '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e'        , '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '<space>q'        , '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f'        , "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)

end


nvim_lsp('rust_analyzer', {
    on_attach=on_attach,
    capabilities=capabilities,

    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true,
                --target = "wasm32-unknown-unknown",
            },
            -- procMacro = {
            --     enable = true
            -- },
            -- experimental = {
            --     procAttrMacros = true
            -- },
        }
    },
})

nvim_lsp('clangd',{
    on_attach=on_attach,
    capabilities=capabilities,
})

nvim_lsp('pylsp',{
    on_attach=on_attach,
    capabilities=capabilities,
})

nvim_lsp('dartls',{
    on_attach=on_attach,
    capabilities=capabilities,
})

nvim_lsp('ts_ls',{
    on_attach=on_attach,
    capabilities=capabilities,
})

nvim_lsp('html',{
    on_attach=on_attach,
    capabilities=capabilities,
    filetypes = {
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
        "jinja",
    }

})

nvim_lsp('jinja_lsp',{
    on_attach=on_attach,
    capabilities=capabilities,

    filetypes = { 'jinja', 'rust', 'html' },
    init_options = {
        templates = './templates',
        backend = { './src' },
        lang = "rust"
    },
})

nvim_lsp('cssls',{
    on_attach=on_attach,
    capabilities=capabilities,
})

nvim_lsp('tailwindcss',{
    on_attach=on_attach,
    capabilities=capabilities,

    filetypes = {
        --"rust",
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
        "jinja",
        "htmldjango",
    },
    --init_options = {
    --    userLanguages = {
    --        rust = "html",
    --    },
    --},
})

--local slint_setting = {
--    on_attach=on_attach,
--
--    capabilities=capabilities,
--
--    filetypes = { 
--        "slint",
--        "rust",
--    },
--}

-- This is important because nvim will shit on you about multiple 
-- offset_encodings not supported (yet)
--slint_setting.capabilities.offsetEncoding = 'utf-8'
--nvim_lsp('slint_lsp',slint_setting)

nvim_lsp('cmake',{
    on_attach=on_attach,
    capabilities=capabilities,
})

nvim_lsp('ocamllsp',{
    on_attach=on_attach,
    capabilities=capabilities,
})

nvim_lsp('gopls',{
    on_attach=on_attach,
    capabilities=capabilities,
})

