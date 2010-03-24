<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:cxf="http://xmlcalabash.com/ns/extensions/fileutils"
                name="main" version="1.0">
  <p:output port="result"/>

  <p:import href="http://xmlcalabash.com/extension/steps/fileutils.xpl"/>

  <cxf:head count="5" href="sonnet116.txt"/>

</p:declare-step>
