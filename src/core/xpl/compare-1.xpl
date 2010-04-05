<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
                version="1.0">
  <p:input port="source"/>
  <p:output port="result">
    <p:pipe step="compare" port="result"/>
  </p:output>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This pipeline compares its single input document against
a fixed alternative. It returns true if they're the same.</para>
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
    <para>It returns false if they're different.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:diff='false'>
    <doc>
      <para>Not the same.</para>
    </doc>
  </p:pipeinfo>

  <p:compare name="compare">
    <p:input port="alternate">
      <p:inline><doc>
      <para>First para.</para>
      <para>Second para.</para>
      <para>Third para.</para>
    </doc></p:inline>
    </p:input>
  </p:compare>

</p:declare-step>

