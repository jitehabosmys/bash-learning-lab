# 文本处理练习

## 练习任务
请完成以下文本处理任务：

1. 创建一个名为 `sample.txt` 的文件，包含以下内容：
   ```
   The quick brown fox jumps over the lazy dog.
   Linux is an open-source operating system.
   Bash scripting is a powerful skill for automation.
   The fox is quick and brown.
   Python, Java, and C++ are popular programming languages.
   ```

2. 使用 `grep` 命令：
   - 从 `sample.txt` 中查找包含 "fox" 的所有行
   - 从 `sample.txt` 中查找以 "The" 开头的所有行
   - 计算 `sample.txt` 中单词 "is" 出现的次数

3. 使用 `sed` 命令：
   - 将 `sample.txt` 中所有 "fox" 替换为 "cat"
   - 删除 `sample.txt` 中包含 "Python" 的行
   - 在 `sample.txt` 的每行结尾添加 "EOL"

4. 使用 `awk` 命令：
   - 打印 `sample.txt` 的第三行
   - 打印 `sample.txt` 中每行的第一个和最后一个单词
   - 统计 `sample.txt` 每行的单词数并显示

5. 使用 `sort` 和 `uniq` 命令：
   - 创建一个名为 `numbers.txt` 的文件，包含一些重复的数字
   - 对 `numbers.txt` 进行排序
   - 统计 `numbers.txt` 中每个数字出现的次数

## 提示
- 使用 `>` 重定向符创建文件
- 使用 `-i` 选项使 `sed` 直接修改文件
- 使用管道符 `|` 组合多个命令
- 使用 `wc -l` 计数行数

## 验证
完成后运行 `./check_text.sh` 检查你的结果

## 练习答案
```bash
# 1. 创建sample.txt文件
cat > sample.txt << 'EOF'
The quick brown fox jumps over the lazy dog.
Linux is an open-source operating system.
Bash scripting is a powerful skill for automation.
The fox is quick and brown.
Python, Java, and C++ are popular programming languages.
EOF

# 2. 使用grep命令
# 查找包含"fox"的所有行
grep "fox" sample.txt
# 查找以"The"开头的所有行
grep "^The" sample.txt
# 计算"is"出现的次数
grep -o "is" sample.txt | wc -l

# 3. 使用sed命令
# 将所有"fox"替换为"cat"
sed 's/fox/cat/g' sample.txt
# 删除包含"Python"的行
sed '/Python/d' sample.txt
# 在每行结尾添加"EOL"
sed 's/$/& EOL/' sample.txt

# 4. 使用awk命令
# 打印第三行
awk 'NR==3 {print}' sample.txt
# 打印每行的第一个和最后一个单词
awk '{print $1, $NF}' sample.txt
# 统计每行的单词数
awk '{print NF}' sample.txt

# 5. 使用sort和uniq命令
# 创建numbers.txt文件
cat > numbers.txt << 'EOF'
5
2
7
5
8
2
9
5
EOF
# 对numbers.txt进行排序
sort numbers.txt
# 统计每个数字出现的次数
sort numbers.txt | uniq -c
``` 