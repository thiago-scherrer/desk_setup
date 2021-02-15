!#/bin/bash

function aptSetup() {

	sudo apt update && \
		apt full-upgrade -y \
		apt install -y htop \
			build-essential \
			encfs \
      exuberant-ctags \
			git \
			gnome-shell-extension-autohidetopbar \
			keepassxc \
			libavcodec-extra \
			libboost-all-dev \
			libboost-dev \
			libboost-filesystem-dev \
			libfreetype-dev \
			libsdl2-dev \
			libz-dev libpng-dev \
			lm-sensors \
			nasm \
			software-center \
			ubuntu-restricted-extras \
			vim \
			vlc* \
      gimp \
      universal-ctags
}

function zshSetup () {
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cp zsh/.zshrc ~/
}

function vimSetup () {
  mkdir ~/.ctags

	cp vim/.vimrc ~/.vimrc
	
  git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
	
  mkdir -p ~/.vim/pack/local/start
	cd ~/.vim/pack/local/start
	git clone https://github.com/editorconfig/editorconfig-vim.git

  git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform

  mkdir -p ~/.vim/pack/tpope/start
  cd ~/.vim/pack/tpope/start
  git clone https://tpope.io/vim/fugitive.git
  vim -u NONE -c "helptags fugitive/doc" -c q

  git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go

  git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/dist/start/vim-airline-themes

  git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline

  git clone https://github.com/pangloss/vim-javascript.git ~/.vim/pack/vim-javascript/start/vim-javascript

  git clone https://github.com/ludovicchabant/vim-gutentags.git ~/.vim/pack/dist/start/vim-gutentags

  git clone https://github.com/preservim/tagbar.git ~/.vim/pack/plugins/start/tagbar
}

function tfSetup(){
  git clone https://github.com/tfutils/tfenv.git ~/.tfenv
}

aptSetup
zshSetup
vimSetup
tfSetup
