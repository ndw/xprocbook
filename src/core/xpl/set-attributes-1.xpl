<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:h="http://www.w3.org/1999/xhtml"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This pipeline adds both <att>role</att> and <att>version</att>
attributes to any matching section.</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <section role="introduction">
        <para>section content</para>
      </section>
      <section>
        <para>other section content</para>
      </section>
    </doc>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The <tag>p:set-attributes</tag> step replaces attributes if
    they already exist:</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <section role="introduction" version="old-version">
        <para>section content</para>
      </section>
      <section version="old-version">
        <para>other section content</para>
      </section>
    </doc>
  </p:pipeinfo>

  <p:set-attributes match="section[not(@role)]">
    <p:input port="attributes">
      <p:inline>
        <irrelevant-element-name role="new-role" version="new-version"/>
      </p:inline>
    </p:input>
  </p:set-attributes>

</p:pipeline>
