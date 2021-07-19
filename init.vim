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
"   Plugin Manager : Vim-Plug   " ( https://github.com/junegunn/vim-plug )
"-------------------------------"

" Auto-Install vim-plug "
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" START Plugin Manager
" Directory for plugins: ( ~/.local/share/nvim/nvPlugins )
call plug#begin(stdpath('data') . '/nvPlugins')

" Plugins
" Airline - Status Bar at bottom
Plug 'https://github.com/vim-airline/vim-airline'
" Nerdtree - netrc alternative / Filesystem browser
Plug 'https://github.com/preservim/nerdtree'

" Vim-Devicons - Use NerdFont glyphs for Airline, Nerdtree, Etc.
" Always last, install a patched NerdFont for this plugin to work
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
