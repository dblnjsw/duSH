#! /bin/bash

{
	c=$(find /root/zipdown -maxdepth 1 -name "Sale*") &&
	a=$(find "$c" -name "*.txt" -o -name "*.jpg" -o -name "*.png") &&
	b=${a// /\\ } &&
	echo $b | xargs rm -f 
	
}||{
	echo '广告删除失败'
	exit 1
}

mv "${c}" /root/zipdown/$2
rename .vtt .srt /root/zipdown/$2/*/*.vtt
{
	mv /root/zipdown/$2 /root/course &&
	rm -rf /root/zipdown/$2
	
}||{
	echo '改字幕等失败'
	exit 1
}
