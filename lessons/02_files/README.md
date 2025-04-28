# 模块二：文件操作

## 学习目标
- 掌握文件和目录的基本操作
- 学习文件权限管理
- 理解Linux文件系统结构

## 核心内容

### 1. 文件和目录操作
- `mkdir` - 创建目录
  ```bash
  # 创建单个目录
  mkdir documents
  
  # 创建多个目录
  mkdir projects backup data
  
  # 创建嵌套目录
  mkdir -p projects/web/css
  ```

- `touch` - 创建空文件
  ```bash
  # 创建空文件
  touch file.txt
  
  # 创建多个文件
  touch index.html style.css script.js
  
  # 更新文件的访问和修改时间
  touch -a existing_file.txt  # 只更新访问时间
  touch -m existing_file.txt  # 只更新修改时间
  ```

- `cp` - 复制文件或目录
  ```bash
  # 复制文件
  cp source.txt destination.txt
  
  # 复制文件到目录
  cp file.txt documents/
  
  # 复制目录及其内容
  cp -r folder1 folder2
  
  # 保留文件属性和权限
  cp -p original.txt copy.txt
  ```

- `mv` - 移动或重命名文件
  ```bash
  # 重命名文件
  mv oldname.txt newname.txt
  
  # 移动文件到目录
  mv file.txt documents/
  
  # 移动并重命名
  mv source.txt documents/destination.txt
  
  # 移动整个目录
  mv folder1 folder2
  ```

- `rm` - 删除文件或目录
  ```bash
  # 删除文件
  rm file.txt
  
  # 删除多个文件
  rm file1.txt file2.txt
  
  # 删除目录及其内容
  rm -r directory/
  
  # 强制删除（谨慎使用）
  rm -f important_file.txt
  rm -rf directory/  # 强制递归删除
  ```

- `find` - 搜索文件
  ```bash
  # 在当前目录及子目录中查找文件
  find . -name "*.txt"
  
  # 查找修改时间小于7天的文件
  find /home -mtime -7
  
  # 查找大于1MB的文件
  find . -size +1M
  
  # 查找并执行操作
  find . -name "*.tmp" -exec rm {} \;
  ```

### 2. 文件查看
- `cat` - 查看文件内容
  ```bash
  # 显示文件内容
  cat file.txt
  
  # 显示多个文件内容
  cat file1.txt file2.txt
  
  # 显示行号
  cat -n file.txt
  
  # 创建文件并写入内容
  cat > newfile.txt << EOF
  这是第一行
  这是第二行
  EOF
  ```

- `less` / `more` - 分页查看文件
  ```bash
  # 分页查看
  less large_file.log
  
  # 在less中搜索内容（输入/后跟搜索词）
  # /error
  
  # more命令（较简单的分页）
  more large_file.log
  ```

- `head` / `tail` - 查看文件开头/结尾
  ```bash
  # 查看文件的前10行
  head file.txt
  
  # 查看指定行数
  head -n 5 file.txt
  
  # 查看文件末尾10行
  tail file.txt
  
  # 持续查看文件更新（实时日志监控）
  tail -f server.log
  ```

- `file` - 确定文件类型
  ```bash
  # 检查文件类型
  file document.pdf
  # 输出: document.pdf: PDF document, version 1.5
  
  # 检查多个文件
  file script.js image.png
  ```

### 3. 文件权限
- 权限概念: 读(r)、写(w)、执行(x)
  ```bash
  # 查看文件权限
  ls -l file.txt
  # 输出: -rw-r--r-- 1 user group 123 Mar 15 14:30 file.txt
  # 表示: 所有者(rw-)、组(r--)、其他用户(r--)
  ```

- `chmod` - 更改文件权限
  ```bash
  # 使用数字模式设置权限
  chmod 755 script.sh  # rwxr-xr-x
  
  # 使用符号模式
  chmod u+x script.sh  # 给所有者添加执行权限
  chmod g+w file.txt   # 给组添加写权限
  chmod o-r file.txt   # 移除其他用户的读权限
  chmod a+r file.txt   # 给所有人添加读权限
  
  # 递归更改目录及所有内容的权限
  chmod -R 644 documents/
  ```

- `chown` - 更改文件所有者
  ```bash
  # 更改文件所有者
  chown user1 file.txt
  
  # 同时更改所有者和组
  chown user1:group1 file.txt
  
  # 递归更改目录及内容
  chown -R user1:group1 directory/
  ```

- `chgrp` - 更改文件组
  ```bash
  # 更改文件的组
  chgrp developers file.txt
  
  # 递归更改组
  chgrp -R developers project/
  ```

### 4. 文件系统
- Linux文件系统层次结构
  ```bash
  # 查看主要目录
  ls /
  # 主要目录包括: /bin, /etc, /home, /var, /usr, /tmp 等
  ```

- `df` - 查看磁盘空间
  ```bash
  # 查看磁盘使用情况
  df
  
  # 以人类可读格式显示
  df -h
  # 输出:
  # Filesystem      Size  Used Avail Use% Mounted on
  # /dev/sda1        20G   8G   12G  40% /
  ```

- `du` - 查看目录大小
  ```bash
  # 查看目录大小
  du /home
  
  # 以人类可读格式显示
  du -h /var/log
  
  # 仅显示总计
  du -sh /home/user
  # 输出: 1.2G /home/user
  ```

## 练习
查看对应的练习目录 `exercises/02_files/` 完成实践任务：

1. 创建、复制、移动和删除文件
2. 修改文件权限
3. 搜索指定文件

## 进阶资源
- Linux文件系统标准(FHS)
- 符号链接和硬链接

## 下一步
完成本模块后，继续学习模块三：文本处理
```bash
cd ../03_text
cat README.md
``` 