all: examples index.html

index.html: env.xml cwd.xml info.xml
	calabash -isource=reference.xml -oresult=$@ ../../xpl/format.xpl

examples:
	make -C results
