<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:c="http://www.w3.org/ns/xproc-step"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This example shows a <tag>c:multipart</tag> result.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:http-request>
    <p:input port="source">
      <p:inline>
        <c:request href="http://tests.xproc.org/service/fixed-multipart"
                   method="get"/>
      </p:inline>
    </p:input>
  </p:http-request>

  <p:string-replace match="c:body[@encoding='base64']"
                    replace="'… base64-binary-content-elided …'"/>

</p:pipeline>
