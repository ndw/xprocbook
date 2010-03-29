all: book.html

book.html: $(wildcard *.xml) \
           reference
	calabash -isource=book.xml -oresult=$@ ../xpl/format.xpl

reference:
	make -C core/results
	make -C fileutils/results
	make -C osutils/results
	make -C utils/results

