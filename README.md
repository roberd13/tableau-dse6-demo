### This is a simple tutorial that walks you through connecting Tableau to DSE via Spark ODBC driver and creating a simple Tableau workbook to analyze data in DSE

This Tutorial was created using Tableau Desktop 10.5 running on Windows 10 and DSE 5.1.5 running in a Docker Container

# Prerequisites

* A DataStax Academy Account to Download/Install DSE and Simba ODBC Driver for Apache Spark:  If you do not already have one, visit https://academy.datastax.com/
* A working DSE install running an Analytics workload.  
  * You can download DataStax Enterprise for free from https://academy.datastax.com/downloads and find installation instructions here http://docs.datastax.com/en/getting_started/doc/getting_started/installDSE.html 
  * Using a Docker Image by visiting [DataStax Docker Store](https://store.docker.com/images/datastax) Each user  must subscribe to the image (which is free) one time. Click Setup Instructions, fill out the form, and you will be given a docker pull command that is valid for that user account. Usage instructions can be found at https://github.com/datastax/docker-images

* A working Tableau Desktop install and basic Tableau understanding.  
  * You can download free Tableau trial from https://www.tableau.com/products/trial 


# The Simba ODBC Driver for Apache Spark

* Download the Simba ODBC Driver for Apache Spark for your version of Microsoft Windows (32bit or 64bit) running Tableau Desktop by visiting https://academy.datastax.com/download-drivers
* Install the Simba ODBC Driver for Apache Spark.

# Demo Data

* Download the demo data to your DSE node from https://github.com/roberd13/DSE-Spark-with-Tableau/tree/master/DemoData
  * Run the cqlscript.sh script to create schemas and load the data. A Keyspace named killr_video with 2 tables **videos** and **videos_by_actor** will be created.

## Now Lets connect Tableau to DSE 

* First we need to find the ip address of your spark master by running on your DSE node `dsetool status`

![](https://github.com/roberd13/DSE-Spark-with-Tableau/blob/master/images/dsetool_status.png)
