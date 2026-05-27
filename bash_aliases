#**   Shell Aliases and Functions   **#
# Path: ~/.bash_aliases
# By: Joshua S. || Pokehah

#--------------------------#
#         Aliases          #
#--------------------------#
alias ls='ls -hF --color=auto --group-directories-first'
alias ll='ls -lhF --color=auto --group-directories-first'
alias la='ls -lAhF --color=auto --group-directories-first'

alias grep='grep --color=auto'

# Print nicely formatted date + time.
alias fdate='date +"%a, %d %B %Y, %I:%M"'

    # C++ Compililation aliases
    # -O0 - no optimization, -O3/4 - Use optimization for faster executable.
#alias cppcompile="g++ -W -Wall -Wextra -Wpedantic"
alias cppcompile="clang++ -std=c++17 -W -Wall -Wextra -Wpedantic"

# yt-dlp | YouTube downloader aliases
alias ytdlmusic='yt-dlp -x --audio-quality "best" --audio-format "opus" -o "%(title)s.%(ext)s"'

#-------------------------#
#        Functions        #
#-------------------------#
RunTheCode() {
    # Get code file's name
    [[ "$1" == "" ]] && filename="a.out" || filename="$1"

    if [ -f ./"${filename}" ]; then
        clear
        ./"${filename}"
        echo -e "\nFinished executing \"${filename}\"."
        echo -n "Press any key to continue..."; read -rn 1; echo;
    else
        echo "File \"${filename}\" does not exist in current directory."
    fi
}

# Get disk usage of contents of directory, sort sizes High->Low
### USAGE EXAMPLE: extra_options_du='-a' duh
duh() {
    du "./${1}" -h --max-depth=1 "${extra_options_du}" | sort -hr "${extra_options_sort}"
}
duhf() {
    du "./${1}" -ha --max-depth=1 "${extra_options_du}" | sort -hr "${extra_options_sort}"
}

# Yazi with directory changing
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


