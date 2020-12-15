# Windows
GVLK KEY 由微软官方提供的批量激活密钥。
https://docs.microsoft.com/en-us/windows-server/get-started/kmsclientkeys

## 查看系统版本
wmic os get caption

## 卸载秘钥
slmgr -upk

## 使用管理员权限运行cmd执行安装key

### Windows 10 Pro 专业版
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX

### Windows 10 Pro for Workstations 专业版工作站
slmgr /ipk NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J

### Windows 10 Enterprise 企业版
slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43

### Windows Server Datacenter 数据中心
slmgr /ipk 6NMRW-2C8FM-D24W7-TQWMY-CWH2D

### Windows Server Standard 标准版
slmgr /ipk N2KJX-J94YW-TQVFB-DG9YT-724CC

## 设置KMS并激活
slmgr /skms kms.03k.org
slmgr /ato

## 查看KMS信息
slmgr -dlv