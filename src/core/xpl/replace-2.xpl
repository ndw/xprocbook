<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            name="main"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The preceding example isn't very practical because the replacement
text is static. For a more realistic example, consider this pipeline which
uses XSLT to update the summary paragraph, then uses <step>p:replace</step>
to replace the original with the new version.</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <para role="summary">Some text.</para>
      <para>Some other text.</para>
    </doc>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>(Though a <step>p:viewport</step> would make more sense here.)</para>
  </p:documentation>

  <p:xslt>
    <p:input port="source" select="//para[@role='summary']"/>
    <p:input port="stylesheet">
      <p:inline>
        <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                        version="2.0">
          <xsl:template match="para">
            <xsl:copy>
              <xsl:copy-of select="@*"/>
              <xsl:text>In summary: </xsl:text>
              <xsl:apply-templates/>
            </xsl:copy>
          </xsl:template>
        </xsl:stylesheet>
      </p:inline>
    </p:input>
  </p:xslt>

  <p:replace match="para[@role='summary']">
    <p:input port="source">
      <p:pipe step="main" port="source"/>
    </p:input>
  </p:replace>
</p:pipeline>
