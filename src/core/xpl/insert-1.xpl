<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The <step>p:insert</step> step inserts one document into
another. You select where and at what position to make the insertion,
before the matched location:</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <div>
        <p>Play.</p>
      </div>
    </doc>
  </p:pipeinfo>

  <p:insert match="/doc/div" position="before">
    <p:input port="insertion">
      <p:inline>
        <p>Hello world.</p>
      </p:inline>
    </p:input>
  </p:insert>
</p:pipeline>
