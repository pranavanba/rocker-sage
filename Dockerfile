FROM rocker/rstudio

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y git python3 python3-pip python3-venv curl libssl-dev libcurl4-openssl-dev unzip git

RUN python3 -m pip install --upgrade pip
RUN pip install synapseclient

RUN R -e 'install.packages("synapser", repos = c("http://ran.synapse.org", "http://cran.fhcrc.org"))'
RUN R -e 'install.packages("synapserutils", repos=c("http://ran.synapse.org", "http://cran.fhcrc.org"))'

ENV ROOT=TRUE

EXPOSE 8787
