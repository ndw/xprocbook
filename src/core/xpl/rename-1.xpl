<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:h="http://www.w3.org/1999/xhtml"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This pipeline renames the <tag>para</tag> elements to
<tag>p</tag>:</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <?vocabulary pseudo-docbook?>
      <para role="summary">Some text.</para>
      <para>Some other text.</para>
    </doc>
  </p:pipeinfo>

  <p:rename match="para" new-name="h:p"/>

</p:pipeline>
