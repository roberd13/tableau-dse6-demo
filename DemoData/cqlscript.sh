#!bin/bash

set -e

cqlsh `hostname -i` -e "CREATE KEYSPACE IF NOT EXISTS killr_video WITH replication = {'class': 'SimpleStrategy','replication_factor' : 1}"
cqlsh `hostname -i` -e "CREATE TABLE IF NOT EXISTS killr_video.videos_by_actor(actor_name text,release_year int,character_name text,title text,video_id timeuuid,PRIMARY KEY (actor_name, release_year))"
cqlsh `hostname -i` -e "CREATE TABLE IF NOT EXISTS killr_video.videos(video_id timeuuid PRIMARY KEY,avg_rating float,description text,genres set<text>,mpaa_rating text,release_date timestamp,release_year int,title text,user_id uuid)"

/opt/dse/bin/dsbulk load -h `hostname -i` -k testks -t killrvideo  -url /opt/dse/demodata/videos_by_actor.csv -header false -m "0=actor_name,1= character_name,2=video_id,3=release_year,4=title"
/opt/dse/bin/dsbulk load -h `hostname -i` -k testks -t killrvideo  -url /opt/dse/demodata/videos -header false -m "0=video_id,avg_rating,1=description,2=genres,3=mpaa_rating,4=release_date,5=release_year,6=title,user_id"
