# 模块五：Shell脚本

## 学习目标
- 掌握Shell脚本基础语法
- 学习条件、循环和函数
- 编写实用脚本自动化任务

## 核心内容

### 1. 脚本基础
- Shebang (`#!/bin/bash`)
  ```bash
  #!/bin/bash
  # 这是Bash脚本的标准开头，指定解释器
  ```

- 注释和脚本结构
  ```bash
  #!/bin/bash
  
  # 这是单行注释
  
  # 脚本结构示例
  # 1. 首先是脚本说明和版本信息
  # 脚本名称: example.sh
  # 版本: 1.0
  # 描述: 这是一个示例脚本
  
  # 2. 然后是变量定义
  
  # 3. 接着是函数定义
  
  # 4. 最后是主程序
  ```

- 变量定义和使用
  ```bash
  # 定义变量（注意=前后不能有空格）
  name="John Doe"
  age=30
  
  # 使用变量
  echo "Name: $name"
  echo "Age: $age"
  
  # 只读变量
  readonly PI=3.14159
  
  # 删除变量
  unset age
  
  # 变量作用域
  local local_var="only visible in function"  # 只能在函数内部使用
  ```

- 命令替换
  ```bash
  # 使用$()进行命令替换
  current_date=$(date)
  echo "Current date and time: $current_date"
  
  # 使用反引号(不推荐，但仍被使用)
  files_count=`ls | wc -l`
  echo "Files in current directory: $files_count"
  ```

- 执行权限和运行脚本
  ```bash
  # 赋予脚本执行权限
  chmod +x script.sh
  
  # 运行脚本方式
  ./script.sh  # 当前目录
  /path/to/script.sh  # 使用绝对路径
  bash script.sh  # 直接使用bash解释器
  ```

### 2. 流程控制
- 条件语句 (`if`, `elif`, `else`)
  ```bash
  # 基本if语句
  if [ $age -gt 18 ]; then
    echo "You are an adult."
  fi
  
  # if-else语句
  if [ $score -ge 60 ]; then
    echo "Pass"
  else
    echo "Fail"
  fi
  
  # if-elif-else语句
  if [ $score -ge 90 ]; then
    echo "A"
  elif [ $score -ge 80 ]; then
    echo "B"
  elif [ $score -ge 70 ]; then
    echo "C"
  elif [ $score -ge 60 ]; then
    echo "D"
  else
    echo "F"
  fi
  ```

- 测试命令 (`test` 或 `[ ]`)
  ```bash
  # 数值比较
  [ $a -eq $b ]  # 等于
  [ $a -ne $b ]  # 不等于
  [ $a -gt $b ]  # 大于
  [ $a -lt $b ]  # 小于
  [ $a -ge $b ]  # 大于等于
  [ $a -le $b ]  # 小于等于
  
  # 字符串比较
  [ "$str1" = "$str2" ]  # 等于
  [ "$str1" != "$str2" ]  # 不等于
  [ -z "$str" ]  # 字符串长度为0
  [ -n "$str" ]  # 字符串长度不为0
  
  # 文件测试
  [ -f "$file" ]  # 是否是普通文件
  [ -d "$dir" ]  # 是否是目录
  [ -r "$file" ]  # 是否可读
  [ -w "$file" ]  # 是否可写
  [ -x "$file" ]  # 是否可执行
  [ -e "$file" ]  # 是否存在
  
  # 逻辑运算
  [ $a -eq 1 -a $b -eq 2 ]  # 逻辑与
  [ $a -eq 1 -o $b -eq 2 ]  # 逻辑或
  [ ! $a -eq 1 ]  # 逻辑非
  ```

- 循环 (`for`, `while`, `until`)
  ```bash
  # for循环 - 列表迭代
  for name in John Jane Jim; do
    echo "Hello, $name!"
  done
  
  # for循环 - 数字范围
  for i in {1..5}; do
    echo "Count: $i"
  done
  
  # for循环 - C风格
  for ((i=1; i<=5; i++)); do
    echo "Count: $i"
  done
  
  # while循环 - 条件为真时执行
  counter=1
  while [ $counter -le 5 ]; do
    echo "While counter: $counter"
    ((counter++))
  done
  
  # until循环 - 条件为假时执行
  counter=1
  until [ $counter -gt 5 ]; do
    echo "Until counter: $counter"
    ((counter++))
  done
  ```

- `case` 语句
  ```bash
  # case语句
  echo "Enter a fruit name:"
  read fruit
  
  case $fruit in
    "apple")
      echo "Apple is red."
      ;;
    "banana")
      echo "Banana is yellow."
      ;;
    "orange")
      echo "Orange is orange."
      ;;
    *)
      echo "Unknown fruit."
      ;;
  esac
  ```

- `break` 和 `continue`
  ```bash
  # break - 退出循环
  for i in {1..10}; do
    if [ $i -eq 5 ]; then
      echo "Breaking at 5."
      break
    fi
    echo "Number: $i"
  done
  
  # continue - 跳过本次循环继续下一次
  for i in {1..5}; do
    if [ $i -eq 3 ]; then
      echo "Skipping 3."
      continue
    fi
    echo "Number: $i"
  done
  ```

### 3. 函数
- 函数定义和调用
  ```bash
  # 函数定义
  greet() {
    echo "Hello, $1!"
  }
  
  # 调用函数
  greet "World"
  
  # 另一种函数定义方式
  function say_goodbye() {
    echo "Goodbye, $1!"
  }
  
  say_goodbye "Friend"
  ```

- 参数传递
  ```bash
  # 函数参数
  calculate() {
    echo "First arg: $1"
    echo "Second arg: $2"
    echo "All args: $@"
    echo "Number of args: $#"
  }
  
  calculate 10 20 30
  ```

- 返回值
  ```bash
  # 使用return返回状态码（0-255）
  is_even() {
    if [ $(($1 % 2)) -eq 0 ]; then
      return 0  # 成功（真）
    else
      return 1  # 失败（假）
    fi
  }
  
  # 调用函数并检查返回值
  is_even 4
  if [ $? -eq 0 ]; then
    echo "Number is even"
  else
    echo "Number is odd"
  fi
  
  # 使用echo返回值（适合任何类型的返回值）
  get_sum() {
    echo $(($1 + $2))
  }
  
  # 捕获函数输出作为返回值
  sum=$(get_sum 10 20)
  echo "Sum: $sum"
  ```

- 局部变量和全局变量
  ```bash
  # 全局变量
  global_var="I'm global"
  
  # 函数中的局部变量
  demo_scope() {
    local local_var="I'm local"
    echo "Inside function: local_var = $local_var"
    echo "Inside function: global_var = $global_var"
  }
  
  demo_scope
  echo "Outside function: global_var = $global_var"
  echo "Outside function: local_var = $local_var"  # 这将为空，因为local_var是局部的
  ```

### 4. 输入和输出
- 命令行参数 (`$1`, `$2`, ...)
  ```bash
  #!/bin/bash
  # 文件名: args.sh
  
  echo "Script name: $0"
  echo "First argument: $1"
  echo "Second argument: $2"
  echo "All arguments: $@"
  echo "Number of arguments: $#"
  
  # 使用: ./args.sh hello world
  ```

- 读取用户输入 (`read`)
  ```bash
  # 基本读取
  echo "What is your name?"
  read name
  echo "Hello, $name!"
  
  # 设置提示符
  read -p "Enter your age: " age
  
  # 无回显（适合密码）
  read -sp "Enter password: " password
  echo
  
  # 读取多个值
  read -p "Enter first and last name: " first_name last_name
  echo "First name: $first_name, Last name: $last_name"
  
  # 设置超时
  read -t 5 -p "Quick! Enter something (5s): " input
  ```

- 标准输入/输出/错误
  ```bash
  # 重定向标准输出到文件
  echo "Hello" > output.txt
  
  # 重定向标准错误到文件
  ls /nonexistent 2> error.log
  
  # 同时重定向标准输出和标准错误
  command > output.txt 2> error.log
  command > all.log 2>&1  # 都重定向到同一文件
  
  # /dev/null 丢弃输出
  command > /dev/null 2>&1
  
  # 使用here document
  cat << EOF > config.txt
  This is a config file
  with multiple lines
  EOF
  ```

- 退出状态 (`$?`)
  ```bash
  # 检查上一个命令的退出状态
  ls /etc
  echo "Exit status: $?"  # 若成功则为0
  
  # 设置脚本的退出状态
  exit 0  # 成功
  exit 1  # 失败/错误
  ```

### 5. 高级特性
- 数组
  ```bash
  # 定义数组
  fruits=("apple" "banana" "orange")
  
  # 访问数组元素
  echo "First fruit: ${fruits[0]}"
  
  # 访问所有元素
  echo "All fruits: ${fruits[@]}"
  
  # 获取数组长度
  echo "Number of fruits: ${#fruits[@]}"
  
  # 添加元素
  fruits+=("grape")
  
  # 遍历数组
  for fruit in "${fruits[@]}"; do
    echo "Fruit: $fruit"
  done
  ```

- 字符串操作
  ```bash
  # 字符串长度
  str="Hello, World!"
  echo "Length: ${#str}"
  
  # 提取子字符串
  echo "Substring: ${str:7:5}"  # 从索引7开始，长度为5
  
  # 字符串替换
  echo "Replace first: ${str/o/O}"  # 替换第一个o
  echo "Replace all: ${str//o/O}"  # 替换所有o
  
  # 删除开头或结尾匹配
  echo "Remove prefix: ${str#Hello, }"  # 删除开头匹配
  echo "Remove suffix: ${str%World!}"  # 删除结尾匹配
  ```

- 算术运算
  ```bash
  # 基本算术
  a=5
  b=3
  
  echo "Addition: $((a + b))"
  echo "Subtraction: $((a - b))"
  echo "Multiplication: $((a * b))"
  echo "Division: $((a / b))"
  echo "Modulus: $((a % b))"
  echo "Exponentiation: $((a ** b))"
  
  # 自增自减
  echo "Increment: $((a++))"
  echo "After increment: $a"
  
  # let命令
  let "c = a * b"
  echo "c = $c"
  ```

- 正则表达式
  ```bash
  # 使用=~操作符进行正则匹配
  email="user@example.com"
  if [[ $email =~ [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,} ]]; then
    echo "Valid email format"
  else
    echo "Invalid email format"
  fi
  
  # 使用grep提取匹配
  phone="Contact me at 123-456-7890"
  if echo "$phone" | grep -E "[0-9]{3}-[0-9]{3}-[0-9]{4}" > /dev/null; then
    echo "Found phone number"
    number=$(echo "$phone" | grep -Eo "[0-9]{3}-[0-9]{3}-[0-9]{4}")
    echo "Number: $number"
  fi
  ```

- 信号处理
  ```bash
  # 捕获SIGINT信号（Ctrl+C）
  trap "echo 'Signal caught! Exiting...'; exit" SIGINT
  
  # 捕获不同的信号
  trap "echo 'Script is terminating...'" EXIT
  
  # 忽略某个信号
  trap "" SIGINT
  
  # 恢复默认行为
  trap - SIGINT
  
  # 示例：优雅退出
  cleanup() {
    echo "Cleaning up temporary files..."
    rm -f /tmp/tempfile_$$
  }
  
  trap cleanup EXIT
  
  # 创建临时文件
  echo "Creating temp file..."
  touch /tmp/tempfile_$$
  ```

- 调试技巧
  ```bash
  # 设置调试模式
  set -x  # 启用调试输出（显示执行的命令）
  command1
  command2
  set +x  # 禁用调试输出
  
  # 只检查语法，不执行
  bash -n script.sh
  
  # 执行并启用调试
  bash -x script.sh
  
  # 启用严格模式
  set -e  # 发生错误时立即退出
  set -u  # 使用未定义变量时报错
  set -o pipefail  # 管道中的命令失败时整个管道失败
  ```

## 练习
查看对应的练习目录 `exercises/05_shell/` 完成实践任务：

1. 编写基本脚本
2. 条件和循环脚本
3. 函数使用
4. 实用工具脚本

## 进阶资源
- [高级Bash脚本指南](https://tldp.org/LDP/abs/html/)
- Shell最佳实践

## 下一步
完成本模块后，继续学习模块六：网络工具
```bash
cd ../06_network
cat README.md
``` 