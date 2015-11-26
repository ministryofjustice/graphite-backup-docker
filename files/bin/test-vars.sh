#!/bin/bash
fails=0
for i in REAL_HN NUM_WORKERS WHISPER_PATH BUCKET STAMP_FILE ENV; do 
    if [ -z "$(eval echo \$$i)" ]; then
       fails=$[ $fails + 1 ]
       echo TEST_${i}: FAIL
   else
       echo TEST_${i}: SUCCESS
   fi
done

[ $fails -gt 0 ] && exit 1 
