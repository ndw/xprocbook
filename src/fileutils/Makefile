all: examples index.html

index.html: pipe.xpl \
            copy.xml delete.xml head.xml info.xml mkdir.xml move.xml \
            reference.xml schemas.xml tail.xml tempfile.xml touch.xml
	calabash -oresult=$@ pipe.xpl

examples:
	make -C results
