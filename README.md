# markdown-to-epub-pdf-others
It uses pandoc to convert markdown(which is my favorite way) to epub/pdf/other ebooks.
# 参考：
本项目参考[Paul Fawkesley ](https://github.com/fawkesley/markdown-to-epub-mobi)于早年前的项目。
# 价值
提供一个本地生成epub/pdf/other ebook的方式，通过预先编写makefile减少对pandoc的重复使用，
欢迎各位fork后自己编写makefile



目前仅做了少部分工作：
+ 支持数学公式
+ 支持插入图片
# 环境依赖
在ubuntu20.04LTS中，你需要安装：
+ pandoc    


用于格式转换
```bash
sudo apt install pandoc
```
+ kindlegen      



用于生成mobi       


由于kindlegen不再提供linux版，因此在这里放一个百度网盘的连接：
[download](https://pan.baidu.com/s/1mgszE44)   
或者你可以在本仓库的kindlegen文件夹下载。
使用方式：
解压后移动文件夹里的kindlegen至 /usr/local/bin/
+ xelatex      



用于帮助pandoc生成pdf
```bash
sudo apt-get install texlive-latex-base 
sudo apt-get install texlive-xetex

```

# 如何使用

本地下载本仓库，安装好所需依赖后，

执行：
```bash
make all
```
可以在build文件夹下生成所有支持的电子书，


执行：
```bash
make epub
```
可以在build文件夹下生成epub文件，


执行：
```bash
make pdf
```
可以在build文件夹下生成pdf文件。

执行：
```bash
make mobi
```
可以在build文件夹下生成mobi文件。

目前仅支持生成这三种文件。





执行：

```bash
make cleanall
```
可以删除所生成的文件。


执行：

```bash
make cleanepub
```
可以删除所生成的epub文件。


执行：

```bash
make cleanpdf
```
可以删除所生成的pdf文件。



执行：

```bash
make cleanmobi
```
可以删除所生成的mobi文件。

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
如你所见，这个项目完全依赖于pandoc,kindlegen以及latex引擎，本项目仅仅通过makefile提供简便的操作
# 注意：
本项目生成的epub为epub3，epub3以下对于数学公式的渲染不友善，建议使用支持epub3阅读的阅读器，国内用户可以使用**neatreader**网页版.      

或者使用foliate:

```bash
sudo snap install foliate
```


而mobi对数学公式仍不友善，解决办法是把数学公式转为图片，我不认为这是一个好的解决办法，因此如同大多数mobi格式的书一样，本项目生成的mobi对latex支持不好且未将其转换为图片。
