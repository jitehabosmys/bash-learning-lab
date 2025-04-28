# 模块四：系统管理

## 学习目标
- 掌握用户和权限管理
- 学习进程和服务管理
- 了解系统监控和维护

## 核心内容

### 1. 用户和组管理
- `useradd`/`userdel` - 添加/删除用户
  ```bash
  # 创建新用户
  sudo useradd john
  
  # 创建用户并设置家目录
  sudo useradd -m john
  
  # 创建用户并指定shell
  sudo useradd -m -s /bin/bash john
  
  # 删除用户
  sudo userdel john
  
  # 删除用户及其家目录
  sudo userdel -r john
  ```

- `passwd` - 修改密码
  ```bash
  # 修改当前用户密码
  passwd
  
  # 为指定用户设置密码
  sudo passwd john
  
  # 锁定用户账户
  sudo passwd -l john
  
  # 解锁用户账户
  sudo passwd -u john
  ```

- `groupadd`/`groupdel` - 添加/删除组
  ```bash
  # 创建新组
  sudo groupadd developers
  
  # 删除组
  sudo groupdel developers
  ```

- `su` - 切换用户
  ```bash
  # 切换到root用户
  su
  
  # 切换到指定用户
  su john
  
  # 切换用户并使用目标用户的环境
  su - john
  ```

- `sudo` - 以超级用户权限执行命令
  ```bash
  # 以root权限执行命令
  sudo apt update
  
  # 查看sudo权限
  sudo -l
  
  # 以指定用户身份执行命令
  sudo -u john ls -la
  
  # 编辑sudoers文件
  sudo visudo
  ```

- `/etc/passwd`, `/etc/shadow`, `/etc/group` - 用户和组配置文件
  ```bash
  # 查看用户信息
  cat /etc/passwd
  
  # 查看用户密码信息（需要root权限）
  sudo cat /etc/shadow
  
  # 查看组信息
  cat /etc/group
  
  # 查看特定用户信息
  grep "john" /etc/passwd
  ```

### 2. 进程管理
- `ps` - 显示进程状态
  ```bash
  # 显示当前终端进程
  ps
  
  # 显示所有进程
  ps -e
  ps -ef
  
  # 详细格式显示所有进程
  ps aux
  
  # 查找特定进程
  ps aux | grep firefox
  
  # 以树状结构显示进程
  ps auxf
  ```

- `top`/`htop` - 实时监控系统状态
  ```bash
  # 启动top
  top
  
  # 在top中按键操作:
  # P - 按CPU使用率排序
  # M - 按内存使用率排序
  # k - 杀死进程（需输入PID）
  # q - 退出
  
  # 使用htop（需安装）
  htop
  ```

- `kill`/`pkill` - 终止进程
  ```bash
  # 通过PID终止进程
  kill 1234
  
  # 强制终止
  kill -9 1234
  
  # 通过进程名终止
  pkill firefox
  
  # 向所有进程发送信号
  killall apache2
  ```

- `bg`/`fg` - 后台/前台进程控制
  ```bash
  # 启动命令并放入后台
  sleep 100 &
  
  # 将当前进程放入后台
  # [按Ctrl+Z暂停进程]
  bg
  
  # 将后台进程调至前台
  fg
  
  # 将特定作业号的进程调至前台
  fg %1
  ```

- `jobs` - 查看作业
  ```bash
  # 查看所有后台作业
  jobs
  
  # 显示PID
  jobs -l
  ```

- `nice`/`renice` - 调整进程优先级
  ```bash
  # 以较低优先级启动进程（-20至19，较低值表示较高优先级）
  nice -n 10 command
  
  # 修改运行中的进程优先级
  renice 10 -p 1234
  ```

### 3. 系统监控
- `free` - 显示内存使用情况
  ```bash
  # 显示内存使用情况
  free
  
  # 以MB为单位显示
  free -m
  
  # 以GB为单位显示
  free -g
  
  # 以人类可读格式显示
  free -h
  ```

- `vmstat` - 虚拟内存统计
  ```bash
  # 显示系统状态
  vmstat
  
  # 每隔2秒采集一次，共采集5次
  vmstat 2 5
  
  # 显示详细内存信息
  vmstat -s
  ```

- `iostat` - I/O统计信息
  ```bash
  # 查看CPU和设备I/O统计
  iostat
  
  # 每2秒更新一次I/O统计
  iostat 2
  
  # 只显示设备统计
  iostat -d
  ```

- `netstat` - 网络连接统计
  ```bash
  # 显示所有活动的网络连接
  netstat -a
  
  # 显示所有TCP连接
  netstat -at
  
  # 显示监听端口
  netstat -l
  
  # 显示进程信息
  netstat -p
  
  # 不解析主机名（更快）
  netstat -n
  ```

- `uptime` - 系统运行时间和负载
  ```bash
  # 查看系统运行时间和负载
  uptime
  
  # 输出例如: 14:23:26 up 3 days, 2:54, 4 users, load average: 0.09, 0.11, 0.10
  ```

### 4. 系统服务
- 服务管理 (`systemctl`, `service`)
  ```bash
  # systemd管理服务
  
  # 查看服务状态
  systemctl status apache2
  
  # 启动服务
  sudo systemctl start apache2
  
  # 停止服务
  sudo systemctl stop apache2
  
  # 重启服务
  sudo systemctl restart apache2
  
  # 重新加载配置
  sudo systemctl reload apache2
  
  # 传统service命令（在一些旧系统中使用）
  sudo service apache2 status
  sudo service apache2 start
  ```

- 启动和停止服务
  ```bash
  # 详见上面的systemctl命令
  ```

- 设置服务自启动
  ```bash
  # 设置服务开机自启
  sudo systemctl enable apache2
  
  # 禁用服务开机自启
  sudo systemctl disable apache2
  
  # 检查服务是否设置为自启
  systemctl is-enabled apache2
  ```

### 5. 系统日志
- `/var/log/` - 日志文件目录
  ```bash
  # 查看日志目录内容
  ls -l /var/log/
  
  # 查看系统日志
  sudo tail -f /var/log/syslog
  
  # 查看验证日志（登录尝试等）
  sudo tail -f /var/log/auth.log
  ```

- `journalctl` - 查看systemd日志
  ```bash
  # 查看所有日志
  journalctl
  
  # 查看特定服务的日志
  journalctl -u apache2
  
  # 显示最近的日志
  journalctl -n 50
  
  # 实时查看新日志
  journalctl -f
  
  # 查看特定时间段的日志
  journalctl --since "2023-01-01" --until "2023-01-02 03:00"
  ```

- `dmesg` - 查看内核日志
  ```bash
  # 查看内核日志
  dmesg
  
  # 以人类可读时间格式显示
  dmesg -T
  
  # 过滤特定内容
  dmesg | grep USB
  
  # 实时查看内核消息
  dmesg -w
  ```

## 练习
查看对应的练习目录 `exercises/04_system/` 完成实践任务：

1. 用户和权限管理
2. 进程控制和监控
3. 系统服务管理

## 进阶资源
- Linux系统架构
- 启动流程和运行级别

## 下一步
完成本模块后，继续学习模块五：Shell脚本
```bash
cd ../05_shell
cat README.md
``` 