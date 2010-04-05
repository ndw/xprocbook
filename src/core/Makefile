all: index.html

.PHONY: examples

index.html: reference.xml \
            add-attribute.xml add-xml-base.xml compare.xml count.xml delete.xml \
            directory-list.xml error.xml escape-markup.xml exec.xml filter.xml \
            hash.xml http-request.xml identity.xml insert.xml label-elements.xml \
            load.xml make-absolute-uris.xml namespace-rename.xml pack.xml \
            parameters.xml rename.xml replace.xml \
            set-attributes.xml sink.xml split-sequence.xml store.xml \
            string-replace.xml unescape-markup.xml unwrap.xml uuid.xml \
            validate-with-relax-ng.xml validate-with-schematron.xml \
            validate-with-xml-schema.xml wrap-sequence.xml wrap.xml \
            www-form-urldecode.xml www-form-urlencode.xml xinclude.xml xquery.xml \
            xsl-formatter.xml xslt.xml \
            examples
	calabash -isource=$< -oresult=$@ ../../xpl/format.xpl

examples:
	make -C build
