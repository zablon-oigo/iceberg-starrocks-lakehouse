## Building a Real-Time Lakehouse with Apache Iceberg and StarRocks

![workflow](https://github.com/zablon-oigo/iceberg-starrocks-lakehouse/actions/workflows/ci.yaml/badge.svg)
![Apache Iceberg](https://img.shields.io/badge/Apache%20Iceberg-Lakehouse-3C8DBC?logo=apache&logoColor=white)
![MinIO](https://img.shields.io/badge/MinIO-S3%20Storage-C72E49?logo=minio&logoColor=white)
![StarRocks](https://img.shields.io/badge/StarRocks-Analytics%20Engine-0F6FFF)
![Makefile](https://img.shields.io/badge/Makefile-Automated%20Setup-4B5563)
![Docker](https://img.shields.io/badge/Docker-Latest-2496ED?logo=docker&logoColor=white)



This project demonstrates how to build a modern enterprise lakehouse using Apache Iceberg as the open table format and StarRocks as the high-performance analytics engine.

The architecture combines the scalability and cost efficiency of object storage with the performance of a modern analytical database, enabling low-latency SQL analytics on Iceberg tables.

#### Quick Start

Follow these steps to run the pipeline locally:

> Tip: Run commands in order. Each step depends on the previous one being completed successfully.

```sh
# 1. First-time setup (build + start all services)
make setup

# 2. Check running containers
make ps

# 3. Connect to StarRocks
make starRocks

```

#### Verify Iceberg Files in MinIO

Configure the MinIO client:
```sh
mc alias set local http://localhost:9000 admin password
```
List the contents of the warehouse bucket:
```sh
mc ls --recursive local/warehouse
```
> You should see Iceberg metadata and Parquet data files.