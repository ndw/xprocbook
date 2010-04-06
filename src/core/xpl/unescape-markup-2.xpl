<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The <option>namespace</option> option can be used to specify the
default namespace.</para>
  </p:documentation>

  <p:pipeinfo><description>
  &lt;p>This is a chunk.&lt;/p>
  &lt;p>This is a another chunk.&lt;/p>
</description></p:pipeinfo>

  <p:unescape-markup namespace="http://www.w3.org/1999/xhtml"/>

</p:pipeline>
