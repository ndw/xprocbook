<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
                name="main" version='1.0'>
  <p:input port="source"/>
  <p:input port="params1" kind="parameter"/>
  <p:input port="params2" kind="parameter"/>
  <p:output port="result"/>

  <p:xslt>
    <p:input port="stylesheet">
      <p:document href="docbook.xsl"/>
    </p:input>
    <p:input port="parameters">
      <p:pipe step="main" port="params1"/>
    </p:input>
  </p:xslt>

  <p:xslt>
    <p:input port="stylesheet">
      <p:document href="docbook.xsl"/>
    </p:input>
    <p:input port="parameters">
      <p:pipe step="main" port="params2"/>
    </p:input>
  </p:xslt>
</p:declare-step>
