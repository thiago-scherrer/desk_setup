!#/bin/bash

function aptSetup() {

	sudo apt update && \
		apt full-upgrade -y \
		apt install -y htop \
			lm-sensors \
			vim \
			keepassxc \
			ubuntu-restricted-extras \
			git \
			vlc* \
			encfs \
			gnome-shell-extension-autohidetopbar \ 
			software-center \
			build-essential \
			libz-dev libpng-dev \
			libsdl2-dev \
			libfreetype-dev \
			nasm \
			libboost-dev \
			libboost-filesystem-dev \
			libboost-all-dev \
			libavcodec-extra \
      gimp
}

function zshSetup () {
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cp zsh/.zshrc ~/
}

function vimSetup () {
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

}

function tfSetup(){
  git clone https://github.com/tfutils/tfenv.git ~/.tfenv
}

aptSetup
zshSetup
vimSetup
tfSetup
