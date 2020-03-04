map<c-a> :w <CR> :!g++ "%" <CR><CR> :q <CR>
map<c-e> :! ./a.out < entrada.in > salida.out <CR> 
syntax on
set number
set mouse =a
set tabstop =3
set showcmd
set autoindent
set autoread
set shiftround
function! My_Tab_Completion()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-P>"
    else
        return "\<Tab>"
endfunction
inoremap <Tab> <C-R>=My_Tab_Completion()<CR>
set expandtab
set shiftwidth =4
set smarttab
set smartindent
autocmd FileType cpp let b:comment_leader = '// '
autocmd FileType python   let b:comment_leader = '# '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
