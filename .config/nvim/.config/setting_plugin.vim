" toggle NERDTree with ctrl-e, where 'e' stands for 'explorer'
nmap <C-E> :NERDTreeToggle<CR>


"this is cool icon, it good :)))
let g:webdevicons_enable_nerdtree = 1

"tabline 
let g:airline#extensions#tabline#enabled = 1




" Use `d[` and `d]` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> d[ <Plug>(coc-diagnostic-prev)
nmap <silent> d] <Plug>(coc-diagnostic-next)

" Apply AutoFix to problem on the current line.
" Use `:CocFix` to get all choices avaliable.
nmap <leader>x <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" always show signcolumns
set signcolumn=yes
