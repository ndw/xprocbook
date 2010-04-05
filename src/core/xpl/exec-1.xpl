<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The optional <step>p:exec</step> step runs external processes.
    </para>
  </p:documentation>

  <p:pipeinfo><doc>
  <p>Some text.</p>
</doc></p:pipeinfo>

  <p:exec command="/bin/cat" result-is-xml="true"/>

</p:pipeline>
