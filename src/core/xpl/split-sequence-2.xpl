<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:db="http://docbook.org/ns/docbook"
                version="1.0">
<p:input port="source" sequence="true"/>
<p:output port="result"/>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>This pipeline accepts a sequence of documents and counts the number
of <emphasis>non-</emphasis>DocBook documents in the sequence.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:diff='false'>
    <doc>
      <para>Hello world.</para>
    </doc>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>(FIXME: the example doesn't really get a sequence)</para>
  </p:documentation>

  <p:split-sequence name="split" test="/db:*"/>

  <p:sink/>

  <p:count>
    <p:input port="source">
      <p:pipe step="split" port="not-matched"/>
    </p:input>
  </p:count>
</p:declare-step>
