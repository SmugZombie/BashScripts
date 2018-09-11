#!/bin/bash
# Home Directory Backup - For Ubuntu on Windows
# Simply create a symlink such as /home/backup to a local drive /mnt/<driveletter>/yourbackuppath and set this script to run automatically or manually to keep a backup of your home dir
# Ron Egli - Github.com/smugzombie

# User Definable
date=$(date +%Y-%m-%d)
user="regli"
backup_path="/home/backup/"

# Do not change
backed_up="false"

check_if_backedup () {
        # So we don't waste resources, check to see if today was already backed up
        if [ -f "$backup_path$date.$user.tar.gz" ]; then
                backed_up="true"
        fi
}


backup_home_dir () {
        # Simply tar the whole directory, then move to backup path
        tar -zcvf $date.$user.tar.gz /home/$user
        mv $date.$user.tar.gz "$backup_path"

}


# Run the check to see if today already exists
check_if_backedup
#echo $backed_up #debug

# Main
if [[ "$backed_up" == "true" ]]; then
        echo "Already backed up today."

else
        echo "Not yet backed up today."
        echo "Backing up to: $backup_path"
        backup_home_dir
        echo "Backup Complete"
fi
