<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The <step>p:label-elements</step> step is most often used
to add <att>xml:id</att> attributes (or ID attributes with some other
name) to elements. By default, it does this for all elements, replacing
any existing values:</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <p>One</p>
      <p xml:id='second'>Two</p>
      <p>Three</p>
    </doc>
  </p:pipeinfo>

  <p:label-elements/>
</p:pipeline>
