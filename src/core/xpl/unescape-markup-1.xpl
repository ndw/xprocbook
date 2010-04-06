<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This example simply decodes some encoded text:</para>
  </p:documentation>

  <p:pipeinfo><description>
  &lt;p>This is a chunk.&lt;/p>
  &lt;p>This is a another chunk.&lt;/p>
</description>
</p:pipeinfo>

  <p:unescape-markup/>
</p:pipeline>
