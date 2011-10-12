<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:param name="p1" select="'default-p1'"/>
<xsl:param name="p2" select="'default-p2'"/>

<xsl:template match="/">
  <doc>
    <param p1="{$p1}"/>
    <param p2="{$p2}"/>
  </doc>
</xsl:template>

</xsl:stylesheet>
