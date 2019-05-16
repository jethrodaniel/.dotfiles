#!/usr/bin/env bash

# Rewrite entire branch history, replacing an email address
#
# @param $1 - The <BAD_EMAIL>, to be replaced
# @param $2 - The <GOOD_EMAIL>, to replace with
# @param $3 - '-f', if -f is to be passed to git-filter-branch
#
# Adapted from <https://help.github.com/en/articles/changing-author-info>
#
replace_git_email() {
  local bad_email="$1"
  local good_email="$2"
  local force="$3"

  local filter_script=`cat <<-SHELL
		if [ "\$GIT_COMMITTER_EMAIL" = "$bad_email" ]
		then
				export GIT_COMMITTER_EMAIL="$good_email"
		fi
		if [ "\$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
		then
				export GIT_AUTHOR_EMAIL="$good_email"
		fi
	SHELL`

  git filter-branch "$force" --env-filter "$filter_script" --tag-name-filter cat -- --branches --tags
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
		Usage: $PROGRAM_NAME -b <BAD_EMAIL> -g <GOOD_EMAIL> [-f]

		Flags:
			-f   Force, i.e, pass -f to git-filter-branch

		Re-writes an entire git branch's history, reauthoring each commit
		by email <BAD_EMAIL> with <GOOD_EMAIL>.

	EOF
}

main() {
  # Parse options
  while getopts ':b:g:f' o; do
    case $o in
      b) bad_email="$OPTARG"
        ;;
      g) good_email="$OPTARG"
        ;;
      f) force='-f'
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

  if [ -z "$force" ] || [ "$force" != '-f' ]; then
    force=''
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
    replace_git_email $bad_email $good_email $force
  else
    echo -e "\nExiting..."
  fi
}
main $@
