# enviroment variables
set -gx REPOS_PATH /home/paodelonga/Repositories/
set -gx BROWSER firefox
set -gx EDITOR micro
set -gx IDE nvim
set -gx PAGER cat

# configure pinentry to current tty
set -g GPG_TTY (tty)
