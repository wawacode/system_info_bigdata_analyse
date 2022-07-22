set TERM=xterm-256color
ip=`/usr/sbin/ifconfig | grep "inet" | grep -v "inet6" | grep -v "127.0.0.1" | awk '{print $2}'`
mac=`/usr/sbin/ifconfig | grep "ether" | awk '{print $2}'`
hostname=`hostname`
who=`who|grep "pts/0"|awk '{print $1}'`
disk=` df | grep -v "/dev/sr0" | grep -v "Use%" | awk '{ a+=$5 } END { print a }'`
cpu_userrate=`top -b -n 1 | grep "%Cpu(s)" |awk '{print $2}'`
cpu_sysrate=`top -b -n 1 | grep "%Cpu(s)" |awk '{print $4}'`
cpu_idlerate=`top -b -n 1 | grep "%Cpu(s)" |awk '{print $8}'`
mem_total=`top -b -n 1|grep "Mem" |grep -v "Swap"|awk '{print $4}'`
mem_free=`top -b -n 1|grep "Mem" |grep -v "Swap"|awk '{print $6}'`
mydate=`date "+%Y-%m-%d %H:%M:%S"`
echo "$mydate|$ip|$mac|$hostname|$who|$disk|$cpu_userrate|$cpu_sysrate|$cpu_idlerate|$mem_total|$mem_free" > /home/soft/data/info.txt
/usr/hadoop/hadoop-2.7.1/bin/hadoop fs -appendToFile /home/soft/data/info.txt /info.txt
