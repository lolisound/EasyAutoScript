# office
GVLK KEY 由微软官方提供的批量激活密钥。
https://docs.microsoft.com/en-us/deployoffice/vlactivation/gvlks

## 切换到安装目录

### x64
cd "C:\Program Files\Microsoft Office\Office16"

### x86
cd "C:\Program Files (x86)\Microsoft Office\Office16"

## 激活

### Office Professional Plus 2019
cscript ospp.vbs /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP

### Office Professional Plus 2016
cscript ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99

## 设置KMS并激活
cscript ospp.vbs /sethst:kms.03k.org
cscript ospp.vbs /act