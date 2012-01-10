<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:h="http://www.w3.org/1999/xhtml"
		exclude-result-prefixes="h xs"
                version="2.0">

<xsl:key name="id" match="*" use="@id|@name"/>

<xsl:template match="/">
  <xsl:variable name="chunks">
    <xsl:apply-templates select="h:html" mode="chunk"/>
  </xsl:variable>

  <xsl:result-document href="/tmp/chunk.xml">
    <xsl:sequence select="$chunks"/>
  </xsl:result-document>

  <xsl:apply-templates select="$chunks/h:chunks"/>

  <!--
  <xsl:sequence select="$chunks"/>
  -->
</xsl:template>

<xsl:template match="h:chunks">
  <xsl:apply-templates select="h:chunk"/>
</xsl:template>

<xsl:template match="h:chunk">
  <xsl:message>writing: <xsl:value-of select="@fn"/></xsl:message>
  <xsl:result-document href="{@fn}">
    <xsl:apply-templates select="h:html"/>
  </xsl:result-document>
  <xsl:apply-templates select="h:chunk"/>
</xsl:template>

<xsl:template match="h:head">
  <xsl:copy>
    <xsl:copy-of select="@*"/>

    <xsl:choose>
      <xsl:when test="ancestor::h:chunk[2]">
        <link rel="up" href="{ancestor::h:chunk[2]/@fn}" title="Up" />
      </xsl:when>
      <xsl:otherwise>
        <link rel="up" href="/" title="Up" />
      </xsl:otherwise>
    </xsl:choose>

    <link rel="prev" title="Previous" href="{preceding::h:chunk[1]/@fn}"/>
    <link rel="next" title="Next" href="{following::h:chunk[1]/@fn}"/>

    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

<xsl:template match="h:a[starts-with(@href,'#')]">
  <xsl:variable name="target" select="key('id', substring-after(@href,'#'))"/>
  <xsl:variable name="id" select="substring-after(@href, '#')"/>

  <xsl:choose>
    <xsl:when test="count($target) = 1">
      <xsl:copy>
        <xsl:copy-of select="@*"/>
        <xsl:choose>
          <xsl:when test="$target/parent::h:body">
            <xsl:attribute name="href" select="$target/ancestor::h:chunk[1]/@fn"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="href"
                           select="concat($target/ancestor::h:chunk[1]/@fn, @href)"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates/>
      </xsl:copy>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message>Cannot patch link: <xsl:value-of select="@href"/>; <xsl:value-of select="count($target)"/> targets.</xsl:message>
      <xsl:copy>
        <xsl:copy-of select="@*"/>
        <xsl:apply-templates/>
      </xsl:copy>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="*">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

<xsl:template match="comment()|processing-instruction()|text()">
  <xsl:copy/>
</xsl:template>

<!-- ============================================================ -->
<!-- chunking -->

<xsl:template match="h:html" mode="chunk">
  <chunks>
    <xsl:apply-templates select="h:body" mode="chunk"/>
  </chunks>
</xsl:template>

<xsl:template match="h:body" mode="chunk">
  <xsl:apply-templates select="h:article" mode="chunk"/>
</xsl:template>

<xsl:template match="h:article[@class='book' or @class='part' or @class='reference']"
              mode="chunk">
  <xsl:variable name="class" select="@class"/>

  <!--
  <xsl:message><xsl:value-of select="@class"/></xsl:message>
  -->

  <chunk fn="{$class}-{count(preceding::h:article[@class=$class])+1}.html">
    <html>
      <xsl:copy-of select="/h:html/h:head"/>
      <body>
        <xsl:copy>
          <xsl:copy-of select="@*"/>
          <xsl:copy-of select="node() except h:article"/>
        </xsl:copy>
      </body>
    </html>
    <xsl:apply-templates select="h:article" mode="chunk"/>
  </chunk>
</xsl:template>

<xsl:template match="h:article" mode="chunk">
  <xsl:variable name="class" select="@class"/>

  <!--
  <xsl:message><xsl:value-of select="@class"/></xsl:message>
  -->

  <chunk fn="{$class}-{count(preceding::h:article[@class=$class])+1}.html">
    <html>
      <xsl:copy-of select="/h:html/h:head"/>
      <body>
        <xsl:copy>
          <xsl:copy-of select="@*"/>
          <xsl:copy-of select="node()"/>
        </xsl:copy>
      </body>
    </html>
  </chunk>
</xsl:template>

<!-- ============================================================ -->

</xsl:stylesheet>
