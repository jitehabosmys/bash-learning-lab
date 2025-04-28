# 网络操作练习

## 练习任务
请完成以下任务：

1. 网络连通性测试
   - 使用ping命令测试与百度(baidu.com)的连通性，只发送5个数据包
   - 使用traceroute命令跟踪到百度的网络路径

2. 网络接口信息
   - 使用ip命令显示所有网络接口信息
   - 找出系统的主网络接口名称和IP地址，并将其保存到network_info.txt文件中

3. 网络连接状态
   - 使用ss命令列出所有监听的TCP端口
   - 找出当前系统上运行的HTTP服务(端口80)，若无则写'无HTTP服务运行'

4. DNS查询
   - 使用host或dig命令查询github.com的IP地址
   - 使用nslookup查询baidu.com的邮件服务器(MX记录)

5. 远程连接（模拟）
   - 创建一个名为ssh_connect.sh的脚本，模拟SSH连接过程，脚本接受用户名和主机名作为参数
   - 并输出类似'正在连接到 username@hostname...'的信息

6. 文件传输（模拟）
   - 创建一个名为file_transfer.sh的脚本，模拟SCP文件传输，接受本地文件和远程路径作为参数
   - 并显示传输进度百分比(使用循环从0%到100%)

7. 网络监控
   - 创建一个简单的网络监控脚本monitor_network.sh，监控与百度和谷歌的连通性
   - 每10秒检查一次，运行3次，并将结果输出到network_status.log

## 提示
- 对于ping，使用 -c 参数限制数据包数量
- 对于traceroute，可能需要先安装: sudo apt install traceroute
- 对于ss命令，使用 -l 参数显示监听端口，-t 参数显示TCP连接
- 对于IP地址提取，可以使用grep和awk等工具
- 创建脚本时，记得添加可执行权限: chmod +x script_name.sh

## 验证
完成后，运行 `./check_network.sh` 来验证你的结果 