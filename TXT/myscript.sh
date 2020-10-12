#!/bin/bash
# Eugene Brigita Lauw
# Sun Oct 04 17:20 WIB
# REV 01 12 Okt 2020 23:30 WIB

FILES="my*.txt my*.sh"
SHA="SHA256SUM"

# delete file if there existe #SHA or #SHA.asc
rm -f $SHA $SHA.asc

echo "sha256sum $FILES > $SHA"  # print to be executed script
sha256sum $FILES > $SHA         
# sha256sum created checksum for $FILES (mylog.txt, mypubkey.txt, myrank.txt, myscript.sh)
# the result of sha256sum will be written to $SHA (SHA256SUM)

echo "sha256sum -c $SHA"
sha256sum -c $SHA               # command to verified files integrity of $SHA (SHA256SUM)

echo "gpg -o $SHA.asc -a -sb $SHA"
gpg -o $SHA.asc -a -sb $SHA    
# gpg is scripting and signing tools
# -o to show output of $HA.asc (SHA256SUM.asc)
# -a to let gpg know, ecrypting with ASCII format
# -sb to sign the contents of file SHA256SUM to SHA256SUM.asc

echo "gpg --verify $SHA.asc $SHA"
gpg --verify $SHA.asc $SHA      # to verify the file's integrity, either the output is correct or not

exit 0

# Sun Oct 04 17:48 WIB
