############## OH MY ZSH CONFIG ###############

# Path to your oh-my-zsh installation.
export ZSH="/Users/annie/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vscode)

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

############## /OH MY ZSH CONFIG ################


############### COVERHOUND CONFIG ###############

# Allows brew installed programs like git to take precedence over system installs
export PATH="/usr/local/bin:$PATH"

eval "$(rbenv init -)"  # initializes rbenv
eval "$(nodenv init -)" # initializes nodenv

# Identifies my CoverHound admin / advisor / employee email for development
export CH_USER="annie@coverhound.com"

alias cov-reset-db="bundle install && be rake db:drop && be rake db:create && be rake db:snapshot:import && be rake db:migrate && be rake db:test:prepare"
alias cap-reset-db="bundle install && be rake db:snapshot:import && be rake db:migrate && be rake db:test:prepare && be rake commercial_agency:db:seed"

# show local branches that have been merged into master
merged_branches()
{
  git branch --merged master | grep -v \* | grep -v integ* | grep -v production | grep -v master
}

deploy_this_branch_to()
{
  branch=$(git rev-parse --abbrev-ref HEAD) bundle exec cap $1 deploy
}

# CoverHound Aliases
alias be="bundle exec"
alias cd-com="cd ~/Code/commercial"
alias client-hot="sh -c 'rm -rf public/business-insurance/webpack || true && yarn run hot-assets'"
alias web="HOT_RELOADING=TRUE bundle exec rails s -p 3000"
alias sidekiq="be sidekiq"
alias deploy-to-batman="deploy_this_branch_to commercial-s-batman"
alias deploy-to-preprod="deploy_this_branch_to commercial-s-preprod"

############## /COVERHOUND CONFIG ###############


# Fixes weird issue resulting in "no match found" error (https://github.com/ohmyzsh/ohmyzsh/issues/31)
unsetopt nomatch

alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias cco="cd ~/Code"

# Open .zshrc file in VS Code
alias ozshrc="open ~/.zshrc"

# git aliases
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gc="git commit"
alias gcv="git commit -v"
alias gcm="git commit -m"
alias gch="git checkout"
alias gchb="git checkout -b"
alias gcherry="git cherry-pick"
alias gd="git diff"
alias gl="git log"
alias glo="git log --oneline"
alias gpl="git pull"
# alias ggl="git pull origin $(current_branch)"
alias gp="git push"
# alias ggp="git push origin $(current_branch)"
alias gpD="git push origin -d"
alias gri="git rebase -i"
alias grh="git reset HEAD"
alias grhh="git reset HEAD --hard"
alias gs="git status"
alias gsh="git stash"

# Rails aliases
alias rc="rails console"
alias rs="rails server"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###################################################

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
