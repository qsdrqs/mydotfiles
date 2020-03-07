set nocompatible
let &t_ut=''
let mapleader = ','                     "The default leader is \, but a comma is much better. 尽量减少小指的负担
" 替换查找（f 或 t) 上一个为 \
noremap \ ,
set encoding=utf-8
"显示相对行号
set relativenumber
set t_CO=256                            "Use 256 colors.This is usefull for terminal vim.
set nu
set cursorline                          "显示当前行
set number                              "Let's activate line numbers.
set clipboard=unnamedplus   "使用系统剪贴板"
set showcmd
set scrolloff=5 "屏幕下方保留5行"

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif "可以保存退出时的光标位置"
endif
"set rtp+={repository_root}/powerline/bindings/vim
call plug#begin('~/.vim/plugged')
Plug 'tmhedberg/SimpylFold'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'sickill/vim-monokai'
"Plug 'puremourning/vimspector'  "调试器 
Plug 'scrooloose/nerdtree' , { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
let g:NERDTreeWinSize = 20 "設定 NERDTree 視窗大小
map nt :NERDTreeToggle<CR> "設定 , + n 打開 NERDTree
Plug 'tpope/vim-fireplace'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'nsf/gocode'
Plug 'liuchengxu/vista.vim'
Plug 'Yggdroot/LeaderF'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'Raimondi/delimitMate' " 自动补全括号
Plug 'skywind3000/gutentags_plus'
"括号补全
    let delimitMate_expand_cr = 1
    let delimitMate_expand_space = 1
    au FileType python let b:delimitMate_nesting_quotes = ['"']
    "au FileType tex let g:delimitMate_quotes="$"
    au FileType tex inoremap $ $$<left>
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
    set conceallevel=2
    let g:tex_conceal="abdgm"
"Plug 'vim-scripts/Align'
Plug 'Shougo/echodoc.vim'
    set laststatus =2
    set noshowmode
    let g:echodoc_enable_at_startup = 2
Plug 'tpope/vim-surround' "添加引号使用cs 
Plug 'preservim/nerdcommenter' "添加注释cc，删除注释cu
" To use echodoc, you must increase 'cmdheight' value.
             "set completeopt=menu,menuone
             "let g:ycm_add_preview_to_completeopt = 0
Plug 'Linfee/ultisnips-zh-doc'
Plug 'ludovicchabant/vim-gutentags' 
Plug 'mbbill/undotree' "查看文件历史"
map U :UndotreeToggle<CR>
" -----------------begin 美观 ------------------{{{
  Plug 'itchyny/vim-cursorword', { 'for': ['c', 'cpp', 'java', 'python', 'julia', 'matlab'] }
  Plug 'lfv89/vim-interestingwords' "使用 <Leader>k 和 <Leader>K 选择和取消
  Plug 'MattesGroeger/vim-bookmarks'
"  " -----------------end 美观 ------------------}}}
" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required


set mouse=a
set fileformat=unix
filetype on
filetype plugin indent on
syntax enable                           " 打开语法高亮
syntax on                               " 开启文件类型侦测
colorscheme monokai
"set paste								"允许粘贴模式（避免粘贴时自动缩进影响格式）
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

set autochdir                           "在打开多个文件的时候自动切换目录


set wildmenu
set wildmode=longest:list,full

"标签页
noremap te :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>

"快速翻页
nnoremap H 7h
nnoremap J 5j
nnoremap K 5k
nnoremap L 7l

"查看函数文档
nnoremap <C-I> K
"----------------------Fold--------------------------------------"
let g:SimpylFold_docstring_preview=1
""set foldenable
set foldmethod=indent
"set foldcolumn=0           "设置折叠宽度
setlocal foldlevel=99      "设置折叠层数为
"set foldclose=all          "设置自动关闭折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"---------------------tex---------------------------------"
""autocmd BufReadPost *.md setlocal spell spelllang=en_us,cjk
"忽略中文对英文进行拼写检查
"" 使用 <C-l> 更改拼写错误
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"跳出括号（可能有更好的方法）
inoremap <C-l> <Right>
inoremap <C-h> <Left>
set magic
set backspace=indent,eol,start          "Make backspace behave like every other editor
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk_engines = {
        \ '_'                : '-xelatex',
        \ 'pdflatex'         : '-pdf',
        \ 'dvipdfex'         : '-pdfdvi',
        \ 'lualatex'         : '-lualatex',
        \ 'xelatex'          : '-xelatex',
        \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
        \ 'context (luatex)' : '-pdf -pdflatex=context',
        \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
        \}
"使ycm生效
if !exists('g:ycm_semantic_triggers')
   let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

"---------------------Search---------------------------------"
set hlsearch
set incsearch
set ignorecase smartcase               "
"搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感

"split navigations
noremap <leader>a :set nosplitright<CR>:vsplit<CR>
noremap <leader>d :set splitright<CR>:vsplit<CR>
noremap <leader>s :set splitbelow<CR>:split<CR>
noremap <leader>w :set nosplitbelow<CR>:split<CR>

noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

noremap <right> :vertical resize-1<CR>
noremap <up> :res -1<CR>
noremap <down> :res +1<CR>
noremap <left> :vertical resize+1<CR>
"PowerLine

let g:powerline_pycmd = "py3"
let g:spf13_use_powerline = 0
"把 vim 插入状态的光标改为竖线 For VTE compatible terminals (urxvt, st, xterm,
"gnome-terminal 3.x, Konsole KDE5 and others)
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"


"================== youcompleteme ============{{{
" 只能是 #include 或已打开的文件
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>gr  :YcmCompleter GoToReferences
map <leader>gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_complete_in_strings=1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" <https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme>
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-Tab>', '<Up>']
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
            \ "python":1,
            \ "tex":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }
"let g:ycm_semantic_triggers =  {
"			\ 'python,java,go,erlang,perl': ['re!\w{2}'],
"			\ 'cs,lua,javascript': ['re!\w{2}'],
"			\ }
let g:ycm_semantic_triggers =  {
			\ 'c,cpp': ['re!\w{7}'],
            \ 'python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
" 开启基于 tag 的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"=================== YCM ========================================}}}
"
"================== UltiSnips ============{{{
" better key bindings for UltiSnipsExpandTrigger

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/plugged/vim-snippets/Ultisnips']
nnoremap <leader>es :UltiSnipsEdit<cr>
let g:UltiSnipsEditSplit="vertical"
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<C-n>"
endif
if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<C-p>"
endif
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
"=================== end ========================================}}}


"tags
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/share/gtags/gtags.conf'
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_plus_nomap = 1
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>
let g:gutentags_define_advanced_commands = 1

