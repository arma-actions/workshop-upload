#!/bin/bash

set -eu

repo=`pwd`
HOME=/home/steam
cd $STEAMCMDDIR

echo "Uploading item $2 for app $1 from $3"

cat << EOF > ./workshop.vdf
"workshopitem"
{
    "appid"            "$1"
    "publishedfileid"  "$2"
    "contentfolder"    "$repo/$3"
    "changenote"       "$4"
}
EOF

/home/steam/steamcmd/steamcmd.sh \
    +login $STEAM_USERNAME $STEAM_PASSWORD \
    +workshop_build_item `pwd -P`/workshop.vdf \
    +quit \
;

exit 0
