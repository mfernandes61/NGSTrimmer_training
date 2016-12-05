#! /bin/bash
# prinseq
cd /tools
wget http://downloads.sourceforge.net/project/prinseq/standalone/prinseq-lite-0.20.4.tar.gz \
-O /tools/prinseq-lite-0.20.4.tar.gz
tar -xvf /tools/prinseq-lite-0.20.4.tar.gz
rm /tools/prinseq-lite*.tar.gz
install -p /tools/prinseq-lite-0.20.4/prinseq-lite.pl /usr/local/bin
