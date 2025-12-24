" resize windows
nnoremap <C-Left> <C-W><
nnoremap <C-Right> <C-W>>
nnoremap <C-Down> <C-W>-
nnoremap <C-Up> <C-W>+

" move window in normal
nnoremap <C-H> <C-w>h
nnoremap <C-J> <C-w>j
nnoremap <C-K> <C-w>k
nnoremap <C-L> <C-w>l

" Fast jumps 
nnoremap J 5j
nnoremap K 5k
nnoremap H ^
nnoremap L $
onoremap J 5j
onoremap K 5k
onoremap H ^
onoremap L $
vnoremap J 5j
vnoremap K 5k
vnoremap H ^
vnoremap L $

" remove line 
nnoremap <C-N> o<Esc>
nnoremap <C-M> O<Esc>

" add space without exiting Normal mode
nnoremap <C-Space> i<Space><Esc>

" move while in insert mode
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>

" Scroll without cursor moving 
nnoremap <Down> 3<C-E>
nnoremap <Up>   3<C-Y>

nnoremap <C-P> aParameters<Esc>o----------<Esc>
nnoremap <C-G> aReturns<Esc>o-------<Esc>
