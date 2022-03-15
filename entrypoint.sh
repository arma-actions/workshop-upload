#!/bin/bash

set -eu

echo "Action ref: $GITHUB_ACTION_REF"

repo=`pwd`
export HOME=/home/steam
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

echo "$(cat ./workshop.vdf)"

(/home/steam/steamcmd/steamcmd.sh \
    +login $STEAM_USERNAME $STEAM_PASSWORD \
    +workshop_build_item `pwd -P`/workshop.vdf \
    +quit \
) || (
    # https://partner.steamgames.com/doc/features/workshop/implementation#SteamCmd
    echo /home/steam/Steam/logs/stderr.txt
    echo "$(cat /home/steam/Steam/logs/stderr.txt)"
    echo
    echo /home/steam/Steam/logs/workshop_log.txt
    echo "$(cat /home/steam/Steam/logs/workshop_log.txt)"
    echo
    echo /home/steam/Steam/workshopbuilds/depot_build_$1.log
    echo "$(cat /home/steam/Steam/workshopbuilds/depot_build_$1.log)"

    exit 1
)

exit 0
