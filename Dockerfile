FROM rocker/tidyverse

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y git python3 python3-pip python3-venv curl libssl-dev libcurl4-openssl-dev unzip git ssh nano less libpng-dev libglpk-dev libxt-dev liblzma-dev libbz2-dev groff

RUN pip install --upgrade pip
RUN pip install synapseclient
RUN pip install --user virtualenv

RUN R -e 'install.packages("reticulate")'
RUN R -e 'install.packages("synapser", repos = c("http://ran.synapse.org", "http://cran.fhcrc.org"))'
RUN R -e 'install.packages("synapserutils", repos=c("http://ran.synapse.org", "http://cran.fhcrc.org"))'
RUN R -e 'install.packages("devtools")'

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install

RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb" \
    && dpkg -i session-manager-plugin.deb

RUN curl -o /home/rstudio/synapse_creds.sh https://raw.githubusercontent.com/Sage-Bionetworks-IT/service-catalog-ssm-access/main/synapse_creds.sh \
    && chmod +x /home/rstudio/synapse_creds.sh

RUN mkdir -p /home/rstudio/.aws

RUN curl -o /home/rstudio/.aws/config https://raw.githubusercontent.com/Sage-Bionetworks-IT/service-catalog-ssm-access/main/config

ENV ROOT=TRUE
