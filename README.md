# dotfiles

Theses are my configuration files for various applications,
feel free to get inspired and use various bits and pieces from them!

## installation

    sh install.sh

## offlineimap
To register your password with gnome-keyring, download the package
python-keyring. Then run:

    python
    >> import keyring
    >> keyring.set_password("offlineimap", "username", "password")
