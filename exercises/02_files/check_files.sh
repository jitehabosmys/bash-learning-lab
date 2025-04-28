#!/bin/bash
# 文件操作练习检查脚本

# 颜色定义
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "======= 检查文件操作练习 ======="
echo ""

# 检查历史命令中的关键操作
echo "检查文件操作命令使用..."
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
check_command "touch"
check_command "echo.*>"
check_command "cat"
check_command "mkdir"
check_command "cp"
check_command "mv"
check_command "rm"

echo ""

# 检查是否有残留文件
echo "检查练习完成情况..."

# 检查文件是否存在
if [ -f "test_file.txt" ]; then
    echo -e "${RED}✗${NC} test_file.txt 文件仍然存在，应该被重命名"
else
    echo -e "${GREEN}✓${NC} test_file.txt 文件不存在，符合预期"
fi

if [ -f "renamed_file.txt" ]; then
    echo -e "${RED}✗${NC} renamed_file.txt 文件仍然存在，应该被删除"
else
    echo -e "${GREEN}✓${NC} renamed_file.txt 文件不存在，符合预期"
fi

if [ -d "backup" ]; then
    echo -e "${RED}✗${NC} backup 目录仍然存在，应该被删除"
else
    echo -e "${GREEN}✓${NC} backup 目录不存在，符合预期"
fi

echo ""
echo "======= 检查完成 ======="
echo -e "${YELLOW}注意:${NC} 命令历史检查仅供参考，如果你刚刚才执行命令，可能尚未写入历史文件。"
echo "本检查脚本只验证了最终状态，请确保你已按顺序完成了所有操作步骤。" 