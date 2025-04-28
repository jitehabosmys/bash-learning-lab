#!/bin/bash
# Shell脚本编程练习检查脚本

# 颜色定义
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "======= 检查Shell脚本编程练习 ======="
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

# 1. 检查 greeting.sh
echo "检查问候脚本..."
check_file_exists "greeting.sh"
if [ $? -eq 0 ]; then
    check_executable "greeting.sh"
    check_file_contains "greeting.sh" "早上好"
    check_file_contains "greeting.sh" "下午好"
    check_file_contains "greeting.sh" "晚上好"
    check_file_contains "greeting.sh" "date"
    check_file_contains "greeting.sh" "uname"
    
    # 测试脚本功能
    echo "测试脚本功能..."
    if [ -x "greeting.sh" ]; then
        result=$(./greeting.sh "测试用户" 2>&1)
        if [[ "$result" == *"测试用户"* ]]; then
            echo -e "${GREEN}✓${NC} greeting.sh 能正确处理命令行参数"
        else
            echo -e "${RED}✗${NC} greeting.sh 未能正确处理命令行参数"
        fi
    fi
fi
echo ""

# 2. 检查 calculator.sh
echo "检查计算器脚本..."
check_file_exists "calculator.sh"
if [ $? -eq 0 ]; then
    check_executable "calculator.sh"
    check_file_contains "calculator.sh" "+"
    check_file_contains "calculator.sh" "-"
    check_file_contains "calculator.sh" "*"
    check_file_contains "calculator.sh" "/"
    
    # 测试脚本功能
    echo "测试脚本功能..."
    if [ -x "calculator.sh" ]; then
        result=$(./calculator.sh 5 + 3 2>&1)
        if [[ "$result" == *"8"* ]]; then
            echo -e "${GREEN}✓${NC} calculator.sh 能正确执行加法"
        else
            echo -e "${RED}✗${NC} calculator.sh 未能正确执行加法"
        fi
        
        result=$(./calculator.sh 10 / 0 2>&1)
        if [[ "$result" == *"错误"* ]] || [[ "$result" == *"除数不能为零"* ]]; then
            echo -e "${GREEN}✓${NC} calculator.sh 能正确处理除零错误"
        else
            echo -e "${RED}✗${NC} calculator.sh 未能正确处理除零错误"
        fi
    fi
fi
echo ""

# 3. 检查 file_analyzer.sh
echo "检查文件分析脚本..."
check_file_exists "file_analyzer.sh"
if [ $? -eq 0 ]; then
    check_executable "file_analyzer.sh"
    check_file_contains "file_analyzer.sh" "find"
    check_file_contains "file_analyzer.sh" "sort"
    
    # 测试脚本功能
    echo "测试脚本功能..."
    if [ -x "file_analyzer.sh" ]; then
        # 创建临时测试目录
        mkdir -p test_analysis
        touch test_analysis/file1.txt
        touch test_analysis/file2.py
        mkdir -p test_analysis/subdir
        
        result=$(./file_analyzer.sh test_analysis 2>&1)
        if [[ "$result" == *"文件"* ]] && [[ "$result" == *"目录"* ]]; then
            echo -e "${GREEN}✓${NC} file_analyzer.sh 能正确分析目录"
        else
            echo -e "${RED}✗${NC} file_analyzer.sh 未能正确分析目录"
        fi
        
        # 清理测试目录
        rm -rf test_analysis
    fi
fi
echo ""

echo "======= 检查完成 ======="
echo -e "${YELLOW}注意:${NC} 这只是基本检查，请确保脚本不仅存在而且功能正常！"
echo "如果有失败项，请检查任务要求并修复问题。" 