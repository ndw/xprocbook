<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>After the matched location:</para>
  </p:documentation>

  <p:pipeinfo>
    <doc>
      <div>
        <p>Play.</p>
      </div>
    </doc>
  </p:pipeinfo>

  <p:insert match="/doc/div" position="after">
    <p:input port="insertion">
      <p:inline>
        <p>Goodbye, cruel world.</p>
      </p:inline>
    </p:input>
  </p:insert>
</p:pipeline>
