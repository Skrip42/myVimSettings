#!/bin/bash

mv ../.vimrc ./backups/.vimrc
mv ../.bashrc ./backups/.bashrc
mv ../.tmux.conf ./backups/.tmux.conf
ln ./configFiles/.vimrc ../.vimrc
ln ./configFiles/.bashrc ../.bashrc
ln ./configFiles/.tmux.conf ../.tmux.conf

apt-get install php-codesniffer
ln -s ~/.vim/CodeSnifferStandarts/mPEAR /usr/share/php/PHP/CodeSniffer/Standards/
phpcs -i

