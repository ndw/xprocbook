<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>A common use of <step>p:identity</step> is to extract some
portion or portions of a document.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions" cx:diff="false">
    <doc>
      <para>Hello world!</para>
      <div>
        <para>Work.</para>
        <para>Sleep.</para>
        <para>Eat.</para>
        <para>Play.</para>
      </div>
      <para>Goodbye, cruel world.</para>
    </doc>
  </p:pipeinfo>

  <p:identity>
    <p:input port="source" select="/doc/div"/>
  </p:identity>
</p:pipeline>
