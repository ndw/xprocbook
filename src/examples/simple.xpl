<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version='1.0'>
  <p:xinclude/>

  <p:validate-with-relaxng>
    <p:input port="schema">
      <p:document href="docbook.rng"/>
    </p:input>
  </p:validate-with-relaxng>

  <p:xslt>
    <p:input port="stylesheet">
      <p:document href="docbook.xsl"/>
    </p:input>
  </p:xslt>
</p:pipeline>
