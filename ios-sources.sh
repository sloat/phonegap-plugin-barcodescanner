#!/bin/zsh

if [[ ! -e './src/ios/zxing-cpp/README.md' ]]; then
    print 'zxing-cpp not found. Remember to git submodules update --init --recursive.'
    exit
fi

SRCPATH='./src/ios/zxing-cpp/core/src'


#find bigint sources first
for f in $(find $SRCPATH -name '*.cc'); do
    filepath=${f[3,${#f}]}
    targetdir="$(print $f(:h:s!$SRCPATH!!))"
    print "<source-file src=\"${filepath}\" target-dir=\"${targetdir[2,${#targetdir}]}\" />"
done;
for f in $(find $SRCPATH -name '*.hh'); do
    filepath=${f[3,${#f}]}
    targetdir="$(print $f(:h:s!$SRCPATH!!))"
    print "<header-file src=\"${filepath}\" target-dir=\"${targetdir[2,${#targetdir}]}\" />"
done;

#now the main sources, excluding the win32 stuff
for f in $(find $SRCPATH -name '*.cpp'); do
    if [[ $f != $SRCPATH/win32/* ]]; then
        filepath=${f[3,${#f}]}
        targetdir="$(print $f(:h:s!$SRCPATH!!))"
        print "<source-file src=\"${filepath}\" target-dir=\"${targetdir[2,${#targetdir}]}\" />"
    fi
done;
for f in $(find $SRCPATH -name '*.h'); do
    if [[ $f != $SRCPATH/win32/* ]]; then
        filepath=${f[3,${#f}]}
        targetdir="$(print $f(:h:s!$SRCPATH!!))"
        print "<header-file src=\"${filepath}\" target-dir=\"${targetdir[2,${#targetdir}]}\" />"
    fi
done;
