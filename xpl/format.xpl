<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
		xmlns:c="http://www.w3.org/ns/xproc-step"
		xmlns:cx="http://xmlcalabash.com/ns/extensions"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
		xmlns:pl="http://www.w3.org/XML/XProc/docs/library"
                name="main" version="1.0">
  <p:input port="source"/>
  <p:input port="parameters" kind="parameter"/>
  <p:output port="result"/>
  <p:serialization port="result" method="xhtml" indent="false"/>

  <p:declare-step type="cx:message">
    <p:input port="source" sequence="true"/>
    <p:output port="result" sequence="true"/>
    <p:option name="message" required="true"/>
  </p:declare-step>

  <p:xinclude name="xinclude" fixup-xml-base="true" fixup-xml-lang="true">
    <p:log port="result" href="/tmp/xinclude.xml"/>
  </p:xinclude>

<!--
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

  <p:xslt name="style">
    <p:input port="stylesheet">
      <p:document href="../style/html.xsl"/>
    </p:input>
  </p:xslt>

  <p:xslt name="chunk">
    <p:input port="stylesheet">
      <p:document href="../style/hchunk.xsl"/>
    </p:input>
  </p:xslt>

  <p:sink/>

  <p:for-each>
    <p:iteration-source>
      <p:pipe step="chunk" port="secondary"/>
    </p:iteration-source>
    <p:output port="result">
      <p:pipe step="store" port="result"/>
    </p:output>

    <cx:message>
      <p:with-option name="message" select="base-uri(/)"/>
    </cx:message>

    <p:store name="store" method="xhtml">
      <p:with-option name="href" select="base-uri(/)"/>
    </p:store>
  </p:for-each>

  <p:count/>

</p:declare-step>
