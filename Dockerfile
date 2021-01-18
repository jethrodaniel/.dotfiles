FROM centos:centos7

RUN yum install -y git
RUN git clone https://github.com/jethrodaniel/dotfiles && cd dotfiles && make
