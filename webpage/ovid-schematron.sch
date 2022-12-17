<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <pattern>
        <rule context="p/desire/@*">
            <assert test=". eq lower-case(.)">The attribute value of <value-of select="name(.)"/> needs to be lower-case.</assert>
        </rule>
        <rule context="p/dia/@*">
            <assert test=". eq lower-case(.)">The attribute value of <value-of select="name(.)"/> needs to be lower-case.</assert>
        </rule>
    </pattern>
</schema>