<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This example is predicated on the notion that the pipeline is
being used to implement some web service end point. The web server packages
up the request in XML and passes it on to our pipeline.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:diff='false'>
    <request xmlns="http://example.com/webservice">
      <uri>http://example.com/service</uri>
      <params>a=b&amp;c=d&amp;test=this%20or%20that</params>
    </request>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>A web service that simply returned its parameters decoded into
a <tag>c:param-set</tag> would be pretty pointless. In a real pipeline, they'd
probably be passed to <step>p:xslt</step> or some other step.</para>
  </p:documentation>

  <p:www-form-urldecode xmlns:ws="http://example.com/webservice">
    <p:with-option name="value" select="/ws:request/ws:params"/>
  </p:www-form-urldecode>

</p:pipeline>
