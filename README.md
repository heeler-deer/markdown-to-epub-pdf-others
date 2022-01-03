# markdown-to-epub-pdf-others
It uses pandoc to convert markdown(which is my favorite way) to epub/pdf/other ebooks.
# 参考：
本项目参考[Paul Fawkesley ](https://github.com/fawkesley/markdown-to-epub-mobi)于早年前的项目。
# 价值
提供一个本地生成epub/pdf/other ebook的方式，通过预先编写makefile减少对pandoc的重复使用，
欢迎各位fork后自己编写makefile
# 环境依赖
在ubuntu20.04LTS中，你需要安装：
+ pandoc

```bash
sudo apt install pandoc
```
+ kindlegen


```bash
sudo snap  install kindlegen
```

+ xelatex
```bash
sudo apt-get remove texlive-latex-base 
sudo apt-get install texlive-xetex

```

# 如何使用

本地下载本仓库，安装好所需依赖后，执行：
```bash
make epub
```
可以在build文件夹下生成epub文件，执行：
```bash
make pdf
```
可以在build文件夹下生成pdf文件。
目前仅支持生成这两种文件。
执行：

```bash
make clean
```
可以删除所生成的文件。
# 本仓库各文件解释
```bash
master/epub$ tree
.
├── build
│   ├── book.epub
│   └── book.pdf
├── img
│   └── 1.png
├── Makefile
├── markdown
│   └── chapter1.md
└── meta
    ├── cover.jpg
    ├── metadata.xml
    ├── stylesheet.css
    └── title.txt

4 directories, 9 files
```
其中：
+ build为生成的文件所在文件夹，
+ img为markdown中引用的图片，值得注意的是为了使markdwon放在一个统一的文件夹下，在md中的图片路径应为makefile下的相对路径，如本例md中图片路径即为./img/1.png
+ markdown文件夹下即为各markdown文件，
+ meta文件夹存放生成电子书的目录以及其他样式的文件
# 本项目如何运行
如你所见，这个项目完全依赖于pandoc以及latex引擎。
# 注意：
生成的epub为epub3，epub3以下对于数学公式的渲染不友善，建议使用支持epub3阅读的阅读器，国内用户可以使用neatreader.
