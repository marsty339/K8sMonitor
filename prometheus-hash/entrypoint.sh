#!/bin/sh
  
ID=${POD_NAME##*-}

mkdir /app

cp /etc/prometheus/prometheus.yml /prometheus/prometheus-hash.yml

sed -i "s/ID_NUM/$ID/g" /prometheus/prometheus-hash.yml

/bin/prometheus --config.file=/prometheus/prometheus-hash.yml --query.max-concurrency=20 --storage.tsdb.path=/prometheus --storage.tsdb.max-block-duration=2h --storage.tsdb.min-block-duration=2h  --storage.tsdb.retention=2h --web.listen-address=:9090 --web.enable-lifecycle --web.enable-admin-api