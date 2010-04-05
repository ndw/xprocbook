<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>If you only want the XML files, use a filter:</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:diff='false' cx:show-source="false">
    <doc/>
  </p:pipeinfo>

  <p:directory-list path="../.." include-filter="^.*\.xml$"/>

</p:pipeline>
