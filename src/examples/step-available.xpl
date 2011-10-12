<p:pipeline xmlns:p="http://www.w3.org/ns/xproc" version="1.0"
            xmlns:s="http://nwalsh.com/ns/steps"
            exclude-inline-prefixes="s"
            name="main">
  <p:serialization port="result" indent="true"/>

  <p:pipeline type="s:mytype">
    <p:identity/>
  </p:pipeline>

  <p:template>
    <p:input port="template">
      <p:inline>
        <available>
          <mytype available="{$a1}">true, s:mytype is declared above</mytype>
          <notype available="{$a2}">false, there's no declaration for s:notype</notype>
          <identity available="{$a3}">always true, all processors support p:identity</identity>
          <template available="{$a4}">true only if the p:template step is supported</template>
        </available>
      </p:inline>
    </p:input>
    <p:with-param name="a1" select="p:step-available('s:mytype')"/>
    <p:with-param name="a2" select="p:step-available('s:notype')"/>
    <p:with-param name="a3" select="p:step-available('p:identity')"/>
    <p:with-param name="a4" select="p:step-available('p:template')"/>
  </p:template>

</p:pipeline>
