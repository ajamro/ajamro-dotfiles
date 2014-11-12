" Vim configuration by Arkadiusz Jamrocha. Inspired by tutorial on using vim
" as python ide by mbrochh (https://github.com/mbrochh/vim-as-a-python-ide)


" Turn on filetype plugin. Used to make filetype specific tweaks
filetype plugin on
filetype plugin indent on


" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Rebind <Leader> Key
let mapleader=","

" Removes highlight of your last search
noremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>

" Quicksave command
noremap <Leader>s :update<CR>
inoremap <Leader>s <C-o>:update<CR>

" Bind ctrl-<movement> keys to move around the windows
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Easier moving between the tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Make history bigger
set history=768
set undolevels=768

" Search customization
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Make default tab behaviour
set nocompatible
set tabstop=2
set shiftwidth=2
set noexpandtab

" Show whitespaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Set Color Scheme
set t_Co=256
color wombat256mod
syntax on

" Highlight color column 80
set textwidth=79
set colorcolumn=80
highlight ColorColumn ctermbg=233

" _____________________________________________________________________________
"  Plugins Configuration
" ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
execute pathogen#infect()

" vim powerline (awesome statusbar)
set laststatus=2

" vim ctrl-p (fuzzy search)
let g:ctrlp_max_height=30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" jedi-vim (autocompletion library)
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list. See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent>j <C-r>=OmniPopup('j')<CR>
inoremap <silent>k <C-r>=OmniPopup('k')<CR>

" Python folding
set nofoldenable
