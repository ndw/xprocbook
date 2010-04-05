<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>To encode an entire document, place it in a wrapper first.
The easiest way to do that is with <step>p:wrap-sequence</step>.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:href="../docs/document.xml"/>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Then in subsequent steps, such as <step>p:http-request</step>, you
    can extract the contents of the wrapper, as necessary.</para>
  </p:documentation>

  <p:wrap-sequence wrapper="my-wrapper"/>
  <p:escape-markup/>

</p:pipeline>
