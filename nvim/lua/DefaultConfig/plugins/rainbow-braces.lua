local rainbow_delimiters = require('rainbow-delimiters')

require('rainbow-delimiters.setup').setup {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        latex = rainbow_delimiters.strategy['noop'],
    },

    query = {
        [''] = 'rainbow-delimiters',
        latex = 'rainbow-blocks',
        -- elixir = 'rainbow-blocks', --This doesn't work
    },

    priority = {
        [''] = 210,
    },

    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan'
    }
}
