<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:h="http://www.w3.org/1999/xhtml"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This pipeline replaces the paragraph with the “<literal>summary</literal>”
role with a new paragraph.</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <para role="summary">Some text.</para>
      <para>Some other text.</para>
    </doc>
  </p:pipeinfo>

  <p:replace match="para[@role='summary']">
    <p:input port="replacement">
      <p:inline>
        <para>Static text.</para>
      </p:inline>
    </p:input>
  </p:replace>

</p:pipeline>
