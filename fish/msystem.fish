# This is a direct port of /etc/msystem.

if test -z $MSYSTEM
  set -x MSYSTEM MSYS
end

set -e MSYSTEM_PREFIX
set -e MSYSTEM_CARCH
set -e MSYSTEM_CHOST

set -e MINGW_CHOST
set -e MINGW_PREFIX
set -e MINGW_PACKAGE_PREFIX

set -e CONFIG_SITE

switch $MSYSTEM
  case MINGW32
    set -x MSYSTEM_PREFIX '/mingw32'
    set -x MSYSTEM_CARCH 'i686'
    set -x MSYSTEM_CHOST 'i686-w64-mingw32'
    set -x MINGW_CHOST "$MSYSTEM_CHOST"
    set -x MINGW_PREFIX "$MSYSTEM_PREFIX"
    set -x MINGW_PACKAGE_PREFIX "mingw-w64-$MSYSTEM_CARCH"
    set -x CONFIG_SITE "$MSYSTEM_PREFIX/etc/config.site"
  case MINGW64
    set -x MSYSTEM_PREFIX '/mingw64'
    set -x MSYSTEM_CARCH 'x86_64'
    set -x MSYSTEM_CHOST 'x86_64-w64-mingw32'
    set -x MINGW_CHOST "$MSYSTEM_CHOST"
    set -x MINGW_PREFIX "$MSYSTEM_PREFIX"
    set -x MINGW_PACKAGE_PREFIX "mingw-w64-$MSYSTEM_CARCH"
    set -x CONFIG_SITE "$MSYSTEM_PREFIX/etc/config.site"
  case CLANG32
    set -x MSYSTEM_PREFIX '/clang32'
    set -x MSYSTEM_CARCH 'i686'
    set -x MSYSTEM_CHOST 'i686-w64-mingw32'
    set -x MINGW_CHOST "$MSYSTEM_CHOST"
    set -x MINGW_PREFIX "$MSYSTEM_PREFIX"
    set -x MINGW_PACKAGE_PREFIX "mingw-w64-clang-$MSYSTEM_CARCH"
    set -x CONFIG_SITE "$MSYSTEM_PREFIX/etc/config.site"
  case CLANG64
    set -x MSYSTEM_PREFIX '/clang64'
    set -x MSYSTEM_CARCH 'x86_64'
    set -x MSYSTEM_CHOST 'x86_64-w64-mingw32'
    set -x MINGW_CHOST "$MSYSTEM_CHOST"
    set -x MINGW_PREFIX "$MSYSTEM_PREFIX"
    set -x MINGW_PACKAGE_PREFIX "mingw-w64-clang-$MSYSTEM_CARCH"
    set -x CONFIG_SITE "$MSYSTEM_PREFIX/etc/config.site"
  case '*'
    set -x MSYSTEM_PREFIX '/usr'
    set -x MSYSTEM_CARCH (/usr/bin/uname -m)
    set -x MSYSTEM_CHOST (/usr/bin/uname -m)"-pc-msys"
    set -x CONFIG_SITE "/etc/config.site"
end