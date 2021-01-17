set -ex

if command -v yum; then
  sudo yum --enablerepo=extras install epel-release
  sudo yum install compton i3 redshift
fi
