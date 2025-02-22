require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  palette_overrides = {
      dark0_soft = "#b3b1a8",
      dark1 = "#3c3836",
      dark2 = "#252525",
      dark3 = "#665c54",
      dark4 = "#7c6f64",
      bright_red = "#bc93db",
      bright_green = "#7487ae",
      bright_yellow = "#359184",
      bright_blue = "#fdb542",
      bright_purple = "#fdb542",
      bright_aqua = "#a5d3e6",
      bright_orange = "#c8c4cc",
      neutral_red = "#cc241d",
      neutral_green = "#98971a",
      neutral_yellow = "#d79921",
      neutral_blue = "#458588",
      neutral_purple = "#fdb542",
      neutral_aqua = "#ae8759",
      neutral_orange = "#d65d0e",
      faded_red = "#9d0006",
      faded_green = "#79740e",
      faded_yellow = "#b57614",
      faded_blue = "#076678",
      faded_purple = "#8f3f71",
      faded_aqua = "#ae8759",
      faded_orange = "#af3a03",
      gray = "#928374",
  },
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})

vim.api.nvim_create_user_command('ColorGruv',
    function()
        vim.cmd("colorscheme gruvbox")
        require('DefaultConfig.plugins.colors').groups(false)
    end,
  {nargs = 0, desc = 'Applies the gruvbox colorscheme'})
