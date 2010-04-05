<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>In this example, we load a document specified in an option.
    </para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:option name="href" select="'../docs/document.xml'"/>
  <p:load>
    <p:with-option name="href" select="$href"/>
  </p:load>
</p:pipeline>
