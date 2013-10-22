replace
-------

:s/vivian/sky/ 替换当前行第一个 vivian 为 sky

:s/vivian/sky/g 替换当前行所有 vivian 为 sky

:n,$s/vivian/sky/ 替换第 n 行开始到最后一行中每一行的第一个 vivian 为 sky

:n,$s/vivian/sky/g 替换第 n 行开始到最后一行中每一行所有 vivian 为 sky , (n 为数字，若 n 为 .，表示从当前行开始到最后一行)

:%s/vivian/sky/（等同于 :g/vivian/s//sky/） 替换每一行的第一个 vivian 为 sky

:%s/vivian/sky/g（等同于 :g/vivian/s//sky/g） 替换每一行中所有 vivian 为 sky

:s#vivian/#sky/# 替换当前行第一个 vivian/ 为 sky/  , 可以使用 # 作为分隔符，此时中间出现的 / 不会作为分隔符

:%s+/oradata/apras/+/user01/apras1+ （使用+ 来 替换 / ）： /oradata/apras/替换成/user01/apras1/

tips:

g放在命令末尾，表示对搜索字符串的每次出现进行替换；

不加 g，表示只对搜索字符串的首次出现进行替换；

g 放在命令开头，表示对正文中所有包含搜索字符串的行进行替换操作。



删除文本中的^M
--------------


使用命令：cat filename1 | tr -d "^V^M" > newfile；

使用命令：sed -e "s/^V^M//" filename > outputfilename。

需要注意的是在1、2两种方法中，^V和^M指的是Ctrl+V和Ctrl+M。你必须要手工进行输入，而不是粘贴。

在vi中处理：
首先使用vi打开文件，然后按ESC键，接着输入命令：%s/^V^M//。

:%s/^M$//g

