<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>As we've seen in other examples, <step>p:try</step>/<step>p:catch</step>
can be used to recover from dynamic errors. In this example, we attempt to
load a valid document. If the document isn't valid, we load it anyway, but add
an attribute to the root element (so that subsequent pipeline processing
can tell, presumably).</para>

<para>This document also includes a DTD:</para>

    <programlisting
><xi:include xmlns:xi="http://www.w3.org/2001/XInclude"
             href="../docs/invalid.xml" parse="text"
/></programlisting>

    <para>But it is not valid. (a <tag>para</tag> appears where a
<tag>p</tag> is expected.)</para>

  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:option name="href" select="'../docs/invalid.xml'"/>

  <p:try>
    <p:group>
      <p:load dtd-validate="true">
        <p:with-option name="href" select="$href"/>
      </p:load>
    </p:group>
    <p:catch>
      <p:load dtd-validate="false">
        <p:with-option name="href" select="$href"/>
      </p:load>
      <p:add-attribute match="/*" attribute-name="INVALID"
                       attribute-value="document-failed-dtd-validation"/>
    </p:catch>
  </p:try>

</p:pipeline>
