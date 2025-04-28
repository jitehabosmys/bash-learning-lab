# 高级Bash编程

本章介绍Bash脚本的高级特性和技术，帮助用户编写更加强大、高效的脚本。

## 高级Bash语法

* 函数定义和使用
* 参数传递与返回值
* 局部变量和全局变量
* 递归函数

```bash
# 函数定义
function greet() {
    local name="$1"
    echo "Hello, $name!"
    return 0
}

# 函数调用
greet "World"
```

## 正则表达式

* 基本正则表达式（BRE）
* 扩展正则表达式（ERE）
* 在grep、sed和awk中使用正则表达式
* 使用正则表达式进行字符串验证

```bash
# 使用grep和正则表达式查找邮箱地址
grep -E '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}' file.txt

# 使用sed和正则表达式替换文本
sed -E 's/user_([0-9]+)/account_\1/g' users.txt
```

## Shell调试与优化

* 调试模式（-x选项）
* 跟踪脚本执行
* 错误处理技巧
* 性能优化方法

```bash
# 开启调试模式
set -x

# 跟踪特定代码块
{
    set -x
    # 要调试的代码
    set +x
}

# 错误处理
set -e  # 遇到错误立即退出
set -u  # 使用未定义变量时报错
```

## 进程管理

* 进程创建和控制
* 后台作业管理
* 信号处理
* 进程间通信

```bash
# 后台运行命令
long_running_command &

# 捕获信号
trap 'echo "Caught SIGINT, cleaning up..."; exit 1' INT

# 等待后台进程完成
wait $PID
```

## 并发与并行

* 并行执行命令
* 使用&和wait实现并行
* 管道和进程替换
* xargs实现并行

```bash
# 并行处理文件
find . -type f -name "*.txt" | xargs -P 4 -I {} grep "pattern" {}

# 使用进程替换
diff <(sort file1.txt) <(sort file2.txt)
```

## 高级IO操作

* 文件描述符操作
* 重定向技巧
* 命名管道（FIFO）
* 读取特殊文件

```bash
# 重定向标准输出和标准错误到同一文件
command > file.log 2>&1

# 使用自定义文件描述符
exec 3> output.log
echo "Logging to fd 3" >&3
exec 3>&-  # 关闭文件描述符
```

## 数据处理技术

* 高级文本处理
* CSV和JSON处理
* 数据提取和转换
* Web API交互

```bash
# 使用jq处理JSON数据
curl -s https://api.example.com/data | jq '.results[] | select(.active==true) | .name'

# 使用awk处理CSV
awk -F, '{sum+=$3} END {print "Total:", sum}' data.csv
```

## 脚本安全

* 安全编码实践
* 输入验证与清理
* 权限与特权控制
* 敏感数据处理

```bash
# 安全地处理用户输入
input=$(tr -dc '[:alnum:]' <<< "$user_input")

# 临时文件安全创建
temp_file=$(mktemp /tmp/script.XXXXXX)
trap 'rm -f $temp_file' EXIT
```

## 最佳实践

* 脚本结构组织
* 注释与文档
* 版本控制集成
* 测试与持续集成

```bash
# 脚本基本结构示例
#!/bin/bash
set -euo pipefail
# 脚本描述...

# 函数定义...

# 主逻辑...

# 清理操作...
``` 