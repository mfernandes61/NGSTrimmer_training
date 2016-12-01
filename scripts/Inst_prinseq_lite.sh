!#/bin/bash
# cd ~/src
wget http://downloads.sourceforge.net/project/prinseq/standalone/prinseq-lite-0.20.4.tar.gz
tar zxvf prinseq-lite-0.20.4.tar.gz
rm *.tar.gz

# Link the program into you ~/bin folder under a shorter name.
ln -sf ~/prinseq-lite-0.20.4/prinseq-lite.pl ~/bin/prinseq-lite

# Set the executable flag on the script/
chmod +x ~/bin/prinseq-lite
