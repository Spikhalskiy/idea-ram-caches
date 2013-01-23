#!/bin/sh

#change this params for your config
USERNAME=YourName
INDEX_NUMSECTORS=500000
CACHES_NUMSECTORS=200000
IDEAVERSION=12

INDEX_PATH=/Users/$USERNAME/Library/Caches/IntelliJIdea$IDEAVERSION/index
CACHES_PATH=/Users/$USERNAME/Library/Caches/IntelliJIdea$IDEAVERSION/caches

myindex=`hdid -nomount ram://$INDEX_NUMSECTORS`
newfs_hfs $myindex

rm -rf $INDEX_PATH
mkdir $INDEX_PATH
mount -t hfs $myindex $INDEX_PATH

mycaches=`hdid -nomount ram://$CACHES_NUMSECTORS`
newfs_hfs $mycaches

rm -rf $CACHES_PATH
mkdir $CACHES_PATH
mount -t hfs $mycaches $CACHES_PATH
