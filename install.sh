#!/bin/bash
set -euo pipefail

PRIVATE_REPOSITORY="leeguooooo/mac-snoopy-wallpaper"

say() {
  printf '%s\n' "$*"
}

fail() {
  printf '错误：%s\n' "$*" >&2
  exit 1
}

[[ "$(uname -s)" == "Darwin" ]] || fail "此安装器只支持 macOS。"

if ! command -v brew >/dev/null 2>&1; then
  fail "未找到 Homebrew。请先从 https://brew.sh 安装。"
fi

if ! command -v gh >/dev/null 2>&1; then
  say "正在安装 GitHub CLI…"
  brew install gh
fi

if ! gh auth status >/dev/null 2>&1; then
  say "需要登录 GitHub。浏览器打开后，请使用已获家庭仓库权限的账号登录…"
  gh auth login --hostname github.com --git-protocol https --web </dev/tty
fi

gh api "repos/$PRIVATE_REPOSITORY" >/dev/null 2>&1 \
  || fail "当前 GitHub 账号无权读取 $PRIVATE_REPOSITORY。请让仓库管理员先添加协作者并接受邀请。"

TEMP_SCRIPT="$(mktemp "${TMPDIR:-/tmp}/snoopy-installer.XXXXXX")"
cleanup() {
  rm -f "$TEMP_SCRIPT"
}
trap cleanup EXIT INT TERM

say "正在读取家庭私有仓库中的完整安装器…"
gh api "repos/$PRIVATE_REPOSITORY/contents/install.sh" --jq .content \
  | base64 --decode > "$TEMP_SCRIPT"

bash -n "$TEMP_SCRIPT" || fail "下载的安装器语法检查失败。"
bash "$TEMP_SCRIPT"
