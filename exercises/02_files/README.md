# 文件操作练习

## 练习任务
请完成以下文件操作任务：

1. 创建一个名为 `test_file.txt` 的文件，包含文本 "Hello, Bash!"
2. 显示该文件的内容
3. 向该文件追加一行文本 "Learning file operations"
4. 再次显示文件内容，确认文本已追加
5. 创建一个名为 `backup` 的目录
6. 将 `test_file.txt` 复制到 `backup` 目录，并命名为 `test_file_backup.txt`
7. 将原始的 `test_file.txt` 重命名为 `renamed_file.txt`
8. 删除 `backup` 目录及其内容
9. 删除 `renamed_file.txt`

## 预期输出示例
```
Hello, Bash!
Hello, Bash!
Learning file operations
```

## 提示
使用以下命令完成练习：
- `touch` - 创建空文件
- `echo` 与重定向符 `>` 或 `>>` - 创建或追加内容到文件
- `cat` - 显示文件内容
- `mkdir` - 创建目录
- `cp` - 复制文件
- `mv` - 移动或重命名文件
- `rm` - 删除文件或目录 (使用 `-r` 选项删除目录)

## 验证
完成后运行 `./check_files.sh` 检查你的结果 