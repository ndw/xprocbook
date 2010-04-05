<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:c="http://www.w3.org/ns/xproc-step"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This example posts to an “echo” service that just sends back whatever
it receives.</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <p>This is what gets sent.</p>
    </doc>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>As you can see, we use other XProc steps to build up the request
wrapper for <step>p:http-request</step>.</para>
  </p:documentation>

  <p:wrap-sequence wrapper="c:body"/>

  <p:add-attribute match="/c:body" attribute-name="content-type"
                   attribute-value="application/xml"/>

  <p:wrap-sequence wrapper="c:request"/>

  <p:set-attributes match="/c:request">
    <p:input port="attributes">
      <p:inline>
        <dummy href="http://tests.xproc.org/service/echo" method="post"/>
      </p:inline>
    </p:input>
  </p:set-attributes>

  <p:http-request/>

</p:pipeline>
