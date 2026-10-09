FROM docker.elastic.co/elasticsearch/elasticsearch:7.3.0

RUN elasticsearch-plugin install --batch \
    https://get.infini.cloud/elasticsearch/analysis-ik/7.3.0

COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY analysis-ik/ /usr/share/elasticsearch/config/analysis-ik/
