<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>In the following example, the <att>href</att> attribute is
made absolute:</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <link href="../test.xml"/>
      <div xml:base="http://example.com/path/">
        <link href="relative.xml"/>
      </div>
    </doc>
  </p:pipeinfo>

  <p:make-absolute-uris match="@href"/>

</p:pipeline>
