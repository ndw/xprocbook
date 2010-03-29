all: examples index.html

index.html: reference.xml \
            recursive-directory-list.xml
	calabash -isource=$< -oresult=$@ ../../xpl/format.xpl

examples:
	make -C results
