# 模块四：系统管理

## 学习目标
- 掌握用户和权限管理
- 学习进程和服务管理
- 了解系统监控和维护

## 核心内容

### 1. 用户和组管理
- `useradd`/`userdel` - 添加/删除用户
- `passwd` - 修改密码
- `groupadd`/`groupdel` - 添加/删除组
- `su` - 切换用户
- `sudo` - 以超级用户权限执行命令
- `/etc/passwd`, `/etc/shadow`, `/etc/group` - 用户和组配置文件

### 2. 进程管理
- `ps` - 显示进程状态
- `top`/`htop` - 实时监控系统状态
- `kill`/`pkill` - 终止进程
- `bg`/`fg` - 后台/前台进程控制
- `jobs` - 查看作业
- `nice`/`renice` - 调整进程优先级

### 3. 系统监控
- `free` - 显示内存使用情况
- `vmstat` - 虚拟内存统计
- `iostat` - I/O统计信息
- `netstat` - 网络连接统计
- `uptime` - 系统运行时间和负载

### 4. 系统服务
- 服务管理 (`systemctl`, `service`)
- 启动和停止服务
- 设置服务自启动

### 5. 系统日志
- `/var/log/` - 日志文件目录
- `journalctl` - 查看systemd日志
- `dmesg` - 查看内核日志

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