# Simple Storage Service (S3)

Introduction:

S3 = simple storage service.

It is a safe place to store your flat files(videos and pictures).
It is object-based storage(flat files) instead of blockchain storage (database, operating system).

Data is spread accross multiple devices and facilities.

AWS offers object based storage in the form of S3. S3 makes use of buckets as a container for objects. A single object in S3 has a maximum size of 5TB. However, the total size of a bucket is virtually unlimited.

Bucket names must be globally unique. That is, even other AWS accounts in different regions cannot share the same bucket name. Buckets, and objects within buckets, can be accessed using a URL.

The bucket policy acts as an access control list. Data can be encrypted for even further protection.

Objects are automatically replicated within a region, so that there’s always at least three copies available. This redundancy greatly increases the availability and durability of objects stored in S3.

S3 objects consist of:

- Key; name of the object.

- Value; this is the data and is made up of a sequence of bytes.

- version 10; important for versioning.

- Metadat; data about data you are storing.

- Sub resources; access control lists, Torrent.

S3 guarantees from Amazon:

Built for 99.9% availability


There are 4 storage classes:
S3 Standard
S3 Standard-IA
S3 One-zone IA
S3 Glacier
There’s also S3 Glacier Deep archive, a subclass of S3 Glacier. And Intelligent Tiering which is more a cost optimization tool than a class on its own.
Storage classes differ in availability, durability, retrieval time, and cost.

In S3, you pay for:
GBs storage per month
Transfer OUT to out of the region
PUT, COPY, POST, LIST, and GET requests
You don’t pay for:
Transfer IN to Amazon S3
Transfer OUT from S3 to CloudFront or EC2 in the same region

Besides storing data for all kinds of purposes (big data, storing videos, archiving, etc.), S3 has another use case: hosting static websites.


Requirements
Your AWS environment
A cat picture (jpg or png)
AWS’ demo website (index.html, script.js, style.css; can be found in the Google Drive)
A peer

Exercise 1
Create new S3 bucket with the following requirements:
Region: Frankfurt (eu-central-1)
Upload a cat picture to your bucket.
Share the object URL of your cat picture with a peer. Make sure they are able to see the picture.

Exercise 2
Create new bucket with the following requirements:
Region: Frankfurt (eu-central-1)
Upload the four files that make up AWS’ demo website.
Enable static website hosting.
Share the bucket website endpoint with a peer. Make sure they are able to see the website.



