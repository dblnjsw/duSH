{
        unzip -O UTF-8 /root/zipdown/$2.zip -d /root/zipdown &&
        rm -f /root/zipdown/$2.zip
}||{
        echo '解压失败'
        exit 1
}

