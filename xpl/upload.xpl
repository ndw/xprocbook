<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
		xmlns:c="http://www.w3.org/ns/xproc-step"
		xmlns:ml="http://xmlcalabash.com/ns/extensions/marklogic"
                xmlns:exf="http://exproc.org/standard/functions"
		exclude-inline-prefixes="c ml exf"
		name="main" version="1.0">
<p:output port="result">
  <p:pipe step="insert" port="result"/>
</p:output>
<p:option name="href" required="true"/>

<p:import href="/home/ndw/xmlcalabash.com/extension/steps/library-1.0.xpl"/>

<p:variable name="uri"
            select="substring-after(resolve-uri($href, exf:cwd()), '/xproc/src')"/>

<p:load>
  <p:with-option name="href" select="resolve-uri($href, exf:cwd())"/>
</p:load>

<ml:insert-document name="insert"
                    user="admin" password="admin" host="localhost" port="7102">
  <p:with-option name="uri" select="$uri"/>
</ml:insert-document>

</p:declare-step>
