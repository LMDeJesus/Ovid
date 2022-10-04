<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="no"/>
    <xsl:template match="/">
        <xsl:for-each select="//div1[@type = 'Book']">
            <xsl:result-document method="xml" href="xml/book{@n}.xml">
                <xsl:apply-templates/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="milestone[@unit = 'tale']">
        <xsl:value-of select="@n"/>
    </xsl:template>
    <xsl:template match="milestone[@unit = 'para']">
        <xsl:text>
    
</xsl:text>
    </xsl:template>
    <xsl:template match="l">
        <l>
            <xsl:apply-templates/>
        </l>
    </xsl:template>
</xsl:stylesheet>
