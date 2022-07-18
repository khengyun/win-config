
for f in split(glob('$HOME/.config/nvim/settings/*.vim'), '\n')
    exe 'source' f
endfor

for f in split(glob('$HOME/.config/nvim/scripts/*.vim'), '\n')
    exe 'source' f
endfor

for f in split(glob('$HOME/.config/nvim/plugin/*.vim'), '\n')
    exe 'source' f
endfor
