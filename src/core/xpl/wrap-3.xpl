<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:h="http://www.w3.org/1999/xhtml"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>In this example, we use a more complex expression to group all
paragraphs except the first.</para>
  </p:documentation>

  <p:pipeinfo>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Some Document</title>
    </head>
    <body>
      <p>Some text.</p>
      <pre>Some example pre text.</pre>
      <p>Some more text.</p>
      <p>Yet even more text.</p>
      <p>A third paragraph.</p>
    </body>
    </html>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This is close to what we want, we're successfully grouping all the
paragraphs except the first, but if the goal was to <emphasis>only</emphasis>
wrap the non-first paragraphs, we're getting extra wrappers.</para>
<para>That's because each “first paragraph” forms its own group where the value
of the <option>group-adjacent</option> option is “<literal>false</literal>”.</para>
  </p:documentation>

  <p:wrap match="h:p" wrapper="div"
          wrapper-namespace="http://www.w3.org/1999/xhtml"
          group-adjacent="count(preceding-sibling::h:p) &gt; 1"/>
</p:pipeline>
