#!bin/bash

set -e

cqlsh `hostname -i` -e "CREATE KEYSPACE IF NOT EXISTS killr_video WITH replication = {'class': 'SimpleStrategy','replication_factor' : 1}"
cqlsh `hostname -i` -e "CREATE TABLE IF NOT EXISTS killr_video.videos_by_actor(actor_name text,release_year int,character_name text,title text,video_id timeuuid,PRIMARY KEY (actor_name, release_year))"
cqlsh `hostname -i` -e "CREATE TABLE IF NOT EXISTS killr_video.videos(video_id timeuuid PRIMARY KEY,avg_rating float,description text,genres set<text>,mpaa_rating text,release_date timestamp,release_year int,title text,user_id uuid)"

cqlsh `hostname -i` -e "COPY  killr_video.videos_by_actor (actor_name,character_name,video_id,release_year,title) FROM '/opt/dse/demodata/videos_by_actor.csv'"
cqlsh `hostname -i` -e "COPY  killr_video.videos (video_id,avg_rating,description,genres,mpaa_rating,release_date,release_year,title,user_id) FROM '/opt/dse/demodata/videos.csv'"
