<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:c="http://www.w3.org/ns/xproc-step"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Here's an alternative way to construct the
<step>c:request</step> document:</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <p>This is what gets sent.</p>
    </doc>
  </p:pipeinfo>

  <p:insert match="/c:request/c:body" position="first-child">
    <p:input port="source">
      <p:inline>
        <c:request href="http://tests.xproc.org/service/echo" method="post">
          <c:body content-type="application/xml"/>
        </c:request>
      </p:inline>
    </p:input>
  </p:insert>

  <p:http-request/>

</p:pipeline>
