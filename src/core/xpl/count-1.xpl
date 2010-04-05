<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This pipeline counts the number of paragraphs in the document.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:diff='false'>
    <doc>
      <para>First para.</para>
      <para>Second para.</para>
      <para>Third para.</para>
    </doc>
  </p:pipeinfo>

  <p:count>
    <p:input port="source" select="//para"/>
  </p:count>

</p:pipeline>
