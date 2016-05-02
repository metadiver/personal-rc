awker()		{
echo -e "You must provide the file with the lines to be removed, followed by the file to remove from. \n"
read -p "Insert the filenames now.     " one
read -p "ANOTHA ONE.     " two
awk 'NR==FNR{a[$0];next} !($0 in a)' $one $two
}

bakfunction()	{
	cp $1 $1.bak
}

bcuts()		{
	cat ~/Documents/Backups/LinuxFiles/LinuxConfig/Shortcuts/cmdkeycuts
}

cd_up()		{
	cd $(printf "%0.0s../" $(seq 1 $1));
}

cfuncl()	{
	cat ~/.bash_functions | grep '()'
}

cmd()		{
	touch $1.sh
	echo "#!/bin/bash" > $1.sh
	chmod +x $1.sh
}

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

degpg()		{
	gpg --decrypt-files $1
}

documents()	{
	cp $1 ~/Documents/Copy/
}

engpg()		{
	gpg --default-recipient-self --encrypt-files $1
}

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

gpgl()		{
	gpg --list-keys
}

gz()		{
	gzip $1
}

input()		{
	echo "$1"
}

lss()		{
	clear ; ls * 
	echo -e "  \n" ; read -p "If you would like to look inside a folder in this list, enter it here:  " dir ; ls * $dir
	echo -e "  \n"
	sleep 3
	echo -e "Did ya find anything ya like? Do you want to cd to a directory?  \n"
	read -p "No to quit, yes to open a cd command. [y/n] :  "

}

slx()  		 {
	xrandr --output HDMI-0 --brightness 0.$1
}

mdcd()		{
	mkdir -p $1 && mkdir -p $1 && cd $1
}

packman()               {
	clear ; cd /var/cache/pacman/pgk/ ; ls
	read -p "Enter your query for grep." thing ; echo -e " \n"
	ls | grep $thing
	read -p "Your dinner, sir." ; echo -e " \n"
}

pdfex()         {
        clear
        echo -e "  \n"
        echo -e "In order to run this program correctly, you must type the command followed by the files you would like to merge. The script will reset if no files were named.  \n"
        if
            wc -l $1 | grep -o [[:digit:]]
        then
            echo "Resetting. You did not enter any variables."
            exit
        fi

        echo -e "What would you like to call your output file?  \n"
        read -p "Type the name and then [ENTER] when finished:  " pdname
        #gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$pdname.pdf
}

rms()		{
	echo -e " \n"
	echo "Are you absolutely sure? [y/n]" | tr -d '\012' ; read
	if [ "_$REPLY" = "_y" ]; then
		echo "Last chance before permanent deletion!"
		'/bin/rm' -i $1
	else
		echo "Deletion cancelled!"
	fi
}

sremv()	{
	for f in *\ *; do mv "$f" "${f// /_}"; done
}

targz()		{
	tar -cvzf $1.tar.gz $2 $3 $4 $5 $6 $7
}

ugz()		{
	echo "Please input the filenames you would like to unzip (up to 9).  "
	read -p "   " a b c d e f g h i
	gunzip -f $a $b $c $d $e $f $g $h $i
}

uzip()          {
        read -p "Recursive unzipping? Press r for recursive or hit enter to continue:  " m 
        gunzip -f$m 
	echo -e "  \n"  
        read -p "Type full names of the archives you would like to unzip: (up to 9)  :" 1 2 3 4 5 6 7 8 9 
        $1 $2 $3 $4 $5 $6 $7 $8 $9
}
