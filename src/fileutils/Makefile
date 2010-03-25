all: examples index.html

index.html: reference.xml \
            copy.xml delete.xml head.xml info.xml mkdir.xml move.xml \
            tail.xml tempfile.xml touch.xml
	calabash -isource=reference.xml -oresult=$@ ../../xpl/format.xpl

examples:
	make -C results
