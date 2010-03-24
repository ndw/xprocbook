<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:cxf="http://xmlcalabash.com/ns/extensions/fileutils"
                name="main" version="1.0">

  <p:output port="result">
    <p:pipe step="copy" port="result"/>
  </p:output>

  <p:import href="http://xmlcalabash.com/extension/steps/fileutils.xpl"/>

  <cxf:copy name="copy" href="copy-1.xpl" target="/tmp/copied.xpl"/>

</p:declare-step>
