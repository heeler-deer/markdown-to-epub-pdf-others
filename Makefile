CHAPTERS = $(wildcard markdown/*.md)

EPUB_FILE = build/book.epub
PDF_FILE = build/book.pdf


.PHONY: all
all: $(EPUB_FILE) $(MOBI_FILE) $(PDF_FILE)

.PHONY: clean
clean:
	rm -f build/*

.PHONY: epub
epub: $(EPUB_FILE)


.PHONY: pdf
pdf: $(PDF_FILE)





$(EPUB_FILE): clean $(CHAPTERS) meta/title.txt meta/cover.jpg meta/stylesheet.css meta/metadata.xml 
	pandoc -t epub3\
		-o $(EPUB_FILE) \
		meta/title.txt \
		$(CHAPTERS) \
		--epub-cover-image=meta/cover.jpg \
		--css=meta/stylesheet.css \
		--epub-metadata=meta/metadata.xml \
		--table-of-contents
		

$(PDF_FILE): $(CHAPTERS) meta/title.txt
	pandoc \
		-o $(PDF_FILE) \
		meta/title.txt \
		$(CHAPTERS) \
		--toc



