-- macos 要将option当成meta键，alt才会起效
-- 通用配置
local settings={}

local function set_general()
    -- 鼠标支持
    vim.o.mouse = "a"

    vim.cmd([[
        "paste模式切换
        set pastetoggle=<F6>
        set relativenumber
        set notimeout
        set cursorline
        set encoding=utf-8
        set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
        set ruler
        set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
        set cmdheight=2
        set showmatch
        set matchtime=5
        set ignorecase
        set hlsearch
        set incsearch

        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
        set expandtab
        set smarttab

        " 截叠行
        set wrap
        " 自动格式化
        "set formatoptions=tcrqn
        " 在被分割的窗口间显示空白，便于阅读
        set fillchars=vert:\ ,stl:\ ,stlnc:\ 
        set colorcolumn=80
        "highlight ColorColumn ctermbg=yellow
        " 与windows共享剪贴板
        set clipboard+=unnamed
        " 不要生成swap文件，当buffer被丢弃的时候隐藏它
        setlocal noswapfile
        " 我的状态行显示的内容（包括文件类型和解码）
        set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
        set laststatus=2
        "不可见字符变成可见
        "set list
        set listchars=space:⋅
    ]]) 
    vim.o.background = "dark" -- or "light" for light mode

    local cache_dir = require("core.global").cache_dir
    vim.cmd("set nobackup")
    vim.cmd("set backupdir=" .. cache_dir) 

    -- vim.o.syntax = 'on'
    vim.o.errorbells = false
end

local disable_distribution_plugins = function()
    vim.g.loaded_fzf = 1
    vim.g.loaded_gtags = 1
    vim.g.loaded_gzip = 1
    vim.g.loaded_tar = 1
    vim.g.loaded_tarPlugin = 1
    vim.g.loaded_zip = 1
    vim.g.loaded_zipPlugin = 1
    vim.g.loaded_getscript = 1
    vim.g.loaded_getscriptPlugin = 1
    vim.g.loaded_vimball = 1
    vim.g.loaded_vimballPlugin = 1
    vim.g.loaded_matchit = 1
    vim.g.loaded_matchparen = 1
    vim.g.loaded_2html_plugin = 1
    vim.g.loaded_logiPat = 1
    vim.g.loaded_rrhelper = 1
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.g.loaded_netrwSettings = 1
    vim.g.loaded_netrwFileHandlers = 1
end

function settings.init()
    set_general()
    disable_distribution_plugins()
end

return settings
