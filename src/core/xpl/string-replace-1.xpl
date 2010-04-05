<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This example updates the class attributes in a document:</para>
  </p:documentation>

  <p:pipeinfo>
    <div>
      <p class="oldclass red">Red.</p>
      <p class="oldclass">Old.</p>
      <p class="otherclass oldclass">Something else.</p>
    </div>
  </p:pipeinfo>

  <p:string-replace match="*[@class='oldclass']/@class" replace="'newclass'"/>
</p:pipeline>
