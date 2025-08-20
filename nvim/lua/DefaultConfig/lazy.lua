local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
    },

    'nvim-treesitter/nvim-treesitter-context',

    -- {
    --     'stevearc/oil.nvim',
    --
    --     dependencies = { { "echasnovski/mini.icons", opts = {} } }
    -- },

    {
        'saghen/blink.cmp',

        build = 'cargo build --release',
        dependencies = 'rafamadriz/friendly-snippets',

        opts = {
            keymap = {
                preset = 'default',
                --<C-Space> is preset to show_documentation (works)
                --<C-k> is preset to show_signature (doesn't work)
            },

            completion = {
                ghost_text = {
                    enabled = false
                },

                documentation = {
                    auto_show = false,
                    auto_show_delay_ms = 1000,

                    window = {
                        border = 'single', --'none',
                    }
                },

                menu = {
                    border = 'none', --'single',
                    scrollbar = false,
                    min_width = 15,
                    max_height = 6,
                    scrolloff = 3,

                    auto_show = true,
                    draw = {
                        columns = {
                            { "kind_icon", gap = 1 },
                            { "label", },
                        },
                    },
                },

            },


            sources = {
                default = { 'lsp', 'buffer' },
                providers = {
                    buffer = {
                        opts = {
                            get_bufnrs = function()
                                return vim.tbl_filter(function(bufnr)
                                    return vim.bo[bufnr].buftype == ''
                                end, vim.api.nvim_list_bufs())
                            end
                        }
                    }
                },

                min_keyword_length = function(ctx)
                    if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then
                        return 2
                    end

                    if CmpState then
                        return 0
                    end

                    return 2
                end
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            cmdline = {
                completion = {
                    menu = {
                        auto_show = function()
                            return not vim.tbl_contains({ '/', '?' },
                                vim.fn.getcmdtype())
                        end,
                    }
                },
            },

            signature = {
                enabled = true,

                trigger = {
                    enabled = false,
                },

                window = {
                    border = 'single', --'none'
                }
            }
        },
    },

    "neovim/nvim-lspconfig",

    'lervag/vimtex',

    'rose-pine/neovim',
    'catppuccin/nvim',
    'marko-cerovac/material.nvim',
    -- 'folke/tokyonight.nvim',
    -- 'ellisonleao/gruvbox.nvim',
    -- 'blazkowolf/gruber-darker.nvim',
    -- 'vague2k/vague.nvim',

    'nvim-treesitter/playground',

    {
        'HiPhish/rainbow-delimiters.nvim',
        lazy = false,
    },

    'norcalli/nvim-colorizer.lua',

    {
        'thePrimeagen/harpoon',
        branch = 'harpoon2',
    },

    'mbbill/undotree',

    'tpope/vim-repeat',

    -- 'kdheepak/lazygit.nvim',
    'tpope/vim-fugitive',

    'kyazdani42/nvim-web-devicons',

    "folke/zen-mode.nvim",

    --'nvim-tree/nvim-tree.lua',

    --'nvim-lualine/lualine.nvim'

})
