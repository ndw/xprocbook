<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:h="http://www.w3.org/1999/xhtml"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Using <option>group-adjacent</option> we can group elements together.
Notice how it's the value of the <option>group-adjacent</option> option that
matters. The expression <code>local-name(.)</code> will be the same for
both <tag>p</tag> elements, so they match.
    </para>
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
    </body>
    </html>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The first and second paragraphs are not adjacent because a
    <tag>pre</tag> intervenes.</para>
  </p:documentation>

  <p:wrap match="h:p" wrapper="div"
          wrapper-namespace="http://www.w3.org/1999/xhtml"
          group-adjacent="local-name(.)"/>
</p:pipeline>
