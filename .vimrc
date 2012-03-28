"set nocompatible

"Si vous voulez utiliez les CTRL+C, CTRL+V, ...
"source $HOME/.vim/mswin.vim
"Sinon vous pouvez toujours utiliser une version minimale qui surcharge juste
"les CTRL+... vraiment utiles : récupérez les lignes qui vous intéressent dans
"ce mswin.vim.

"Activation de la coloration et de l'intendation
syn on
set syntax=on
filetype indent on
filetype plugin on

"Afficher les n° de ligne
set nu

"Activer la souris dans vim (dans gvim elle est déjà active)
set mouse=a

"Afficher les parenthèses correspondantes
set showmatch


"Modifier la police
"set guifont=Courier\ 9
set guifont=Monospace\ 9

"Modifier la taille des tabulations
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab "supprime les tabulations et met des espaces


"Recherche
set incsearch
set ignorecase
set smartcase

"Complétion
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

"Afficher la ligne du curseur
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
nmap <F4> :set fileencoding=latin1<Return>:w<Return>:!~/cmd/pdflatex.sh %:p:r<Return>

"map <C-V>		"+gP
"imap <C-V>	<Esc>"+gPi
"imap <C-C>	<Esc>"+yyi
"vnoremap <C-C> "+y
"noremap <C-Z> u


au BufRead,BufNewFile *.twig set syntax=htmljinja

set tabpagemax=400
set showtabline=2


" tab navigation
:nmap <S-Right> :tabnext<CR>
:nmap <S-Left> :tabprevious<CR>


call pathogen#infect()
