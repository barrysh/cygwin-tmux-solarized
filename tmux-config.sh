#!/usr/bin/env bash
set +x
echo test

# Source: https://github.com/mavnn/mintty-colors-solarized
# Source: https://github.com/gpakosz/.tmux

HOME_DIR="/cygdrive/c/Users/$(whoami)"

# Exit is home directory isn't found
[ ! -d "$USER_HOME" ]  && exit 1

# Windows directories to symlink
DOC_DIR="${HOME_DIR}"/Documents/
DOWN_DIR="${HOME_DIR}"/Downloads/
SSH_DIR="${HOME_DIR}"/.ssh/
GIT_DIR="${DOC_DIR}"/GitHub

# Create symlinks in cygwin user home directory
[ -d "${DOC_DIR}" ] && ln -s "${DOC_DIR}" ~/Documents
[ -d "${DOWN_DIR}" ] && ln -s "${DOWN_DIR}" ~/Downloads
[ -d "${SSH_DIR}" ] && ln -s "${SSH_DIR}" ~/.ssh

# Create GitHub directory if missing
[ ! -d "${GIT_DIR}" ] && (mkdir -p "${GIT_DIR}" || exit 1)

# Install ~/.minttyrc
git clone https://github.com/mavnn/mintty-colors-solarized.git "${GIT_DIR}"/mintty-colors-solarized
cat "${GIT_DIR}"/mintty-colors-solarized/.minttyrc.dark > ~/.minttyrc

# Install ~/.tmux.conf and ~/.tmux.conf.local
git clone https://github.com/gpakosz/.tmux.git "${GIT_DIR}"/oh-my-tmux
ln -s -f "${GIT_DIR}"/oh-my-tmux/.tmux.conf ~/.tmux.conf
cp "${GIT_DIR}"/oh-my-tmux/.tmux.conf.local ~/.tmux.conf.local

# Install neofetch, like a boss
git clone https://github.com/dylanaraps/neofetch.git "${GIT_DIR}"/neofetch
cd "${GIT_DIR}"/neofetch || exit 1
make
make install
