<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:c="http://www.w3.org/ns/xproc-step"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>If you want simply to test whether or not you can access a resource,
specifying both <att>detailed</att> and <att>status-only</att> simplifies things
even further.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:http-request>
    <p:input port="source">
      <p:inline>
        <c:request href="http://tests.xproc.org/docs/basic-auth" method="get"
                   detailed="true" status-only="true"/>
      </p:inline>
    </p:input>
  </p:http-request>

</p:pipeline>
