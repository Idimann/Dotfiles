local configMax = 0

local configTable = {
    [0] = "DefaultConfig"
}

local applyConfig = function(config)
    require(configTable[config])
end

applyConfig(0)

vim.api.nvim_create_user_command('Config',
    function(args)
        local config = tonumber(args.args)
        if config then
            if config <= configMax then
                print("Applied Config!")
                applyConfig(config)
            else
                print("Couldn't apply config. Max is:", configMax)
            end
        end
    end,
    {nargs = 1, desc = 'Applies the config'})
