<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:my-errors="http://www.example.org/error"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>A <step>p:error</step> always fails. In the example below, we
catch it with a <step>p:try</step>.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Without the <step>p:try</step>, the failure would have caused the
pipeline processor to abort the pipeline. How (or if) the processor reports
an error in that case is <glossterm>implementation-defined</glossterm>.
    </para>
  </p:documentation>

  <p:try>
    <p:group>
      <p:error code="my-errors:fall-down-go-bang">
        <p:input port="source">
          <p:inline><doc>Nothing to see here.</doc></p:inline>
        </p:input>
      </p:error>
    </p:group>
    <p:catch name="uh-oh">
      <p:identity>
        <p:input port="source">
          <p:pipe step="uh-oh" port="error"/>
        </p:input>
      </p:identity>
    </p:catch>
  </p:try>
</p:pipeline>
