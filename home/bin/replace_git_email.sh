#!/usr/bin/env bash

# Rewrite entire branch history, replacing an email address
#
# @param $1 - The <BAD_EMAIL>, to be replaced
# @param $2 - The <GOOD_EMAIL>, to replace with
#
replace_git_email() {
  BAD_EMAIL="$1"
  GOOD_EMAIL="$2"

  git filter-branch --commit-filter '
    if [ "$GIT_AUTHOR_EMAIL" = "$BAD_EMAIL" ];
      then
        GIT_AUTHOR_EMAIL="$GOOD_EMAIL";
        git commit-tree "$@";
      else
        git commit-tree "$@";
    fi' HEAD
}

# Ask a yes or no question, prompting until a valid response is recieved
#
# @param $1 the question to ask
#
# @return true if 'yes', false if 'no'
#
ask() {
  until [[ $choice =~ ^(yes|no)$ ]]; do
    read -p "$1 (yes/no): " choice
  done

  if [[ $choice == 'yes' ]]; then
    unset choice
    true
  else
    unset choice
    false
  fi
}

PROGRAM_NAME="$0"

usage() {
  cat <<-EOF
		Usage: $PROGRAM_NAME -b <BAD_EMAIL> -g <GOOD_EMAIL>

		Re-writes an entire git branch's history, reauthoring each commit
		by email <BAD_EMAIL> with <GOOD_EMAIL>.

	EOF
}

main() {
  # Parse options
  while getopts ':b:g:' o; do
    case $o in
      b) bad_email="$OPTARG"
        ;;
      g) good_email="$OPTARG"
        ;;
      \?) usage ;;
    esac
  done
  shift $((OPTIND - 1))

  if [ -z "$bad_email" ]; then
    echo '-b <BAD_EMAIL> is required.'
    missing_required_args=true
  fi

  if [ -z "$good_email" ]; then
    echo '-b <GOOD_EMAIL> is required.'
    missing_required_args=true
  fi

  if [ $missing_required_args ]; then
    exit
  fi

  confirmation=$(cat <<-MSG
		Rewriting commit history, replacing

		'$bad_email' with '$good_email' ...

		Proceed? This is destructive. 💣

	MSG)

  if $(ask "$confirmation"); then
		echo -e "\nRewriting commit history ..."
    replace_git_email $bad_email $good_email
  else
    echo -e "\nExiting..."
  fi
}
main $@
