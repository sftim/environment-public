syntax on
filetype plugin indent on
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround
set nojoinspaces
highlight TrailWhitespace ctermbg=red guibg=red
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
match TrailWhitespace /\s\+$\| \+\ze\t/
set list             " Show invisible characters
set listchars=tab:⭾─ "Set the characters for the invisibles
