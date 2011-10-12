<p:pipeline xmlns:p="http://www.w3.org/ns/xproc" version="1.0"
            xmlns:s="http://nwalsh.com/ns/steps"
            exclude-inline-prefixes="s"
            name="main">
  <p:serialization port="result" indent="true"/>

  <p:pipeline type="s:example">
    <p:option name="opt1" required="true"/>
    <p:option name="opt2" select="'default'"/>
    <p:option name="opt3"/>
    <p:option name="opt4"/>
    <p:variable name="var" select="'some value'"/>

    <p:template>
      <p:input port="template">
        <p:inline>
          <available>
            <opt1 available="{$opt1a}">always true, because the caller is required to provide a value</opt1>
            <opt2 available="{$opt2a}">always true, because the pipeline provides a default</opt2>
            <opt3 available="{$opt3a}">true only if the caller provides a value</opt3>
            <opt4 available="{$opt4a}">true only if the caller provides a value</opt4>
            <var available="{$vara}">always true, because variables must have values</var>
          </available>
        </p:inline>
      </p:input>
      <p:with-param name="opt1a" select="p:value-available('opt1')"/>
      <p:with-param name="opt2a" select="p:value-available('opt2')"/>
      <p:with-param name="opt3a" select="p:value-available('opt3')"/>
      <p:with-param name="opt4a" select="p:value-available('opt4')"/>
      <p:with-param name="vara" select="p:value-available('var')"/>
    </p:template>
  </p:pipeline>

  <s:example opt1="reqd" opt3="supplied"/>

</p:pipeline>
