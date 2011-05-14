set textwidth=79
set spell
au BufWritePost *.tex :call system("pdflatex ".expand("%"))
