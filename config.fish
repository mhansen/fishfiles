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

if test $TERM != "screen-256color"
  tmux attach; or tmux
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mark/Downloads/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/mark/Downloads/google-cloud-sdk/path.fish.inc'; else; . '/Users/mark/Downloads/google-cloud-sdk/path.fish.inc'; end; end
