# 模块一：基础入门

## 学习目标
- 了解终端和Shell的概念
- 学习基本命令行操作
- 掌握命令行导航和帮助系统

## 核心内容

### 1. 基本概念
- 什么是终端(Terminal)
- 什么是Shell及Bash
- 命令行界面(CLI)与图形界面(GUI)的区别

### 2. 基础命令
- `pwd` - 显示当前工作目录
  ```bash
  # 示例：显示当前所在目录的完整路径
  pwd
  # 输出: /home/user/documents
  ```

- `ls` - 列出目录内容
  ```bash
  # 基本用法：列出当前目录的文件和文件夹
  ls
  
  # 显示详细信息
  ls -l
  # 输出:
  # -rw-r--r-- 1 user group 2048 Mar 15 14:30 file.txt
  
  # 显示隐藏文件
  ls -a
  
  # 结合多个选项
  ls -la
  ```

- `cd` - 切换目录
  ```bash
  # 进入指定目录
  cd Documents
  
  # 返回上一级目录
  cd ..
  
  # 返回用户主目录
  cd ~
  
  # 返回上一个工作目录
  cd -
  ```

- `clear` - 清屏
  ```bash
  clear
  # 或使用快捷键 Ctrl+L
  ```

- `history` - 查看命令历史
  ```bash
  # 显示最近使用的命令
  history
  
  # 显示最近的10条命令
  history 10
  
  # 执行历史记录中的特定命令（如第5条）
  !5
  
  # 执行最近使用的以'ls'开头的命令
  !ls
  ```

- `echo` - 输出文本
  ```bash
  # 输出简单文本
  echo "Hello, World!"
  
  # 显示环境变量值
  echo $HOME
  
  # 与重定向结合使用
  echo "This is a test" > test.txt
  ```

### 3. 获取帮助
- `man` - 查看命令手册
  ```bash
  # 查看ls命令的手册
  man ls
  
  # 在man页面中搜索，输入/followed后跟要搜索的内容
  # 例如在ls手册中搜索"sort"
  /sort
  ```

- `--help` 选项
  ```bash
  # 查看命令的简短帮助
  ls --help
  ```

- `info` - 获取详细信息
  ```bash
  # 获取ls命令的详细信息
  info ls
  ```

- Tab键自动补全
  ```bash
  # 输入部分命令或文件名，然后按Tab键自动补全
  # 例如：
  cd Doc[按Tab键] -> cd Documents/
  ```

## 练习
查看对应的练习目录 `exercises/01_basics/` 完成实践任务：

1. 使用导航命令
2. 尝试不同的ls选项
3. 查看命令手册

## 进阶资源
- [Bash官方文档](https://www.gnu.org/software/bash/manual/)
- Linux命令速查表

## 下一步
完成本模块后，继续学习模块二：文件操作
```bash
cd ../02_files
cat README.md
``` 