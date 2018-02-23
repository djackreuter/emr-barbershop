#!/bin/bash
chown -R 1000 /emr-barbershop
rm /emr-barbershop/tmp/pids/server.pid
cd /emr-barbershop; bundle exec rails server -p 3000 -b '0.0.0.0'
