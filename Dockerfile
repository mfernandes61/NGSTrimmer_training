#
# Create a test Galaxy instance with Ipython Notebooks & Bioblend API
# to facilitate utility program development
# Mark Fernandes 15/04/16
#

FROM bppc

MAINTAINER Mark Fernandes mark.fernandes@ifr.ac.uk

USER root
RUN apt-get -qq update && apt-get upgrade -y && apt-get install -y software-properties-common python-pip sickle \
  fastqc tophat perl gcc g++ pkg-config wget 
RUN mkdir /scripts
ADD scripts\*.sh /scripts/
RUN chmod +x /scripts/*.sh

EXPOSE 22
EXPOSE 4200
VOLUME /coursehome
	
#USER ngsintro

ENTRYPOINT ["/scripts/launchsiab.sh"]
CMD ["/bin/bash"]
