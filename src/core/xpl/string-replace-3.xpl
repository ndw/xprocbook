<p:pipeline xmlns:p="http://www.w3.org/ns/xproc"
            version="1.0">

  <p:documentation xmlns="http://docbook.org/ns/docbook">
    <para>Better, but now we're clobbering the other values. We
can fix that, too.</para>
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
    <para>This is still imperfect as it incorrectly replaces
“<literal>someoldclasstoo</literal>” with “<literal>somenewclasstoo</literal>”.
We could improve this further with even more
complex <option>match</option> and <option>replace</option> options.</para>
  </p:documentation>

  <p:string-replace match="*[contains(@class,'oldclass')]/@class"
                    replace="concat(substring-before(.,'oldclass'),'newclass',substring-after(.,'oldclass'))"/>
</p:pipeline>
