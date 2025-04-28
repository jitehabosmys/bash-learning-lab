#!/bin/bash
# 文本处理练习检查脚本

# 颜色定义
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "======= 检查文本处理练习 ======="
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

# 检查sample.txt文件
echo "检查sample.txt文件..."
check_file_exists "sample.txt"
if [ $? -eq 0 ]; then
    # 检查文件内容
    check_file_contains "sample.txt" "The.*cat" # 替换后的内容
    check_file_contains "sample.txt" "EOL" # 行尾添加的标记
    
    # 检查是否删除了包含Python的行
    if grep -q "Python" "sample.txt"; then
        echo -e "${RED}✗${NC} 包含Python的行未被删除"
    else
        echo -e "${GREEN}✓${NC} 成功删除了包含Python的行"
    fi
fi
echo ""

# 检查numbers.txt文件
echo "检查numbers.txt文件..."
check_file_exists "numbers.txt"
echo ""

# 检查历史命令中的关键工具使用
echo "检查文本处理工具使用..."
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
check_command "grep"
check_command "sed"
check_command "awk"
check_command "sort"
check_command "uniq"

echo ""
echo "======= 检查完成 ======="
echo -e "${YELLOW}注意:${NC} 命令历史检查仅供参考，如果你刚刚才执行命令，可能尚未写入历史文件。"
echo "请确保你已完成了所有练习任务，包括创建、修改文件和使用各种文本处理工具。" 