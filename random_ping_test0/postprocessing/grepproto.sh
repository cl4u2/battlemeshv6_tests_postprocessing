grep '^[0-9\.]*\ 0\ '        $1 > /tmp/${2}badv.txt
grep '^[0-9\.]*\ 0[0-9]*1\ ' $1 > /tmp/${2}olsr.txt
grep '^[0-9\.]*\ 0[0-9]*2\ ' $1 > /tmp/${2}bmx6.txt
grep '^[0-9\.]*\ 0[0-9]*4\ ' $1 > /tmp/${2}babel.txt
