<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:h="http://www.w3.org/1999/xhtml"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>We can jump this last hurdle by changing the
<option>match</option> option so that it doesn't even consider
first paragraphs.</para>
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

  <p:wrap match="h:p[count(preceding-sibling::h:p) &gt; 1]" wrapper="div"
          wrapper-namespace="http://www.w3.org/1999/xhtml"
          group-adjacent="count(preceding-sibling::h:p) &gt; 1"/>
</p:pipeline>
