FROM scratch
MAINTAINER binhex

# additional files
##################

# add bootstrap files
ADD bootstrap/shim/shim /.shim
ADD bootstrap/cert/cert /.cert
ADD bootstrap/ducktape/ducktape /.ducktape

# install app
#############

# run shim to set permissions to run
RUN ["/.shim", ""]

# run ducktape to download and extract root tarball
RUN ["/.ducktape", "https://github.com/binhex/arch-scratch/releases/download/0.0.1/root.tar.bz2"]

# run pacman to update system
RUN pacman -Syu --needed --noconfirm git

# remove bootstrap files
rm -f /.shim /.cert /.ducktape /.dockerenv /.dockerinit

# set entry point as /bin/bash
CMD ["/bin/bash"]