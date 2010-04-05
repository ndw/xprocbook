<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            name="main"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Pipelines can't directly access parameters by name (because the
names of parameters aren't known in advance). To find out what parameters
were passed to the pipeline, the <step>p:parameters</step> step is first
used to create a document, then that document can be interrogated with
XPath.</para>
    <para>This pipeline just prints the parameters passed to it (in this case,
<literal>param</literal> with the value “<literal>value</literal>” and
<literal>cx:test</literal> with the value “<literal>othervalue</literal>”).</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:parameters='true'>
    <c:param-set xmlns:c="http://www.w3.org/ns/xproc-step">
      <c:param name="param" value="value"/>
      <c:param name="cx:test" value="othervalue"/>
    </c:param-set>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Note that neither the <port>parameters</port> port nor the
    <port>result</port> output on <step>p:parameters</step> are
    primary, so we must connect to them explicitly.</para>
  </p:documentation>

  <p:parameters name="params">
    <p:input port="parameters">
      <p:pipe step="main" port="parameters"/>
    </p:input>
  </p:parameters>

  <p:identity>
    <p:input port="source">
      <p:pipe step="params" port="result"/>
    </p:input>
  </p:identity>

</p:pipeline>
