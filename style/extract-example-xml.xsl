<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:cx="http://xmlcalabash.com/ns/extensions"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns="http://docbook.org/ns/docbook"
                exclude-result-prefixes="db p"
                version="2.0">

<xsl:output method="xml" encoding="utf-8" indent="no"
	    omit-xml-declaration="yes"/>

<xsl:variable name="basename"
              select="replace(base-uri(/), '^.*/', '')"/>

<xsl:template match="/">
  <wrapper>
    <xsl:apply-templates/>
  </wrapper>
</xsl:template>

<xsl:template match="p:pipeline|p:declare-step">
  <xsl:apply-templates select="p:documentation[db:*]|p:pipeinfo"/>
</xsl:template>

<xsl:template match="p:documentation">
  <xsl:copy-of select="*"/>

  <xsl:if test="not(preceding-sibling::p:documentation[db:*])">
    <xi:include href="examples/{$basename}"/>
  </xsl:if>
</xsl:template>

<xsl:template match="p:pipeinfo[not(@cx:parameters='true')]">
  <xsl:variable name="num" select="count(preceding::p:pipeinfo)+1"/>
  <xi:include href="diffs/{$basename}-{$num}.xml"/>
</xsl:template>

</xsl:stylesheet>
