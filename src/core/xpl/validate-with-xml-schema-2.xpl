<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            name="main"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>XML Schema output is a PSVI which may include both defaulted attributes
and type information. Here we see a default attribute added to the <tag>div</tag>
element.</para>
  </p:documentation>

  <p:pipeinfo><doc>
<title>Title</title>
<div>
<p>Some paragraph.</p>
</div>
</doc></p:pipeinfo>

  <p:validate-with-xml-schema>
    <p:input port="schema">
      <p:document href="../docs/document.xsd"/>
    </p:input>
  </p:validate-with-xml-schema>
</p:pipeline>
