<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            xmlns:foaf="http://xmlns.com/foaf/0.1/"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This example uses a UUID to generate a globally unique identifier.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions">
    <doc>
      <id>@@</id>
      <p>Some text.</p>
    </doc>
  </p:pipeinfo>

  <p:uuid match="/doc/id/text()" version="4"/>
</p:pipeline>
