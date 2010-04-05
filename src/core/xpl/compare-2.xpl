<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>If <option>fail-if-not-equal</option> is
“<literal>true</literal>”, then the step fails when the documents
are different.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:diff='false'>
    <doc>
      <para>Not the same.</para>
    </doc>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>And succeeds if they're the same.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:diff='false'>
<doc>
      <para>First para.</para>
      <para>Second para.</para>
      <para>Third para.</para>
    </doc>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <note>
      <para>The <step>p:compare</step> step is
      <emphasis>very</emphasis> sensitive to changes in the document.
      Changes in the leading and trailing whitespace around the
      document element, for example, is enough to make the documents
      different. As shown, the “pretty printed” examples in this book would
      actually be different because there is extra whitespace inside the
      <tag>p:inline</tag> elements.</para>
      <para>If you look at the source for the pipelines, you'll see that
      we very carefully made the whitespace the same.</para>
    </note>
  </p:documentation>

  <p:try>
    <p:group>
      <p:compare fail-if-not-equal="true">
        <p:input port="alternate">
      <p:inline><doc>
      <para>First para.</para>
      <para>Second para.</para>
      <para>Third para.</para>
    </doc></p:inline>
        </p:input>
      </p:compare>
      <p:identity>
        <p:input port="source">
          <p:inline><PASS/></p:inline>
        </p:input>
      </p:identity>
    </p:group>
    <p:catch>
      <p:identity>
        <p:input port="source">
          <p:inline><FAIL/></p:inline>
        </p:input>
      </p:identity>
    </p:catch>
  </p:try>

</p:pipeline>
