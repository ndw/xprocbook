<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Steps in XProc read either a single document (and specifying
multiple documents is an error) or they read <emphasis>all</emphasis>
the documents sent to them. The <step>p:pack</step> step makes it possible
to group documents from two input streams, allowing you to effectively
read one document at a time.</para>

<para>This example uses <step>p:pack</step> to transform a
4x<replaceable>n</replaceable> table into an <replaceable>n</replaceable>x4
table.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:diff='false'>
    <doc>
      <para>This is a table.</para>
      <table>
        <tr><td>A1</td><td>B1</td><td>C1</td></tr>
        <tr><td>A2</td><td>B2</td><td>C2</td></tr>
        <tr><td>A3</td><td>B3</td><td>C3</td></tr>
        <tr><td>A4</td><td>B4</td><td>C4</td></tr>
      </table>
    </doc>
  </p:pipeinfo>

  <p:viewport match="table" name="rotate">
    <p:identity name="col1">
      <p:input port="source" select="/table/tr[1]/td">
        <p:pipe step="rotate" port="current"/>
      </p:input>
    </p:identity>

    <p:identity name="col2">
      <p:input port="source" select="/table/tr[2]/td">
        <p:pipe step="rotate" port="current"/>
      </p:input>
    </p:identity>

    <p:identity name="col3">
      <p:input port="source" select="/table/tr[3]/td">
        <p:pipe step="rotate" port="current"/>
      </p:input>
    </p:identity>

    <p:identity name="col4">
      <p:input port="source" select="/table/tr[4]/td">
        <p:pipe step="rotate" port="current"/>
      </p:input>
    </p:identity>

    <p:pack name="c12" wrapper="wrap12">
      <p:input port="source">
        <p:pipe step="col1" port="result"/>
      </p:input>
      <p:input port="alternate">
        <p:pipe step="col2" port="result"/>
      </p:input>
    </p:pack>

    <p:pack name="c34" wrapper="wrap34">
      <p:input port="source">
        <p:pipe step="col3" port="result"/>
      </p:input>
      <p:input port="alternate">
        <p:pipe step="col4" port="result"/>
      </p:input>
    </p:pack>

    <p:pack name="c1234" wrapper="wrapper">
      <p:input port="source">
        <p:pipe step="c12" port="result"/>
      </p:input>
      <p:input port="alternate">
        <p:pipe step="c34" port="result"/>
      </p:input>
    </p:pack>

    <p:for-each>
      <p:for-each>
        <p:iteration-source select="//td"/>
        <p:identity/>
      </p:for-each>
      <p:wrap-sequence wrapper="tr"/>
    </p:for-each>

    <p:wrap-sequence wrapper="table"/>
  </p:viewport>

</p:pipeline>
