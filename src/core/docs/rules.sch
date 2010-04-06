<s:schema xmlns:s="http://purl.oclc.org/dsdl/schematron"
          xmlns:db="http://docbook.org/ns/docbook">
   <s:ns prefix="db" uri="http://docbook.org/ns/docbook"/>

   <s:pattern name="'biblioref' type constraint">
      <s:rule context="db:biblioref[@linkend]">
         <s:assert test="local-name(//*[@xml:id=current()/@linkend]) = 'bibliomixed' and namespace-uri(//*[@xml:id=current()/@linkend]) = 'http://docbook.org/ns/docbook'">@linkend on biblioref must point to a bibliography entry.</s:assert>
      </s:rule>
   </s:pattern>
</s:schema>
