<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>You can be more selective by changing <option>match</option>
and other options.</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <p>One</p>
      <p xml:id='second'>Two</p>
      <p>Three</p>
    </doc>
  </p:pipeinfo>

  <p:label-elements match="p" replace="false" label='concat("ID-",$p:index)'/>
</p:pipeline>
