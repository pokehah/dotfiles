#**   Shell Aliases and Functions   **#
# Path: ~/.bash_aliases
# By: Joshua S. || Pokehah

export VISUAL="$(which nvim)"
export EDITOR="$VISUAL"

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

# Github SSH auto-login #
#exec $(ssh-agent -s)  # Start ssh-agent
## run ssh-add manually and login to Github SSH key.

# Overwrite ls preferences
alias l="ls -lhF --group-directories-first"
alias ll="ls -lhF --group-directories-first"
alias la="ls -lAhF --group-directories-first"

# Get disk usage of current directories contents, sort sizes High->Low
alias duh="du ./ -h --max-depth=1 | sort -hr"

# I hate typing xdg-open
alias opendir="xdg-open ./"

# Pretty print mount output. Moreso for an example of using column command
#alias pmount="mount | column -t"

# turns out this works with an alias too, I just needed to use " instead of '.
# alias could be better as well since you can see what its runs just by typing alias cmd and unalias it if desired
# Interesting way to allow passing different options to piped aliases
# For example, if you wanted to list files with du using '-a'
# Better than function parameters in a way since you have to explicity name when using it, less obscurity
#duh() {
#    # USAGE EXAMPLE: extra_options_du='-a' duh
#    du ./ -h --max-depth=1 ${extra_options_du} | sort -hr ${extra_options_sort}
#}

# Print nicely formatted date + time.
alias fdate='date +"%a, %d %B %Y, %I:%M"'
