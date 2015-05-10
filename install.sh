if [ ! -n "$KCONFIG" ]; then
    KCONFIG=~/.kconfig
fi

if [ -d "$KCONFIG" ]; then
    echo -e "\e[33mThere is already an installation of KING Config\e[0m"
    exit
fi


echo -e "\e[33mCloning KING Config...\e[0m"
hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/Dieonar/config.git $KCONFIG ||
	{
	    echo "git not installed"
	    exit
	}

rm -f $HOME/.emacs
rm -rf $HOME/.emacs.d
rm -f $HOME/.aliases

#Creation of links
ln -s $KCONFIG/.emacs $HOME/.emacs
ln -s $KCONFIG/.emacs.d/ $HOME/.emacs.d
ln -s $KCONFIG/.aliases $HOME/.aliases


if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    echo "" >> $HOME/.zshrc
    echo "#Load aliases" >> $HOME/.zshrc
    echo "if [ -f ~/.aliases ]; then" >> $HOME/.zshrc
    echo ". ~/.aliases" >> $HOME/.zshrc
    echo "fi" >> $HOME/.zshrc

    echo "
extract ()
{
    if [ -f $1 ] ; then
        case \$1 in
            *.tar.bz2) tar xjf \$1 ;;
            *.tar.gz) tar xzf \$1 ;;
            *.bz2) bunzip2 \$1 ;;
            *.rar) unrar x \$1 ;;
            *.gz) gunzip \$1 ;;
            *.tar) tar xf \$1 ;;
            *.tbz2) tar xjf \$1 ;;
            *.tgz) tar xzf \$1 ;;
            *.zip) unzip \$1 ;;
            *.Z) uncompress \$1;;
            *.7z) 7z x \$1 ;;
            *) echo \"'\$1' cannot be extracted via extract()\" ;;
        esac
    else
        echo \"'\$1' is not a valid file\"
    fi
}" >> $HOME/.zshrc

fi

if [ -f ~/.bashrc ] || [ -h ~/.bashrc ]; then
    echo "" >> $HOME/.bashrc
    echo "#Load aliases" >> $HOME/.bashrc
    echo "if [ -f ~/.aliases ]; then" >> $HOME/.bashrc
    echo ". ~/.aliases" >> $HOME/.bashrc
    echo "fi" >> $HOME/.bashrc
fi
