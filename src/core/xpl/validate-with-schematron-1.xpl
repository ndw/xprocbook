<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            name="main"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The Schematron language is (XPath) rule based, rather than grammar
based (like XML Schema and RELAX NG). As a consequence, it can be used to test
assertions of arbitrary complexity.</para>

    <para>One such example is the DocBook rule about bibliography references.
The DocBook <tag>biblioref</tag> element <emphasis>must</emphasis> point to a
bibliography entry. Grammar-based parsers can check that the IDREF attribute on
a <tag>biblioref</tag> element points to an ID that exists, but they don't check
to see what kind of element has that ID.</para>

    <para>Enter Schematron. Here's a simple rule that tests <tag>biblioref</tag>
elements:</para>

<programlisting><![CDATA[<s:pattern name="'biblioref' type constraint">
   <s:rule context="db:biblioref[@linkend]">
      <s:assert test="local-name(//*[@xml:id=current()/@linkend]) = 'bibliomixed'
          and namespace-uri(//*[@xml:id=current()/@linkend])
              = 'http://docbook.org/ns/docbook'">@linkend on biblioref must point
to a bibliography entry.</s:assert>
   </s:rule>
</s:pattern>
]]></programlisting>

<para>This rule asserts that when a <tag>bibloref</tag> element has a
<att>linkend</att> attribute, that attribute's value must be the
<att>xml:id</att> value of a <tag>bibliomixed</tag> element in the
DocBook namespace. (A slight simplification of
the real rule which checks for a few other elements as well.)</para>
  </p:documentation>

  <p:pipeinfo><chapter xmlns="http://docbook.org/ns/docbook">
<title>Chapter title</title>
<para>What about this book: <biblioref linkend="someid"/>.</para>

<bibliography>
<bibliomixed xml:id="someid"><abbrev>BOOK</abbrev> Title, Author,
etc.</bibliomixed>
</bibliography>
</chapter></p:pipeinfo>

  <p:validate-with-schematron>
    <p:input port="schema">
      <p:document href="../docs/rules.sch"/>
    </p:input>
  </p:validate-with-schematron>
</p:pipeline>
