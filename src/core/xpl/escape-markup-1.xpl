<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Some non-XML systems require markup to be escaped. This can
be achieved with the <step>p:escape-markup</step> step.
    </para>
  </p:documentation>

  <p:pipeinfo><document>
  <para>This is a paragraph of text.</para>
  <para>So is this</para>
</document></p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Observe that <step>p:escape-markup</step> <emphasis>does not</emphasis>
escape the document element of its input. It can't. If it did, the output of
the step would not be well-formed XML.</para>
  </p:documentation>

  <p:escape-markup/>

</p:pipeline>
