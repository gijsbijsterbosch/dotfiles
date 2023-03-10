let mapleader = ","
let maplocalleader = ','
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plug 'embark-theme/vim', { 'as': 'embark' }
" Ulti snips: , 
Plug 'SirVer/ultisnips' "| Plug 'honza/vim-snippets'
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger= '<s-tab>'
"format of an ultisnip, in all.snippets snippets for any filetype c.snippets
"for .c files etc 
"snippet keywoord
"{snippet body}
"endsnippet
"we want ultisnips and the wiki to live in the same root directory.
let g:vimwiki_list = [{'path' : '/Users/gijsbijsterbosch/kasteel/vimwiki/'}]



" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"Distraction free editing
Plug 'https://github.com/junegunn/goyo.vim'

"this is some technical package that supports other packages
Plug 'nvim-lua/plenary.nvim'
" Plug 'MunifTanjim/nui.nvim'
" fast file navigation:
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'ThePrimeagen/harpoon'
Plug 'flazz/vim-colorschemes'
Plug 'ThePrimeagen/vim-be-good'
" Plug 'liuchengxu/eleline.vim'
" Plug 'itchyny/lightline.vim'
" Plug 'glepnir/galaxyline.nvim' , { 'branch': 'main' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" let g:airline_exclude_preview = 0

Plug 'https://github.com/tpope/vim-fugitive'
let g:airline_powerline_fonts = 1
"vimwiki
Plug 'vimwiki/vimwiki'
" Plug 'EdenEast/nightfox.nvim' " Vim-Plug
"tabline
Plug 'nvim-tree/nvim-web-devicons'
" tabline plug   
Plug 'romgrk/barbar.nvim'

"adds gcc-comments out a line , gcmotion comment out motion
Plug 'https://github.com/tpope/vim-commentary'

"latex set, using castels stuff
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_view_skim_sync = 1 " Value 1 allows forward search after every successful compilation
let g:vimtex_view_skim_activate = 0 " Value 1 allows change focus to skim after command `:VimtexView` is given
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
autocmd BufRead,BufNewFile *.wiki silent! setlocal ft=vimwiki.tex

" On-demand loading
Plug 'preservim/nerdtree'

Plug  'https://tpope.io/vim/repeat.git'
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

"has vimtex load into .wiki files tos,s
autocmd BufRead,BufNewFile *.wiki silent! setlocal ft=vimwiki.tex
"attempt to fix python sourcing,seems to have worked
let  g:python3_host_prog = expand('/usr/bin/python3')



"add hybrid linenumbers
:set relativenumber
:set number
" Set shift width to 4 spaces.
set shiftwidth=4
" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab
" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
" Show the mode you are on the last line.
set showmode
" Set the commands to save in history default number is 20.
set history=1000

" Show matching words during a search.
set showmatch

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Use highlighting when doing a search.
set hlsearch

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" ------------------------------------------------------------------------------
                              " overview of used shortcuts
" ------------------------------------------------------------------------------
"leader + w : vimwiki
"leader + s[na] : snippets
"leader + h harpoon
"leader + c changing directories
"leader + t telescope to find files
"shortcuts and remaps
autocmd filetype python nnoremap <leader>ex :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <leader>ex :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <leader>ex :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
"makes navigating split windows slightly easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"map f2 to nerdtree
map <F2> :NERDTreeToggle<CR>
"make nerdtree open on the right
let g:NERDTreeWinPos = "right"
"I also declare the mapleader up high because some plugins use the leader
let mapleader = ","

"these might be dependend on the barbar plugin to move around the buffers
nnoremap <leader>pr <Cmd>BufferPrevious<CR>
nnoremap <leader>ne <Cmd>BufferNext<CR>
nnoremap <leader>1     <Cmd>BufferGoto 1<CR>
nnoremap <leader>2     <Cmd>BufferGoto 2<CR>
nnoremap <leader>3     <Cmd>BufferGoto 3<CR>
nnoremap <leader>4     <Cmd>BufferGoto 4<CR>
nnoremap <leader>5     <Cmd>BufferGoto 5<CR>
nnoremap <leader>6     <Cmd>BufferGoto 6<CR>
nnoremap <leader>7     <Cmd>BufferGoto 7<CR>
nnoremap <leader>8     <Cmd>BufferGoto 8<CR>
nnoremap <leader>9     <Cmd>BufferGoto 9<CR>
nnoremap <leader>0     <Cmd>BufferLast<CR>
" Re-order to previous/next
nnoremap <leader>< <Cmd>BufferMovePrevious<CR>
nnoremap <leader>> <Cmd>BufferMoveNext<CR>
nnoremap <leader>ew :enew<CR>

nmap <leader>nt :NERDTreeToggle<cr>
"command that closes the vim if i close the last buffer
function! CloseOnLast()
    let cnt = 0

    for i in range(0, bufnr("$"))
        if buflisted(i)
            let cnt += 1
        endif
    endfor

    if cnt <= 1
        q
    else
        bd
    endif
 endfunction

nmap <leader>bd :bd<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>sn :UltiSnipsEdit<cr>
nmap <leader>sa :e /Users/gijsbijsterbosch/.config/nvim/UltiSnips/all.snippets<cr>
nmap <leader>ww :w<cr>
nmap <leader>qq :call CloseOnLast()<CR>
nmap <leader>; :
nmap <leader>ch :checkhealth<cr>
inoremap <leader><leader> <Esc>
noremap <leader><leader> <ESC>

"remap vimwiki leader ww to leader wi
"note that <leader>w<leader>w generates a new diary entry
nmap <leader>wi <Plug>VimwikiIndex
noremap <leader>wd <Plug>VimwikiDiaryIndex
nmap <leader>wg <Plug>VimwikiDiaryGenerateLinks
nmap <leader>wx <Plug>VimwikiDeleteFile
" " Copy to clipboard
" nnoremap  <leader>-y  "*y
" nnoremap  <leader>Y  "*yg_

" " " Paste from clipboard
" nnoremap <leader>pp "+p
" nnoremap <leader>P "+P


"distraction free mode
nnoremap <leader>gy :Goyo<CR>

" " enter becomes :
nnoremap <CR> :

"add lines without entering insert mode
nnoremap <silent> <leader>zj :<C-u>call append(line("."),   repeat([""], v:count1))<CR>

nnoremap <silent> <leader>zk :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" ------------------------------------------------------------------------------
                              " quick directories
" ------------------------------------------------------------------------------
nnoremap <leader>ck :cd ~/kasteel/<CR>
nnoremap <leader>cu :cd ..<CR>
"change working directory to current directory
nnoremap <leader>cd :cd %:p:h<CR>
nnoremap <leader>cb :cd -<CR>
nnoremap <leader>cp :pwd<CR>


" colorscheme nightfox
" colorscheme embark
lua require('plugins')
:set spelllang=en_gb,de_de,nl,fr
:command Writemode colorscheme sol-term | setlocal spell | Goyo 70
:command Codemode     Goyo! | colorscheme luna | set nospell 
let g:solarized_termcolors=256
" ------------------------------------------------------------------------------
                              " Writer & code mode
" ------------------------------------------------------------------------------
nnoremap <leader>wm :Writemode<CR>
nnoremap <leader>cm :Codemode<CR>

colorscheme luna    

" ------------------------------------------------------------------------------
                              " navigation: harpoon & telescope 
" ------------------------------------------------------------------------------
nnoremap <leader>hp :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hm :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>h1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>h2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>h3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>h4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>h5 :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <leader>h6 :lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <leader>h7 :lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <leader>h8 :lua require("harpoon.ui").nav_file(8)<CR>
nnoremap <leader>h9 :lua require("harpoon.ui").nav_file(9)<CR>

nnoremap <leader>hn :lua require("harpoon.ui").nav_next()  <CR>
nnoremap <leader>hp :lua require("harpoon.ui").previous()  <CR>
nnoremap <leader>tf :Telescope find_files<cr>
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>

" ------------------------------------------------------------------------------
" some ez yank registers.
" ------------------------------------------------------------------------------

nnoremap <leader>qy "qy
nnoremap <leader>qp "qp
nnoremap <leader>wy "wy
nnoremap <leader>wp "wp
nnoremap <leader>ey "ey
nnoremap <leader>ep "ep
nnoremap <leader>ry "ry
nnoremap <leader>rp "rp
nnoremap <leader>+y "+y
nnoremap <leader>+p "+p
nnoremap <leader>-y "-y
nnoremap <leader>-p "-p
" yanks file to current buffer to + register
:nnoremap <Leader>yp :let @+=expand('%:p')<CR>

