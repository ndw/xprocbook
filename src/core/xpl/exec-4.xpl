<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The exit status is available through the non-primary
“<port>exit-status</port>” port.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Because it's an error to leave a primary output port unbound,
in this example we explicitly discard it with <step>p:sink</step>. In
a real pipeline, we'd probably be doing something useful with the output.</para>
  </p:documentation>

  <p:exec name="ls" command="/bin/ls" result-is-xml="false" args="-l ../docs"
          wrap-result-lines="true">
    <p:input port="source">
      <p:empty/>
    </p:input>
  </p:exec>

  <p:sink/>

  <p:identity>
    <p:input port="source">
      <p:pipe step="ls" port="exit-status"/>
    </p:input>
  </p:identity>

</p:pipeline>
