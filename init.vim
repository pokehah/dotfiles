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

" Break lines on words instead of letters
set linebreak

" When Terminal opened, disable line numbering locally
autocmd TermOpen * setlocal nonumber norelativenumber

"--------------------------------"
"   Neovim Remaps and Keybinds   "
"--------------------------------"
nnoremap <C-e> :NERDTree<CR>

"*********************************************************************************************************************"
"-------------------------------"
"   Plugin Manager : Vim-Plug   "
"-------------------------------"
" https://github.com/junegunn/vim-plug
" Needs an if block that can auto install vim-plug as well as if plugins aren't installed, get them.

" Directory for plugins
call plug#begin(stdpath('data') . '/nvPlugins')

" Plugins
" Airline - Status Bar at bottom
Plug 'https://github.com/vim-airline/vim-airline'
" netrc alternative - Filesystem browser
Plug 'https://github.com/preservim/nerdtree'

" Always last, install a patched NerdFont for this to work
Plug 'https://github.com/ryanoasis/vim-devicons'

call plug#end()
" END Plugin Manager

"**********************************************************************************************************************"
"---------------------------"
"   Plugin Configurations   "
"---------------------------"

"** Airline Config **"
" Automatically populate g:airline_symbols
" !! maybe not necessary? !!
let g:airline_powerline_fonts = 1

"** Vim Devicons Config **"
" System Font to Use
set guifont=Cascadia\ Code\ PL
