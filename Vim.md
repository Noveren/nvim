## 应用笔记
> 命令行下执行 `:help [some_thing]` 查看相关说明文档



## 系统框架

**挂起**: 将 Vim 程序挂起并 **返回命令行**, 在命令行中执行 `fg` 命令可以重新进入 Vim 程序

```shell
:stop | :suspend | Control-Z
```

| 显示系统抽象 |                             说明                             |
| :----------: | :----------------------------------------------------------: |
|  **Buffer**  | 缓冲区, 一块内存空间, 储存文本数据, **一块缓冲区对应一份文件数据** |
|  **Window**  |  窗口, 对一块缓冲区内容的显示, 一块缓冲区可以被多个窗口展示  |
|   **Tab**    |          表, 窗口的**重叠**, 等效于窗口的功能和机制          |

> 一块内存空间, 储存文本数据, **一块缓冲区对应一份文件数据**, 对缓冲区的操作, 即对应编辑器对文件的操作

```shell
> vim --help
Usage: vim [<file_name> ..]		# 子集用法: 打开指定文件, 若文件不存在则创建对应名称的缓冲区
								# 默认使用一个窗口, 一个Tab, 显示第一个文件
```

```shell
:buffers						# 查看现有缓冲区 (正在编辑的文件); alias = files | ls
  <serial> <status> <file_name> <current_edit_line>
:bdelete <serial | file_name>   # 删除指定缓冲区 ( ... ), 停止编辑并关闭指定文件
:w | write	[<file_name>]		# 写入当前或指定的文件
```

> 对一块缓冲区内容的显示, 一块缓冲区可以被多个窗口展示, 不同窗口的操作会影响同一块缓冲区的数据
>
> **注意**: Vim 的运行至少存在一个窗口, 当最后一个窗口被成功关闭后, 删除打开的缓冲区,  并退出 Vim 程序

```shell
:split <file_name>				# 新建水平窗口, 在 Tab 上打开或创建; alias = new
:vsplit <file_name>				# 新建垂直窗口, ...
								# 缺省文件时, 默认为当前光标位于的窗口中活跃的文件
# 通过如下快捷键在窗口之间进行跳转
Control-W + H | J | K | L
# 调整窗口显示的缓冲区
:bnext							# 转到缓冲区
:bprevious						# 	按照序号 小->大 顺序, 循环移动
:buffer  <serial | file_name>	# 转到指定缓冲区 (file_name 模式支持 Tab 补全)
```

```shell
Control-W + C | O				# 关闭 当前窗口 | 其他所有窗口
:q | qall					    # 关闭 当前窗口 | 所有窗口
:wq	| wqall					    # 写入并关闭 当前窗口 | 所有窗口
```

+ **后台缓冲区不能处于修改状态**: 若窗口 **唯一显示** 被修改的缓冲区, 则在保存该缓冲区修改后, 才允许关闭该窗口
+ **强制退出**: `q! | qall!`, 放弃修改的内容

> 窗口的**重叠**, 等效于窗口的功能和机制; 同一组 Tab 从左至右从`1` 开始编号

```shell
:tabnew <file_name>				# 新建 Tab, 打开或创建, 并转到
:tabclose						# 关闭当前 Tab, 无法关闭窗口的最后一个 Tab
:tabnext	:tabprevious	:tablast	:tabfirst
:edit <file_name>				# 在当前 Tab 下打开或创建
```

```shell
gt | gT							# :tabnext | :tabprevious
<serial>gt | <serial>gT			# 前往指定序号的 Tab (当有数字参数时, gt 和 gT 等效)
```

```shell
> vim --help
Usage: vim [arguments] [file ..]		edit specified file(s)
   or: vim [arguments] -				read text from stdin
   or: vim [arguments] -t tag       	edit file where tag is defined
   or: vim [arguments] -q [errorfile]	edit file with first err
```





Vim 以状态机的方式运行, 有如下模式:

+ **Normal**: 普通模式
+ **Insert**: 插入模式

Vim 语法规则概述

```shell
<verb><noun>						# 动词 + 名词
```

Motion 动作名词

```shell
## 定义字符: 西文字符、单个汉字 等
h | l							    # 前往 左 | 右 一字 (字符由任意个连续空白符分隔)
## 定义单词: 由若干连续空白符分隔
e									# 前往 下一词 末尾: 最后一字前 (不含空白符, 一般)
w									# 前往 下一词 末尾: 最后一字后 (包含空白符, 一般)
## 定义一行: 由分行符分隔
0 | $								# 前往当前行 头字前 | 尾字后
## 定义一段: 由分段行分隔 (若干连续仅含分段符的行, 即有两个及两个以上的分段符)
{    								# 前往 上一段 末尾: 最后一个字符之前
}									# 前往 当前段 末尾: 最后一个字符之前
```



```shell
h | l							    # 前往 左 | 右 一字 (字符由任意个连续空白符分隔)
j | k								# 前往 下 | 上 一行
w									# 前往 下一词 末尾: 最后一字后 (包含空白符, 一般)
e									# 前往 下一词 末尾: 最后一字前 (不含空白符, 一般)
0 | $								# 前往当前行 头 | 尾
{ | }								# 前往当前段 头 | 尾
```

Operator 操作符动词

```shell
y									# yank   复制
d									# delete 删除
c									# change 修改: 删除指定内容并保存到寄存器, 然后进入插入模式
```

