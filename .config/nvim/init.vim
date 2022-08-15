"============================= Include file from .config 

for f in split(glob('$HOME/.config/nvim/.config/*.vim'), '\n')
    		exe 'source' f
	endfor

















