<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Many processes produce non-XML markup, which has to be encoded.
    In this case, the external process does not expect any input, so we
    explicitly make the <port>source</port> empty.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:exec command="/bin/ls" result-is-xml="false" args="-l ../docs">
    <p:input port="source">
      <p:empty/>
    </p:input>
  </p:exec>

</p:pipeline>
