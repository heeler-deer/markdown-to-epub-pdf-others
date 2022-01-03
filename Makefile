CHAPTERS = $(wildcard markdown/*.md)

EPUB_FILE = build/book.epub
PDF_FILE = build/book.pdf
MOBI_FILE = build/book.mobi

.PHONY: all
all: $(EPUB_FILE) $(MOBI_FILE) $(PDF_FILE)


.PHONY: cleanall
cleanall:
	rm -f build/*

.PHONY: cleanepub
cleanepub:
	rm -f build/*.epub

.PHONY: cleanpdf
cleanpdf:
	rm -f build/*.pdf
	
.PHONY: cleanmobi
cleanmobi:
	rm -f build/*.mobi


.PHONY: epub
epub: $(EPUB_FILE)


.PHONY: pdf
pdf: $(PDF_FILE)

.PHONY: mobi
mobi: $(MOBI_FILE)



$(EPUB_FILE): cleanepub $(CHAPTERS) meta/title.txt meta/cover.jpg meta/stylesheet.css meta/metadata.xml 
	pandoc -t epub3\
		-o $(EPUB_FILE) \
		meta/title.txt \
		$(CHAPTERS) \
		--epub-cover-image=meta/cover.jpg \
		--css=meta/stylesheet.css \
		--epub-metadata=meta/metadata.xml \
		--table-of-contents
		

$(PDF_FILE): cleanpdf $(CHAPTERS) meta/title.txt
	pandoc \
		-o $(PDF_FILE) \
		meta/title.txt \
		$(CHAPTERS) \
		--toc


$(MOBI_FILE): cleanmobi $(EPUB_FILE)
	kindlegen $(EPUB_FILE)
