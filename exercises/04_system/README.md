# 系统管理练习

## 练习任务
请完成以下系统管理任务：

1. 用户和组管理
   - 创建一个名为 `testuser` 的新用户
   - 为该用户设置密码
   - 创建一个名为 `testgroup` 的新组
   - 将 `testuser` 添加到 `testgroup` 组
   - 查看 `/etc/passwd` 文件中的 `testuser` 信息
   - 查看 `/etc/group` 文件中的 `testgroup` 信息
   - 最后，删除 `testuser` 用户和 `testgroup` 组

2. 进程管理
   - 运行 `sleep 300 &` 启动一个后台休眠进程
   - 使用 `ps` 命令查找该进程的 PID
   - 使用 `kill` 命令终止该进程
   - 启动另一个休眠进程 `sleep 200`，然后按 Ctrl+Z 暂停
   - 使用 `bg` 命令将其放入后台
   - 使用 `jobs` 命令查看后台作业
   - 使用 `fg` 命令将其带回前台，然后按 Ctrl+C 终止

3. 系统监控
   - 使用 `free` 命令查看内存使用情况，记录总内存和可用内存
   - 使用 `top` 命令运行 10 秒钟，观察 CPU 和内存使用率最高的进程
   - 使用 `vmstat` 命令每隔 2 秒采样 5 次
   - 使用 `df -h` 命令检查磁盘空间使用情况

4. 系统服务
   - 使用 `systemctl list-units --type=service` 查看活动服务
   - 找出并记录 SSH 服务的状态
   - 检查 SSH 服务是否设置为开机自启动
   - 如果你有 root 权限，尝试重启 SSH 服务（小心操作）

5. 系统日志分析
   - 查看 `/var/log/syslog` 或 `/var/log/messages` 的最后 20 行
   - 使用 `dmesg` 命令查看内核日志信息
   - 如果系统使用 systemd，使用 `journalctl` 查看最近的系统日志

## 提示
- 用户和组管理命令需要 root 权限，请使用 `sudo`
- 使用 `man` 命令查看各命令的详细用法
- 某些命令可能需要安装额外的包
- 系统服务管理在不同发行版间有差异，可能需要使用 `service` 而非 `systemctl`
- 日志文件位置也可能因发行版而异

## 验证
完成后运行 `./check_system.sh` 检查你的结果

## 练习答案
```bash
# 1. 用户和组管理
# 创建新用户
sudo useradd testuser
# 设置密码
sudo passwd testuser
# 创建新组
sudo groupadd testgroup
# 将用户添加到组
sudo usermod -aG testgroup testuser
# 查看用户信息
grep testuser /etc/passwd
# 查看组信息
grep testgroup /etc/group
# 删除用户和组
sudo userdel testuser
sudo groupdel testgroup

# 2. 进程管理
# 启动后台进程
sleep 300 &
# 查找进程PID
ps aux | grep "sleep 300"
# 终止进程(假设PID是1234)
kill 1234
# 启动进程并暂停
sleep 200
# 按Ctrl+Z后
bg
# 查看后台作业
jobs
# 将作业带到前台
fg
# 然后按Ctrl+C终止

# 3. 系统监控
# 查看内存使用情况
free -h
# 运行top命令10秒
top -n 1
# 使用vmstat采样
vmstat 2 5
# 查看磁盘空间
df -h

# 4. 系统服务
# 查看活动服务
systemctl list-units --type=service
# 查看SSH服务状态
systemctl status sshd
# 检查SSH是否自启动
systemctl is-enabled sshd
# 重启SSH服务(需要root权限)
sudo systemctl restart sshd

# 5. 系统日志分析
# 查看系统日志
tail -n 20 /var/log/syslog
# 或者
tail -n 20 /var/log/messages
# 查看内核日志
dmesg
# 使用journalctl
journalctl -n 50 