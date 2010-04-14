<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:h="http://www.w3.org/1999/xhtml"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Here we use <step>p:wrap</step> to wrap each <tag>p</tag> in 
a <tag>div</tag>.</para>
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

  <p:wrap match="h:p" wrapper="div" wrapper-namespace="http://www.w3.org/1999/xhtml"/>
</p:pipeline>
