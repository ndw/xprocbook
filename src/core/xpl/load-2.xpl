<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This time we'll load a document that includes a DTD.</para>

    <programlisting
><xi:include xmlns:xi="http://www.w3.org/2001/XInclude"
             href="../docs/valid.xml" parse="text"
/></programlisting>

    <para>This document is valid.</para>

  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:option name="href" select="'../docs/valid.xml'"/>
  <p:load dtd-validate="true">
    <p:with-option name="href" select="$href"/>
  </p:load>
</p:pipeline>
