<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:c="http://www.w3.org/ns/xproc-step"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Unfortunately, the results aren't very useful. By specifying
<att>detailed</att>, we can get more information:</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
  <para>Now at least we can see the status code.</para>
  </p:documentation>

  <p:http-request>
    <p:input port="source">
      <p:inline>
        <c:request href="http://tests.xproc.org/docs/basic-auth" method="get"
                   detailed="true"/>
      </p:inline>
    </p:input>
  </p:http-request>

</p:pipeline>
