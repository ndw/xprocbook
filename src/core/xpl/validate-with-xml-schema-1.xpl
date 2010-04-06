<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            name="main"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The simplest use of <step>p:validate-with-xml-schema</step> simply validates
a document.</para>
  </p:documentation>

  <p:pipeinfo><doc>
<title>Title</title>
<p>Some paragraph.</p>
</doc></p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>FIXME: more examples, showing all the various options and what
they do.</para>
  </p:documentation>

  <p:validate-with-xml-schema>
    <p:input port="schema">
      <p:document href="../docs/document.xsd"/>
    </p:input>
  </p:validate-with-xml-schema>
</p:pipeline>
