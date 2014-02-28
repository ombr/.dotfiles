" Leader
let mapleader = " "

set nocompatible
call pathogen#infect()

set backspace=2   " Backspace deletes like most programs in insert mode

"Colors
syn on
syntax enable
filetype plugin indent on

colorscheme default
set background=dark
call togglebg#map("<F5>")
let g:solarized_termcolors=16
colorscheme solarized


set colorcolumn=85

"change buffer without saving
set hidden

set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set autowrite     " Automatically :write before running commands

"I like to have a huge history.
set history=1000
"Undo better than swp
set undolevels=10000
set nobackup
set noswapfile
set undofile
set undodir=~/.vim-undo//

"Edit quickly vim rc
nmap <silent><leader>ve :e $MYVIMRC<CR>
nmap <silent><leader>vr :so $MYVIMRC<CR>
"Afficher les n° de ligne
set nu

"Activer la souris dans vim (dans gvim elle est déjà active)
set mouse=a

"Afficher les parenthèses correspondantes
set showmatch

" w!! to save with a sudo :-D
cmap w!! w !sudo tee % >/dev/null

"Modifier la police
"set guifont=Courier\ 9
"set guifont=Monospace\ 9

"Modifier la taille des tabulations
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab "supprime les tabulations et met des espaces


"Recherche
set incsearch
set ignorecase
set smartcase

"Completion
set ofu=syntaxcomplete#Complete "Omni completion provides smart autocompletion for programs. 
set wmnu "affiche le menu
set wildmode=list:longest,list:full "affiche toutes les possibilités
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz "ignorer certains types de fichiers pour la complétion des includes


"Folding
"function! MyFoldFunction()
"	let line = getline(v:foldstart)
"	let sub = substitute(line,'/\*\|\*/\|^\s+', '', 'g')
"	let lines = v:foldend - v:foldstart + 1
"	return v:folddashes.sub.'...'.lines.' Lines...'.getline(v:foldend)
"endfunction
"set foldmethod=syntax "Réduira automatiquement les fonctions et blocs (#region en C# par exemple)
"set foldtext=MyFoldFunction() "on utilise notre fonction (optionnel)


"Orthographe
"set spelllang=en,fr
"set spell
"set spellsuggest=5

" Afficher la ligne du curseur
set cursorline

" backup
if !filewritable($HOME."/.vim/backup") " Si le repertoire n'existe pas
    call mkdir($HOME."/.vim/backup", "p") " Creation du repertoire de sauvegarde
endif
set backupdir=$HOME/.vim/backup " On definit le repertoire de sauvegarde
set backup " On active le comportement

imap <C-Space> <C-X><C-O>
iab #i #include
"Compil
"nmap <F5> :!gnatmake %:p:r<Return>
"nmap <F6> :!gcc -Wall -Wextra -m32 -g -std=c99 -o %:p:r %:p<Return>
"nmap <F8> :!%:p:r<Return>
"nmap <F9> :!make<Return>
"nmap <F10> :!make clean<Return>
"nmap <F11> :!./exec<Return>
"Orthographe
"nmap <F7> :!gnome-terminal --tab -e "aspell --lang=fr_FR --encoding=iso8859-1 check %:p"<Return>

"Latex
nmap <F4> :set fileencoding=latin1<Return>:w<Return>:!~/.bin/pdflatex.sh %:p:r<Return>

"map <C-V>		"+gP
"imap <C-V>	<Esc>"+gPi
"imap <C-C>	<Esc>"+yyi
"vnoremap <C-C> "+y
"noremap <C-Z> u

set tabpagemax=400
set showtabline=2


" tab navigation
":nmap <S-Right> :tabnext<CR>
":nmap <S-Left> :tabprevious<CR>

"Always a status line :
set laststatus=2

map <leader>u :GundoToggle<CR>
map <leader>s, :s/\v\,([^ ])/, \1/g<CR>
map <leader>S, :%s/\v\,([^ ])/, \1/gc<CR>
map <leader>s= :s/\v\=([^ =])/= \1/g<CR>:s/\v([^= ])\=/\1 =/g<CR>
map <leader>S= :%s/\v\=([^ =])/= \1/gc<CR>:%s/\v([^= ])\=/\1 =/gc<CR>

"Nerdtree configs
let NERDTreeQuitOnOpen=1
"map <leader>] :NERDTreeToggle<CR>
map <leader>] :NERDTreeFind<CR>
map <leader>? :TlistToggle<CR>


"FuzzyFinderTextMate
map <leader>t :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>
let g:fuzzy_ignore = "*.svn"
let g:fuzzy_ignore = "*.git*"
let g:fuzzy_ignore = "*vendor*"

map <leader>p :CtrlP<CR>

"map <Leader>bb :MiniBufExplorer<cr>
"map <Leader>bc :CMiniBufExplorer<cr>
"let g:miniBufExplModSelTarget = 1
"Single clic for selecting a buffer
"map <leader>r :CMiniBufExplorer<CR>:MiniBufExplorer<CR>
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1 Does Not work ? Maybe conflict ?



" WINDOWS
" Change windows with Ctrl + Arrows
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" Move windows with Ctrl + Shift + Arrows
nmap <silent> <C-S-Up> <C-W>K
nmap <silent> <C-S-Down> <C-W>J
nmap <silent> <C-S-Left> <C-W>H
nmap <silent> <C-S-Right> <C-W>L

" Resize windows with Alt + Shift + Arrows
nmap <silent> <C-S-k> <C-W>+
nmap <silent> <C-S-j> <C-W>-
nmap <silent> <C-S-l> <C-W>>
nmap <silent> <C-S-h> <C-W><

nmap <silent> <C-S-C> <C-W>c
"nmap <silent> <C-S-O> <C-W>o
nmap <silent> <A-S-Up> <C-W>+
nmap <silent> <A-S-Down> <C-W>-
nmap <silent> <A-S-Left> <C-W><
nmap <silent> <A-S-Right> <C-W>>

nmap <silent> <C-S-C> <C-W>c
nmap <silent> <C-S-O> <C-W>o
nmap <silent> <C-S-N> <C-W>n


" TAB
" http://www.vim.org/scripts/script.php?script_id=2520
function! MoveCurrentTab(value)
  if a:value == 0
    return
  endif
  let move = a:value - 1
  let move_to = tabpagenr() + move
  if move_to < 0
    let move_to = 0
  endif
  exe 'tabmove '.move_to
endfunction

nmap <silent>  <leader-l> :tabn<CR>
nmap <silent>  <leader-h> :tabp<CR>
nmap <silent>  <leader-k> :tabnew<CR>
nmap <silent>  <leader-j> :tabc<CR>
nmap <silent>  <S-Right> :tabn<CR>
nmap <silent>  <S-Left> :tabp<CR>
nmap <silent>  <S-Up> :tabnew<CR>
nmap <silent>  <S-Down> :tabc<CR>
nmap <silent> <C-Left> :call MoveCurrentTab(-1)<Esc>
nmap <silent> <C-Right> :call MoveCurrentTab(1)<Esc>
nmap <silent>  <C-1> 1gt
nmap <silent>  <C-2> 2gt
nmap <silent>  <C-3> 3gt
nmap <silent>  <C-4> 4gt
nmap <silent>  <C-5> 5gt
nmap <silent>  <C-6> 6gt
nmap <silent>  <C-7> 7gt
nmap <silent>  <C-8> 8gt
nmap <silent>  <C-9> 9gt
nmap <silent>  <C-0> 10gt

"French accents on qwerty keyboard :
imap <leader>ee é
imap <leader>Ee É
imap <leader>ee é
imap <leader>eg è
imap <leader>ec ê
imap <leader>e.. ë
imap <leader>Ag À
imap <leader>ag à
imap <leader>ac â
imap <leader>uc û
imap <leader>oc ô
imap <leader>oe œ
imap <leader>i.. ï
imap <leader>ic î
imap <leader>cc ç
imap <leader>ae æ
imap <leader>ug ù
imap <leader>uc û
imap <leader>u.. ü
imap <leader>y.. ÿ

"exit insert mode with jj
inoremap jj <ESC>
inoremap <Nul> <C-x><C-o>
"pasting without indentation problems.
set pastetoggle=<F2>
"set formatoptions=tcp << TODO !

"Use visual selection to search and replace ( Cf .
"http://stackoverflow.com/questions/676600/vim-replace-selected-text)
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>


"GVIM OPTIONS
set guioptions=a "http://stackoverflow.com/questions/7997380/selection-automatically-put-into-x11-clipboard-vim

"Coffee 2 spaces indentation
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
au BufWritePost *.coffee silent CoffeeLint | cwindow | redraw!

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Display extra whitespace
set list listchars=tab:»·,trail:·
"
" Switch between the last two files
nnoremap <leader><leader> <c-^>



" Numbers
set number
set numberwidth=5


augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
