<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            name="main"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Type information doesn't show up in the serialized output, but it
can be used in the pipeline, as we see here:</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:diff='false'>
<doc>
<title>Title</title>
<div>
<p>Some paragraph
with a uri: <uri>http://example.com/</uri>.</p>
</div>
</doc></p:pipeinfo>

  <p:identity>
    <p:input port="source" select="//element(*,xs:anyURI)"/>
  </p:identity>

  <p:wrap-sequence name="wrapper1" wrapper="uris-before-validation"/>

  <p:validate-with-xml-schema>
    <p:input port="source">
      <p:pipe step="main" port="source"/>
    </p:input>
    <p:input port="schema">
      <p:document href="../docs/document.xsd"/>
    </p:input>
  </p:validate-with-xml-schema>

  <p:identity>
    <p:input port="source" select="//element(*,xs:anyURI)"/>
  </p:identity>

  <p:wrap-sequence name="wrapper2" wrapper="uris-after-validation"/>

  <p:wrap-sequence wrapper="uris">
    <p:input port="source">
      <p:pipe step="wrapper1" port="result"/>
      <p:pipe step="wrapper2" port="result"/>
    </p:input>
  </p:wrap-sequence>

</p:pipeline>
