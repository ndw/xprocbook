<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>In this example, we select the element with a particular
<att>xml:id</att> where the ID value is an option to the pipeline.
    </para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <p xml:id="one">One</p>
      <p xml:id="two">Two</p>
      <p xml:id="three">Three</p>
    </doc>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>In real life it's unlikely that there would be value in having
   a default for the 'id' option, but it's convenient for the example.)
    </para>
  </p:documentation>

  <p:option name="id" select="'two'"/>
  <p:filter>
    <p:with-option name="select"
                   select="concat('//*[@xml:id=&quot;',$id,'&quot;]')"/>
  </p:filter>
</p:pipeline>
