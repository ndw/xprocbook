<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
                name="main" version="1.0">
  <p:output port="result"/>

  <p:option name="new-class" select="'new-value'"/>

  <p:string-replace match="p/@class">
    <p:input port="source">
      <p:inline><p class="old-value">Some text.</p></p:inline>
    </p:input>

    <p:with-option name="replace" select="$new-class"/>
  </p:string-replace>

</p:declare-step>
