#
# Create a test Galaxy instance with Ipython Notebooks & Bioblend API
# to facilitate utility program development
# Mark Fernandes 15/04/16
#

FROM foodresearch/bppc

MAINTAINER Mark Fernandes mark.fernandes@ifr.ac.uk

USER root
RUN apt-get -qq update && apt-get upgrade -y && apt-get install -y software-properties-common python-pip sickle \
  fastqc tophat perl gcc g++ pkg-config wget 
RUN if [ ! -d "/scripts" ]; then mkdir /scripts ; fi
ADD scripts\* /scripts
RUN chmod +x /scripts/*.sh
# need to install fastqc, tophat, pip, sickle, cutadapt, condetri, prinseq, erne-filter, prinseq, trimmomatic
# Install cutadapt
RUN pip install --user --upgrade cutadapt
# Install trimmomatic binary
RUN wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip
RUN /scripts/FastX_install.sh 
RUN /scripts/install_prinseq.sh

EXPOSE 22
EXPOSE 4200
VOLUME /coursehome
	
#USER ngsintro

ENTRYPOINT ["/scripts/launchsiab.sh"]
CMD ["/bin/bash"]
