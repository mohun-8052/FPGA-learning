工程文件：
  --par 工程文件
  --rtl 设计文件、代码
  --sim 仿真文件
  --doc 设计文档，datesheet

quartusII 
new project 
①介绍界面
②路径 不可出现中文
   工程名字
   顶层文件名（与工程名字保持一致）
③添加代码
④选择芯片
⑤第三方EDA工具

新建完成后，点击芯片型号可以直接改变芯片型号
file-new-verilog

编写完成后，分析与综合按钮

tool-option-texteditor-tabsize设置为4 并将空格键转化为tab键勾选
可以取消save backup file 取消备份文件

引脚复用功能：如果要取消引脚复用功能
点击芯片型号-device and pin option-dual-purpose pin -nCEO改为use as regular I/O

分配引脚 assignment-pin planner
分配引脚通过excel表格（原理图-引脚分配脚）
可在par文件夹下面查看.qsf文件

设置完成后，点击开始编译的图标
任务条：分析与综合、布局布线、生成任务下载程序文件、时序分析、生成EDA网表

下载程序：
tool- project
下载之前要连接usb bluarst（一端电脑 一段开发板）
文件类型为 sof文件 此文件烧录到ram中，断电即消失
如果要永久保存在开发板中，需要设置
file-convert project-program file type改为jic文件
configuration device 改为 epcq16（根据flash型号来改）
flash loader-add device 
选择芯片型号 cycloneⅣE 选择芯片名称 EP4CE10
SOF Date- add file 选择下载文件 sof文件
最后点击 generate生成jic文件
到下载的界面 删掉sof文件 添加jic文件 点击program/configure 点击下载即可
开发板只要断电后重新上电即可跑程序（因为上电过程中fpga会去读取flash里的文件）
如果要擦除程序，不勾选program/configure，勾选rease，下载即可

使用modelsim仿真
前仿真：功能仿真，只验证功能是否符合设计要求，不考虑门延迟和线延迟
后仿真：时序仿真、布局布线后仿真、综合考虑电路路径延迟和门延迟的影响、可以更好的反应芯片的实际功能

联合仿真（自动仿真）
tool-option-eda tool option-选择modelsim的路径
选择eda：assignment-setting-eda tool setting-simulate选择modelsim-altera
产生tb文件（给顶层文件提供激励，如系统时钟和复位信号）：
processing-start-start test bence
可在信息栏中看到test bence生成的路径
file- open-根据路径打开vt文件
ps：vt文件和verilog代码的.v文件是通用的

timescale 1ps/1ps （仿真单位/仿真精度）仿真精度太高 改成1ns/1ns
在initial中，begin和end中中间的代码删除
仿真代码看视频 10mins开始

assignment - setting-simulation-compile test bench-test benches-new 输入vt文件中的模块名
file name 选择vt文件 点击add添加 
依次点击ok

开始仿真 ：
tools-run simulation tools-俩选项分别是功能仿真和时序仿真
首先进行功能仿真