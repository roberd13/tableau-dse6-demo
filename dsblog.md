# Visualize your data in Tableau 2x faster with DSE 6

Have you heard about all the new features in DSE 6, especially that it's 2x faster?  If not check out Robin Schumacher [blog](https://www.datastax.com/2018/04/datastax-enterprise-6-the-distributed-cloud-database-designed-for-hybrid-cloud). 

DSE isn’t the only thing that is 2x faster! With the new TPC and AlwaysOn SQL features using the Spark Sql connection in Tabluea, you can now visualize your data 2x the transfer speed compared to previous DSE versions.

Our brains process visual information very efficiently, visualizing data graphically greatly speeds up the process of data analysis. 
Which of the following is easier to analize?

![](https://github.com/roberd13/tableau-dse6-demo/blob/master/images/numbers.png)  


![](https://github.com/roberd13/tableau-dse6-demo/blob/master/images/graph.png)

The visual graph right?  If the numbers were easier to analize,  you are the outlier and can stop reading now.  

If we are able to visualize the data 2x faster, this greatly improves your effiency and as the data sets become more complex, the potential time savings become even greater.


### How We Got Here

You have always been able to use the Simba Spark ODBC driver to create a connection with Tableau, but in DSE 5.1 SQL access was handled by the Spark SQL Thriftserver. There are a variety of reasons which we will not get into in this blog post that makes Spark SQL Thriftserver less desirable and a non production ready enterprise-grade ODBC/JDBC service.  

With this information at hand, AlwaysOn SQL was designed to address the shortcomings of the other approaches and brings a production-ready, enterprise-grade ODBC/JDBC service to DSE 6. We also worked with Magnitude|Simba to enhance the ODBC/JDBC driver to allow Spark SQL to seamlessly use the AlwaysOn Sql REST API. To learn more about AlwaysOn SQL and its history check out Brian Hess's AlwaysOn Sql [blog](https://www.datastax.com/2018/05/introducing-alwayson-sql-for-dse-analytics).

## This leaves one thing left to do!  Take this for a test drive and see the difference for yourself, check out this [tutorial](https://academy.datastax.com/content/visualizing-your-data-tableau-using-dse-6-docker-images) which leverages our DSE 6 Docker images with Tableau for step by step instructions to create a simple Tablaeu workbook with Data stored in DSE.
