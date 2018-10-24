#!/bin/bash 

[ ! -e configure ] && NOCONFIGURE=1 ./autogen.sh

GLIB_GENMARSHAL="`which glib-genmarshal`" \
GLIB_MKENUMS="`which glib-mkenums`" \
LDFLAGS="-ldl -Wl,-rpath,/lib -Wl,-rpath,/usr/lib" \
CFLAGS="-fPIC -fno-omit-frame-pointer -funwind-tables -Wl,--no-merge-exidx-entries" \
./configure --host=arm-linux --prefix= --with-sysroot=/chroot --disable-debug --disable-nls --disable-valgrind --disable-orc --disable-opengl --disable-gles2 --disable-egl --disable-wgl --disable-glx --disable-cocoa --disable-x11 --disable-wayland --disable-dispmanx --disable-x --disable-xvideo --disable-xshm --disable-gl --disable-cdparanoia --disable-ivorbis --disable-libvisual --disable-ogg --disable-opus --disable-pango --disable-theora --disable-vorbis
make -j8
make DESTDIR=/chroot install
