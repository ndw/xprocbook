<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">

    <para>This examples in this section rely on the fact that the
    input document is constructed using an XML feature called external
    parsed entities:</para>

      <programlisting><![CDATA[<!DOCTYPE book [
<!ENTITY ch01 SYSTEM "chaps/ch01.xml">
<!ENTITY ch02 SYSTEM "chaps/ch02.xml">
<!ENTITY appa SYSTEM "apps/appa.xml">
]>
<book>
<title>Some Title</title>
&ch01;
&ch02;
&appa;
</book>]]></programlisting>

      <para>When the parser expands the entities, the base URI of the
      parts becomes part of the data model, but it's not reflected in the
      serialized form shown below. This is <emphasis>precisely</emphasis>
      the problem that <step>p:add-xml-base</step> is designed to address.
      </para>

    <para>With that caveat, we can see how this pipeline adds
    <att>xml:base</att> attributes where necessary in the document.</para>

  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:href="../docs/main.xml"/>

  <p:add-xml-base/>

</p:pipeline>
