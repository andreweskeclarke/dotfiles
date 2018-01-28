eval "$(jenv init -)"

# added by Anaconda3 2.3.0 installer
export PATH="/Users/andrew/anaconda/bin:$PATH"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.local/lib64/
export CPATH=$CPATH:~/.local/include
export LIBRARY_PATH=$LIBRARY_PATH:~/.local/lib

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib:/usr/local/cuda/extras/CUPTI/lib/
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH
export PATH="$CUDA_HOME/bin:$PATH"

alias ll='ls -l'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"


function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

PS1="\[$COLOR_WHITE\]\u:\w "     # user:pwd
PS1+="\[\$(git_color)\]"        # colors git status
PS1+="\$(git_branch)"           # prints current branch
PS1+="\[$COLOR_GREEN\]\$\[$COLOR_RESET\] "   # '#' for root, else '$'
export PS1
export PATH=$PATH:~/src/maths/
export BUILD_ROOT=/Users/andrew/src/prediction_machines/build.rules/
export GTEST_COLOR=1

export TIME="%e"
function timeop() {
OutputFile=/home/rodo/times.$1
shift
echo /usr/bin/time -ao $OutputFile "$@"
/usr/bin/time -f "$PWD,%e" -ao $OutputFile "$@"
}

alias synergy='synergyc --name rkr --debug DEBUG1 --log synergylog.txt 192.168.1.8'

alias build='touch ./build_output.log; ln -sf $PWD/build_output.log /home/rodo/build_output.log; timeop build make -j 8 VERBOSE=1 > build_output.log 2>&1 || vim build_output.log; grep warning build_output.log'
alias tail_build='tail -f /home/rodo/build_output.log'

alias focker='docker run --privileged=true --rm -it -v /home/rodo/:/home/rodo -v /tmp/.X11-unix:/tmp/.X11-unix -e "TERM=xterm" --security-opt seccomp=unconfined --net="host" -e "HOSTNAME=localhost" -e DISPLAY=unix$DISPLAY ';

function dockerGCC71() { sudo focker gcc:7.1 ;}
function dockerGCC72() { sudo focker gcc:7.2 ;}
function dockerMine() { sudo focker $1 ;}
function dockerPull() { sudo docker pull $1 ;}
alias runDocker='sudo systemctl start docker'

alias fthist="find . -type f | sed 's/.*\///' | sed 's/.*\.//' | sort | uniq -c"

alias find_sources='find . -name \*.h -o -name \*.cpp -o -name \*.cc -o -name \*.hpp -o -name \*.cxx -o -name \*.hxx -o -name \*.c -o -name \*.ipp'
alias find_xml='find . -name \*.xml -o -name \*.xsl -o -name \*.xsd'
alias find_python='find . -name \*.py'
alias find_configs='find . -name \*.xml -o -name \*.cfg -o -name \*.json -o -name \*.yaml -o -name \*.yml -o -name \*.csv -o -name \*.ini'

function cpplist { find_sources > ~/cpplist.$$.cpplist; vim ~/cpplist.$$.cpplist; rm ~/cpplist.$$.cpplist; }
function xmllist { find_xml > ~/xmllist.$$.xmllist; vim ~/xmllist.$$.xmllist; rm ~/xmllist.$$.xmllist; }
function pylist { find_python > ~/pylist.$$.pylist; vim ~/pylist.$$.pylist; rm ~/pylist.$$.pylist; }

function cppfind { find_sources | xargs grep -n "$@" | tee ~/cppfind_results.$$.findres; vim ~/cppfind_results.$$.findres; rm ~/cppfind_results.$$.findres ;}
function xmlfind { find_xml | xargs grep -n "$@" | tee ~/xmlfind_results.$$.findres; vim ~/xmlfind_results.$$.findres; rm ~/xmlfind_results.$$.findres ;}
function pyfind { find_python | xargs grep -n "$@" | tee ~/pyfind_results.$$.findres; vim ~/pyfind_results.$$.findres; rm ~/pyfind_results.$$.findres ;}

function cfgfind { find_configs | xargs grep -n "$@" | tee ~/cfgfind_results.$$.findres; vim ~/cfgfind_results.$$.findres; rm ~/cfgfind_results.$$.findres ;}

function gdiff() { git diff "$@" > g_diff_diffs.$$.txt && vim g_diff_diffs.$$.txt && rm g_diff_diffs.$$.txt ;}
function gshow() { git show "$@" > g_diff_diffs.$$.gshow && vim g_diff_diffs.$$.gshow && rm g_diff_diffs.$$.gshow ;}
function gcdiff() { git diff "$@" --cached > g_diff_diffs.$$.txt && vim g_diff_diffs.$$.txt && rm g_diff_diffs.$$.txt ;}
function gstatus() { git status > g_status.$$.txt && vim g_status.$$.txt && rm g_status.$$.txt ;}
function gsstatus() { git submodule foreach git status ;}
function gpull() { git pull --rebase ;}
function gpush() { git push origin HEAD ;}
function gsshow() { git stash show -p "$@" > g_stash_show_diffs.$$.gshow && vim g_stash_show_diffs.$$.gshow && rm g_stash_show_diffs.$$.gshow ;}
function gshown() { git log --name-status -n "$@" | egrep 'commit [0-9a-z]+' | sed 's/commit //' | xargs git show > g_show_n_diffs.$$.gshow && vim g_show_n_diffs.$$.gshow && rm g_show_n_diffs.$$.gshow ;}
function glog() { git log --name-status -n "$@" > g_log_results.$$.glog && vim g_log_results.$$.glog && rm g_log_results.$$.glog ;}
function gspeek() { git stash show -p stash@{"$1"} > git_stash_peek.$$.gshow && vim git_stash_peek.$$.gshow && rm git_stash_peek.$$.gshow ;}
function gsapply() { git stash apply stash@{"$1"} ;}

