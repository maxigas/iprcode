#!/bin/bash

# Dependencies on Debian:
# sudo apt install parallel curl

# .repos.txt is a list all of GitHub repositories retrieved from
# http://ghtorrent-downloads.ewi.tudelft.nl/mysql/mysql-2019-04-01.tar.gz

parallel --joblog .job.log --jobs 100 -a .repos.txt \
    curl --silent --fail --create-dirs -o {} -o {} -o {} \
         https://raw.githubusercontent.com/{}/master/README.md \
         https://raw.githubusercontent.com/{}/master/README \
         https://raw.githubusercontent.com/{}/master/README.txt

# Resume with:

# parallel --resume --joblog .job.log --jobs 200 -a .antirepos.txt
#     curl --silent --fail --create-dirs -o {} -o {} -o {} \
#          https://raw.githubusercontent.com/{}/master/README.md \
#          https://raw.githubusercontent.com/{}/master/README \
#          https://raw.githubusercontent.com/{}/master/README.txt

# Reference:
# 
# University of Delft. (2019). GH Torrent archives. FTP server. Retrieved
# from <http://ghtorrent-downloads.ewi.tudelft.nl/>

