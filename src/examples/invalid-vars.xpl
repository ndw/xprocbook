<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version='1.0'>
  <p:option name="href"/>

  <p:variable name="abshref" select="resolve-uri($href, 'http://example.com/')"/>

  <p:load>
    <p:with-option name="href" select="$abshref"/>
  </p:load>

  <p:variable name="version" select="/*/@version"/>

  ...
</p:pipeline>
