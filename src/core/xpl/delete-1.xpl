<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:h="http://www.w3.org/1999/xhtml"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This pipeline deletes elements with a <att>class</att> attribute
that contains the string “<literal>del</literal>”.</para>
  </p:documentation>

  <p:pipeinfo>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Some Document</title>
    </head>
    <body>
      <div>
        <p class="add">This is new text.</p>
        <p class="del">Some text.</p>
        <div>
          <pre class="chg">Some pre text.</pre>
        </div>
      </div>
      <div class="del strikeout">
        <pre>Some more example pre text.</pre>
      </div>
    </body>
    </html>
  </p:pipeinfo>

  <p:delete match="*[contains(@class,'del')]"/>

</p:pipeline>
