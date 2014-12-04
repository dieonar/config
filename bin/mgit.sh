#!/bin/sh
## mgit.sh for mgit in /home/fulmine/Git/github/dieonar/config/bin
##
## Made by KING Jimmy
## Login   <fulmine@epitech.net>
##
## Started on  Thu Dec  4 14:46:22 2014 KING Jimmy
## Last update Thu Dec  4 15:26:52 2014 KING Jimmy
##

WHITE="\e[97m"
BLUE="\e[33m"
GREEN="\e[32m"
RED="\e[31m"
CYAN="\e[36m"

LRED="\e[91m"
LGREEN="\e[92m"
LBLUE="\e[94m"
LCYAN="\e[96m"

function print_message {
    echo -e "["$LBLUE"KING"$WHITE"]["$LCYAN"GIT"$WHITE"] "$1"\e[0m"
}


function clone() {
    if [ -e $2 ]; then
        print_message "Usage: mgit clone [SERVER] [REPOSITORY] (USER)"
        exit
    fi
    if [ "$1" == "github" ]; then
        if [ "$#" == 3 ]; then
            git clone git@github.com:$3/$2
        else
            git clone git@github.com:dieonar/$2
        fi
    elif [ "$1" == "epitech" ]; then
        if [ "$#" == 3 ]; then
            git clone king_j@git.epitech.eu:/$3/$2
        else
            git clone king_j@git.epitech.eu:/king_j/$2
        fi
    else
        print_message $LRED"Error"$WHITE": Server does not exist !"
    fi
}

function create {
    if [ -e $1 ]; then
	print_message "Usage: mgit create [REPOSITORY NAME] (PATH TO CLONE)"
        exit
    fi
    if [ "$#" != 0 ]; then
        blih -u king_j repository create $1 > /dev/null
	blih -u king_j repository setacl $1 ramassage-tek r > /dev/nul
	print_message "Repository "$1" created on server EPITECH"
    else
        print_message $RED"Error"$WHITE": Missing repository name"
    fi
}

function delete {
    echo "testdelete";
}

function check {
   if [ -e $1 ]; then
       print_message "Usage: mgit check [REPOSITORY NAME]";
       exit
   fi
   print_message "Checking rights on the repository "$1":"
   blih -u king_j repository getacl $1
}

function push {
    print_message "Updating repository with local changes"
    if [ -e $1]; then
	git add --all
	git commit -am "Autoupdate using mgit"
	git push origin master
    else
	git add --all
	git commit -am $1
	git push origin master
    fi
}

if [ -e $1 ]; then
    print_message "Usage: mgit [ACTION]"
    echo -e "\tFlag [create] : create new repository on epitech server"
    echo -e "\tFlag [clone]  : clone a repository from github or epitech servers"
    echo -e "\tFlag [check]  : displays users rights on a epitech repository"
    echo -e "\tFlag [delete] : delete a repository from epitech server"
    echo -e "\tFlag [push]   : update a repository using local refs"
    exit
fi

case "$1" in
    "create" )
        create $2 $3;;
    "clone" )
        clone $2 $3;;
    "check" )
	check $2;;
    "delete" )
	delete $2;;
    "push" )
	push $2;;
esac;
