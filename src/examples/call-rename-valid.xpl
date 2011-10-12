<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:ex="http://example.com/pipeline/types"
            version='1.0'>
  <p:import href="do-stuff-and-rename.xpl"/>

  <!-- do some other stuff -->

  <ex:do-stuff-and-rename match="h:body/h:p">
    <p:namespaces xmlns:h="http://www.w3.org/1999/xhtml"/>
  </ex:do-stuff-and-rename>

  <!-- do some other stuff -->
</p:pipeline>
