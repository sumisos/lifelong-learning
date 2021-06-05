#!/bin/bash

SCRIPT_NAME="Sample: getopt Usage"
SCRIPT_VERSION="1.0.0"

function print_help () {
    echo "$0 -h 查看帮助"
}
function print_usage () {
    echo -e "Usage: $0 [options]\n"
    echo -e "Options:\n  --force, -f:   启用强制模式\n\n  --test, -t:    测试\n\n  --repeat, -r:  启用重复操作\n                 默认重复1次\n                 e.g. -r3 重复3次\n\n  --host:        自定义主机名\n  --port, -p:    自定义端口\n\n  --help, -h:    显示帮助\n\n  --version, -v: 版本信息"
}

TEMP=$(
    getopt -o fhtvb:p:,r:: --long force,help,test,version,b-long:,host:,port:,repeat:: \
        -n "$0" -- "$@"
)
if [ $? != 0 ]; then
    echo "非法参数" >&2
    print_help
    exit 1
fi
eval set -- "$TEMP"

while true; do
    case "$1" in
    -f | --force)
        echo "[DEBUG] enable Option [force]"
        shift
        ;;
    -h | --help)
        print_usage
        exit 0
        ;;
    -t | --test)
        echo "$0 -h       查看帮助"
        echo "$0 -v       查看版本"
        echo "$0 -- -post 不解析参数 直接传递原本的值"
        echo -e "$0 -post    会被解析成 [-p ost] => [--port 'ost']\n"
        echo "$0 -f --host '127.0.0.1' -p 8080 -r 'alone arg'"
        echo "$0 -f AloneArg1 --host '0.0.0.0' AloneArg2 -p66 -r3 AloneArg3"
        exit 0
        ;;
    -v | --version)
        echo "$SCRIPT_NAME v$SCRIPT_VERSION"
        exit 0
        ;;
    --host)
        echo "[DEBUG] enable Option [host] @ \`$2\`"
        shift 2
        ;;
    -p | --port)
        echo "[DEBUG] enable Option [port] @ \`$2\`"
        shift 2
        ;;
    -r | --repeat)
        case "$2" in
        "")
            echo "[DEBUG] enable Option [repeat], default 1 time"
            shift 2
            ;;
        *)
            echo "[DEBUG] enable Option [repeat], choose \`$2\` times"
            shift 2
            ;;
        esac
        ;;
    --)
        shift
        break
        ;;
    *)
        echo "[FATAL] Internal error!"
        exit 1
        ;;
    esac
done

function main() {
    if [ $# -ne 0 ]; then
        echo "[DEBUG] 剩余未被解析的孤立参数:"
        for arg; do
            echo "--> \`$arg\`"
        done
    else
        echo "没有任何孤立参数"
        print_help
    fi
}
main $*
