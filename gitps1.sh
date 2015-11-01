# Show Git Branch
force_git_branch_prompt=yes
git_ps1(){
    local branch=$((git branch) 2>/dev/null|grep \*|sed 's/^* //g')
    local clear=$((git status -s) 2>/dev/null)
    local status=
    if [ -n "$clear" ];then
        status=×
    fi
    if [ -n "$branch" ] && [ -z "$status" ];then
        echo -e "\033[00m[\033[01;33m"$branch$status"\033[00m]"
    elif [ -n "$branch" ] && [ -n "status" ];then
        echo -e "\033[00m[\033[01;31m"$branch$status"\033[00m]"
    else
        echo -e "\033[01;31m"$status
    fi
}

if [ ! -z "${force_git_branch_prompt}" ];then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W$(git_ps1)\[\033[00m\]\$ '
fi
unset force_git_branch_prompt
