Set-StrictMode -Version Latest

$curr_date = Get-Date -UFormat "%Y%m%d_%H%M%S"
mkdir -Force C:/Users/faris/rclone_logs

# sync C:/Users/faris to pcloud
Start-Process -FilePath rclone -ArgumentList 'sync "C:/Users/faris/" pcloud10tb:/backups/mirror/faris --backup-dir pcloud10tb:/backups/incremental/"$curr_date" --log-file=C:/Users/faris/rclone_logs/faris_pcloud.txt  --log-level=INFO --filter-from rclone-sync-filter-list.txt -P -l --max-backlog=-1 --transfers=30 --buffer-size=50M --use-mmap --fast-list --drive-chunk-size 64M --retries 3 --timeout 60s --contimeout 60s'
# sync C:/Users/faris to NAS
Start-Process -FilePath rclone -ArgumentList 'sync "C:/Users/faris/" Z:/backups/mirror/faris --backup-dir Z:/backups/incremental/"$curr_date" --log-file=C:/Users/faris/rclone_logs/faris_nas.txt  --log-level=INFO                      --filter-from rclone-sync-filter-list.txt -P -l --max-backlog=-1 --transfers=30 --buffer-size=50M --use-mmap --fast-list --drive-chunk-size 64M --retries 3 --timeout 60s --contimeout 60s'
# sync C:/Users/faris to E: internal drive
Start-Process -FilePath rclone -ArgumentList 'sync "C:/Users/faris/" E:/backups/mirror/faris --backup-dir E:/backups/incremental/"$curr_date" --log-file=C:/Users/faris/rclone_logs/faris_e.txt  --log-level=INFO                        --filter-from rclone-sync-filter-list.txt -P -l --max-backlog=-1 --transfers=30 --buffer-size=50M --use-mmap --fast-list --drive-chunk-size 64M --retries 3 --timeout 60s --contimeout 60s'

# sync D: to pcloud
Start-Process -FilePath rclone -ArgumentList 'sync "D:/" pcloud10tb:/backups/mirror/d --backup-dir pcloud10tb:/backups/incremental/"$curr_date" --log-file=C:/Users/faris/rclone_logs/d_pcloud.txt  --log-level=INFO                     --filter-from rclone-sync-filter-list.txt -P -l --max-backlog=-1 --transfers=30 --buffer-size=50M --use-mmap --fast-list --drive-chunk-size 64M --retries 3 --timeout 60s --contimeout 60s'
# sync D: to NAS
Start-Process -FilePath rclone -ArgumentList 'sync "D:/" Z:/backups/mirror/d --backup-dir Z:/backups/incremental/"$curr_date" --log-file=C:/Users/faris/rclone_logs/d_nas.txt  --log-level=INFO                                          --filter-from rclone-sync-filter-list.txt -P -l --max-backlog=-1 --transfers=30 --buffer-size=50M --use-mmap --fast-list --drive-chunk-size 64M --retries 3 --timeout 60s --contimeout 60s'
# sync D: to E: internal drive
Start-Process -FilePath rclone -ArgumentList 'sync "D:/" E:/backups/mirror/d --backup-dir E:/backups/incremental/"$curr_date" --log-file=C:/Users/faris/rclone_logs/d_e.txt  --log-level=INFO                                            --filter-from rclone-sync-filter-list.txt -P -l --max-backlog=-1 --transfers=30 --buffer-size=50M --use-mmap --fast-list --drive-chunk-size 64M --retries 3 --timeout 60s --contimeout 60s'

#: Shows progress while transferring files.
# --transfers 10: Allows up to 10 file transfers to run in parallel.
# --checkers 10: Allows up to 10 checkers to run in parallel.
# --fast-list: Uses a faster listing mode that reduces the number of API calls.
# --drive-chunk-size 64M: Uploads files in 64 MB chunks (increases performance).
# --retries 3: Retries the operation up to 3 times in case of errors.
# --timeout 60s: Sets a timeout of 60 seconds for each operation.
# --contimeout 60s: Sets a timeout of 60 seconds for establishing a connection.
# --drive-use-trash=false: Skips the trash and permanently deletes files when needed.
