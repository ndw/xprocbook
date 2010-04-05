<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:h="http://www.w3.org/1999/xhtml"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This pipeline adds a <att>class</att> attribute to any
    HTML <tag namespace="http://www.w3.org/1999/xhtml">div</tag>
    that contains a <tag namespace="http://www.w3.org/1999/xhtml">pre</tag>.
    </para>
  </p:documentation>

  <p:pipeinfo>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Some Document</title>
    </head>
    <body>
      <div>
        <p>Some text.</p>
        <div>
          <pre>Some example pre text.</pre>
        </div>
      </div>
      <div>
        <pre>Some more example pre text.</pre>
      </div>
    </body>
    </html>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The <tag>p:add-attribute</tag> step replaces attributes if they
already exist:</para>
  </p:documentation>

  <p:pipeinfo>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Some Other Document</title>
    </head>
    <body>
      <div class="original value">
        <pre>Some example pre text.</pre>
      </div>
    </body>
    </html>
  </p:pipeinfo>

  <p:add-attribute match="h:div[h:pre]"
                   attribute-name="class"
                   attribute-value="example"/>

</p:pipeline>
