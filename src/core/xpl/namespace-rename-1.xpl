<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>One use of <step>p:namepace-rename</step> is to move content that
is (or isn't) in a namespace into (or out of) a namespace.</para>
  </p:documentation>

  <p:pipeinfo>
    <html>
      <head>
        <title>My Title</title>
      </head>
      <body>
        <p>Hello world.</p>
      </body>
    </html>
  </p:pipeinfo>

  <p:namespace-rename from="" to="http://www.w3.org/1999/xhtml"/>
</p:pipeline>
