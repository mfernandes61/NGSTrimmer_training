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
	 libboost-all-dev libghc6-zlib-dev perl gcc g++ pkg-config \
	 sickle fastqc tophat wget bowtie fastx-toolkit
RUN if [ ! -d "/scripts" ]; then mkdir /scripts ; fi
ADD scripts\* /scripts
RUN chmod +x /scripts/*.sh
# need to install fastqc, tophat, pip, sickle, cutadapt, condetri, prinseq, erne-filter, prinseq, trimmomatic
# Install cutadapt
RUN pip install --user --upgrade cutadapt
RUN mkdir /tools && cd /tools
#download SRA-toolkit
RUN wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.6.2/sratoolkit.2.6.2-ubuntu64.tar.gz -P /tools
RUN tar zxvf /tools/sratoolkit.2.6.2-ubuntu64.tar.gz && rm /tools/sra*.tar.gz
# RUN ln -s /tools/sra/sratoolkit.2.6.2-ubuntu64/bin/* /usr/local/bin/

# download ERNE
RUN mkdir erne && wget http://github.com/vezzi/ERNE/archive/master.zip -P /tools
# Install trimmomatic binary
RUN wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip -P /tools
RUN unzip /tools/Trimm*.zip && rm /tools/Trimm*.zip
# download condetri
RUN mkdir condetri && wget http://github.com/linneas/condetri/archive/master.zip -P /tools
# RUN unzip *.zip
# Install Prinseq or Prinseq-lite
# RUN  /scripts/install_prinseq.sh

EXPOSE 22
EXPOSE 4200
VOLUME /coursehome
	
#USER ngsintro

ENTRYPOINT ["/scripts/launchsiab.sh"]
CMD ["/bin/bash"]
