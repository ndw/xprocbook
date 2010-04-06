<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>In practice, the grammar is rarely “inlined” in the pipeline. In this,
and future examples, we'll simply load it from the filesystem.</para>
  </p:documentation>

  <p:pipeinfo><doc>
<title>Title</title>
<p>Some paragraph.</p>
</doc></p:pipeinfo>

  <p:validate-with-relax-ng>
    <p:input port="schema">
      <p:document href="../docs/grammar.rng"/>
    </p:input>
  </p:validate-with-relax-ng>
</p:pipeline>
