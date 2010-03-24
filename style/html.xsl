<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:db="http://docbook.org/ns/docbook"
		xmlns:t="http://docbook.org/xslt/ns/template"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:html="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="db t html"
                version="2.0">

<xsl:import href="/sourceforge/docbook/xsl2/base/html/docbook.xsl"/>
<xsl:import href="xprocns.xsl"/>

<xsl:template match="db:step">
  <xsl:call-template name="t:inline-monoseq"/>
</xsl:template>

<xsl:template match="db:port">
  <xsl:call-template name="t:inline-monoseq"/>
</xsl:template>

<!--
<xsl:template match="db:refentry">
  <hr />
  <xsl:next-match/>
</xsl:template>
-->

<xsl:template match="db:error">
  <xsl:variable name="code" select="@code"/>
  <xsl:variable name="num" select="count(preceding::db:error[@code=$code])"/>

  <a name="err.inline.{@code}{if ($num&gt;0) then concat('.',$num) else ''}"/>

  <xsl:choose>
    <xsl:when test="node()">
      <xsl:apply-templates/>
    </xsl:when>
    <xsl:otherwise>
      <code>err:<xsl:value-of select="$code"/></code>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:glossterm">
  <xsl:variable name="term" select="string(.)"/>
  <xsl:variable name="anchorterm"
                select="if (@baseform) then @baseform else normalize-space($term)"/>

  <xsl:next-match/>

  <xsl:if test="ancestor::db:error
		and ($anchorterm = 'static error' or $anchorterm = 'dynamic error')">
    <xsl:variable name="code" select="ancestor::db:error[1]/@code"/>
    <xsl:text>&#160;(</xsl:text>
    <a href="#err.{$code}">
      <code class="errqname">
	<xsl:text>err:X</xsl:text>
	<xsl:value-of select="ancestor::db:error[1]/@code"/>
      </code>
    </a>
    <xsl:text>)</xsl:text>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
