FROM fabric8/fluentd:0.14.8

MAINTAINER Gilbert Roulot <gilbert.roulot@tech-angels.com>

ENTRYPOINT ["fluentd"]

RUN yum install -y gcc-c++ wget

RUN scl enable rh-ruby23 'gem install --no-document string-scrub -v 0.0.5' && \
    scl enable rh-ruby23 'gem install --no-document fluent-plugin-kubernetes_metadata_filter -v 0.18.0' && \
    scl enable rh-ruby23 'gem install --no-document fluent-plugin-elasticsearch -v 1.4.0' && \
    scl enable rh-ruby23 'gem install --no-document fluent-plugin-mongo -v 1.0.0' && \
    scl enable rh-ruby23 'gem install --no-document gelf' && \
    scl enable rh-ruby23 'gem cleanup fluentd'

RUN mkdir -p /etc/fluent/plugin \
    && wget https://raw.githubusercontent.com/tech-angels/fluent-plugin-gelf/master/lib/fluent/plugin/out_gelf.rb -O /etc/fluent/plugin/out_gelf.rb

ENV GELF_HOST Graylog Host or IP
ENV GELF_PORT 12201

ENV MONGO_HOST MONGO Host or IP
ENV MONGO_PORT 27017
ENV MONGO_DB kubernetes_logs
ENV MONGO_COLLECTION staging_de_logs 

ADD fluent.conf /etc/fluent/fluent.conf