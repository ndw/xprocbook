<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
		xmlns:c="http://www.w3.org/ns/xproc-step"
		xmlns:cx="http://xmlcalabash.com/ns/extensions"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
		xmlns:pl="http://www.w3.org/XML/XProc/docs/library"
                name="main" version="1.0">
  <p:input port="source"/>
  <p:input port="parameters" kind="parameter"/>
  <p:output port="result"/>

  <p:import href="/home/ndw/xmlcalabash.com/library/tee.xpl"/>

  <p:xinclude name="xinclude" fixup-xml-base="true" fixup-xml-lang="true"/>

<!--
  <cx:tee href="/tmp/xiout.xml" debug="1"/>

  <p:validate-with-relax-ng>
    <p:input port="schema">
      <p:data href="../schemas/xproc.rnc"/>
    </p:input>
  </p:validate-with-relax-ng>
-->

  <p:xslt name="patchdb">
    <p:input port="stylesheet">
      <p:document href="../style/patch-db.xsl"/>
    </p:input>
  </p:xslt>

  <cx:tee href="book-expanded.xml" debug="1"/>

  <p:xslt name="style">
    <p:input port="stylesheet">
      <p:document href="../style/html.xsl"/>
    </p:input>
  </p:xslt>

</p:declare-step>
