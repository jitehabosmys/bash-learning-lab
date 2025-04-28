#!/bin/bash
# 系统管理练习检查脚本

# 颜色定义
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "======= 检查系统管理练习 ======="
echo ""

# 检查历史命令中是否有关键命令
HISTORY_FILE=~/.bash_history

check_command() {
    if grep -q "$1" "$HISTORY_FILE"; then
        echo -e "${GREEN}✓${NC} 找到 $1 命令的使用记录"
        return 0
    else
        echo -e "${YELLOW}!${NC} 未找到 $1 命令的使用记录"
        return 1
    fi
}

# 1. 检查用户和组管理
echo "检查用户和组管理命令..."
check_command "useradd\|adduser"
check_command "passwd"
check_command "groupadd\|addgroup"
check_command "usermod\|gpasswd"
check_command "cat.*\/etc\/passwd"
check_command "cat.*\/etc\/group"
check_command "userdel\|deluser"
check_command "groupdel\|delgroup"

# 检查是否有残留的测试用户或组
echo ""
echo "检查残留用户和组..."
if grep -q "testuser" /etc/passwd 2>/dev/null; then
    echo -e "${RED}✗${NC} testuser 用户仍然存在，应该被删除"
else
    echo -e "${GREEN}✓${NC} testuser 用户不存在，符合预期"
fi

if grep -q "testgroup" /etc/group 2>/dev/null; then
    echo -e "${RED}✗${NC} testgroup 组仍然存在，应该被删除"
else
    echo -e "${GREEN}✓${NC} testgroup 组不存在，符合预期"
fi
echo ""

# 2. 检查进程管理
echo "检查进程管理命令..."
check_command "sleep.*&"
check_command "ps"
check_command "kill"
check_command "bg"
check_command "jobs"
check_command "fg"
echo ""

# 3. 检查系统监控
echo "检查系统监控命令..."
check_command "free"
check_command "top"
check_command "vmstat"
check_command "df -h"
echo ""

# 4. 检查系统服务
echo "检查系统服务命令..."
check_command "systemctl list-units\|service --status-all"
check_command "systemctl status\|service.*status.*ssh"
check_command "systemctl is-enabled\|chkconfig.*ssh"
echo ""

# 5. 检查系统日志
echo "检查系统日志命令..."
check_command "tail.*\/var\/log\/syslog\|tail.*\/var\/log\/messages"
check_command "dmesg"
check_command "journalctl"
echo ""

echo "======= 检查完成 ======="
echo -e "${YELLOW}注意:${NC} 命令历史检查仅供参考，如果你刚刚才执行命令，可能尚未写入历史文件。"
echo "本检查脚本只验证了常用命令的使用情况，请确保你已按指导手册完成了所有的操作步骤。"
echo "系统管理操作可能需要 root 权限，某些命令可能因权限不足而无法执行。" 