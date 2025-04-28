#!/bin/bash
# 高级Bash编程练习检查脚本

# 颜色定义
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "======= 检查高级Bash编程练习 ======="
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

# 1. 检查 math_func.sh
echo "检查数学函数脚本..."
check_file_exists "math_func.sh"
if [ $? -eq 0 ]; then
    check_executable "math_func.sh"
    check_file_contains "math_func.sh" "function add"
    check_file_contains "math_func.sh" "function subtract"
    check_file_contains "math_func.sh" "function multiply"
    check_file_contains "math_func.sh" "function divide"
    
    # 测试脚本功能
    echo "测试脚本功能..."
    if [ -x "math_func.sh" ]; then
        result=$(./math_func.sh add 5 3 2>&1)
        if [[ "$result" == *"8"* ]]; then
            echo -e "${GREEN}✓${NC} add 函数工作正常"
        else
            echo -e "${RED}✗${NC} add 函数未返回正确结果"
        fi
        
        result=$(./math_func.sh divide 10 2 2>&1)
        if [[ "$result" == *"5"* ]]; then
            echo -e "${GREEN}✓${NC} divide 函数工作正常"
        else
            echo -e "${RED}✗${NC} divide 函数未返回正确结果"
        fi
    fi
fi
echo ""

# 2. 检查 regex_validator.sh
echo "检查正则表达式验证脚本..."
check_file_exists "regex_validator.sh"
if [ $? -eq 0 ]; then
    check_executable "regex_validator.sh"
    check_file_contains "regex_validator.sh" "email"
    check_file_contains "regex_validator.sh" "ip"
    check_file_contains "regex_validator.sh" "phone"
    check_file_contains "regex_validator.sh" "date"
    
    # 测试脚本功能
    echo "测试脚本功能..."
    if [ -x "regex_validator.sh" ]; then
        result=$(./regex_validator.sh email "test@example.com" 2>&1)
        if [[ "$result" == *"有效"* ]]; then
            echo -e "${GREEN}✓${NC} 电子邮件验证工作正常"
        else
            echo -e "${RED}✗${NC} 电子邮件验证未返回正确结果"
        fi
        
        result=$(./regex_validator.sh ip "192.168.1.1" 2>&1)
        if [[ "$result" == *"有效"* ]]; then
            echo -e "${GREEN}✓${NC} IP地址验证工作正常"
        else
            echo -e "${RED}✗${NC} IP地址验证未返回正确结果"
        fi
    fi
fi
echo ""

# 3. 检查 robust_script.sh
echo "检查健壮脚本..."
check_file_exists "robust_script.sh"
if [ $? -eq 0 ]; then
    check_executable "robust_script.sh"
    check_file_contains "robust_script.sh" "trap"
    check_file_contains "robust_script.sh" "set -e"
    check_file_contains "robust_script.sh" "--debug"
    
    # 测试调试模式
    echo "测试调试模式..."
    if [ -x "robust_script.sh" ]; then
        result=$(./robust_script.sh --debug 2>&1)
        if [[ "$result" == *"调试"* ]] || [[ "$result" == *"debug"* ]]; then
            echo -e "${GREEN}✓${NC} 调试模式工作正常"
        else
            echo -e "${RED}✗${NC} 调试模式未正确激活"
        fi
    fi
fi
echo ""

# 4. 检查 parallel_processor.sh
echo "检查并行处理脚本..."
check_file_exists "parallel_processor.sh"
if [ $? -eq 0 ]; then
    check_executable "parallel_processor.sh"
    check_file_contains "parallel_processor.sh" "&"
    check_file_contains "parallel_processor.sh" "wait"
    
    # 创建临时测试目录和文件
    echo "创建测试文件..."
    mkdir -p test_dir
    echo "This is a test file 1" > test_dir/file1.txt
    echo "This is a test file 2" > test_dir/file2.txt
    
    # 测试脚本功能
    echo "测试脚本功能..."
    if [ -x "parallel_processor.sh" ]; then
        result=$(./parallel_processor.sh test_dir 2>&1)
        if [[ "$result" == *"总计"* ]] || [[ "$result" == *"total"* ]]; then
            echo -e "${GREEN}✓${NC} 并行处理工作正常"
        else
            echo -e "${RED}✗${NC} 并行处理未返回汇总结果"
        fi
    fi
    
    # 清理测试文件
    rm -rf test_dir
fi
echo ""

# 5. 检查 advanced_io.sh
echo "检查高级IO脚本..."
check_file_exists "advanced_io.sh"
if [ $? -eq 0 ]; then
    check_executable "advanced_io.sh"
    check_file_contains "advanced_io.sh" "exec"
    check_file_contains "advanced_io.sh" "2>&1"
    check_file_contains "advanced_io.sh" "<("
    check_file_contains "advanced_io.sh" "mkfifo"
    
    # 测试脚本功能
    echo "测试脚本功能..."
    if [ -x "advanced_io.sh" ]; then
        if ./advanced_io.sh &>/dev/null; then
            echo -e "${GREEN}✓${NC} 高级IO脚本执行成功"
        else
            echo -e "${RED}✗${NC} 高级IO脚本执行失败"
        fi
    fi
fi
echo ""

echo "======= 检查完成 ======="
echo -e "${YELLOW}注意:${NC} 这只是基本检查，请确保脚本不仅存在而且功能正常！"
echo "如果有失败项，请检查任务要求并修复问题。" 