return {
  -- 1. Sintaxe e Parênteses Coloridos (Essencial para Lisp)
  {
    'nvim-treesitter/nvim-treesitter',
    ensure_installed = { 'clojure' },
  },
  { 'HiPhish/rainbow-delimiters.nvim' },

  -- 2. Edição Estrutural (Para não quebrar os parênteses por acidente)
  {
    'guns/vim-sexp',
    dependencies = { 'tpope/vim-sexp-mappings-for-regular-people' },
    ft = { 'clojure', 'edn' },
  },

  -- 3. O REPL Interativo (Conjure) e ferramenta de Jack-In
  {
    'Olical/conjure',
    ft = { 'clojure', 'fennel' },
    config = function()
      -- Define o <localleader> como a tecla ',' (vírgula) para os atalhos do Conjure
      vim.g['conjure#mapping#prefix'] = ','
    end,
  },
  {
    'clojure-vim/vim-jack-in',
    dependencies = { 'tpope/vim-dispatch' },
    ft = { 'clojure' },
  },

  -- 4. LSP Config (Sintaxe moderna para o clojure-lsp)
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      -- Sintaxe moderna integrada do Neovim
      vim.lsp.config('clojure_lsp', {})
    end,
  },
}
