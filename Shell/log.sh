#!/bin/bash

function logger() {
    typeset -u level
    level="$2"
    case "${level}" in
    "NOTICE")
        level="INFO"
        prefix="\033[1;36m"
        ;;
    "SUCCESS")
        level="INFO"
        prefix="\033[1;32m"
        ;;
    "INFO")
        prefix="\033[37m"
        ;;
    "WARN")
        prefix="\033[1;33m"
        ;;
    "ERROR")
        prefix="\033[1;31m"
        ;;
    "FATAL")
        prefix="\033[1;7;31;47m"
        ;;
    "DIVIDER")
        echo "================================================================"
        return
        ;;
    "BREAKPOINT" | "BREAK")
        level="BREAK"
        prefix="\033[5;7m"
        ;;
    *)
        level="DEBUG"
        prefix="\033[2;37m"
        ;;
    esac
    tmp=" [$level]"
    echo -e "$prefix$(date +"%Y-%m-%d %H:%M:%S") ${tmp:0-7} $1\033[0m"
    if [[ $level == "FATAL" ]]; then exit 1; fi
}

function test() {
    logger "It's just a Divider whatever you edit anything." divider
    logger "This is a Breakpoint message." breakpoint
    logger "This is a Debug message."
    logger "This is a Notice message." notice
    logger "This is a Info message." info
    logger "This is a Success message." success
    logger "This is a Warning message." warn
    logger "This is a Error message." error
    logger 1 divider
    logger "This is a Fatal message. Process will exit." fatal
}

test

##################################################
# \033[d;dm  中的 d 即指格式化标记
# e.g.
# echo -e "\033[5;31mStart to display content\033[0m"
# \033[0m    关闭所有属性 即恢复到上次修改之前的显示属性
# \033[1m    高亮 突出显示并加粗
# \033[2m    灰度 暗淡当前的前景色
# \033[3m    斜体
# \033[4m    下划线
# \033[5m    闪烁
# \033[7m    反显 黑底白字 -> 白底黑字
# \033[8m    消隐 将前景色设置为背景色
# \033[30m   黑色前景
# \033[31m   红色前景
# \033[32m   绿色前景
# \033[33m   黄色前景
# \033[34m   蓝色前景
# \033[35m   紫色前景
# \033[36m   青色前景
# \033[37m   白色前景
# \033[40m   黑色背景
# \033[41m   红色背景
# \033[42m   绿色背景
# \033[43m   黄色背景
# \033[44m   蓝色背景
# \033[45m   紫色背景
# \033[46m   青色背景
# \033[47m   白色背景
# \033[90m   黑色背景灰色前景
# \033[91m   黑色背景红色前景
# \033[92m   黑色背景绿色前景
# \033[93m   黑色背景黄色前景
# \033[94m   黑色背景蓝色前景
# \033[95m   黑色背景紫色前景
# \033[96m   黑色背景青色前景
# \033[97m   黑色背景白色前景
# \033[nA    光标上移n行
# \033[nB    光标下移n行
# \033[nC    光标右移n行
# \033[nD    光标左移n行
# \033[y;xH  设置光标位置
# \033[2J    清屏
# \033[K     清除从光标到行尾的内容
# \033[s     保存光标位置
# \033[u     恢复光标位置
# \033[?25l  隐藏光标
# \033[?25h  显示光标
##################################################
