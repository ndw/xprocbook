<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:c="http://www.w3.org/ns/xproc-step"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This example is like the previous, except that the web service
returns plain text.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:http-request>
    <p:input port="source">
      <p:inline>
        <c:request href="http://tests.xproc.org/service/fixed-text" method="post">
          <c:body content-type="application/xml">
            <c:any-content/>
          </c:body>
        </c:request>
      </p:inline>
    </p:input>
  </p:http-request>

</p:pipeline>
