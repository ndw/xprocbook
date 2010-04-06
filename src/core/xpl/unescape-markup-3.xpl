<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Simply unescaping the markup in this HTML example would not yield a
well-formed XML result. By specifying a <literal>text/html</literal>
<option>content-type</option>, we give the processor the ability to perform
appropriate “fixup” on the markup.</para>
  </p:documentation>

  <p:pipeinfo><wrapper>
&lt;html>
&lt;title>Some title&lt;/title>
&lt;h1>Some title&lt;/h1>
&lt;p>This is some&lt;br>
HTML text
&lt;p>It isn't well-formed XML&lt;br>
by any stretch of the imagination
</wrapper></p:pipeinfo>

  <p:unescape-markup content-type="text/html"/>
</p:pipeline>

