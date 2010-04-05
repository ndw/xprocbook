<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>But instead, let's take advantage of the fact that this is a pipeline.
We don't have to do everything all at once.
    </para>
  </p:documentation>

  <p:pipeinfo>
    <div>
      <p class="oldclass red">Red.</p>
      <p class="oldclass">Old.</p>
      <p class="otherclass oldclass">Something else.</p>
      <p class="someoldclasstoo">Not really old.</p>
    </div>
  </p:pipeinfo>

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>(This still doesn't handle the case where “<literal>oldclass</literal>”
appears more than once in the attribute value, but I'm willing to live with
that.)</para>
  </p:documentation>

  <p:string-replace match="*[@class='oldclass']/@class" replace="'newclass'"/>
  <p:string-replace match="*[starts-with(@class,'oldclass ')]/@class"
                    replace="concat('newclass ', substring-after(.,'oldclass '))"/>
  <p:string-replace match="*[contains(@class,' oldclass ')]/@class"
                    replace="concat(substring-before(.,' oldclass '),' newclass ',substring-after(.,' oldclass '))"/>
  <p:string-replace match="*[ends-with(@class,' oldclass')]/@class"
                    replace="concat(substring-before(.,' oldclass'), ' newclass')"/>

</p:pipeline>
