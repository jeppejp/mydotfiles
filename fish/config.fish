function fish_greeting
    fortune -a
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

set -g fish_color_cwd 9fbc00
