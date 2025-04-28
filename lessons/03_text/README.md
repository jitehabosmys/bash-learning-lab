# 模块三：文本处理

## 学习目标
- 掌握文本查看和编辑命令
- 学习文本过滤和处理工具
- 理解正则表达式基础

## 核心内容

### 1. 文本编辑器
- `nano` - 简单的终端编辑器
  ```bash
  # 打开文件进行编辑
  nano file.txt
  
  # 保存文件: Ctrl+O，然后按Enter
  # 退出nano: Ctrl+X
  
  # 指定行号打开
  nano +10 file.txt
  ```

- `vim` - 高效的文本编辑器
  ```bash
  # 打开文件
  vim file.txt
  
  # vim基本操作模式
  # i - 插入模式
  # Esc - 返回命令模式
  # :w - 保存文件
  # :q - 退出
  # :wq - 保存并退出
  # :q! - 不保存强制退出
  
  # 常用命令
  # dd - 删除当前行
  # yy - 复制当前行
  # p - 粘贴
  # /word - 搜索"word"
  ```

- `emacs` - 功能强大的编辑器
  ```bash
  # 打开文件
  emacs file.txt
  
  # 基本快捷键
  # Ctrl+x Ctrl+s - 保存文件
  # Ctrl+x Ctrl+c - 退出emacs
  # Ctrl+k - 剪切当前行
  # Ctrl+y - 粘贴
  # Ctrl+s - 搜索
  ```

### 2. 文本处理命令
- `grep` - 文本搜索
  ```bash
  # 基本搜索
  grep "pattern" file.txt
  
  # 递归搜索目录
  grep -r "pattern" directory/
  
  # 显示行号
  grep -n "pattern" file.txt
  
  # 忽略大小写
  grep -i "pattern" file.txt
  
  # 显示匹配行的上下文
  grep -C 2 "pattern" file.txt  # 显示匹配行的前后2行
  
  # 使用正则表达式
  grep -E "[0-9]{3}-[0-9]{4}" contacts.txt  # 搜索电话号码模式
  ```

- `sed` - 流编辑器
  ```bash
  # 替换文本
  sed 's/old/new/' file.txt  # 替换每行第一次出现的"old"为"new"
  
  # 全局替换
  sed 's/old/new/g' file.txt  # 替换所有出现的"old"为"new"
  
  # 删除行
  sed '5d' file.txt  # 删除第5行
  sed '/pattern/d' file.txt  # 删除包含"pattern"的行
  
  # 添加内容
  sed '2i\New line' file.txt  # 在第2行前插入"New line"
  sed '2a\New line' file.txt  # 在第2行后追加"New line"
  
  # 直接修改文件（小心使用！）
  sed -i 's/old/new/g' file.txt
  ```

- `awk` - 文本处理语言
  ```bash
  # 打印指定列
  awk '{print $1}' file.txt  # 打印第一列
  awk '{print $1, $3}' file.txt  # 打印第一列和第三列
  
  # 使用自定义分隔符
  awk -F":" '{print $1}' /etc/passwd  # 以冒号为分隔符打印第一列
  
  # 条件过滤
  awk '$3 > 100 {print $1, $3}' data.txt  # 打印第三列大于100的行的第一列和第三列
  
  # 计算总和
  awk '{sum += $1} END {print sum}' numbers.txt
  
  # 自定义输出格式
  awk '{printf "Name: %s, Age: %d\n", $1, $2}' people.txt
  ```

- `sort` - 排序文本
  ```bash
  # 基本排序
  sort file.txt
  
  # 数字排序
  sort -n numbers.txt
  
  # 反向排序
  sort -r file.txt
  
  # 按指定列排序
  sort -k2 data.txt  # 按第二列排序
  
  # 去重并排序
  sort -u file.txt
  ```

- `uniq` - 删除重复行
  ```bash
  # 删除相邻的重复行
  uniq file.txt
  
  # 仅显示重复行
  uniq -d file.txt
  
  # 统计重复次数
  uniq -c file.txt
  
  # 通常与sort结合使用
  sort file.txt | uniq
  sort file.txt | uniq -c  # 统计每行出现的次数
  ```

- `wc` - 统计行数、字数和字符数
  ```bash
  # 完整统计
  wc file.txt  # 输出行数、字数和字节数
  
  # 只统计行数
  wc -l file.txt
  
  # 只统计字数
  wc -w file.txt
  
  # 只统计字符数
  wc -c file.txt
  ```

- `cut` - 提取文件列
  ```bash
  # 按字符位置提取
  cut -c1-5 file.txt  # 提取每行的前5个字符
  
  # 按分隔符提取字段
  cut -d"," -f1,3 data.csv  # 从CSV文件中提取第1和第3字段
  
  # 提取多列
  cut -d":" -f1,3-5 /etc/passwd  # 提取冒号分隔的第1字段和第3-5字段
  ```

- `paste` - 合并文件列
  ```bash
  # 合并两个文件的对应行
  paste file1.txt file2.txt
  
  # 指定分隔符
  paste -d"," file1.txt file2.txt  # 使用逗号作为分隔符
  
  # 串行合并
  paste -s file.txt  # 将文件中的所有行合并成一行
  ```

### 3. 重定向和管道
- 输入/输出重定向 (`>`, `>>`, `<`)
  ```bash
  # 将命令输出写入文件（覆盖）
  ls > file_list.txt
  
  # 将命令输出追加到文件
  echo "New line" >> notes.txt
  
  # 从文件读取输入
  sort < unsorted.txt
  
  # 同时重定向标准输出和标准错误
  ls /nonexistent 2> errors.log
  command > output.txt 2> errors.txt
  
  # 将错误也重定向到标准输出
  command > all.log 2>&1
  ```

- 管道 (`|`) 连接命令
  ```bash
  # 基本管道
  ls -l | grep "Dec"  # 列出12月修改的文件
  
  # 多级管道
  cat log.txt | grep "ERROR" | sort | uniq -c
  
  # 通过wc计数
  cat file.txt | grep "pattern" | wc -l  # 计算包含pattern的行数
  
  # 查找最大的文件
  du -h /var | sort -hr | head -5  # 列出/var中最大的5个目录
  ```

- 命令替换 (`` ` `` 或 `$()`)
  ```bash
  # 将命令输出作为参数
  echo "Today is $(date)"
  
  # 或使用反引号
  echo "Today is `date`"
  
  # 在脚本中使用
  files_count=$(ls | wc -l)
  echo "There are $files_count files in this directory"
  
  # 嵌套使用
  echo "The largest file is $(du -h $(find . -type f -exec du -h {} \; | sort -hr | head -1 | cut -f2))"
  ```

### 4. 正则表达式
- 基本正则表达式(BRE)
  ```bash
  # 匹配任意字符
  grep "a.c" file.txt  # 匹配a和c之间有一个字符，如abc, a1c
  
  # 开头和结尾
  grep "^start" file.txt  # 匹配以start开头的行
  grep "end$" file.txt  # 匹配以end结尾的行
  
  # 字符类
  grep "[aeiou]" file.txt  # 匹配包含任何元音字母的行
  grep "[0-9]" file.txt  # 匹配包含数字的行
  
  # 重复
  grep "x*y" file.txt  # 匹配x重复零次或多次后跟y，如y, xy, xxy
  ```

- 扩展正则表达式(ERE)
  ```bash
  # 使用grep -E或egrep启用ERE
  grep -E "one|two" file.txt  # 匹配包含one或two的行
  
  # 分组
  grep -E "(abc){2}" file.txt  # 匹配abcabc
  
  # 一次或多次重复
  grep -E "a+" file.txt  # 匹配a重复一次或多次
  
  # 零次或一次重复
  grep -E "colou?r" file.txt  # 匹配color或colour
  ```

- 在grep和sed中使用正则表达式
  ```bash
  # grep使用ERE搜索邮箱
  grep -E "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" file.txt
  
  # sed使用正则替换
  sed -E 's/[0-9]+/NUMBER/g' file.txt  # 将所有数字替换为NUMBER
  
  # 提取IP地址
  grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" log.txt
  ```

## 练习
查看对应的练习目录 `exercises/03_text/` 完成实践任务：

1. 使用基本文本编辑命令
2. 文本过滤和处理
3. 管道和重定向操作
4. 使用grep搜索文本

## 进阶资源
- [正则表达式教程](https://www.regular-expressions.info/)
- [Sed & Awk快速参考](https://www.gnu.org/software/sed/manual/sed.html)

## 下一步
完成本模块后，继续学习模块四：系统管理
```bash
cd ../04_system
cat README.md
``` 