let s:vim_files=$USER_DOTFILES_DIR.'/vim/'

set nowritebackup
set nobackup
set noswapfile
set background=dark
set nocompatible
set clipboard=unnamed
set wildmenu
set mouse=a
set esckeys
set backspace=indent,eol,start
set ttyfast
set gdefault
set encoding=utf-8 nobomb
let mapleader=","
set binary
set noeol
set modeline
set modelines=4
set exrc
set secure
set number
syntax on
set cursorline
set tabstop=2
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set noerrorbells
set nostartofline
set ruler
set shortmess=atI
set showmode
set title
set showcmd
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
set scrolloff=3
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
cmap w!! w !sudo tee > /dev/null %
noremap <leader>ss :call StripWhitespace()<CR>
noremap <leader>W :w !sudo tee % > /dev/null<CR>
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
let pate_mode = 1
func! Paste_on_off()
   if g:paste_mode == 0
      set paste
      let g:paste_mode = 1
   else
      set nopaste
      let g:paste_mode = 0
   endif
   return
endfunc


