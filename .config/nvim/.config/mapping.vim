"Nerdtree setting 

nnoremap  <silent> <C-a> <Cmd>:NERDTreeFocus %<CR>
nnoremap <silent> <C-n> <Cmd>:NERDTree<CR>
nnoremap <silent> <C-f> <Cmd> :NERDTreeFind<CR>
nnoremap <silent> <C-t> <Cmd> :NERDTreeToggle<CR>

"fzf config
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :GFiles<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>
"move a line with shift up or down

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>


inoremap ii <Esc> 
