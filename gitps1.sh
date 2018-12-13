# Show Git Branch and Status
force_git_branch_prompt=yes
export git_status=
export git_branch=

PROMPT_COMMAND="git_ps1;$PROMPT_COMMAND"

git_ps1(){
    git_branch=$((git branch) 2>/dev/null|grep \*|sed 's/^* //g')
    local clear=$((git status -s) 2>/dev/null)
    if [ -n "$clear" ];then
        git_status=×
    else
    	git_status=
    fi
}

if [ ! -z "${force_git_branch_prompt}" ];then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$(if [ -n "$git_branch" ] && [ ! -n "$git_status" ]; then echo "[\[\033[01;33m\]";elif [ -n "$git_branch" ];then echo "[\[\033[01;31m\]";else echo "\[\033[01;31m\]";fi)$(echo $git_branch$git_status)$(if [ -n "$git_branch" ] ; then echo "\[\033[00m\]]";fi)\[\033[00m\]\$ '
fi

unset force_git_branch_prompt
