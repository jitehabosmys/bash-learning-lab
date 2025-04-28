#!/bin/bash
# 基础命令练习检查脚本

# 颜色定义
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "======= 检查基础命令练习 ======="
echo ""

# 检查是否存在test_dir目录
if [ -d "test_dir" ]; then
    echo -e "${GREEN}✓${NC} test_dir目录已创建"
else
    echo -e "${RED}✗${NC} test_dir目录不存在，请创建目录"
fi

# 检查命令历史中是否有关键命令
echo ""
echo "检查命令历史..."
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

# 检查关键命令
check_command "pwd"
check_command "ls"
check_command "mkdir"
check_command "cd"
check_command "history"

echo ""
echo "======= 检查完成 ======="
echo -e "${YELLOW}注意:${NC} 命令历史检查仅供参考，如果你刚刚才执行命令，可能尚未写入历史文件。"
echo "请确保你已完成全部练习任务。" 