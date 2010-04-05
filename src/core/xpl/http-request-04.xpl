<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:c="http://www.w3.org/ns/xproc-step"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This example also does a “post”, but it gets back binary.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:http-request>
    <p:input port="source">
      <p:inline>
        <c:request href="http://tests.xproc.org/service/fixed-binary" method="post">
          <c:body content-type="application/xml">
            <c:any-content/>
          </c:body>
        </c:request>
      </p:inline>
    </p:input>
  </p:http-request>

  <p:string-replace match="/c:body/text()"
                    replace="'… base64-binary-content-elided …'"/>

</p:pipeline>
