#! /bin/bash
# prinseq
cd /tmp
wget http://downloads.sourceforge.net/project/prinseq/standalone/prinseq-lite-0.20.4.tar.gz \
-O /tmp/prinseq-lite-0.20.4.tar.gz
tar -xvf /tmp/prinseq-lite-0.20.4.tar.gz
install -p tmp/prinseq-lite-0.20.4/prinseq-lite.pl /usr/local/bin
