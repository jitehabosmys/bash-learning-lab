# 基础命令练习

## 练习任务
请完成以下任务：

1. 显示当前目录
2. 列出当前目录内容
3. 创建一个名为'test_dir'的目录
4. 进入该目录
5. 显示当前目录（确认已经在test_dir中）
6. 返回上一级目录
7. 查看命令历史

## 预期输出示例
```
/path/to/your/directory
[目录内容列表]
已创建目录
/path/to/your/directory/test_dir
/path/to/your/directory
[命令历史列表]
```

## 提示
使用 `pwd`, `ls`, `mkdir`, `cd`, `history` 命令

## 验证
完成后运行 `./check_basics.sh` 检查你的结果

## 练习答案
```bash
pwd
ls
mkdir test_dir
cd test_dir
pwd
cd ..
history
``` 