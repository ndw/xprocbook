<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
		xmlns:c="http://www.w3.org/ns/xproc-step"
		xmlns:cx="http://xmlcalabash.com/ns/extensions"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:exf="http://exproc.org/standard/functions"
                name="main" version="1.0">
  <p:input port="parameters" kind="parameter"/>

  <p:import href="/home/ndw/xmlcalabash.com/extension/steps/library-1.0.xpl"/>
  <p:import href="/home/ndw/xmlcalabash.com/library/tee.xpl"/>

  <p:directory-list include-filter=".*-1.xml$" name="find1">
    <p:with-option name="path" select="exf:cwd()"/>
  </p:directory-list>

  <p:directory-list include-filter=".*-01.xml$" name="find01">
    <p:with-option name="path" select="exf:cwd()"/>
  </p:directory-list>

  <p:wrap-sequence wrapper="irrelevant">
    <p:input port="source">
      <p:pipe step="find1" port="result"/>
      <p:pipe step="find01" port="result"/>
    </p:input>
  </p:wrap-sequence>

  <p:for-each name="stepout">
    <p:iteration-source select="//c:file"/>

<!--
    <cx:message>
      <p:with-option name="message"
                     select="if (contains(/*/@name, '-01.xml'))
                             then concat(substring-before(/*/@name, '-01.xml'),'-.*')
                             else concat(substring-before(/*/@name, '-1.xml'),'-.*')"/>
    </cx:message>
-->

    <p:directory-list>
      <p:with-option name="path" select="exf:cwd()"/>
      <p:with-option name="include-filter"
                     select="if (contains(/*/@name, '-01.xml'))
                             then concat(substring-before(/*/@name, '-01.xml'),'-.*')
                             else concat(substring-before(/*/@name, '-1.xml'),'-.*')"/>
    </p:directory-list>

    <p:for-each>
      <p:iteration-source select="//c:file"/>

      <p:string-replace match="/*/@href">
        <p:input port="source">
          <p:inline xmlns:xi="http://www.w3.org/2001/XInclude"
                    exclude-inline-prefixes="p c cx xs db exf">
            <xi:include href="@@"
                        xpointer="xpath(/*/node^(^))"/>
          </p:inline>
        </p:input>
        <p:with-option name="replace"
                       select="concat('&quot;', /*/@name, '&quot;')"/>
      </p:string-replace>
    </p:for-each>

    <p:wrap-sequence wrapper="db:wrapper"/>

    <p:store>
      <p:with-option name="href"
                     select="if (contains(/*/@name, '-01.xml'))
                             then concat(exf:cwd(), '/', substring-before(/*/@name, '-01.xml'),'.xml')
                             else concat(exf:cwd(), '/', substring-before(/*/@name, '-1.xml'),'.xml')">
        <p:pipe step="stepout" port="current"/>
      </p:with-option>
    </p:store>
  </p:for-each>

</p:declare-step>
