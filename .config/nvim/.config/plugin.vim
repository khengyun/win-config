call plug#begin( '$HOME/.config/nvim/plugged' )


" this is nvim ayu
Plug 'ayu-theme/ayu-vim' " or other package manager

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" files hierarchy tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'


" cool icons
Plug 'ryanoasis/vim-devicons'


" editorconfig support
Plug 'editorconfig/editorconfig-vim'

" git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" lean & mean status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" emmet (like), essential toolkit for abbreviation expansion
Plug 'mattn/emmet-vim'


" awesome completion tool
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" insert or delete parenthesis in pair
Plug 'vim-scripts/auto-pairs-gentle'

" toggle comments
" use `gcc` to comment out a line (takes a count),
" `gc` in visual mode to comment out the selection, and much more...
Plug 'tpope/vim-commentary'

" search tool
Plug 'mileszs/ack.vim'

" my favourite colorscheme, bubblegum
Plug 'baskerville/bubblegum'

" vim-plug end, add plugins to &runtimepath



Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'chun-yang/auto-pairs'     " Auto pair (can use coc-pairs)
Plug 'alvan/vim-closetag'



call plug#end()






