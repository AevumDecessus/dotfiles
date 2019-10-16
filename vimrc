" Don't set compatible (turning vim back into vi)
set nocompatible
" Syntax highlighting is my friend
syntax on

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" cc is unfortunately not comaptible with Solaris VIM
set cc=80       " Highlight column 80
set hidden      " Hide buffers when they are abandoned
set hlsearch    " Highlight search results in buffer
set incsearch   " Incremental search
set ignorecase  " Do case insensitive matching
set mouse=a     " Enable mouse usage (all modes)
set number      " Show line numbers
set ruler       " Always show current cursor position
set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set smartcase   " Do smart case matching

" Allow backspacing in insert mode
set backspace=indent,eol,start
" Tab handling
set autoindent     " Use smart indenting on new lines
set softtabstop=2
set shiftwidth=2    " Number of spaces to use for each step of indent
set expandtab       " Expand tabs to spaces

" Overwrite :W and :Q to their lowercase counterparts because of typos
:command W w
:command Q q

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Load pathogen if it exists
if filereadable("~/.vim/vim-pathogen/autoload/pathogen.vim")
  runtime bundle/vim-pathogen/autoload/pathogen.vim
  execute pathogen#infect()
endif

if filereadable("~/.vim/bundle/syntastic/.gitignore")
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0 
  let g:syntastic_puppet_puppetlint_args = "--no-80chars-check --no-autoloader_layout-check --no-class_inherits_from_params_class-check" 
endif
