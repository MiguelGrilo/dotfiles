function gh-push-all --description 'git add, commit and push on all repos'
    pushd /home/miguelgrilo/GitHubRepos/
    for d in */
        if test -d "$d/.git"
            echo "  Processing $d..."
            builtin cd "$d"
            
            # Verifica se há alterações para evitar commits vazios
            if not git diff-index --quiet HEAD --
                git add .
                set -l msg "Auto-update: "(date "+%Y-%m-%d %H:%M")
                git commit -m "$msg"
                
                # Deteta a branch atual para o push ser certeiro
                set -l branch (git branch --show-current)
                if git push origin $branch
                    echo "  Success on $d"
                else
                    echo "  Error pushing to $d"
                end
            else
                echo "  Nothing to change on $d"
            end
            
            builtin cd ..
        end
    end
    popd
end
