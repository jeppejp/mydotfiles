function fish_greeting
    fortune /home/jjp/git-repos/mydotfiles/fortunes/
end

funcsave fish_greeting

function fish_right_prompt
     set -l is_git_repository (git rev-parse --is-inside-work-tree ^/dev/null)
     if test -n "$is_git_repository"
         set -l branch (git symbolic-ref --short HEAD ^/dev/null; or git show-ref --head -s --abbrev | head -n1 ^/dev/null)
        echo $branch
    end

end

funcsave fish_right_prompt


function calc
    echo scale=3 \n $argv \n quit | bc -q
end
funcsave calc

#set -g fish_color_cwd 9fbc00
set -gx PATH /usr/local/avr32/bin $PATH
