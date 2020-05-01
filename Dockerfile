FROM archlinux/base

RUN pacman -Syyu --noconfirm --needed base-devel

RUN useradd -m -G users -s /usr/bin/bash builder
RUN echo 'builder ALL=(ALL) NOPASSWD: /usr/bin/pacman' >> /etc/sudoers
USER builder:users
RUN mkdir ~/.gnupg && echo "keyserver-options auto-key-retrieve" > ~/.gnupg/gpg.conf

ENV SRCDEST="/home/builder/srcdest" BUILDDIR="/home/builder/builddir"
VOLUME /home/builder/pkgbuild
WORKDIR /home/builder/pkgbuild

ENTRYPOINT [ "makepkg" ]
CMD [ "--sync", "--noprogressbar", "--asdeps", "--noconfirm", "--needed", "--rmdeps", "--noarchive" ]
