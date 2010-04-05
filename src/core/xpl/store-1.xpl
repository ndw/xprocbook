<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>In this example, we store a document to the filesystem.
    </para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:store name="store" href="/tmp/out.xml"/>

  <p:identity>
    <p:input port="source">
      <p:pipe step="store" port="result"/>
    </p:input>
  </p:identity>

</p:pipeline>
