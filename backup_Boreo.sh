#!/bin/bash
 
BASEDIR=/backup/boreo1
BAKDIR=/backup/arquivos-bkp/pasta-boreo

cd /boreo
\cp -Rf /boreo/macsol /backup/boreo1
\cp -Rf /boreo/Tintas /backup/boreo1
 
stamp=$(date +%Y-%m-%d)
 
cd "$BASEDIR"
for prj in * ; do
 
find "$prj" -name "*" | grep "" >/dev/null && {
        tar -zcvf "$BAKDIR/${prj}_${stamp}.tgz" "$prj"
        find "$BAKDIR" -name "${prj}_*" -mtime -14 -mtime +7 -not -name "*-01.*" -exec rm {} \;
        ls -sh "$BAKDIR/${prj}_"*
}
 
done
