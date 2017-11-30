set fish_greeting ""

# make Vim the default editor
set --export EDITOR "nvim"

# make Vim usable with git
set --export GIT_EDITOR "nvim"

if [ -f $HOME/.config/fish/aliases.fish ]
	. $HOME/.config/fish/aliases.fish
end

eval (thefuck --alias | tr '
' ';')

function fish_prompt
	if [ $status -eq 0 ]
		set status_face (set_color green -b black)"_・)< "(set_color -b normal)
	else
		set status_face (set_color red -b black)"(*;-;)< "(set_color -b normal)
	end

	set prompt (set_color yellow)(prompt_pwd)

	echo $prompt
	echo $status_face
end
