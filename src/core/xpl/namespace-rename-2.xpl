<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>It can also be used to change the namespace associated with
attributes.</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <para href="http://www.w3.org/">Some text.</para>
    </doc>
  </p:pipeinfo>

  <p:namespace-rename from="" to="http://www.w3.org/1999/xlink"
                      apply-to="attributes"/>

</p:pipeline>
