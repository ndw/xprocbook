<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
		xmlns:c="http://www.w3.org/ns/xproc-step"
		xmlns:cx="http://xmlcalabash.com/ns/extensions"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
		xmlns:pl="http://www.w3.org/XML/XProc/docs/library"
                name="main" version="1.0">
  <p:input port="source"/>
  <p:input port="parameters" kind="parameter"/>
  <p:output port="result"/>

  <p:xinclude name="xinclude"/>

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

</p:declare-step>
