<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version='1.0'>
  <p:option name="schema"/>
  <p:option name="stylesheet"/>

  <p:xinclude name="include"/>

  <p:load name="load-schema">
    <p:with-option name="href" select="$schema"/>
  </p:load>

  <p:load name="load-stylesheet">
    <p:with-option name="href" select="$stylesheet"/>
  </p:load>

  <p:validate-with-relax-ng>
    <p:input port="source">
      <p:pipe step="include" port="result"/>
    </p:input>
    <p:input port="schema">
      <p:pipe step="load-schema" port="result"/>
    </p:input>
  </p:validate-with-relax-ng>

  <p:xslt>
    <p:input port="stylesheet">
      <p:pipe step="load-stylesheet" port="result"/>
    </p:input>
  </p:xslt>
</p:pipeline>
