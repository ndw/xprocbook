<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:c="http://www.w3.org/ns/xproc-step"
            version="1.0">
  <p:option name="a" select="'default a'"/>
  <p:option name="c" select="'default c'"/>
  <p:option name="test" select="'default test'"/>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>In this example, we package up some options as parameters for
a web service call.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>In a real pipeline, we'd almost certainly pass this <tag>c:request</tag>
element on to a <step>p:http-request</step> step, not return it.</para>
  </p:documentation>

  <p:www-form-urlencode match="/c:request/@href">
    <p:input port="source">
      <p:inline>
        <c:request method="get" href="@@"/>
      </p:inline>
    </p:input>
    <p:with-param name="a" select="$a"/>
    <p:with-param name="c" select="$c"/>
    <p:with-param name="test" select="$test"/>
  </p:www-form-urlencode>

  <p:string-replace match="/c:request/@href"
                    replace="concat('http://example.com/service?', .)"/>

</p:pipeline>
