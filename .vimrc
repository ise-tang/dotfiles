set nocompatible
filetype off
""" pathogen をコメントアウト
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()
" set helpfile=$VIMRUNTIME/doc/help.txt
 
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'ZenCoding.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1

" unite.vim
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" Open NERDTRee
nnoremap <silent> ,nt :<C-u>NERDTree<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" for coffeescript
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

let twitvim_browser_cmd = 'firefox'

" for rspec-vim
let g:rspec_command = "Dispatch rspec {spec}"
nnoremap <silent> ,rc :call RunCurrentSpecFile()<CR>

" enable neocomplecache
let g:neocomplcache_enable_at_startup = 1

set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set number

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

NeoBundleCheck
