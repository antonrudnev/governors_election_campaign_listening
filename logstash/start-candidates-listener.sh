#!/bin/bash

/usr/share/logstash/bin/logstash -f candidates_listener.conf --path.settings /etc/logstash/ --path.data governors_election
