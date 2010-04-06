<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Validity errors will cause the step to fail if
    <option>assert-valid</option> is true.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:diff='false'>
<doc>
<title>Title</title>
<not-valid/>
</doc></p:pipeinfo>

  <p:try>
    <p:group>
      <p:validate-with-relax-ng assert-valid="true">
        <p:input port="schema">
          <p:data href="../docs/grammar.rnc"/>
        </p:input>
      </p:validate-with-relax-ng>
    </p:group>
    <p:catch>
      <p:identity>
        <p:input port="source">
          <p:inline>
            <failed/>
          </p:inline>
        </p:input>
      </p:identity>
    </p:catch>
  </p:try>
</p:pipeline>
