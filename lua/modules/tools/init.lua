-- https://bryankegley.me/posts/nvim-getting-started/
local conf = require("modules.tools.config")
local tools = {
    {
        "dstein64/vim-startuptime",
        opt = true, 
        cmd = "StartupTime"
    },
    {
        "nvim-lua/popup.nvim"
    },
    {
        "nvim-lua/plenary.nvim"
    },
    {
        "nvim-lua/telescope.nvim",
        config = conf.telconf
    },
    {
        "jremmen/vim-ripgrep"
    },
    {
        "lukas-reineke/format.nvim",
        cmd = {"Format", "FormatWrite"},
        config = conf.format
    }

}
return tools
