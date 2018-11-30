/home/xonotic/sdk-server.linux.amd64 --local > /home/xonotic/game_server.log 2>&1 &
/home/xonotic/wrapper -i /home/xonotic/Xonotic/server_linux.sh >> /home/xonotic/game_server.log 2>&1 &
if [ $? -eq 0 ]
then
    echo "Game server successfully started. Check logs in /home/xonotic/game_server.log"
else
    echo "ERROR: problem starting Game server. Check logs in /home/xonotic/game_server.log"
fi
/bin/bash
