<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>If you load a compact syntax schema with <tag>p:data</tag> (instead
of <tag>p:document</tag>) then XML Calabash will validate with that.</para>
  </p:documentation>

  <p:pipeinfo><doc>
<title>Title</title>
<p>Some paragraph.</p>
</doc></p:pipeinfo>

  <p:validate-with-relax-ng>
    <p:input port="schema">
      <p:data href="../docs/grammar.rnc"/>
    </p:input>
  </p:validate-with-relax-ng>
</p:pipeline>
