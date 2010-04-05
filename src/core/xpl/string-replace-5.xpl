<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>It's worth observing that matching on attributes is a special case.
Attribute matches replace the value. Any other kind of match replaces
<emphasis>the entire node</emphasis>. Here we find elements that have the
“<literal>oldclass</literal>” value and replace them with the new class.</para>
  </p:documentation>

  <p:pipeinfo>
    <div>
      <p class="oldclass red">Red.</p>
      <p class="oldclass">Old.</p>
      <p class="otherclass oldclass">Something else.</p>
    </div>
  </p:pipeinfo>

  <p:string-replace match="*[@class='oldclass']" replace="'newclass'"/>
</p:pipeline>
