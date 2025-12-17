---
title: zoxide 使用感受
description: 一位忠实的 zoxide 用户在使用 zoxide 一年后的感受
slug: feelings-about-zoxide
date: 2025-02-02
image: image.webp
categories:
    - 技术
tags:
    - cd
    - zoxide
---

[zoxide](https://github.com/ajeetdsouza/zoxide) 是一个更聪明的 `cd` 命令，旨在让你更快速的在目录之间来回切换。

我是在 YouTube 闲逛时看到这个项目的，感觉很不错就尝试了一下。事实证明，这个工具确实很方便。下文将详细阐述为什么我认为这是个好工具。

## `zoxide` 有什么用处？

`zoxide` 受 `z` 和 `autojump` 启发而开发。它会记住你每一个 `cd` 命令的使用频次，这样你就可以快速切换到这些目录。这样说可能有点抽象，但你可以看下方的演示：

![GitHub repo 中的演示](https://github.com/ajeetdsouza/zoxide/raw/main/contrib/tutorial.webp)

`zoxide` 还可以与 `fzf` 配合，以达到互动式的 `cd` 操作。

## 快速入手 `zoxide`

`zoxide` 支持各大主流操作系统，其安装也非常简单，在[官方 README](https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file)中有详细的教程可以查看，这里仅作简单概述。

### 安装

使用主流的包管理器即可安装 `zoxide`。对于 Windows，可以使用 `winget`：

```pwsh
winget install ajeetdsouza.zoxide
```

对于 Linux，使用任意的包管理器（除了 Ubuntu `apt`，因为更新太慢）安装 `zoxide` 包或使用安装脚本：

```bash
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

### 在 shell 中配置

`zoxide` 支持各平台主流 shell 的配置，仅需将下面的命令输出保存进 shell 的配置文件即可：

```bash
zoxide init [shell_name]
```

例如，对于 `Bash`，在配置文件中（通常是 `~/.bashrc`）中加入以下行：

```bash
eval "$(zoxide init bash)"
```

具体支持的 shell 和配置所需的命令见 README。

需要注意的是，使用 `zoxide` 切换目录的命令默认是 `z`，但是如果你习惯使用 `cd` 浏览目录，你可以使用以下的 flag 直接替换 `cd` 或是自定义其他你喜欢的命令：

```bash
zoxide init [shell-name] --cmd cd
```

同样的，使用 `fzf` 进行互动式 `cd` 的命令也会从 `zi` 变为 `cdi`。

## 使用体验

事实上，`zoxide` 的使用体验和 `cd` 基本无异。除了对 `cd` 本身特性（如使用 `cd` 回到 `~`，使用 `cd -` 回到上个目录等），对于 `cd` 做了自动补全的 shell，用 `zoxide` 直接替换 `cd` 命令一样可以使用自动补全，非常方便。特别是对于路径长的一塌糊涂的 Windows，`zoxide` 确实能帮助我快速转到目标目录。比如说：我将我的作业代码全部放在 `C:\Users\William\Desktop\Homework\Code` 里，以前打开项目还需要我回到桌面，点击 `Homework` 文件夹，再点击 `Code` 文件夹，右击选择使用 Code 打开，现在可以启动 shell：

```bash
cd Code
code .
```

完事！（注：我使用了 `--cmd cd` flag 配置。）

你问我为什么不把作业放到 Documents 文件夹下？因为这里是 Windows，而很多应用喜欢在这里面拉屎，把用户文件全扔在这里面（即使用户指定了其他的保存路径）。事实上，各种应用已经在我的 Documents 文件夹里已经堆了 41 个子文件夹了。同样对于 `~` Home 目录，也是一堆的 dotfiles 和不知名的应用写进去的文件夹。相比之下，只有 Desktop 桌面这个地方是干净的，因此所有的个人文件就放在了桌面下的一个统一的文件夹内（咱是不会让桌面堆满文件夹的）。

而对于 Linux，得益于目录结构的简洁与合理以及大部分 Linux 应用遵守规范，其帮助不是很显著，但是仍然能省去大部分记忆目录和 `cd-ls` 组合的时间。

比如说，我希望修改我的代理配置，我可以使用 `cd v2ray` 而非 `cd /etc/v2ray`；现在如果我还希望修改 `fish` 的配置文件，还可以直接 `cd fish` 而非 `cd ~/.config/fish`。对于需要在很多不同目录间来回切换的人，使用 `zoxide` 无疑是省时的。以及，在这个过程中完全不需要想某个配置文件在什么目录，直接无脑 `cd` 即可（当然，前提是你已经 `cd` 过了一次）。

至于使用 `cdi` 的场景，因为不太习惯用 `fzf`，所以还没有什么感想。

## 更高级的 `zoxide` 使用法

对于我这样的普通用户，深度使用 `zoxide` 的场景并不多，但 `zoxide` 的潜力不止于此。实际上，`zoxide` 可以模糊匹配目录。这里简单介绍一下其[算法](https://github.com/ajeetdsouza/zoxide/wiki/Algorithm)：

1. 搜索时大小写不敏感。
   * `cd foo` 可以匹配 `/foo` 或者 `/FOO`。
2. 可以使用多个关键词搜索（包括斜杠），但顺序必须正确。
   * `cd fo ba` 可以匹配 `/foo/bar`，但不匹配 `/bar/foo`。
   * `cd fo / ba` 可以匹配 `/foo/bar`，但不匹配 `/foobar`。
3. 最后一个搜索关键词和路径的最后一个组成部分匹配。
   * `cd bar` 可以匹配 `/foo/bar`，不匹配 `/bar/foo`。
   * `cd foo/bar` 不匹配 `/foo/bar/baz`。

也就是说，如果我希望访问我的作业 `Code` 下的 `Python` 文件夹，除了打全名字，还可以使用更有效率的切换方式：`cd code py`。如果真的很会用这个工具的话，我认为应该能很有效的提高效率。

此外，`zoxide` 有许多三方支援，包括 Vim/NeoVim 等。对于重度的命令行使用者，这个工具应该会或多或少帮到你。

## 总结

`zoxide` 在使用上接近原生的 POSIX `cd` 体验，且对于其目录搜索和快速切换的功能做的也很方便。不管你在什么操作系统下，我都觉得 `zoxide` 完全可以替代原生的 `cd`（特别是对于 Windows 上需要和命令行打交道的人）。希望你能喜欢这个推荐吧！
