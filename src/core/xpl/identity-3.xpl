<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:db="http://docbook.org/ns/docbook"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Another common use is in one of the branches of a
<step>p:choose</step>.</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <para>Hello world!</para>
    </doc>
  </p:pipeinfo>

  <p:choose>
    <p:when test="/db:*">
      <p:xslt>
        <p:input port="stylesheet">
          <p:document href="docbook.xsl"/>
        </p:input>
      </p:xslt>
    </p:when>
    <p:otherwise>
      <p:identity/>
    </p:otherwise>
  </p:choose>
</p:pipeline>
