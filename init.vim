"**      NEOVIM Config      **"
" Path: ~/.config/nvim/init.vim
" By: Joshua S. || Pokehah

"*********************************************************************************************************************"
"--------------------------"
"   Neovim Configuration   "
"--------------------------"
" Line Numbers
set number
set relativenumber

" Convert Tabs to 4 Spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Fold automatically according to language syntax
" set foldmethod=syntax

" Break lines on words instead of letters
set linebreak

" When Terminal opened, disable line numbering locally
autocmd TermOpen * setlocal nonumber norelativenumber

" Enable Mouse support in normal/visual/insert mode.
" Useful for switching buffers when viewing, not editing.
set mouse=nvi

" Bind the leader-key to space
let mapleader="\<space>"

"--------------------------------"
"   Neovim Remaps and Keybinds   "
"--------------------------------"
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <leader>c :ALEToggle<CR>

" Correct indentation in current file
nnoremap <F10> gg=G

" Buffer-Related keybinds
nnoremap <leader>T :enew<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprev<CR>
nnoremap <leader><Left> :bprev<CR>
nnoremap <leader><Right> :bnext<CR>

"*********************************************************************************************************************"
"-------------------------------"
"   Plugin Manager : Vim-Plug   " ( https://github.com/junegunn/vim-plug )
"-------------------------------"

" Auto-Install vim-plug "
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"# START Plugin Manager #"
" Directory for plugins: ( ~/.local/share/nvim/nvPlugins )
call plug#begin(stdpath('data') . '/nvPlugins')

"" Plugins
" Airline - Status Bar at bottom
Plug 'https://github.com/vim-airline/vim-airline'

" Nerdtree - netrc alternative / Filesystem browser
Plug 'https://github.com/preservim/nerdtree'

" BarBar - Add a tabline for buffers
"Plug 'https://github.com/romgrk/barbar.nvim'

" Vim-Devicons - Use NerdFont glyphs for Airline, Nerdtree, Etc.
" Always last, install a patched NerdFont for this plugin to work
Plug 'https://github.com/ryanoasis/vim-devicons'

" ALE - Asynchronous Linting
Plug 'https://github.com/dense-analysis/ale'

call plug#end()
"# END Plugin Manager #"

"**********************************************************************************************************************"
"---------------------------"
"   Plugin Configurations   "
"---------------------------"

"** Airline Config **"
    " Automatically populate g:airline_symbols (might not be neccesary)
let g:airline_powerline_fonts = 1
    " Use Airline tabline
let g:airline#extensions#tabline#enabled = 1
    " Name tabs/buffers after the file
let g:airline#extensions#tabline#fnamemod = ':t'

"** ALE Config **"
    " ALE completion
let g:ale_completion_enabled = 1
    " Specify c++17 standard for linters + LSP
let g:ale_cpp_cc_options = '-std=c++17 -Wall'
    " Only use listed linters
let g:ale_linters = { 'cpp': ['clang++', 'clangd'] }
    " Report problems with...
    " VirtualText (at the end of the line by default)
let g:ale_virtualtext_cursor = 1
