<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
		xmlns:c="http://www.w3.org/ns/xproc-step"
		xmlns:cx="http://xmlcalabash.com/ns/extensions"
                type="cx:http-get"
                version="1.0">
  <p:output port="result"/>
  <p:option name="href" required="true"/>
  <p:option name="username"/>
  <p:option name="password"/>

  <p:identity>
    <p:input port="source">
      <p:inline><c:request method="GET" href="@@"/></p:inline>
    </p:input>
  </p:identity>

  <p:string-replace match="/c:request/@href">
    <p:with-option name="replace"
                   select="concat('&quot;', $href, '&quot;')"/>
  </p:string-replace>

  <p:choose>
    <p:when test="p:value-available('username')">
      <p:add-attribute match="/c:request" attribute-name="username">
        <p:with-option name="attribute-value" select="$username"/>
      </p:add-attribute>
      <p:add-attribute match="/c:request" attribute-name="password">
        <p:with-option name="attribute-value" select="$password"/>
      </p:add-attribute>
    </p:when>
    <p:otherwise>
      <p:identity/>
    </p:otherwise>
  </p:choose>

  <p:http-request/>
</p:declare-step>
