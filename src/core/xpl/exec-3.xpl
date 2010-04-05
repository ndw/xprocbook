<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The <option>wrap-result-lines</option> option can make it
easier for other XML processes to work with the lines of non-XML output.
    </para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:exec command="/bin/ls" result-is-xml="false" args="-l ../docs"
          wrap-result-lines="true">
    <p:input port="source">
      <p:empty/>
    </p:input>
  </p:exec>

</p:pipeline>
