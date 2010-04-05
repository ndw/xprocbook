<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:c="http://www.w3.org/ns/xproc-step"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Without <code><att>detailed</att>="<literal>true</literal>"</code>,
you just get back the resource:</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Just like the first example!</para>
  </p:documentation>

  <p:http-request>
    <p:input port="source">
      <p:inline>
        <c:request href="http://tests.xproc.org/docs/helloworld.xml" method="get"/>
      </p:inline>
    </p:input>
  </p:http-request>

</p:pipeline>
