<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:h="http://www.w3.org/1999/xhtml"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The <step>p:unwrap</step> step uses a
    <emphasis>match</emphasis> pattern which can apply at many different depths
in the document tree. In particular, note that the unwrapped content is also
subject to unwrapping.</para>
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

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Using a simple <option>match</option> pattern of <literal>div</literal>
effectively removes <emphasis>every single</emphasis> <tag>div</tag> from
the document.</para>
  </p:documentation>

  <p:unwrap match="h:div"/>
</p:pipeline>
