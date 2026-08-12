# Snoopy 家庭动态壁纸一键安装器

这个公开仓库只保存安装入口，不包含任何视频文件。完整 65 场景视频存放在家庭私有仓库的 GitHub Release 中。

## 一键安装

先让仓库管理员把你的 GitHub 账号加入私有仓库，再在 Mac 的“终端”执行：

```bash
curl -fsSL https://raw.githubusercontent.com/leeguooooo/mac-snoopy-wallpaper-installer/main/install.sh | bash
```

首次运行会打开 GitHub 登录页面。登录成功后，脚本自动下载、校验并导入完整壁纸；最后在系统壁纸设置中点击 `Snoopy-All-65-Scenes` 一次。

如果首次安装提示 Phosphene 壁纸扩展尚未生效，请退出登录 macOS、重新登录，再运行同一条命令。扩展检查在大文件下载前完成。

要求：macOS 26+、Homebrew、至少 14 GB 可用空间。

> 仅供本人和家庭设备使用。公开仓库不包含视频；不要公开转载、转售或二次分发私有素材。
