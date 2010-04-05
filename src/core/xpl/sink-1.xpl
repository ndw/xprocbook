<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>There's nothing much to show, really, <step>p:sink</step> is just
a bit bucket. In this example, we explicitly discard the primary output of
the <step>p:xslt</step> step and return only the content of its secondary
output.</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <para>Hello world.</para>
    </doc>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Without the <step>p:sink</step>, the XProc processor would have
complained about the unbound primary output port on the <step>p:xslt</step>
step.</para>
  </p:documentation>

  <p:xslt name="style">
    <p:input port="stylesheet">
      <p:inline>
        <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                        version="2.0">
          <xsl:template match="/">
            <xsl:sequence select="."/>

            <xsl:result-document href="http://example.com/foo">
              <doc>
                <p>Secondary result document.</p>
              </doc>
            </xsl:result-document>
          </xsl:template>
        </xsl:stylesheet>
      </p:inline>
    </p:input>
  </p:xslt>

  <p:sink/>

  <p:identity>
    <p:input port="source">
      <p:pipe step="style" port="secondary"/>
    </p:input>
  </p:identity>

</p:pipeline>
