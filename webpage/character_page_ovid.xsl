<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no"
        include-content-type="no" indent="yes"/>
    <xsl:variable name="stories" select="collection('../xml-story-markups/?select=*.xml')"/>
    <xsl:template name="xsl:initial-template">
        <xsl:variable name="characterlist" select="distinct-values($stories//p/character[not(@descrip)]) => sort()"/>
        <html>
            <head>
                <title>Character Page</title>
                <link rel="stylesheet" type="text/css" href="character_page.css"/>
            </head>
            <body>
                <h1>Character Page</h1>
                <ul>
                    <xsl:for-each select="$characterlist">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>
                <hr/>
                <ul>
                    <xsl:for-each select="$characterlist">
                        <li>
                            <xsl:value-of select="."/>
                            <xsl:apply-templates select="desire"/>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="desire">
        <li>
                <xsl:apply-templates select=". ! @object"/>
                <xsl:apply-templates select=". ! @perp"/>
        </li>
    </xsl:template>
</xsl:stylesheet>