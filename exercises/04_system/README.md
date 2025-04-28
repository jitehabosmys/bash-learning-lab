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