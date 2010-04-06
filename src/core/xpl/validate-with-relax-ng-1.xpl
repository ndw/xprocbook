<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            name="main"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The simplest use of <step>p:validate-with-relax-ng</step> simply validates
a document.</para>
  </p:documentation>

  <p:pipeinfo><doc>
<title>Title</title>
<p>Some paragraph.</p>
</doc></p:pipeinfo>

  <p:identity>
    <p:input port="source">
      <p:inline>
<grammar xmlns="http://relaxng.org/ns/structure/1.0">
  <start>
    <ref name="doc"/>
  </start>
  <define name="doc">
    <element name="doc">
      <optional>
        <ref name="title"/>
      </optional>
      <zeroOrMore>
        <ref name="p"/>
      </zeroOrMore>
    </element>
  </define>
  <define name="title">
    <element name="title">
      <text/>
    </element>
  </define>
  <define name="p">
    <element name="p">
      <text/>
    </element>
  </define>
</grammar>
      </p:inline>
    </p:input>
  </p:identity>

  <p:validate-with-relax-ng>
    <p:input port="source">
      <p:pipe step="main" port="source"/>
    </p:input>
    <p:input port="schema"/>
  </p:validate-with-relax-ng>
</p:pipeline>
