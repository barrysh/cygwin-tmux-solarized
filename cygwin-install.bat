@ECHO OFF
REM -- Automates cygwin installation
REM -- Source: https://gist.github.com/wjrogers/1016065

SETLOCAL

REM -- Change to the directory of the executing batch file
CD %~dp0

REM -- Configure our paths
SET SITE=http://mirrors.kernel.org/sourceware/cygwin/
SET LOCALDIR=%LOCALAPPDATA%/cygwin
SET ROOTDIR=C:/cygwin
SET SETUPX86_64=C:/Users/%username%/Downloads/setup-x86_64.exe

REM -- These are the packages we will install (in addition to the default packages)
SET PACKAGES=ansible,bash,bash-completion,bash-completion-devel,bzip2,ca-certificates,ca-certificates-letsencrypt,colordiff,curl,cygwin,cygwin-devel,dejavu-fonts,diffutils,findutils,gawk,git,git-completion,gnupg,gnutls,grep,gzip,hostname,htop,keepassx,keychain,less,makepasswd,man-pages-linux,mintty,neofetch,ncurses,openssl,p7zip,ping,screen,sed,time,tmux,tree,vim,wget,which,whois

REM -- Optional development tools
SET PACKAGES=%PACKAGES%,autoconf,automake,ctags,gcc-core,gcc-g++,gettext,libiconv,libncursesw-devel,make,readline,zlib-devel

REM -- Optional python packages (Python2.7 and Python3.8)
SET PACKAGES=%PACKAGES%,python-pip-wheel,python-setuptools-wheel,python-wheel-wheel,python2,python27,python27-pip,python27-setuptools,python3,python38,python38-pip,python38-setuptools,python38-wheel

REM -- Optional SSH packages
SET PACKAGES=%PACKAGES%,openssh,ssh-pageant,sshpass

REM -- Optional databases
SET PACKAGES=%PACKAGES%,postgresql,postgresql-client,postgresql-devel,sqlite3

REM -- Install the packages
ECHO *** INSTALLING PACKAGES
"%SETUPX86_64%" --no-admin -q -D -L -d -g -o -s "%SITE%" -l "%LOCALDIR%" -R "%ROOTDIR%" -C Base -P %PACKAGES%

REM -- Show what we did
ECHO.
ECHO.
ECHO cygwin installation updated
ECHO  - %PACKAGES%
ECHO.

ENDLOCAL

PAUSE
EXIT /B 0