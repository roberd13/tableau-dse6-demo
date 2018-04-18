#!bin/bash

set -e

cqlsh -e `hostname -i` "CREATE KEYSPACE IF NOT EXISTS killr_video WITH replication = {'class': 'SimpleStrategy','replication_factor' : 1}"
cqlsh -e `hostname -i` "CREATE TABLE IF NOT EXISTS killr_video.videos_by_actor(actor_name text,release_year int,character_name text,title text,video_id timeuuid,PRIMARY KEY (actor_name, release_year))"
cqlsh -e `hostname -i` "CREATE TABLE IF NOT EXISTS killr_video.videos(video_id timeuuid PRIMARY KEY,avg_rating float,description text,genres set<text>,mpaa_rating text,release_date timestamp,release_year int,title text,user_id uuid)"

cqlsh -e `hostname -i` "COPY  killr_video.videos_by_actor (actor_name,character_name,video_id,release_year,title) FROM 'videos_by_actor.csv'"
cqlsh -e `hostname -i` "COPY  killr_video.videos (video_id,avg_rating,description,genres,mpaa_rating,release_date,release_year,title,user_id) FROM 'videos.csv'"
