hostlist="cs4fs cn6ls"
for h in $hostlist
do
#       echo hi $h
time=`date +%F`

echo  -e "\n--------rsync $h--`date +%F:%T`---------" >>/tank/home/backup-user/scripts/$time.log 2>&1
rsync -avlzx  --exclude '/home/andre' --exclude '/root/scripts' --exclude '/proc' --exclude '/sys' --exclude '/dev' --exclude '/var/log' --exclude '/tmp' -e "ssh -i /tank/home/backup-user/keys/cs4fs/id_rsa" --rsync-path="sudo rsync" backup-user@$h:/.* /tank/backup/$h/ >> /tank/home/backup-user/scripts/$time.log 2>&1 &
wait $!

done
