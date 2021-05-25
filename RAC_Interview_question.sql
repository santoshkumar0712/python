1. What is cache fusion?
2. What is split-brain?
3. What is the difference between Crash recovery and Instance recovery?
   When an instance crashes in a single node database on startup a crash recovery takes place. In a RAC environment, the same recovery for an instance is performed by the surviving nodes called Instance recovery.
4. How do you determine what protocol is being used for Interconnect traffic?
   One of the ways is to look at the database alert log for the time period when the database was started up.
5. What methods are available to keep the time synchronized on all nodes in the cluster?
   CTSS (Cluster Time synchronized service deome)
6. What methods are available to keep the time synchronized on all nodes in the cluster?
   Spfiles, ControlFiles, Datafiles, and Redolog files should be created on shared storage.
7. Where does the Clusterware write when there is a network or Storage missed heartbeat?
   In Cluster ready service log $CRS_HOME/log
8. How do you find out what OCR backups are available?
   root$ /u01/app/12.2.0/grid/bin/ocrconfig -showbackup
9. How do you find out what object has its blocks being shipped across the instance the most?
   You can use the dba_hist_seg_stats
10. What is a VIP in RAC use?
11. Is there an easy way to verify the inventory for all remote nodes?
   You can run the OPATCH LSINVENTORY -ALL_NODES command from a single node to look at the inventory details for all nodes in the cluster.
12. What components of the Grid should I back up?
    OLR,OCR and ASM metadata.
13. What is a rolling upgrade?
    A patch is considered rolling if it is can be applied to the cluster binaries without having to shut down the database in a RAC environment.
    All nodes in the cluster are patched in a rolling manner, one by one, with only the node which is being patched unavailable while all other instances open.
14. What is the purpose of OLR?
    Oracle Local repository contains information that allows the cluster processes to be started up with the OCR being in the ASM storage system.
    Since the ASM file system is unavailable until the Grid processes are started up a local copy of the contents of the OCR is required which is stored in the OLR.
15. What is the default memory allocation for ASM?
    In 10g the default SGA size is 1G in 11g it is set to 256M and in 12c ASM it is set back to 1G.
16. How do you backup ASM Metadata?
    You can use md_backup to restore the ASM disk group configuration in-case of ASM disk group storage loss.
17. What files can be stored in the ASM disk group?
    in 11g the following files can be stored in ASM disk groups.
    Datafiles
    Redo logfiles
    Spfiles
    In 12c the files below can also now be stored in the ASM Diskgroup
    Password file
18 How can we configure the cluster interconnect?
   Configure User Datagram Protocol(UDP) on Gigabit ethernet for cluster interconnect.On unix and linux systems we use UDP and RDS(Reliable data socket) protocols to be used by Oracle Clusterware.Windows clusters use the TCP protocol.
19 What are RAC specific Parameters?
    CLUSTER_DATABASE
    CLUSTER_DATABASE_INSTANCE
    INSTANCE_NUMBER
    CLUSTER_INTERCONNECTS
20 What are the initialization parameters that must have same value for every instance in an Oracle RAC database and what should be unique ?
    Same Across the Instances
    COMPATIBLE
    CLUSTER_DATABASE
    CLUSTER_DATABASE_INSTANCE
    CONTROL_FILES
    DB_BLOCK_SIZE
    DB_DOMAIN
    DB_FILES
    DB_NAME
    DB_RECOVERY_FILE_DEST
    DB_RECOVERY_FILE_DEST_SIZE
    DB_UNIQUE_NAME
    INSTANCE_TYPE
    PARALLEL_MAX_SERVERS
    REMOTE_LOGIN_PASSWORD_FILE
    UNDO_MANAGEMENT

    Unique Across the instance
    CLUSTER_DATABASE
    CLUSTER_DATABASE_INSTANCE
    INSTANCE_NUMBER
    CLUSTER_INTERCONNECTS
    UNDO_TABLESPACE

  21. What are the wait events in RAC?
    Answer
    gc buffer busy
    gc buffer busy acquire
    gc current request
    gc cr request
    gc cr failure
    gc current block lost
    gc cr block lost
    gc current block corrupt
    gc cr block corrupt
    gc current block busy
    gc cr block busy
    gc current block congested
    gc cr block congested.
    gc current block 2-way
    gc cr block 2-way
    gc current block 3-way
    gc cr block 3-way
    (even if we have n number of nodes, there can be only 3-way wait event)
    gc current grant 2-way
    gc cr grant 2-way
    gc current grant busy
    gc current grant congested
    gc cr grant congested
    gc cr multi block read
    gc current multi block request
    gc cr multi block request
    gc cr block build time
    gc current block flush time
    gc cr block flush time
    gc current block send time
    gc cr block send time
    gc current block pin time
    gc domain validation
    gc current retry
    ges inquiry response
    gcs log flush sync
 22. What is the difference between CR(Consistent Read) block and cur (current) block?
 23. How to kill session in Oracle RAC?
    If we have to kill session on another instance while connected to different instance, we can use below command
    alter system kill session ‘SID, SERIAL#,@instance_id’

24. What is the difference between SRVCTL and CRSCTL utilities?
25. How to recover OCR file?
    stop oracle Clusterware
    crsctl stop crs
    ocrconfig -restore
    ocrconfig -restore $ORA_CRS_HOME/cdata/crs/backup00.ocr
    crsctl start crs

26. What is Voting file/disk and how many files should be there?
    Number of voting files must be odd i.e. 1, 3, 5, 7, 9, 11, 13, 15(max) etc.

27. How do I identify the voting disk location?
    crsctl query css votedisk

28. How to change the Voting Disk Configuration after Installing Real Application Clusters
    You can dynamically add and remove voting disks after installing Real Application Clusters.Run the following command as the root user to add a voting disk
    crsctl add css  path

29. What is the use of SCAN IP (SCAN name) and will it provide load balancing?
    Single Client Access Name (SCAN) is a new Oracle Real Application Clusters (RAC) 11g Release 2, feature that provides a single name for clients to access an Oracle Database running in a cluster.
    The benefit is clients using SCAN do not need to change if you add or remove nodes in the cluster.

30. How many SCAN listeners will be running?
    3 listener only

31. What is FAN( Fast Application Notification )?
    Applications can use Fast Application Notification (FAN) to enable rapid failure detection, balancing of connection pools after failures, and re-balancing of connection pools
    when failed components are repaired. The FAN process uses system events that Oracle publishes when cluster servers become unreachable or if network interfaces fail.

32. What is FCF( Fast Connection Failover )?
    Fast Connection Failover provides high availability to FAN integrated clients, such as clients that use JDBC, OCI, or ODP.NET. If you configure the client to use fast connection failover,
    then the client automatically subscribes to FAN events and can react to database UP and DOWN events. In response, Oracle gives the client a connection to an active instance that provides the requested database service.

33. What is TAF and TAF policies?
    Transparent Application Failover (TAF) – A runtime failover for high availability environments, such as Real Application Clusters and Oracle Real Application Clusters Guard, TAF refers to the failover and re-establishment of application-to-service connections. It enables client applications to automatically reconnect to the database if the connection fails, and optionally resume a SELECT statement that was in progress. This reconnect happens automatically from within the Oracle Call Interface (OCI) library.

34. How to know the public IPs, private IPs, VIPs in RAC?
    olsnodes -n -p -i

35. How to check the cluster (all nodes) status and How to check the cluster (one node) status?
    crsctl check clusters
    crsctl check crs

36. Mention what is new feature in Oracle ASM 12c?
    The new feature added in Oracle ASM 12c is Oracle Flex ASM. Its a new ASM deployment model which increases instance database availability and reduces the Oracle ASM related resource consumption.

37. Mention how Oracle Flex ASM works?
    Oracle Flex ASM instance when fails on a particular node, then the Oracle Flex ASM instance is passed over to another node in the cluster.
