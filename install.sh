#!/bin/bash

mv ../.vimrc ./backups/.vimrc
mv ../.bashrc ./backups/.bashrc
mv ../.tmux.conf ./backups/.tmux.conf
ln ./configFiles/.vimrc ../.vimrc
ln ./configFiles/.bashrc ../.bashrc
ln ./configFiles/.tmux.conf ../.tmux.conf

apt-get install php-codesniffer
#cp -r ~/.vim/CodeSnifferStandarts/mPEAR /usr/share/php/PHP/CodeSniffer/src/Standards/
#phpcs -i
#phpcs --config-set default_standard mPEAR

apt-get install exuberant-ctags

