return {
  -- 1. LSP e Mason para Python
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = { 'basedpyright', 'ruff' },
      }

      -- Configura o Pyright para autocomplete
      vim.lsp.config('basedpyright', {})
      -- Configura o Ruff para Linting rápido
      vim.lsp.config('ruff', {})
    end, -- <-- Aqui fecha a função config de forma correta
  },

  -- 2. Formatação Automática ao Salvar
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        python = { 'ruff_format' }, -- ou "black" se preferir
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },
  },

  -- 3. Seleção de Virtualenv prático
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      require('venv-selector').setup {
        auto_refresh = true,
      }
    end,
    keys = {
      -- Atalho para abrir a lista de venvs disponíveis
      { '<leader>vs', '<cmd>VenvSelect<cr>', desc = 'Selecionar Virtualenv' },
    },
  },

  -- 4. Debugger (Opcional, mas altamente recomendado)
  {
    'mfussenegger/nvim-dap-python',
    dependencies = { 'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui' },
    ft = 'python',
    config = function()
      -- Procura o debugpy no Mason
      local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
      require('dap-python').setup(path)
    end,
  },
}
