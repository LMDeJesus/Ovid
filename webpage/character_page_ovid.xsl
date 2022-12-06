<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no"
        include-content-type="no" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Character Page</title>
                <link rel="stylesheet" type="text/css" href="ovid.css"/>
            </head>
            <body>
                <h1>Character Page</h1>
                <ul>
                    <xsl:for-each select="distinct-values(//p/character[not(@descrip)])">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>