#!/bin/bash
# 网络操作练习检查脚本

# 颜色定义
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "======= 检查网络操作练习 ======="
echo ""

# 检查文件是否存在
check_file_exists() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} 文件 $1 存在"
        return 0
    else
        echo -e "${RED}✗${NC} 文件 $1 不存在"
        return 1
    fi
}

# 检查文件是否为可执行文件
check_executable() {
    if [ -x "$1" ]; then
        echo -e "${GREEN}✓${NC} 文件 $1 具有可执行权限"
        return 0
    else
        echo -e "${RED}✗${NC} 文件 $1 没有可执行权限"
        return 1
    fi
}

# 检查文件内容是否包含特定字符串
check_file_contains() {
    if grep -q "$2" "$1"; then
        echo -e "${GREEN}✓${NC} 文件 $1 包含 '$2'"
        return 0
    else
        echo -e "${RED}✗${NC} 文件 $1 不包含 '$2'"
        return 1
    fi
}

# 检查历史命令
check_history() {
    HISTORY_FILE=~/.bash_history
    if grep -q "$1" "$HISTORY_FILE"; then
        echo -e "${GREEN}✓${NC} 历史命令中包含 '$1'"
        return 0
    else
        echo -e "${YELLOW}!${NC} 历史命令中未找到 '$1'"
        return 1
    fi
}

# 1. 检查网络连通性测试
echo "检查网络连通性测试..."
check_history "ping.*baidu.*-c"
check_history "traceroute"
echo ""

# 2. 检查网络接口信息
echo "检查网络接口信息..."
check_file_exists "network_info.txt"
if [ $? -eq 0 ]; then
    # 检查文件内容
    check_file_contains "network_info.txt" "eth0\|ens\|enp\|wlan0\|wlp\|lo"
    check_file_contains "network_info.txt" "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}"
fi
echo ""

# 3. 检查DNS查询
echo "检查DNS查询..."
check_history "host\|dig.*github\.com"
check_history "nslookup.*baidu\.com.*MX"
echo ""

# 4. 检查SSH连接脚本
echo "检查SSH连接脚本..."
check_file_exists "ssh_connect.sh"
if [ $? -eq 0 ]; then
    check_executable "ssh_connect.sh"
    check_file_contains "ssh_connect.sh" "username"
    check_file_contains "ssh_connect.sh" "hostname"
    
    # 测试脚本功能
    echo "测试脚本功能..."
    if [ -x "ssh_connect.sh" ]; then
        result=$(./ssh_connect.sh test_user test_host 2>&1)
        if [[ "$result" == *"test_user"* ]] && [[ "$result" == *"test_host"* ]]; then
            echo -e "${GREEN}✓${NC} ssh_connect.sh 能正确处理参数"
        else
            echo -e "${RED}✗${NC} ssh_connect.sh 未能正确处理参数"
        fi
    fi
fi
echo ""

# 5. 检查文件传输脚本
echo "检查文件传输脚本..."
check_file_exists "file_transfer.sh"
if [ $? -eq 0 ]; then
    check_executable "file_transfer.sh"
    check_file_contains "file_transfer.sh" "%"
    
    # 测试脚本功能
    echo "测试脚本功能..."
    if [ -x "file_transfer.sh" ]; then
        result=$(./file_transfer.sh test_file test_remote 2>&1)
        if [[ "$result" == *"%"* ]]; then
            echo -e "${GREEN}✓${NC} file_transfer.sh 显示了进度百分比"
        else
            echo -e "${RED}✗${NC} file_transfer.sh 未显示进度百分比"
        fi
    fi
fi
echo ""

# 6. 检查网络监控脚本
echo "检查网络监控脚本..."
check_file_exists "monitor_network.sh"
if [ $? -eq 0 ]; then
    check_executable "monitor_network.sh"
    check_file_contains "monitor_network.sh" "baidu"
    check_file_contains "monitor_network.sh" "google"
    
    # 检查日志文件
    check_file_exists "network_status.log"
fi
echo ""

echo "======= 检查完成 ======="
echo -e "${YELLOW}注意:${NC} 这只是基本检查，请确保脚本不仅存在而且功能正常！"
echo "如果有失败项，请检查任务要求并修复问题。" 