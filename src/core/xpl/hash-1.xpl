<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            xmlns:foaf="http://xmlns.com/foaf/0.1/"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>The FOAF (“friend of a friend”) project specifies an
SHA1 checksum as an alternative for email addresses (so that the addresses
can't be harvested by spammers).</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions">
    <foaf:Person
      xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
      xmlns:foaf="http://xmlns.com/foaf/0.1/"
      rdf:about="http://norman.walsh.name/knows/who#norman-walsh">
  <foaf:name>Norman Walsh</foaf:name>
  <foaf:nick>norm</foaf:nick>
  <foaf:nick>ndw</foaf:nick>
  <foaf:nick>nwalsh</foaf:nick>

  <foaf:mbox rdf:resource="mailto:ndw@nwalsh.com"/>
  <foaf:mbox_sha1sum>@@</foaf:mbox_sha1sum>
    </foaf:Person>
  </p:pipeinfo>

  <p:hash algorithm="sha" version="1" match="/*/foaf:mbox_sha1sum/node()">
    <p:with-option name="value" select="/*/foaf:mbox/@rdf:resource"/>
  </p:hash>
</p:pipeline>
