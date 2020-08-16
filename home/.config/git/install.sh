set -ex

cd ~/dotfiles/home/.config/git/src


sudo yum groupinstall -y "Development Tools"
sudo yum install -y wget perl-CPAN gettet-devel perl-devel openssl-devel

make configure
sudo ./configure --prefix=/usr
sudo make
sudo make install

cd -
