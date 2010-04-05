<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:c="http://www.w3.org/ns/xproc-step"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Finally, let's send the correct <att>username</att> and
<att>password</att> so that we can actually get the resource!</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:http-request>
    <p:input port="source">
      <p:inline>
        <c:request href="http://tests.xproc.org/docs/basic-auth" method="get"
                   detailed="true" auth-method="Basic" username="testuser"
                   password="testpassword"/>
      </p:inline>
    </p:input>
  </p:http-request>

</p:pipeline>
