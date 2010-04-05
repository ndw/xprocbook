<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
		xmlns:c="http://www.w3.org/ns/xproc-step"
		xmlns:cx="http://xmlcalabash.com/ns/extensions"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:exf="http://exproc.org/standard/functions"
                name="main" version="1.0">
  <p:input port="parameters" kind="parameter"/>

  <p:option name="href" required="true"/>

  <p:import href="/home/ndw/xmlcalabash.com/library/eval.xpl"/>
  <p:import href="/home/ndw/xmlcalabash.com/extension/steps/library-1.0.xpl"/>
  <p:import href="/home/ndw/xmlcalabash.com/extension/steps/namespace-delete.xpl"/>
  <p:import href="/home/ndw/xmlcalabash.com/library/tee.xpl"/>

  <p:load name="xpl">
    <p:with-option name="href" select="concat(exf:cwd(), '/../xpl/', $href)"/>
  </p:load>

  <p:delete match="p:documentation[db:*]"/>
  <p:delete match="p:pipeinfo"/>

  <p:exec command="/opt/local/bin/xmllint" args="--format --nsclean -"/>

  <p:exec command="/projects/xproc/bin/prettyprint"
          result-is-xml="true">
    <p:input port="source" select="/*/*"/>
  </p:exec>

  <p:identity>
    <p:input port="source" select="/*/*"/>
  </p:identity>

  <p:store>
    <p:with-option name="href"
                   select="concat(exf:cwd(), '/examples/', $href)"/>
  </p:store>

  <p:for-each name="for-each">
    <p:iteration-source select="//p:pipeinfo[not(@cx:parameters='true')]">
      <p:pipe step="xpl" port="result"/>
    </p:iteration-source>

    <p:variable name="basename"
                select="concat($href,'-',p:iteration-position(),'.xml')"/>

    <p:choose name="load">
      <p:when test="/*/@cx:href">
        <p:output port="result"/>
        <p:load>
          <p:with-option name="href" select="resolve-uri(/*/@cx:href, base-uri(.))"/>
        </p:load>
      </p:when>
      <p:otherwise>
        <p:output port="result"/>
        <p:identity>
          <p:input port="source" select="/p:pipeinfo/*"/>
        </p:identity>
      </p:otherwise>
    </p:choose>

    <cx:namespace-delete prefixes="p h cx"
                         xmlns:h="http://www.w3.org/1999/xhtml"/>

    <p:exec command="/opt/local/bin/xmllint" args="--format --nsclean -"/>

    <p:exec command="/projects/xproc/bin/prettyprint"
            result-is-xml="true">
      <p:input port="source" select="/*/*"/>
    </p:exec>

    <p:identity name="ppinput">
      <p:input port="source" select="/*/*"/>
    </p:identity>

    <p:identity name="params">
      <p:input port="source" select="//p:pipeinfo[@cx:parameters='true']/c:param-set">
        <p:pipe step="xpl" port="result"/>
      </p:input>
    </p:identity>

     <cx:eval name="runpipe">
      <p:input port="source">
        <p:pipe step="load" port="result"/>
      </p:input>
      <p:input port="pipeline">
        <p:pipe step="xpl" port="result"/>
      </p:input>
      <p:input port="parameters">
        <p:pipe step="params" port="result"/>
      </p:input>
      <p:input port="options">
        <p:empty/>
      </p:input>
    </cx:eval>

    <cx:namespace-delete prefixes="p h cx"
                         xmlns:h="http://www.w3.org/1999/xhtml"/>

    <p:exec command="/opt/local/bin/xmllint" args="--format --nsclean -"/>

    <p:exec command="/projects/xproc/bin/prettyprint"
            result-is-xml="true">
      <p:input port="source" select="/*/*"/>
    </p:exec>

    <p:identity name="ppoutput">
      <p:input port="source" select="/*/*"/>
    </p:identity>

    <p:choose>
      <p:when test="/*/@cx:show-source = 'false'">
        <p:xpath-context>
          <p:pipe step="for-each" port="current"/>
        </p:xpath-context>

        <p:identity>
          <p:input port="source">
            <p:pipe step="ppoutput" port="result"/>
          </p:input>
        </p:identity>

        <p:wrap-sequence wrapper="c:suppress-source"/>

      </p:when>

      <p:when test="/*/@cx:diff = 'false'">
        <p:xpath-context>
          <p:pipe step="for-each" port="current"/>
        </p:xpath-context>

        <p:identity>
          <p:input port="source">
            <p:pipe step="ppinput" port="result"/>
            <p:pipe step="ppoutput" port="result"/>
          </p:input>
        </p:identity>

        <p:wrap-sequence wrapper="c:suppress-diff"/>

      </p:when>

      <p:otherwise>
        <cx:delta-xml>
          <p:input port="source">
            <p:pipe step="ppinput" port="result"/>
          </p:input>
          <p:input port="alternate">
            <p:pipe step="ppoutput" port="result"/>
          </p:input>
          <p:input port="dxp">
            <p:document href="diff.dxp"/>
          </p:input>
        </cx:delta-xml>
      </p:otherwise>
    </p:choose>

    <p:store>
      <p:with-option name="href"
                     select="concat(exf:cwd(), '/diffs/', $basename)"/>
    </p:store>
  </p:for-each>

  <p:xslt>
    <p:input port="source">
      <p:pipe step="xpl" port="result"/>
    </p:input>
    <p:input port="stylesheet">
      <p:document href="../style/extract-example-xml.xsl"/>
    </p:input>
  </p:xslt>

  <p:store>
    <p:with-option name="href"
                   select="concat(exf:cwd(), '/', substring-before($href,'.xpl'), '.xml')"/>
  </p:store>

</p:declare-step>
