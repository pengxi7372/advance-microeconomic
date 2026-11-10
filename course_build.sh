#!/usr/bin/env bash
# 课程讲义统一编译脚本（LuaLaTeX 两遍，正确嵌入系统字体）
# 用法：bash course_build.sh <lecture_dir>
set -u
DIR="${1:?用法：bash course_build.sh <lecture_dir>}"
cd "$DIR" || exit 1
export OSFONTDIR=/System/Library/Fonts:/System/Library/Fonts/Supplemental:/Library/Fonts
LUA=/Library/TeX/texbin/lualatex
OPTS="-interaction=nonstopmode -halt-on-error -file-line-error"
echo ">>> 第一遍编译：$DIR"
"$LUA" $OPTS main.tex >/tmp/cb_pass1.log 2>&1
ec1=$?
echo ">>> 第二遍编译：$DIR"
"$LUA" $OPTS main.tex >/tmp/cb_pass2.log 2>&1
ec2=$?
echo "exit_pass1=$ec1 exit_pass2=$ec2"
echo "=== 错误统计（第二遍）==="
grep -c "^!" /tmp/cb_pass2.log | sed 's/^/Errors: /'
grep -c "Missing character" /tmp/cb_pass2.log | sed 's/^/MissingChar: /'
grep -c "Overfull" /tmp/cb_pass2.log | sed 's/^/Overfull: /'
grep -c "Underfull" /tmp/cb_pass2.log | sed 's/^/Underfull: /'
echo "=== 末几行 ==="
tail -5 /tmp/cb_pass2.log
# 可选第二参数：把 main.pdf 另存为该讲（章）的独立命名 PDF
NAME="${2:-}"
if [ -n "$NAME" ]; then
  cp -f main.pdf "$NAME.pdf"
  echo "=== 已输出独立命名 PDF：$DIR/$NAME.pdf ==="
fi
