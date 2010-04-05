<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            xmlns:c="http://www.w3.org/ns/xproc-step"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>If you run the preceding example with some sort of “web sniffer”
enabled, you'll see that the XProc processor and the server perform a little
dance:</para>

<orderedlist>
<listitem><para>XProc requests the page,</para></listitem>
<listitem><para>the web server declines, asserting authentication is required</para>
</listitem>
<listitem><para>XProc tries again, sending the credentials</para>
</listitem>
<listitem><para>the web server sends back the representation.</para>
</listitem>
</orderedlist>

<para>By adding <code><att>send-authorization</att>="<literal>true</literal>"</code>,
you can reduce the dance by two steps: the XProc processor will send the
credentials initially and the web server will respond with the representation.
</para>

<para>This only works for basic authentication. If you use basic
authentication you really <emphasis>should</emphasis> use <uri
type="scheme">https:</uri> as passwords are otherwise sent
unencrypted, visible to anyone with the aforementioned “web
sniffer”.</para>
  </p:documentation>

  <p:pipeinfo xmlns:cx="http://xmlcalabash.com/ns/extensions"
              cx:show-source='false'>
    <doc/>
  </p:pipeinfo>

  <p:http-request>
    <p:input port="source">
      <p:inline>
        <c:request href="http://tests.xproc.org/docs/basic-auth" method="get"
                   detailed="true" auth-method="Basic" username="testuser"
                   password="testpassword" send-authorization="true"/>
      </p:inline>
    </p:input>
  </p:http-request>

</p:pipeline>
