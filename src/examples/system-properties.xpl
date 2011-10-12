<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="1.0"
                xmlns:cx="http://xmlcalabash.com/ns/extensions"
                exclude-inline-prefixes="cx"
                name="main">
<p:output port="result"/>
<p:serialization port="result" indent="true"/>

<p:template>
  <p:input port="source"><p:empty/></p:input>
  <p:input port="template">
    <p:inline>
      <system-properties>
        <standard-properties>
          <episode>{$episode}</episode>
          <language>{$language}</language>
          <product-name>{$product-name}</product-name>
          <product-version>{$product-version}</product-version>
          <vendor>{$vendor}</vendor>
          <vendor-uri>{$vendor-uri}</vendor-uri>
          <version>{$version}</version>
          <xpath-version>{$xpath-version}</xpath-version>
          <psvi-supported>{$psvi-supported}</psvi-supported>
        </standard-properties>
        <calabash-properties>
          <general-values>{$general-values}</general-values>
          <xpointer-on-text>{$xpointer-on-text}</xpointer-on-text>
          <transparent-json>{$transparent-json}</transparent-json>
        </calabash-properties>
        <unknown-property>{$fred}</unknown-property>
      </system-properties>
    </p:inline>
  </p:input>
  <p:with-param name="episode" select="p:system-property('p:episode')"/>
  <p:with-param name="language" select="p:system-property('p:language')"/>
  <p:with-param name="product-name" select="p:system-property('p:product-name')"/>
  <p:with-param name="product-version" select="p:system-property('p:product-version')"/>
  <p:with-param name="vendor" select="p:system-property('p:vendor')"/>
  <p:with-param name="vendor-uri" select="p:system-property('p:vendor-uri')"/>
  <p:with-param name="version" select="p:system-property('p:version')"/>
  <p:with-param name="xpath-version" select="p:system-property('p:xpath-version')"/>
  <p:with-param name="psvi-supported" select="p:system-property('p:psvi-supported')"/>

  <p:with-param name="general-values" select="p:system-property('cx:general-values')"/>
  <p:with-param name="xpointer-on-text" select="p:system-property('cx:xpointer-on-text')"/>
  <p:with-param name="transparent-json" select="p:system-property('cx:transparent-json')"/>
  <p:with-param name="fred" select="p:system-property('cx:fred')"/>
</p:template>

</p:declare-step>
