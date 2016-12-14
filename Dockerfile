#
# Create a container environment with several NGS trimmers and, data and 
# an mapper for students to explore the efficacy of trimming in getting good alignments
#
# Mark Fernandes November 2016
# www.ifr.ac.uk

FROM foodresearch/bppc
MAINTAINER Mark Fernandes mark.fernandes@ifr.ac.uk

USER root
RUN apt-get -qq update && apt-get upgrade -y && apt-get install -y software-properties-common python-pip unzip default-jre\
	 time libboost-all-dev libghc6-zlib-dev perl gcc g++ pkg-config \
	 sickle fastqc tophat wget bowtie fastx-toolkit && apt-get clean
RUN if [ ! -d "/scripts" ]; then mkdir /scripts ; fi
ADD scripts\* /scripts
RUN chmod +x /scripts/*.sh
ADD Welcome.txt /etc/motd
# need to install fastqc, tophat, pip, sickle, cutadapt, condetri, prinseq, erne-filter, prinseq, trimmomatic
# Install cutadapt
RUN pip install --user --upgrade cutadapt
RUN mkdir /tools && cd /tools
#download SRA-toolkit 2.8+ to support requires https connection
# sratoolkit.current-ubuntu64.tar.gz
RUN wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz -P /tools \
	&& tar zxvf /tools/sratoolkit.current-ubuntu64.tar.gz -C /tools && rm /tools/*.tar.gz \
	&& ln -s /tools/sratoolkit.current-ubuntu64/bin/* /usr/local/bin/

# download ERNE
#RUN mkdir erne && wget http://github.com/vezzi/ERNE/archive/master.zip -P /tools && mv /tools/master.zip /tools/erne.zip \
#	&& unzip /tools/erne.zip -d /tools && rm /tools/erne.zip
RUN mkdir erne && wget http://sourceforge.net/projects/erne/files/2.1.1/erne-2.1.1-linux.tar.gz -P /tools \
	&& tar zxvf /tools/erne*.tar.gz -C /tools && rm /tools/*.tar.gz && ln -s /tools/erne*/bin/* /usr/local/bin
# Install trimmomatic binary
RUN wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip -P /tools \
	&& unzip /tools/Trimm*.zip -d /tools && rm /tools/Trimm*.zip
# download condetri
RUN wget http://github.com/linneas/condetri/archive/master.zip -P /tools && mv /tools/master.zip /tools/condetri.zip \
	&& unzip /tools/condetri.zip -d /tools && rm /tools/cond*.zip
# RUN unzip *.zip  && rm /tools/sra*.tar.gz
# Install Prinseq or Prinseq-lite
RUN /scripts/prinseq_lite.sh

EXPOSE 22 4200
VOLUME /coursehome
	
#USER ngsintro

ENTRYPOINT ["/scripts/launchsiab.sh"]
CMD ["/bin/bash"]
