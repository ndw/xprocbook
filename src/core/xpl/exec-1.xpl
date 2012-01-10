<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The optional <step>p:exec</step> step runs external processes.
    </para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              xmlns:c="http://www.w3.org/ns/xproc-step"
              cx:diff="true"><c:result><doc>
  <p>Some text.</p>
</doc></c:result></p:pipeinfo>

  <p:exec command="/bin/cat" result-is-xml="true"/>

</p:pipeline>
