## VMware disk

### increase disk size

1. Disable snapshots.
2. Delete snapshots.
3. Expand virtual disk size.
3.1. If error, create new snapshot and then delete snapshot & childs.
4. Start guest system
5. Install growpart (`yay growpart`)
6. Run `sudo growpart /dev/sda 1`
7. Run `sudo resize2fs /dev/sda1`
