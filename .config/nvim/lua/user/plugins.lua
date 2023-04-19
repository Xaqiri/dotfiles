local lazy = {} 

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {
  ui = {
    width = 0.5,
    height = 0.5,
    border = 'double',
  },
}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim...')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  lazy.install(lazy.path)
  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end
lazy.setup({
  {'nvim-lua/plenary.nvim'},
  {'catppuccin/nvim', name = 'catppuccin'},
  {'decaycs/decay.nvim', name = 'decay'},
  {'cocopon/iceberg.vim', name = 'iceberg'},
  {'folke/tokyonight.nvim', name = 'tokyonight'},
  {'nvim-lualine/lualine.nvim'},
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  {'nvim-tree/nvim-web-devicons'},
  {'nvim-tree/nvim-tree.lua'},
  {'numToStr/Comment.nvim'},
  {'akinsho/toggleterm.nvim'},
  {'windwp/nvim-autopairs'},
  {'lukas-reineke/indent-blankline.nvim'},
  {'williamboman/mason.nvim', build = ':MasonUpdate'},
  {'williamboman/mason-lspconfig.nvim'},
  {'neovim/nvim-lspconfig'},
  {'folke/which-key.nvim'},
  {'NvChad/nvim-colorizer.lua'},
  {'hrsh7th/nvim-cmp', version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
  },
  opts = function()
    local cmp = require("cmp")
    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = function(_, item)
          local icons = require("lazyvim.config").icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          return item
        end,
      },
      experimental = {
        ghost_text = {
          hl_group = "LspCodeLens",
        },
      },
    }
  end,},
  {'hrsh7th/cmp-cmdline'},
  {'L3MON4D3/LuaSnip',
build = (not jit.os:find("Windows"))
      and "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
    or nil,
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
  -- stylua: ignore
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true, silent = true, mode = "i",
    },
    { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
    { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  },},
  {'rafamadriz/friendly-snippets'},
  {'saadparwaiz1/cmp_luasnip'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'folke/trouble.nvim', dependencies = {'nvim-tree/nvim-web-devicons'}},
  {'folke/todo-comments.nvim', dependencies = {'nvim-lua/plenary.nvim'}, cmd = { 'TodoTrouble', 'TodoTelescope' }},
  {'nvim-telescope/telescope-fzf-native.nvim', build = ':make' },
  {'nvim-telescope/telescope.nvim', tag = '0.1.1', dependencies = { 'nvim-lua/plenary.nvim', 'sharkdp/fd'}},
})


