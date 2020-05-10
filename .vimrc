
"              __     _____ __  __ ____   ____
"              \ \   / /_ _|  \/  |  _ \ / ___|
"               \ \ / / | || |\/| | |_) | |
"                \ V /  | || |  | |  _ <| |___
"                 \_/  |___|_|  |_|_| \_\\____|

set nocompatible
let &t_ut=''
let mapleader = ' '                     "The default leader is \, but a space is much better. 尽量减少小指的负担
let maplocalleader = ' '
nmap <leader>rc :tabe ~/.vimrc<CR>
"set encoding=utf-8
"显示相对行号
set relativenumber
set t_Co=256                            "Use 256 colors.This is usefull for terminal vim.
set nu
set cursorline                          "显示当前行
set number                              "Let's activate line numbers.
set clipboard=unnamedplus   "使用系统剪贴板"
set showcmd
"屏幕下方保留6行"
set scrolloff=6
"在行尾加分号（不是很好用）
"nnoremap ;; A;
packadd termdebug
"

"set termguicolors
hi Normal ctermbg=NONE
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif "可以保存退出时的光标位置"
endif
"运行无插件vim
if get(g:, 'vim_startup', 0) == 1

else
    if filereadable(expand("~/.vimrc.plugs"))
        set statusline=%{coc#status()}
        source ~/.vimrc.plugs
    endif
endif

"TODO 制作一个开关控制mouse
set mouse=a
set fileformat=unix
filetype on
filetype plugin indent on
syntax enable                           " 打开语法高亮
syntax on                               " 开启文件类型侦测
"set paste                              "允许粘贴模式（避免粘贴时自动缩进影响格式）
set smarttab
" 设置格式化时制表符占用空格数
set shiftwidth=4
" " 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" " 设置编辑时制表符占用空格数
set tabstop=4
set expandtab
set smartindent "智能缩进"
set cindent "C 语言风格缩进"
set autoindent "自动缩进"

"使空格和缩进显示字符
set list
set listchars=tab:▸\ ,trail:▫
"hi NonText ctermfg=16 guifg=#4a4a59
"hi SpecialKey ctermfg=16 guifg=#4a4a59

set autochdir                           "在打开多个文件的时候自动切换目录

set wildmenu
"set wildmode=full "TODO:不太懂

"使tex中的conceal颜色一致
hi clear Conceal
highlight Conceal ctermfg=81
"标签页
nnoremap <tab>e :tabe<CR>
nnoremap <tab>c :tabc<CR>
nnoremap <tab>h :-tabnext<CR>
nnoremap <tab>l :+tabnext<CR>

"复制全文
nmap yaa ggVGy<C-o>

"保存
nnoremap <leader><leader> :w<CR>

"快速翻页
noremap H <nop>
noremap J <nop>
noremap K <nop>
noremap L <nop>
noremap H 7h
noremap J 5j
noremap K 5k
noremap L 7l
noremap <C-w> ^
noremap <C-e> $

"使得可以使用c-j轮询补全."NOTE: 可能有更好的办法
inoremap <C-j> <C-n>

"中文符号的补全
inoremap “ “”<Left>
inoremap ‘ ‘’<Left>
inoremap ” “”<Left>
inoremap ’ ‘’<Left>
inoremap （ （）<left>
inoremap 《 《》<Left>

autocmd BufReadPost *.md setlocal spell spelllang=en_us,cjk
"忽略中文对英文进行拼写检查
"" 使用 <C-l> 更改拼写错误
noremap <leader><C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"跳出括号（可能有更好的方法）
inoremap <C-l> <Right>
inoremap <C-h> <Left>
set magic
set backspace=indent,eol,start          "Make backspace behave like every other editor


"---------------------Search---------------------------------"
set hlsearch
set incsearch
exec "nohlsearch"
nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>
set ignorecase smartcase
"搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感

"split navigations
nnoremap <leader>H :set nosplitright<CR>:vsplit<CR>
nnoremap <leader>L :set splitright<CR>:vsplit<CR>
nnoremap <leader>J :set splitbelow<CR>:split<CR>
nnoremap <leader>K :set nosplitbelow<CR>:split<CR>

nnoremap <A-j> <C-W><C-J>
nnoremap <A-k> <C-W><C-K>
nnoremap <A-l> <C-W><C-L>
nnoremap <A-h> <C-W><C-H>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
tnoremap <A-q> <C-\><C-n>
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l

nnoremap <right> :vertical resize+1<CR>
nnoremap <up> :res +1<CR>
nnoremap <down> :res -1<CR>
nnoremap <left> :vertical resize-1<CR>
"Termdebug
nnoremap \d :Termdebug<CR> :nnoremap K 5k<CR>
nnoremap \e :Evaluate<CR>
nnoremap \b :Break<CR>
nnoremap \n :Over<CR>
nnoremap \s :Step<CR>
nnoremap \c :Continue<CR>
let g:termdebug_wide = 1

"把 vim 插入状态的光标改为竖线 For VTE compatible terminals (urxvt, st, xterm,
"gnome-terminal 3.x, Konsole KDE5 and others)(neovim 不需要)
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

highlight Comment cterm=italic gui=italic
highlight Function cterm=bold gui=bold

