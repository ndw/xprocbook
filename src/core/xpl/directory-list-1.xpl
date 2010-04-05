<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>What's in my “XProc book” directory? Let's see! (This
    example pipeline is in a directory a couple of levels below the
    main book directory, hence the “<filename
    class="directory">../..</filename>”.)</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:diff='false' cx:show-source="false">
    <doc/>
  </p:pipeinfo>

  <p:directory-list path="../.."/>

</p:pipeline>
