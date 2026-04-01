## **Hadoop (Master-Worker):**



#### **What is big data ??**



* **Volume, Variety and Velocity, Veracity**



* **In simple words big data is data sets that are too large and complex to manipulate with standard method tools**



**Sorces : youtube, facebook etc**



###### **How to handle big data??**

**mangodb, Casandra, Hadoop and spark**



**Spark :**

**Apache Spark is a framework which is written in Scala**

**It is used for fast data analysis**

**general purpose cluster in memory computing system**

**It abstract APIs in java, scala and python and provides an optimized engine that supports general execution**





**What is Hadoop ?**



Apache Hadoop is a framework that allows for the distributed processing of large datasets across clusters of commodity computers using a simple programming model.



Framework written in java



Designed to solve problem that involve anything large data(Perabytes)

programming model based on googles map reduce



###### **companies using Hadoop:**

1. yahoo
2. google
3. facebook
4. Amazon
5. AOL
6. IBM and many



###### **Hadoop core components :**



* **HDFS - Hadoop Distributed File System(storage)**
* **MapReduce(processing)**



###### **Main components of HDFS:**



###### **Name node**

&#x20;        **-** maintain and serves(manages meta data(data(data)) like permissions, block locations, replicas)

&#x20;        **- manages the file system namespaces and regulate access to file by clients**

&#x20;        **meta data : the entire meta data files are maintained in memory**



&#x20;       **Meta data types:**

1. &#x20;       List of files
2. &#x20;       list of block for each files
3. &#x20;       list of data nodes for each block
4. &#x20;       File attributes eg., creation time, replication factor



&#x20;      **A Transaction log :**

**records the creation and deletion of files.**





###### **Data node - stored:**

**one per node in the cluster, manage storage attached to the node that they can run on**



###### **A block server :**

1. Stores data in local file system
2. Stores meta data of a block
3. Servers data and meta data to the clients
4. Block reports



###### **Secondary name node(makes of backup of lost data(meta data))**



A misnomer it is not a back-up for the namenode



* renamed as checknode in 0.21
* periodically walks up and takes a checkpoints
* Memory requirements are the same as the namenode(big)
* Typically should be on a separate machine in a large cluster (> 10)
* Directory structure is same as namenode except that it keep a previous checkpoint version in addition to the current
* Helps in recovering a failed namenode.



**Usage of HDFS :**

\---

* Scaling wide
* Scaling deep
* Cost effective
* Flexible
* Fault tolerant
* Data block rebalancing





When the user gives the request it will reach hdfs client and **hdfs client** sends the request to the name node



###### **User -> HDFS Client -> Name Node**



**1.why are we splitting the data into blocks??**

**Ans : when user requests the data to read --> hdfs client the client breaks the data into chunks and those chunks are redirected to different data nodes**



**2.number of blocks depends on wt factor??**

**Ans :Standard block size 128 MB or multiple of 64 (total file size / block size)**



###### **DataNode and NameNode communication :**



**data nodes sends heartbeat every 3 seconds via a tcp 3 way handshake protocol**

**for every 10 seconds sends the report to data node**



###### **NAMENODE METADATA**



**Meta-data in memory:**

The entire metadata is in main memory

No demand paging of FS meta-data



**Types of Metadata:**

1. List of files
2. List of Blocks for rach file
3. List of DataNodes for each block
4. File attributes, e.g, access time, replication factor



**A Transaction Log**

Records file creations, file deletions etc



##### 

##### **Assignment -1**

###### 

###### **1.Take 2 csv files merge those files and create use cases** 





###### **Lets say you have 80 TB of data to store and to run the mapreduce on this amount of data.**

###### **Configuration of data nodes**



**-8 GB RAM**

**-100 MB/s read- write speed**

**Total no. of nodes = 20**



**Lets assume the replicationfactor is 4 and block size is 64 mb.**

**By simple calculation you will need:**



**=total amount of data \* replication fare / total no of nodes**

**=80 \* 4/20**

**=16(disk size per data node)**



**Now lets say you need to run Map Reduce program in 80 TB of data.**

**Reading 80 TB data at a speed of 100MB/s using only 1 node will take:**

**= Total data / Read-write speed**

**=80 \* 1024 \*1024/100**

**=838860.8 seconds**

**=13981.01 hours**



**With 20 data node you will be able to finish the job in**

**=13981.01/20**

**=699.05 hours**

##### 

##### **Hadoop Commands :**



**hadoop fs -ls /**

**hadoop fs -mkdir/nandini    (creates a directory in hadoop)**

**hadoop fs -ls /nandini**

**hadoop fs -put '/home/clouder/desktop/filename  (put local directory to hadopp(hdfs))**

**hadoop fs -rm /nandini/filename   (removes the file from the directory)**

**hadoop fs -ls /nandini** 

**pwd**

**hadoop version**

**touch nans.txt**    



























