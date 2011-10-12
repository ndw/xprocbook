<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:html="http://www.w3.org/1999/xhtml"
            xmlns:ex="http://example.com/pipeline/types"
            type="ex:do-stuff-and-rename"
            version='1.0'>
  <p:option name="oldname" required="true"/>
  <p:option name="newname" select="'html:div'"/>

  <!-- do some stuff -->

  <p:rename>
    <p:with-option name="match" select="$oldname"/>
    <p:with-option name="new-name" select="$newname"/>
  </p:rename>

  <!-- do some stuff -->
</p:pipeline>
