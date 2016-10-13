
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements

" Use Vim defaults instead of 100% vi compatibility
set nocompatible	

set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

set number

set incsearch

set wildmenu wildmode=list:full

set mouse=a 

"Don't make swap files
set noswapfile

"Encoding
set encoding=utf-8

"Ignore the case of normal letters
set ignorecase

"current  highlight
set cursorline
highlight cursorline term=reverse cterm=reverse

" Space highlight
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction
 
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

"======================keymap=================================

nnoremap <silent><C-e> :NERDTreeToggle<CR>



"====================dein=================================

" reset augroup
augroup MyAutoCmd
autocmd!
augroup END



let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif


if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml)
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif


"colorscheme 
syntax enable
set background=dark

if dein#check_install()
  call dein#install()
endif


