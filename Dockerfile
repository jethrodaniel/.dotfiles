FROM centos:centos7

RUN yum install -y git make
RUN git clone https://github.com/jethrodaniel/dotfiles && cd dotfiles && make
