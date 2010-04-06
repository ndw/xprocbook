<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            name="main"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>When an assertion fails, the error message is sent to the
<port>report</port> port.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:diff='false'>
<chapter xmlns="http://docbook.org/ns/docbook">
<title>Chapter title</title>
<para>What about this book: <biblioref linkend="bibl"/>.</para>

<bibliography xml:id="bibl">
<bibliomixed xml:id="someid"><abbrev>BOOK</abbrev> Title, Author,
etc.</bibliomixed>
</bibliography>
</chapter></p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>If you want to read the <port>report</port> output, you must specify
that <option>assert-valid</option> is “<literal>false</literal>”, otherwise
the step fails and there's no way to read the <port>report</port> output.
    </para>
  </p:documentation>

  <p:validate-with-schematron name="schematron" assert-valid="false">
    <p:input port="schema">
      <p:document href="../docs/rules.sch"/>
    </p:input>
  </p:validate-with-schematron>

  <p:sink/>

  <p:identity>
    <p:input port="source">
      <p:pipe step="schematron" port="report"/>
    </p:input>
  </p:identity>

</p:pipeline>
