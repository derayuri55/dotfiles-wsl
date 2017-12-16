set fish_greeting ""

# make Vim the default editor
set --export EDITOR "nvim"

# make Vim usable with git
set --export GIT_EDITOR "nvim"

# alias
if [ -f $HOME/.config/fish/aliases.fish ]
	. $HOME/.config/fish/aliases.fish
end

# pyenv
if [ -d $HOME/.pyenv/bin/ ]
	set -x PATH $HOME/.pyenv/bin/ $PATH
	. (pyenv init -l psub)
end

# goenv
if [ -d $HOME/.goenv/bin ]
	set -gx GOPATH $HOME/go
	set -gx GOENV_ROOT $HOME/.goenv
	set -gx PATH $GOPATH/bin $PATH
	set -gx PATH $GOENV_ROOT/bin $PATH
	. (goenv init -|psub)
end

if [ -d $HOME/.go/bin ]
	set -gx PATH $HOME/.go/bin $PATH
end

# $DISPLAY
set -x DISPLAY localhost:0.0

function upgrade
	switch (uname)
	case Linux
		sudo apt update
		sudo apt upgrade
	case Darwin
		brew update
		brew upgrade
	end
end

function fish_prompt
	if [ $status -eq 0 ]
		set status_face (set_color green -b black)" > "(set_color -b normal)
	else
		set status_face (set_color red -b black)" >> "(set_color -b normal)
	end

	set prompt (set_color yellow)(prompt_pwd)

	echo $prompt
	echo $status_face
end
