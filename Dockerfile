FROM fedora:latest

LABEL updated_at '2017-06-24'

RUN dnf -y update
RUN dnf -y install gpg perl perl-Getopt-Long perl-Digest-MD5 tar wget
WORKDIR /usr/local/src
RUN curl -sL http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar zxf - && mv install-tl-20* install-tl
WORKDIR install-tl
RUN echo "selected_scheme scheme-full" > profile && ./install-tl -profile profile
WORKDIR /
ENV PATH /usr/local/texlive/2017/bin/x86_64-linux:$PATH
CMD ["tlmgr", "--version"]
