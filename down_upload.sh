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

{
	unzip -O UTF-8 /root/zipdown/$2.zip -d /root/zipdown &&
	rm -f /root/zipdown/$2.zip
}||{
	echo '解压失败'
	exit 1
}

{
	c=$(find /root/zipdown -maxdepth 1 -name "Sale*") &&
	a=$(find "$c" -name "*.txt" -o -name "*.jpg" -o -name "*.png") &&
	b=${a// /\\ } &&
	echo $b | xargs rm -f 
	
}||{
	echo '广告删除失败'
	exit 1
}

{
	mv "${c}" /root/zipdown/$2 &&
	rename .vtt .srt /root/zipdown/$2/*/*.vtt &&
	echo "srt后缀修改完成" &&
	mv /root/zipdown/$2 /root/course &&
	rm -rf /root/zipdown/$2
	
}||{
	echo '改字幕等失败'
	exit 1
}

{
	echo "开始上传" &&
	nohup ./bygo upload /root/course/$2 /course > /root/out/$2.out &&
	echo "上传完成" &&
	rm -rf /root/course/$2
	
}||{
	echo '上传失败'
	exit 1
}
	
	
