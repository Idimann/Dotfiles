require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.qol.todo_items"] = {},
        ["core.itero"] = {},
        ["core.pivot"] = {},
        ["core.summary"] = {},
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/Notes",
                },

                default_workspace = "notes",
            },
        },
    },
}

--vim.cmd(':Neorg sync-parsers')
