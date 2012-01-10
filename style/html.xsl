<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:db="http://docbook.org/ns/docbook"
		xmlns:t="http://docbook.org/xslt/ns/template"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:html="http://www.w3.org/1999/xhtml"
                xmlns:c="http://www.w3.org/ns/xproc-step"
                xmlns:deltaxml="http://www.deltaxml.com/ns/well-formed-delta-v1"
                exclude-result-prefixes="c db t html deltaxml"
                version="2.0">

<xsl:import href="/Volumes/Data/docbook/xslt20/xslt/base/html/docbook.xsl"/>
<xsl:import href="xprocns.xsl"/>
<xsl:import href="rngsyntax.xsl"/>

<xsl:param name="resource.root" select="'../'"/>

<xsl:param name="linenumbering" as="element()*">
<ln path="literallayout" everyNth="0"/>
<ln path="programlisting" everyNth="5" width="3" separator=" " padchar=" " minlines="3"/>
<ln path="programlistingco" everyNth="5" width="3" separator=" " padchar=" " minlines="3"/>
<ln path="screen" everyNth="5" width="3" separator=" " padchar=" " minlines="0"/>
<ln path="synopsis" everyNth="0"/>
<ln path="address" everyNth="0"/>
<ln path="epigraph/literallayout" everyNth="0"/>
</xsl:param>

<xsl:param name="refentry.generate.name" select="0"/>
<xsl:param name="refentry.generate.title" select="1"/>

<!-- ============================================================ -->

<xsl:template match="db:step">
  <xsl:call-template name="t:inline-monoseq"/>
</xsl:template>

<xsl:template match="db:port">
  <xsl:call-template name="t:inline-monoseq"/>
</xsl:template>

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
<!--
    <a href="#err.{$code}">
-->
      <code class="errqname">
	<xsl:text>err:X</xsl:text>
	<xsl:value-of select="ancestor::db:error[1]/@code"/>
      </code>
<!--
    </a>
-->
    <xsl:text>)</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="db:refclass"/>

<!-- ============================================================ -->

<xsl:template match="c:prettyprint">
  <div class="programlisting">
    <pre>
      <xsl:apply-templates mode="prettyprint"/>
    </pre>
  </div>
  <xsl:if test="matches(base-uri(.), '^.*/examples/.*\.xpl$')">
    <div class="exlink">
      <a href="build/xpl/{substring-after(base-uri(.),'examples/')}">
        <xsl:text>Download pipeline</xsl:text>
      </a>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template match="c:line" mode="prettyprint">
  <span class="line">
    <xsl:call-template name="linenumber"/>
    <span>
      <xsl:copy-of select="@class"/>
      <xsl:apply-templates/>
    </span>
  </span>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="c:prettyprint[@deltaxml:version]">
  <xsl:variable name="orig">
    <xsl:apply-templates mode="orig"/>
  </xsl:variable>
  <xsl:variable name="diff">
    <xsl:apply-templates mode="diff"/>
  </xsl:variable>

  <table class="pipelineexample" cellspacing="0" cellpadding="0">
    <tr>
      <th>Input</th>
      <th>→</th>
      <th>Output</th>
    </tr>
    <tr>
      <td valign="top">
        <div class="programlisting">
          <xsl:apply-templates select="$orig/*"/>
        </div>
      </td>
      <td valign="middle"><span class="arrow">&#160;</span></td>
      <td valign="top">
        <div class="programlisting">
          <xsl:apply-templates select="$diff/*"/>
        </div>
      </td>
    </tr>
  </table>
</xsl:template>

<xsl:template match="c:suppress-source">
  <xsl:variable name="diff">
    <xsl:apply-templates select="c:prettyprint[1]/*" mode="orig"/>
  </xsl:variable>

  <table class="pipelineexample" cellspacing="0" cellpadding="0">
    <tr>
      <th>Output</th>
    </tr>
    <tr>
      <td valign="top">
        <div class="programlisting">
          <xsl:apply-templates select="$diff/*"/>
        </div>
      </td>
    </tr>
  </table>
</xsl:template>

<xsl:template match="c:suppress-diff">
  <xsl:variable name="orig">
    <xsl:apply-templates select="c:prettyprint[1]/*" mode="orig"/>
  </xsl:variable>
  <xsl:variable name="diff">
    <xsl:apply-templates select="c:prettyprint[2]/*" mode="orig"/>
  </xsl:variable>

  <table class="pipelineexample" cellspacing="0" cellpadding="0">
    <tr>
      <th>Input</th>
      <th>→</th>
      <th>Output</th>
    </tr>
    <tr>
      <td valign="top">
        <div class="programlisting">
          <xsl:apply-templates select="$orig/*"/>
        </div>
      </td>
      <td valign="middle"><span class="arrow">&#160;</span></td>
      <td valign="top">
        <div class="programlisting">
          <xsl:apply-templates select="$diff/*"/>
        </div>
      </td>
    </tr>
  </table>
</xsl:template>

<xsl:template match="c:line">
  <div class="line">
    <xsl:call-template name="linenumber"/>
    <span>
      <xsl:copy-of select="@class"/>
      <xsl:apply-templates/>
    </span>
  </div>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="c:line" mode="orig">
  <xsl:copy>
    <xsl:copy-of select="@*"/>

    <xsl:choose>
      <xsl:when test="@deltaxml:deltaV2='A!=B'">
        <xsl:attribute name="class" select="'diff'"/>
        <xsl:apply-templates mode="orig"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates mode="orig"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:copy>
</xsl:template>

<xsl:template match="c:line[@deltaxml:deltaV2='B']" mode="orig"/>

<xsl:template match="deltaxml:attributes" mode="orig"/>

<xsl:template match="deltaxml:textGroup" mode="orig">
  <xsl:apply-templates select="deltaxml:text[@deltaxml:deltaV2='A']" mode="orig"/>
</xsl:template>

<xsl:template match="deltaxml:textGroup[@deltaxml:deltaV2='B']" mode="orig"/>

<xsl:template match="deltaxml:text" mode="orig">
  <xsl:apply-templates mode="orig"/>
</xsl:template>

<xsl:template match="*" mode="orig">
  <xsl:if test="not(@deltaxml:deltaV2='B')">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates mode="orig"/>
    </xsl:copy>
  </xsl:if>
</xsl:template>

<xsl:template match="comment()|processing-instruction()|text()" mode="orig">
  <xsl:copy/>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="c:line" mode="diff">
  <xsl:copy>
    <xsl:copy-of select="@*"/>

    <xsl:choose>
      <xsl:when test="@deltaxml:deltaV2='A!=B'">
        <xsl:attribute name="class" select="'diff'"/>
        <xsl:apply-templates mode="diff"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates mode="diff"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:copy>
</xsl:template>

<xsl:template match="c:line[@deltaxml:deltaV2='A']" mode="diff">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:attribute name="class" select="'del'"/>
    <xsl:apply-templates mode="diff"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="c:line[@deltaxml:deltaV2='B']" mode="diff">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:attribute name="class" select="'add'"/>
    <xsl:apply-templates mode="diff"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="deltaxml:attributes" mode="diff"/>

<xsl:template match="deltaxml:textGroup" mode="diff">
  <xsl:apply-templates select="deltaxml:text[@deltaxml:deltaV2='B']" mode="diff"/>
</xsl:template>

<xsl:template match="deltaxml:textGroup[@deltaxml:deltaV2='A']" mode="diff"/>

<xsl:template match="deltaxml:text" mode="diff">
  <xsl:apply-templates mode="diff"/>
</xsl:template>

<xsl:template match="*" mode="diff">
  <xsl:if test="not(@deltaxml:deltaV2='A')">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates mode="diff"/>
    </xsl:copy>
  </xsl:if>
</xsl:template>

<xsl:template match="comment()|processing-instruction()|text()" mode="diff">
  <xsl:copy/>
</xsl:template>

<!-- ============================================================ -->

<xsl:template name="t:css">
  <link rel="stylesheet" type="text/css" href="../css/docbook.css"/>
  <link rel="stylesheet" type="text/css" href="../css/pygments.css"/>
  <link rel="stylesheet" type="text/css" href="../css/xprocbook.css"/>
</xsl:template>

<xsl:template name="linenumber">
  <xsl:variable name="line" select="ancestor-or-self::c:line"/>
  <xsl:variable name="plines"
                select="$line/preceding-sibling::c:line"/>
  <xsl:variable name="num" select="count($plines[not(contains(@class,'del'))])+1"/>
  <xsl:choose>
    <xsl:when test="contains($line/@class, 'del')">
      <span class="linenumber"><xsl:text>   </xsl:text></span>
      <span class="linenumber-separator"><xsl:text> </xsl:text></span>
    </xsl:when>
    <xsl:when test="$num = 1 or $num mod 5 = 0">
      <span class="linenumber">
        <xsl:if test="$num &lt; 10"><xsl:text> </xsl:text></xsl:if>
        <xsl:if test="$num &lt; 100"><xsl:text> </xsl:text></xsl:if>
        <xsl:value-of select="$num"/>
      </span>
      <span class="linenumber-separator"><xsl:text> </xsl:text></span>
    </xsl:when>
    <xsl:otherwise>
      <span class="linenumber"><xsl:text>   </xsl:text></span>
      <span class="linenumber-separator"><xsl:text> </xsl:text></span>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
