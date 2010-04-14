<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:h="http://www.w3.org/1999/xhtml"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>You might think that the more complex <option>match</option>
    expression was sufficient, but it isn't. See what happens when we
    remove the <option>group-adjacent</option>?</para>
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
    <para>Although we still avoid first paragraphs, we no longer get the
    grouping.</para>
  </p:documentation>

  <p:wrap match="h:p[count(preceding-sibling::h:p) &gt; 1]" wrapper="div"
          wrapper-namespace="http://www.w3.org/1999/xhtml"/>
</p:pipeline>
