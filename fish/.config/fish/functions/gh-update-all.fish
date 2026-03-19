function gh-update-all
    pushd /home/miguelgrilo/GitHubRepos/
    for d in */
        if test -d "$d/.git"
            echo "A atualizar $d..."
            builtin cd "$d"; git pull; builtin cd ..
        end
    end
    popd
end
