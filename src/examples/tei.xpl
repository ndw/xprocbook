<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version='1.0'>
  <p:xinclude/>

  <p:validate-with-relax-ng>
    <p:input port="schema">
      <p:document href="tei.rng"/>
    </p:input>
  </p:validate-with-relax-ng>

  <p:xslt>
    <p:input port="stylesheet">
      <p:document href="tei.xsl"/>
    </p:input>
  </p:xslt>
</p:pipeline>
