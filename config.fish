function fish_prompt
    printf '%s@%s%s%s%s%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (git_prompt) (set_color normal)
end

function git_prompt
    if git symbolic-ref HEAD >/dev/null ^/dev/null
        set_color yellow
        printf ' (git:%s' (git-current-branch)
        git cherry -v >/dev/null ^/dev/null; and printf '+%d' (git-num-commits-to-push ^/dev/null)
        printf ')'
    end
end

function git-current-branch
    git symbolic-ref HEAD ^/dev/null | awk -F/ '{print $3;}'
end

function git-num-commits-to-push
    git cherry -v | wc -l
end

for method in GET HEAD POST PUT DELETE TRACE OPTIONS
    alias $method "lwp-request -m $method"
end
