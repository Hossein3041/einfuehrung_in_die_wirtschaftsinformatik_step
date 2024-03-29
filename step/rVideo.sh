#!/bin/bash
echo "Content-type: video/mp4"
echo ""

#führt cVideo.sh und reicht den QUERY_STRING weiter
curl "https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/cVideo.sh?$QUERY_STRING" >> /dev/null
#ruft das von cVideo.sh Video auf
cat /tmp/data/video.mp4

