<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
                name="main" version='1.0'>
  <p:input port="source"/>
  <p:input port="parameters" kind="parameter"/>
  <p:output port="result">
    <p:pipe step="style" port="result"/>
  </p:output>

  <p:xslt name="style">
    <p:input port="stylesheet">
      <p:document href="docbook.xsl"/>
    </p:input>
    <p:input port="parameters">
      <p:pipe step="main" port="parameters"/>
    </p:input>
  </p:xslt>
</p:declare-step>
