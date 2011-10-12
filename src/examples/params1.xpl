<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
                version='1.0'>
  <p:input port="parameters" kind="parameter"/>
  <p:output port="result"/>
  <p:serialization port="result" indent="true"/>

  <p:xslt>
    <p:input port="source"><p:inline><doc/></p:inline></p:input>
    <p:input port="stylesheet">
      <p:document href="show-params.xsl"/>
    </p:input>
    <p:with-param name="p1" select="'with-param value'"/>
  </p:xslt>
</p:declare-step>
