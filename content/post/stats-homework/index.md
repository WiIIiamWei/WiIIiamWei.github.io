---
title: 数理统计 - 置信区间估计整理
description: 为了完成李新秀 - 概率论与数理统计课程某作业而整理的笔记
slug: stats-homework
date: 2024-12-19
math: true
categories:
    - 学习
tags:
    - 概率论
    - 数理统计
---

| 题意 | 枢轴量 | 双侧置信区间 | 单侧置信限 |
| ----- | ----- | ------------------- | ------ |
| 估计 $\mu$, 已知 $\sigma^2$ | $Z = \dfrac{\overline{X} - \mu}{\sigma / \sqrt{n}} \sim N\left(0, 1\right)$ | $\left(\overline{X} - \dfrac{\sigma}{\sqrt{n}}z_{\alpha/2}, \overline{X} + \dfrac{\sigma}{\sqrt{n}}z_{\alpha/2}\right)$ | $\overline{\mu} = \overline{X} + \dfrac{\sigma}{\sqrt{n}}z_{\alpha}, \\ \underline{\mu} = \overline{X} - \dfrac{\sigma}{\sqrt{n}}z_{\alpha}$ |
| 估计 $\mu$, 未知 $\sigma^2$ | $T = \dfrac{\overline{X} - \mu}{S / \sqrt{n}} \sim t\left({n - 1}\right)$ | $\left(\overline{X} - \dfrac{S}{\sqrt{n}}t_{\alpha/2}\left({n - 1}\right), \overline{X} + \dfrac{S}{\sqrt{n}}t_{\alpha/2}\left({n - 1}\right)\right)$ | $\overline{\mu} = \overline{X} + \dfrac{S}{\sqrt{n}}t_{\alpha}\left({n - 1}\right), \\ \underline{\mu} = \overline{X} - \dfrac{S}{\sqrt{n}}t_{\alpha}\left({n - 1}\right)$ |
| 估计 $\sigma^2$, 已知 $\mu$ | $\chi^2 = \dfrac{\sum\limits^n_{i=1}\left(X_i - \mu\right)^2}{\sigma^2} \sim \chi^2\left(n\right)$ | $\left(\dfrac{\sum\limits^n_{i=1}\left(X_i - \mu\right)^2}{\chi^2_{\alpha/2}\left(n\right)}, \dfrac{\sum\limits^n_{i=1}\left(X_i - \mu\right)^2}{\chi^2_{1-\alpha/2}\left(n\right)}\right)$ | $\overline{\sigma^2} = \dfrac{\sum\limits^n_{i=1}\left(X_i - \mu\right)^2}{\chi^2_{1-\alpha}\left(n\right)}, \\ \underline{\sigma^2} = \dfrac{\sum\limits^n_{i=1}\left(X_i - \mu\right)^2}{\chi^2_{\alpha}\left(n\right)}$ |
| 估计 $\sigma^2$, 未知 $\mu$ | $\chi^2 = \dfrac{\left(n - 1\right) S^2}{\sigma^2} \sim \chi^2\left(n - 1\right)$ | $\left(\dfrac{\left(n - 1\right) S^2}{\chi^2_{\alpha/2}\left(n - 1\right)}, \dfrac{\left(n - 1\right) S^2}{\chi^2_{1 - \alpha/2}\left(n - 1\right)}\right)$ | $\overline{\sigma^2} = \dfrac{\left(n - 1\right) S^2}{\chi^2_{1 - \alpha}\left(n - 1\right)}, \\ \underline{\sigma^2} = \dfrac{\left(n - 1\right) S^2}{\chi^2_{\alpha}\left(n - 1\right)}$ |
