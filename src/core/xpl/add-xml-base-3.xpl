<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The <option>all</option> option can be used to force
<att>xml:base</att> attributes throughout.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:href="../docs/main.xml"/>

  <p:add-xml-base relative="false" all="true"/>

</p:pipeline>
