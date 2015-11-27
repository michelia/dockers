FROM elasticsearch:2.1
MAINTAINER michelia <github.com/michelia>
# RUN /usr/share/elasticsearch/bin/plugin -i elasticsearch/marvel/latest
RUN \
    && export ES_HOME=/usr/share/elasticsearch  \
    && cd $ES_HOME  \
    && bin/plugin -i elasticsearch/marvel/latest
