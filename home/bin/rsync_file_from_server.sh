#!/usr/bin/env bash

#
# Rsync a file from a remote server to local env.
#
# This is mostly intended as a script to remind me of the right rsync syntax.
#
# Example:
#
#   rsync_file_from_server.sh -u user -s server -r remote_file -l local_file
#

usage() {
  cat <<-EOF
		Usage: $PROGRAM_NAME -u <USER> -s <SERVER> -r <REMOTE_FILE> -l <LOCAL_FILE>

    Rsyncs <REMOTE_FILE> from <USER>@<SERVER> to <LOCAL_FILE>

	EOF
}

# Ask a yes or no question, prompting until a valid response is received
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

main() {
  # Parse options
  while getopts ':u:s:r:l:' o; do
    case $o in
      u) user="$OPTARG"
        ;;
      s) server="$OPTARG"
        ;;
      r) remote_file="$OPTARG"
        ;;
      l) local_file="$OPTARG"
        ;;
      \?) usage ;;
    esac
  done
  shift $((OPTIND - 1))

  if [ -z "$user" ]; then
    echo '-u <USER> is required.'
    missing_required_args=true
  fi

  if [ -z "$server" ]; then
    echo '-s <SERVER> is required.'
    missing_required_args=true
  fi

  if [ -z "$remote_file" ]; then
    echo '-r <REMOTE_FILE> is required.'
    missing_required_args=true
  fi

  if [ -z "$local_file" ]; then
    echo '-l <LOCAL_FILE> is required.'
    missing_required_args=true
  fi

  if [ $missing_required_args ]; then
    exit
  fi

  confirmation=`cat <<-MSG
		Running

		rsync -avhPzn -e ssh $user@$server:$remote_file $local_file

		Proceed? (no will perform a dry-run)

	MSG`

  if $(ask "$confirmation"); then
		echo -e "\nGrabbing remote file ..."
    rsync -avhPz -e ssh "$user@$server:$remote_file" "$local_file"
    echo
  else
		echo -e "\nGrabbing remote file (dry-run) ..."
    rsync -avhPzn -e ssh "$user@$server:$remote_file" "$local_file"
  fi
}
main $@
