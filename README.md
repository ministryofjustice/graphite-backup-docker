
graphite-backup-docker
======================

Docker container to backup Graphite cluster to reliable storage such as
Amazon S3 or OpenStack Swift.  Also, the ability to restore that data in
a sane away.


### General handling instructions

* Enter the container
`docker exec -ti graphite_backup /bin/bash`
* Run a backup
`backup`
* Check the last backup
`find-last-backup` spits out the last backup timestamp eg:
"2015-11-25T11:04:00.000Z"
* fiddle with the bucket
`aws s3 ls $BUCKET`
* deep inspect a whisper file
`whisper-info.py /data/graphite/whisper/collectd/po/i-*/cpu/0/cpu/user.wsp`



