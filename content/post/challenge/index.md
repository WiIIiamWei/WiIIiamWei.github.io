---
title: 成员招募挑战
description: 路桥卫士项目组
slug: challenge
date: 2024-11-15
categories:
    - 竞赛
---

> 在下面选择一个你认为擅长的挑战，完成它，证明你的实力。完成任意挑战之后都请尽快提交。祝你好运！

> **联系方式（QQ）**
>
> 硬件相关：1542745943
>
> 软件相关：1397784681
>
> 建模相关：1969860168
>
> 提交成果请联系对应的负责人，联系我们时请务必注明来意。

## 想做机器学习！

机器学习领域有一个很入门的课题，叫 MNIST（手写数字识别）。请你完成一个实例。

我推荐你使用 Jupyter Notebook + Tensorflow 完成这一任务。你可以从我给你的示例代码开始做，里面包含完整的数据集和测试集，不需要你再找。你也可以用你自己的方式完成。

仓库地址：[https://gitee.com/WiIIiamWei/mnist-beginner.git](https://gitee.com/WiIIiamWei/mnist-beginner.git)

使用以下命令克隆仓库（这是一个 Git 仓库，在使用之前你可能还需要学习一下如何安装和使用 Git）：

```bash
git clone https://gitee.com/WiIIiamWei/mnist-beginner.git
```

如果你认为你完成了，请联系我们并发给我们完整的代码压缩包，或者直接在 Gitee 上提出 Pull Request（那样我更看好你）。

## 想帮队长做硬件！

### 基础要求

从一块 ESP32 中获取温湿度数据，将数据上传到阿里云物联网平台。

### 进阶挑战

从一块 ESP32 中获取温湿度数据，利用任意无线传输方式将温湿度数据从这块 ESP32 传输到另一块 ESP32 再上传到阿里云物联网平台。

## 想做大屏或者小程序！

[Element](https://element.eleme.cn/#/zh-CN) 是一个对新手非常友好的前端库，也是我们大屏主要使用的技术。

请你用这个库写一个好看的界面。请注意：你要做的不只是 UI 设计，而是在网页上实现它。

Element 是基于 Vue 2.0 的，在此之前你可能还需要了解 Vue 基础。

或者……如果你真的很牛，想用其他的框架（甚至是纯 HTML + CSS + JS）搓出一个好看的界面也不是不行。

## 想帮我们维护服务器！

1. 拥有一个自己可控的 GNU/Linux 系统作为服务器，可以是实体机或虚拟机，发行版随意；
2. 在服务器上部署一个 Flask 服务：

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(debug=True)
```

3. 在另一台机器上以任意方式（浏览器、`curl`、`wget` 等）访问这个服务，看到 `Hello, World!` 便算你成功。

你说你会部署其他服务？也可以和我们聊聊看。

## 想帮我们做数字孪生！

**我们在这个领域其实也是新手。如果有大佬能在这方面有些见解，欢迎来找我们聊聊！**

数字孪生这一技术一般呈现数据大屏上。帮我们做一个这样的大屏吧，只不过你**必须使用 Unity**。

简陋一点或者没做出数字孪生也没关系，只要用 Unity 实现一个像样的数据大屏就可以了。毕竟我们在这方面了解也不多，慢慢来。

如果说你不会做大屏，但你喜欢建模，可以试试这个：

使用下面的素材文件，任选一个进行建模，以**书页**为主题，其余场景可自主发挥，但需要契合音频，不可对音频进行任何改动，包括删减、增添、混响等。

[素材下载（包含一个示例成果）](https://cowtransfer.com/s/0d01a97d11064b)
