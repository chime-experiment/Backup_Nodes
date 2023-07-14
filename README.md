# Backup_Nodes
This is the repos has all backup script runing in ZFS server side and playbook for configuration end nodes.
Here are the 
1>backup script which is started by crontab of ZFS server every friday or monday to rsync files to zfs dataset.
2>weekly cleanup snapshot based on our rotation policy.
3>monthly cleanup snapshot based on our rotation policy.
