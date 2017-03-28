# KAT-dockerized
Dockerfile for Kmer Analysis Tool

`docker build -t kat-dockerized ./`

```
docker run --rm -t -u \
  -v /local/input:/mnt/input/ \
  -v /local/output:/mnt/output/ \
  kat-dockerized \
  /bin/bash -c "kat hist /mnt/input/x.fastq"
```
