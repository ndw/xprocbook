VPATH = ../examples
.SUFFIXES: .xml .xpl

all: head-1.xml head-2.xml head-3.xml head-4.xml \
     tail-1.xml tail-2.xml tail-3.xml tail-4.xml \
     copy-1.xml

.xpl.xml:
	calabash -oresult=$@ $<
