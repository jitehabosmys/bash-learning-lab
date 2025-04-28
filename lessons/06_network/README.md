# 网络操作

本章介绍Linux系统中的网络操作基础知识，包括基本网络命令、网络配置、远程连接、文件传输和网络监控等内容。

## 基本网络命令

* `ping` - 测试网络连通性
* `ifconfig`/`ip` - 显示和配置网络接口信息
* `netstat`/`ss` - 显示网络连接状态
* `traceroute` - 显示数据包到目标主机的路径
* `host`/`dig`/`nslookup` - DNS查询工具
* `whois` - 查询域名注册信息

```bash
# 测试与目标主机的连通性
ping example.com

# 显示网络接口信息
ip addr show

# 显示网络连接
ss -tuln
```

## 网络配置

* IP地址、子网掩码和网关的配置
* DNS配置
* 网络接口的启用和禁用
* 静态和动态IP配置

```bash
# 临时配置IP地址
sudo ip addr add 192.168.1.100/24 dev eth0

# 添加默认网关
sudo ip route add default via 192.168.1.1

# 修改DNS服务器
sudo vim /etc/resolv.conf
```

## 远程连接

* SSH (Secure Shell) 连接
* 密钥认证
* 远程命令执行
* SSH配置选项

```bash
# 连接到远程服务器
ssh username@remote_host

# 使用密钥认证
ssh -i ~/.ssh/id_rsa username@remote_host

# 远程执行命令
ssh username@remote_host "ls -la"
```

## 文件传输

* SCP (Secure Copy)
* SFTP (SSH File Transfer Protocol)
* rsync 增量文件同步
* FTP/FTPS 文件传输

```bash
# 使用scp复制文件到远程服务器
scp file.txt username@remote_host:/path/to/destination

# 使用rsync同步目录
rsync -avz /local/dir/ username@remote_host:/remote/dir/
```

## 网络监控和诊断

* 网络流量监控工具
* 数据包捕获和分析
* 网络问题诊断方法

```bash
# 捕获网络数据包
sudo tcpdump -i eth0 host 192.168.1.100

# 监控网络带宽使用情况
sudo iftop -i eth0
```

## 网络安全基础

* 防火墙设置
* 端口扫描与安全检查
* 网络安全最佳实践

```bash
# 显示防火墙规则
sudo iptables -L

# 使用nmap扫描端口
nmap -sV 192.168.1.100
```

## 实用技巧

* 解决常见网络问题的方法
* 网络配置备份与恢复
* 网络脚本自动化示例

```bash
# 创建网络接口配置备份
sudo cp /etc/network/interfaces /etc/network/interfaces.bak

# 检查网络连接问题
mtr google.com
``` 