local config = {}

function config.treesitter()
    require'nvim-treesitter.configs'.setup {
        ensure_installed = {"go", "bash", "json", "lua", "python"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
        ignore_install = { "javascript" }, -- List of parsers to ignore installing
        highlight = {
            enable = true,              -- false will disable the whole extension
            disable = { "c", "rust" },  -- list of language that will be disabled
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
  },
}
end

function config.bufferline()
    -- vim.opt.termguicolors = true
    require("bufferline").setup{}
end

function config.nvim_tree()
    vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

    local tree_cb = require"nvim-tree.config".nvim_tree_callback
    require("nvim-tree").setup {
        git = {enable = true, ignore = false, timeout = 500},
        ignore = {".git", "node_modules", ".cache"},
        open_on_tab = false,
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        auto_close = true,
        update_cwd = true,
        highlight_opened_files = true,
        auto_ignore_ft = {"startify", "dashboard"},
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {}
        },
        view = {
            width = 30,
            side = "left",
            auto_resize = false,
            mappings = {
                custom_only = true,
                -- list of mappings to set on the tree manually
                list = {
                    {
                        key = {"<CR>", "o", "<2-LeftMouse>"},
                        cb = tree_cb("tabnew")
                    }, {key = {"<2-RightMouse>", "<C-]>"}, cb = tree_cb("cd")},
                    {key = "<C-v>", cb = tree_cb("vsplit")},
                    {key = "<C-x>", cb = tree_cb("split")},
                    {key = "<C-t>", cb = tree_cb("tabnew")},
                    {key = "<", cb = tree_cb("prev_sibling")},
                    {key = ">", cb = tree_cb("next_sibling")},
                    {key = "P", cb = tree_cb("parent_node")},
                    {key = "<BS>", cb = tree_cb("close_node")},
                    {key = "<S-CR>", cb = tree_cb("close_node")},
                    {key = "<Tab>", cb = tree_cb("preview")},
                    {key = "K", cb = tree_cb("first_sibling")},
                    {key = "J", cb = tree_cb("last_sibling")},
                    {key = "I", cb = tree_cb("toggle_ignored")},
                    {key = "H", cb = tree_cb("toggle_dotfiles")},
                    {key = "R", cb = tree_cb("refresh")},
                    {key = "a", cb = tree_cb("create")},
                    {key = "d", cb = tree_cb("remove")},
                    {key = "r", cb = tree_cb("rename")},
                    {key = "<C-r>", cb = tree_cb("full_rename")},
                    {key = "x", cb = tree_cb("cut")},
                    {key = "c", cb = tree_cb("copy")},
                    {key = "p", cb = tree_cb("paste")},
                    {key = "y", cb = tree_cb("copy_name")},
                    {key = "Y", cb = tree_cb("copy_path")},
                    {key = "gy", cb = tree_cb("copy_absolute_path")},
                    {key = "[c", cb = tree_cb("prev_git_item")},
                    {key = "]c", cb = tree_cb("next_git_item")},
                    {key = "-", cb = tree_cb("dir_up")},
                    {key = "s", cb = tree_cb("system_open")},
                    {key = "q", cb = tree_cb("close")},
                    {key = "g?", cb = tree_cb("toggle_help")}
                }
            }
        }
    }
end

return config
