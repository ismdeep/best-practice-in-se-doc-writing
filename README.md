---
title: 软件工程师文档写作最佳实践
---

对于软件工程师来说，文档写作实团队沟通和合作的必备技能，高质量的文档是实现有效沟通的简单方式。

本文开源地址： [https://github.com/ismdeep/best-practice-in-se-doc-writing](https://github.com/ismdeep/best-practice-in-se-doc-writing)

# Markdown

Markdown 是一种轻量的标记语言，程序员尤为喜爱 Markdown 文档，因其有着简洁、直观和高效等特点。而且很多本地化或者在线的编辑器都支持 Markdown 的语法。本文的目的就是通过 Markdown 语法编辑文档，产出各种交付的文档。

# Mediawiki

通过 Markdown 转 Mediawiki 文档

```
$ pandoc -f markdown -t mediawiki hello.md -o hello.wiki
```

# PDF

首先通过 Markdown 转 Tex 文档

```
$ pandoc -r markdown-auto_identifiers -w latex hello.md -o hello-snippet.tex
```

