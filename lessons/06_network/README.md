# 网络操作

本章介绍Linux系统中的网络操作基础知识，包括基本网络命令、网络配置、远程连接、文件传输和网络监控等内容。

## 基本网络命令

* `ping` - 测试网络连通性
  ```bash
  # 基本用法
  ping google.com
  
  # 指定ping次数
  ping -c 4 google.com
  
  # 指定时间间隔（秒）
  ping -i 2 google.com
  
  # 洪水ping（需要root权限，谨慎使用）
  sudo ping -f google.com
  ```

* `ifconfig`/`ip` - 显示和配置网络接口信息
  ```bash
  # 显示所有网络接口
  ifconfig
  ip addr show
  
  # 显示特定接口
  ifconfig eth0
  ip addr show dev eth0
  
  # 启用/禁用网络接口
  sudo ifconfig eth0 up
  sudo ifconfig eth0 down
  sudo ip link set eth0 up
  sudo ip link set eth0 down
  
  # 设置IP地址
  sudo ifconfig eth0 192.168.1.100 netmask 255.255.255.0
  sudo ip addr add 192.168.1.100/24 dev eth0
  ```

* `netstat`/`ss` - 显示网络连接状态
  ```bash
  # 显示所有监听端口
  netstat -tuln
  ss -tuln
  
  # 显示活动连接
  netstat -tuap
  ss -tuap
  
  # 显示路由表
  netstat -r
  ip route show
  
  # 显示网络统计信息
  netstat -s
  ss -s
  ```

* `traceroute` - 显示数据包到目标主机的路径
  ```bash
  # 基本用法
  traceroute google.com
  
  # 不解析主机名（更快）
  traceroute -n google.com
  
  # 使用特定协议
  traceroute -I google.com  # 使用ICMP
  traceroute -T google.com  # 使用TCP
  ```

* `host`/`dig`/`nslookup` - DNS查询工具
  ```bash
  # 基本DNS查询
  host google.com
  
  # 详细DNS查询
  dig google.com
  
  # 查询特定记录类型
  host -t MX google.com
  dig MX google.com
  
  # 交互式DNS查询
  nslookup
  > google.com
  > set type=MX
  > google.com
  > exit
  ```

* `whois` - 查询域名注册信息
  ```bash
  # 基本用法
  whois google.com
  
  # 查询特定服务器
  whois -h whois.verisign-grs.com google.com
  
  # 简短输出
  whois -b google.com
  ```

## 网络配置

* IP地址、子网掩码和网关的配置
  ```bash
  # 临时配置IP地址（重启后失效）
  sudo ip addr add 192.168.1.100/24 dev eth0
  
  # 删除IP地址
  sudo ip addr del 192.168.1.100/24 dev eth0
  
  # 永久配置IP（Ubuntu/Debian）
  sudo nano /etc/network/interfaces
  # 添加以下内容
  # auto eth0
  # iface eth0 inet static
  # address 192.168.1.100
  # netmask 255.255.255.0
  # gateway 192.168.1.1
  
  # 永久配置IP（CentOS/RHEL）
  sudo nano /etc/sysconfig/network-scripts/ifcfg-eth0
  # 添加以下内容
  # DEVICE=eth0
  # BOOTPROTO=static
  # IPADDR=192.168.1.100
  # NETMASK=255.255.255.0
  # GATEWAY=192.168.1.1
  # ONBOOT=yes
  ```

* DNS配置
  ```bash
  # 临时设置DNS
  sudo nano /etc/resolv.conf
  # 添加：
  # nameserver 8.8.8.8
  # nameserver 8.8.4.4
  
  # 永久设置DNS（Ubuntu 18.04+）
  sudo nano /etc/systemd/resolved.conf
  # 添加：
  # [Resolve]
  # DNS=8.8.8.8 8.8.4.4
  
  # 永久设置DNS（NetworkManager）
  sudo nmcli con mod "以太网连接" ipv4.dns "8.8.8.8 8.8.4.4"
  ```

* 网络接口的启用和禁用
  ```bash
  # 使用ip命令
  sudo ip link set eth0 up
  sudo ip link set eth0 down
  
  # 使用ifconfig命令
  sudo ifconfig eth0 up
  sudo ifconfig eth0 down
  
  # 使用NetworkManager
  sudo nmcli device connect eth0
  sudo nmcli device disconnect eth0
  ```

* 静态和动态IP配置
  ```bash
  # 配置DHCP（动态IP）
  # Ubuntu/Debian中的/etc/network/interfaces
  # auto eth0
  # iface eth0 inet dhcp
  
  # 使用NetworkManager
  sudo nmcli con mod "以太网连接" ipv4.method auto
  
  # 应用更改
  sudo systemctl restart networking
  # 或
  sudo nmcli con up "以太网连接"
  ```

## 远程连接

* SSH (Secure Shell) 连接
  ```bash
  # 基本SSH连接
  ssh username@192.168.1.100
  
  # 指定端口
  ssh -p 2222 username@192.168.1.100
  
  # 压缩传输数据
  ssh -C username@192.168.1.100
  
  # 启用X11转发
  ssh -X username@192.168.1.100
  
  # 安静模式
  ssh -q username@192.168.1.100
  
  # 使用配置文件指定参数
  # 编辑 ~/.ssh/config:
  # Host myserver
  #   HostName 192.168.1.100
  #   User username
  #   Port 2222
  # 然后使用：
  ssh myserver
  ```

* 密钥认证
  ```bash
  # 生成SSH密钥对
  ssh-keygen -t rsa -b 4096
  
  # 带注释的密钥生成
  ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
  
  # 将公钥上传到服务器
  ssh-copy-id username@192.168.1.100
  
  # 手动上传公钥
  cat ~/.ssh/id_rsa.pub | ssh username@192.168.1.100 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
  
  # 使用特定密钥连接
  ssh -i ~/.ssh/id_rsa_special username@192.168.1.100
  ```

* 远程命令执行
  ```bash
  # 执行单个命令
  ssh username@192.168.1.100 "ls -la"
  
  # 执行多个命令
  ssh username@192.168.1.100 "cd /var/log && ls -la | grep error"
  
  # 以root身份执行远程命令
  ssh username@192.168.1.100 "sudo ls -la /root"
  ```

* SSH配置选项
  ```bash
  # 编辑SSH客户端配置
  nano ~/.ssh/config
  
  # 常用配置示例
  # Host myserver
  #   HostName 192.168.1.100
  #   User username
  #   Port 2222
  #   IdentityFile ~/.ssh/id_rsa_special
  #   ForwardAgent yes
  #   Compression yes
  
  # 服务器端配置（需要root权限）
  sudo nano /etc/ssh/sshd_config
  # 常用设置：
  # PermitRootLogin no
  # PasswordAuthentication no
  # Port 2222
  
  # 重启SSH服务器
  sudo systemctl restart sshd
  ```

## 文件传输

* SCP (Secure Copy)
  ```bash
  # 上传本地文件到远程服务器
  scp local_file.txt username@remote_host:/path/to/destination/
  
  # 下载远程文件到本地
  scp username@remote_host:/path/to/remote_file.txt local_directory/
  
  # 复制整个目录
  scp -r local_directory/ username@remote_host:/path/to/destination/
  
  # 指定端口
  scp -P 2222 local_file.txt username@remote_host:/path/to/destination/
  
  # 保留文件属性
  scp -p local_file.txt username@remote_host:/path/to/destination/
  ```

* SFTP (SSH File Transfer Protocol)
  ```bash
  # 连接到SFTP服务器
  sftp username@remote_host
  
  # SFTP常用命令
  # ls - 列出远程目录文件
  # lls - 列出本地目录文件
  # cd - 切换远程目录
  # lcd - 切换本地目录
  # get remote_file - 下载文件
  # put local_file - 上传文件
  # mget *.txt - 下载多个文件
  # mput *.txt - 上传多个文件
  # bye/exit/quit - 退出
  
  # 非交互式SFTP脚本
  sftp username@remote_host << EOF
  cd /remote/directory
  get important_file.txt
  bye
  EOF
  ```

* rsync 增量文件同步
  ```bash
  # 基本用法
  rsync -av /source/directory/ username@remote_host:/destination/directory/
  
  # 使用SSH连接
  rsync -avz -e ssh /source/directory/ username@remote_host:/destination/directory/
  
  # 仅同步不同的文件（快速检查模式）
  rsync -avz --checksum /source/ username@remote_host:/destination/
  
  # 删除目标目录中源目录没有的文件
  rsync -avz --delete /source/ username@remote_host:/destination/
  
  # 排除特定文件或目录
  rsync -avz --exclude='*.tmp' --exclude='cache/' /source/ username@remote_host:/destination/
  
  # 限制带宽使用（10MB/s）
  rsync -avz --bwlimit=10000 /source/ username@remote_host:/destination/
  ```

* FTP/FTPS 文件传输
  ```bash
  # 使用ftp命令
  ftp ftp.example.com
  # 登录后：
  # get file.txt - 下载文件
  # put file.txt - 上传文件
  # bye - 退出
  
  # 使用匿名FTP
  ftp ftp.example.com
  # 用户名: anonymous
  # 密码: your@email.com（任意电子邮件）
  
  # 使用lftp（更现代的客户端）
  lftp ftp.example.com
  
  # 非交互式FTP脚本
  ftp -n ftp.example.com << EOF
  user username password
  cd /remote/directory
  get important_file.txt
  bye
  EOF
  ```

## 网络监控和诊断

* 网络流量监控工具
  ```bash
  # 使用iftop监控网络流量
  sudo iftop -i eth0
  
  # 使用nethogs监控进程网络使用
  sudo nethogs eth0
  
  # 使用nload显示网络流量图表
  nload eth0
  
  # 使用vnstat查看历史流量统计
  vnstat -i eth0
  
  # 实时监控
  vnstat -l -i eth0
  
  # 查看每小时统计
  vnstat -h -i eth0
  ```

* 数据包捕获和分析
  ```bash
  # 使用tcpdump捕获数据包
  sudo tcpdump -i eth0
  
  # 捕获特定主机的数据包
  sudo tcpdump -i eth0 host 192.168.1.100
  
  # 捕获特定端口
  sudo tcpdump -i eth0 port 80
  
  # 捕获并保存到文件
  sudo tcpdump -i eth0 -w capture.pcap
  
  # 读取pcap文件
  tcpdump -r capture.pcap
  
  # Wireshark（图形界面数据包分析器）
  sudo wireshark
  # 或在远程机器上捕获，在本地分析
  sudo tcpdump -i eth0 -w - | wireshark -k -i -
  ```

* 网络问题诊断方法
  ```bash
  # 使用mtr进行网络路径分析
  mtr google.com
  
  # 检查网络接口错误
  ifconfig eth0 | grep -E "RX|TX"
  
  # 查看开放端口
  sudo lsof -i -P -n | grep LISTEN
  
  # 检查名称解析
  getent hosts google.com
  
  # 检查防火墙规则
  sudo iptables -L
  
  # 检查系统路由表
  ip route show
  
  # 识别网络瓶颈
  sudo iperf -s  # 在服务器端运行
  iperf -c server_ip  # 在客户端运行
  ```

## 网络安全基础

* 防火墙设置
  ```bash
  # iptables基本用法
  # 查看当前规则
  sudo iptables -L
  
  # 允许SSH连接（端口22）
  sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
  
  # 允许已建立的连接
  sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  
  # 拒绝所有其他传入连接
  sudo iptables -A INPUT -j DROP
  
  # 保存iptables规则（Ubuntu/Debian）
  sudo iptables-save > /etc/iptables.rules
  
  # 保存iptables规则（CentOS/RHEL）
  sudo service iptables save
  
  # 使用ufw（Ubuntu防火墙）
  sudo ufw enable
  sudo ufw allow 22/tcp
  sudo ufw status
  ```

* 端口扫描与安全检查
  ```bash
  # 使用nmap扫描主机
  nmap 192.168.1.100
  
  # 扫描特定端口范围
  nmap -p 20-100 192.168.1.100
  
  # 扫描整个子网
  nmap 192.168.1.0/24
  
  # 检测操作系统和服务版本
  nmap -O -sV 192.168.1.100
  
  # 全面扫描
  nmap -A 192.168.1.100
  
  # 使用hping3测试防火墙
  sudo hping3 -S -p 80 192.168.1.100
  ```

* 网络安全最佳实践
  ```bash
  # 仅允许SSH密钥登录（禁用密码）
  sudo nano /etc/ssh/sshd_config
  # 设置: PasswordAuthentication no
  sudo systemctl restart sshd
  
  # 检查可疑网络连接
  sudo netstat -plutn
  
  # 监控登录尝试
  sudo tail -f /var/log/auth.log
  
  # 使用fail2ban防止暴力攻击
  sudo apt-get install fail2ban
  sudo systemctl start fail2ban
  sudo fail2ban-client status
  
  # 检查已安装程序的漏洞（Debian/Ubuntu）
  sudo apt install debsecan
  debsecan
  ```

## 实用技巧

* 解决常见网络问题的方法
  ```bash
  # 重启网络服务
  sudo systemctl restart networking
  
  # 重新获取DHCP地址
  sudo dhclient -r eth0
  sudo dhclient eth0
  
  # 清除DNS缓存
  sudo systemd-resolve --flush-caches
  
  # 排查DNS问题
  sudo nano /etc/resolv.conf
  
  # 释放并更新IP地址（Windows风格）
  sudo ip addr flush dev eth0
  sudo dhclient eth0
  
  # 检查网络冲突
  sudo arping -D -I eth0 192.168.1.100
  ```

* 网络配置备份与恢复
  ```bash
  # 备份网络配置
  sudo cp /etc/network/interfaces /etc/network/interfaces.bak
  
  # 备份网络名称解析配置
  sudo cp /etc/resolv.conf /etc/resolv.conf.bak
  
  # 备份完整网络配置（Ubuntu/Debian）
  sudo tar -czvf network_config_backup.tar.gz /etc/network/interfaces /etc/resolv.conf /etc/hosts
  
  # 恢复备份
  sudo cp /etc/network/interfaces.bak /etc/network/interfaces
  sudo systemctl restart networking
  ```

* 网络脚本自动化示例
  ```bash
  # 简单的网络监控脚本
  #!/bin/bash
  # monitor_network.sh
  
  HOST="google.com"
  LOG_FILE="/var/log/network_monitor.log"
  
  while true; do
    ping -c 1 $HOST > /dev/null
    if [ $? -eq 0 ]; then
      echo "$(date): Network is UP" >> $LOG_FILE
    else
      echo "$(date): Network is DOWN" >> $LOG_FILE
      # 可选：发送邮件通知
      echo "Network is down!" | mail -s "Network Alert" admin@example.com
    fi
    sleep 300  # 每5分钟检查一次
  done
  
  # 网络接口自动配置脚本
  #!/bin/bash
  # auto_network_config.sh
  
  INTERFACE="eth0"
  IP="192.168.1.100"
  NETMASK="255.255.255.0"
  GATEWAY="192.168.1.1"
  
  # 配置IP地址
  sudo ip addr flush dev $INTERFACE
  sudo ip addr add $IP/$NETMASK dev $INTERFACE
  sudo ip link set $INTERFACE up
  
  # 配置默认网关
  sudo ip route add default via $GATEWAY
  
  # 配置DNS服务器
  echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
  echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf
  
  echo "Network configuration completed."
  ``` 