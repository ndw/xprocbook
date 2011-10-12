HOST=http://localhost:8350
# http://microwave:8151/

all: book.html

book.html: $(wildcard *.xml) \
           reference
	calabash -isource=book.xml -oresult=$@ ../xpl/format.xpl
	rm -f chunked/*
	cd chunked && saxon ../book.html ../../style/hchunk.xsl

post:
	for f in ../css/*.css; do \
          post -u admin -p xyzzy -f $$f $(HOST)/post/css/; \
        done
	for f in images/*.png; do \
          post -u admin -p xyzzy -f $$f $(HOST)/post/book/$$f; \
        done
	for f in chunked/*.html; do \
          post -u admin -p xyzzy -f $$f $(HOST)/post/book/; \
        done

reference:
	make -C core/results
	make -C fileutils/results
	make -C osutils/results
	make -C utils/results

