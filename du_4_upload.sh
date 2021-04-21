#! /bin/bash
{
	echo "开始上传" &&
	nohup ./bygo upload /root/course/$2 /course > /root/out/$2.out &&
	echo "上传完成" &&
	rm -rf /root/course/$2
	
}||{
	echo '上传失败'
	exit 1
}
