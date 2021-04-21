#! /bin/bash
echo "开始下载$1,$2"
{
	CONFIRM=$(wget -q --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p') &&
	wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O /root/zipdown/$2.zip &&
	rm -rf /tmp/cookies.txt
}||{
	echo '下载失败'
	exit 1
}

