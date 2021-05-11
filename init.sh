#!/bin/sh
################################################################################
#
# Bash initialization template file
#
# Created by peromage 2021/02/24
# Last modified 2021/03/18
#
#
# This section should remain untouched
# Initialization
[ -z "$BASH_VERSION" ] && return
init_home=$(dirname $(realpath "$BASH_SOURCE"))
init_file=$(realpath "$BASH_SOURCE")
#
# Examples of configuration outside of ribash
#
# z.lua
#------
#eval "$(lua5.3 $init_home/bin/z.lua --init bash enhanced once)"
#
# Examples of configuration options of ribash
#
# Prompt theme
#-------------
#rice_theme="my-bash"
#
# Space separated string for mods under ribash/mods
#--------------------------------------------------------
#rice_mods="basic nav env"
#
################################################################################
rice_theme="my-bash"
rice_mods="basic nav env"
. $init_home/ribash/ribash.sh # Rice config should start before this line

# Not available in container
if [ -z "$(cat /proc/1/cgroup | grep :/docker)" ]; then
    eval "$(lua5.3 $init_home/bin/z.lua --init bash enhanced once)"
fi

PATH=$HOME/a/bin:$PATH
. $HOME/a/workbench/init.sh
. $HOME/a/workbench/sources/ecgdev_docker.sh
. $HOME/a/workbench/sources/ecg2sdk_setup.sh

cpm_setup() {
    local p="$HOME/repo/ecg_master"
    cd "$p"
    . env_setup.sh
    cd fnv/cpm
}
