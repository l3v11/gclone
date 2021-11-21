# gclone

A modified version of the [rclone](//github.com/rclone/rclone)

Original [donwa/gclone](https://github.com/donwa/gclone) but synced with rclone version for getting the latest features and bug fixes

Provides dynamic replacement of SA files support for Google Drive operation for bypassing the 750GB/day limit


## Instructions

### 1. Configuring the service_account_file_path

Add `service_account_file_path` in config file for dynamic replacement of *service_account_file* (SAs). Replaces when `rateLimitExceeded` error occurs.

> ***rclone.conf*** example:
```
[gc]
type = drive  
scope = drive  
service_account_file = /root/accounts/1.json  
service_account_file_path = /root/accounts/  
root_folder_id = root  
```
**Note:** `/root/accounts/` folder must contain **SA files** (*.json)
  
### 2. Copying data

```
gclone copy gc:{source} gc:{destination} --drive-server-side-across-configs
```
**Note:** Provide Team Drive ID or Folder ID as `source` and `destination`
