# vim

The Vim configuration uses [Vundle](https://github.com/gmarik/vundle) to
completely manage the `.vim` folder. See below for how to create the `.vim`
folder.

## Installation
    cd
    mkdir -p .vim/bundle
    git clone https://github.com/gmarik/vundle .vim/bundle/vundle
    vim +BundleInstall +qall
