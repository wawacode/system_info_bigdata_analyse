time=`date "+%Y/%m/%d %H:%M:%S"`
ip=`ifconfig|grep "inet"|grep -v "inet6"|grep -v "127.0.0.1"|awk '{print $2}'`
mac=`ifconfig|grep "ether"|awk '{print $2}'`
hostname=`hostname`
who=`who am i|awk '{print $1}'`
cpu_user_rate=`top -n 1 | grep "%Cpu(s)" |awk '{print $2}'`
cpu_sys_rate=`top -n 1 | grep "%Cpu(s)" |awk '{print $4}'`
cpu_idle=`top -n 1 | grep "%Cpu(s)" |awk '{print $8}'`
mem_total=`top -n 1|grep "Mem" |grep -v "Swap"|awk '{print $4}'`
mem_free=`top -n 1|grep "Mem" |grep -v "Swap"|awk '{print $6}'`
disk_rate=`df | grep -v "/dev/sr0" | grep -v "Use%" | awk '{ a+=$5 } END { print a }'`
echo "$time|$ip|$mac|$hostname|$who|$cpu_user_rate|$cpu_sys_rate|$cpu_idle|$mem_total|$mem_free|$disk_rate">/home/data/info.txt
