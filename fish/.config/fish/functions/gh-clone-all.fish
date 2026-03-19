function gh-clone-all
    set -l user (gh api user -q .login)
    gh repo list $user --limit 1000 | awk '{print $1}' | xargs -L1 gh repo clone
end
