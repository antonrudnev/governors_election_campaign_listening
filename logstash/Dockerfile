FROM logstash:7.5.1

RUN bin/logstash-plugin install logstash-output-solr_http && sed -i -e 's/document\["@timestamp"\] = document\["@timestamp"\].iso8601/# document["@timestamp"] = document["@timestamp"].iso8601/g' -e 's/@solr.add(documents)/@solr.add(documents, :add_attributes => {:commitWithin=>1000})/g' /usr/share/logstash/vendor/bundle/jruby/2.5.0/gems/logstash-output-solr_http-3.0.5/lib/logstash/outputs/solr_http.rb

COPY --chown=logstash:logstash config /usr/share/logstash/config
COPY --chown=logstash:logstash pipeline /usr/share/logstash/pipeline

RUN sed -i -f pipeline/params/input.sed pipeline/logstash.conf
