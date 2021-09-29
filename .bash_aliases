#**   Shell Aliases and Functions   **#
# Path: ~/.bash_aliases
# By: Joshua S. || Pokehah

    # C++ Compililation aliases
    # -O0 - no optimization, -O3/4 - Use optimization for faster executable.
#alias cppcompile="g++ -W -Wall -Wextra -Wpedantic"
alias cppcompile="clang++ -std=c++17 -W -Wall -Wextra -Wpedantic"

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

#TODO_PATH="${HOME}/Documents/ToDo"
TODO() {
    tmux -c "${HOME}/Scripts/OpenToDos.sh"  # Run OpenToDos.sh in tmux
}

# Overwrite ls preferences
alias ll="ls -lhF --group-directories-first"
alias la="ls -lAhF --group-directories-first"

# Get disk usage of current directories contents, sort sizes High->Low
alias duh="du ./ -h --max-depth=1 | sort -hr"
