<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="readingview.css"/>
                <title>Myth</title>                
            </head>
            <body>
                <xsl:apply-templates select="//story"/>
            </body>
            <xsl:text>&#160;</xsl:text>
            <xsl:text>&#160;</xsl:text>
            <xsl:text>&#160;</xsl:text>
        </html>
    </xsl:template>
    <xsl:template match="story">
        <h1><xsl:apply-templates select="title"/></h1>
        <hr/>
        <xsl:apply-templates select="p"/>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="lb">
        <br/>
    </xsl:template>
    <xsl:template match="character[@descrip]">
        <span class="hoverable {@gender}_character">
            <xsl:apply-templates/>
        </span>
        <span class="char_hover">
            <xsl:text>CHARACTER</xsl:text>
            <br/>
            <xsl:value-of select="@gender"/> 
            <xsl:text>, </xsl:text>
            <xsl:value-of select="@descrip"/>
        </span>
    </xsl:template>
        <xsl:template match="place">
        <span class="place">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
        <xsl:template match="dia[not(@invo)]">
            <span class="hoverable {@gender}_dia">
                <xsl:apply-templates/>
            </span>
            <span class="dia_hover">
                <xsl:text>DIALOGUE</xsl:text>
                <br/>
                <xsl:value-of select="@gender"/>
                <xsl:text>, sp: </xsl:text>
                <xsl:value-of select="@speaker"/>
            </span>
        </xsl:template>
    <xsl:template match="dia[@invo]">
        <span class="hoverable {@gender}_dia">
            <xsl:apply-templates/>
        </span>
        <span class="dia_hover">
            <xsl:text>DIALOGUE</xsl:text>
            <br/>
            <xsl:value-of select="@gender"/>
            <xsl:text>, sp: </xsl:text>
            <xsl:value-of select="@speaker"/>
            <xsl:text>, invo: </xsl:text>
            <xsl:value-of select="@invo"/>
        </span>
    </xsl:template>
    <xsl:template match="name">
        <span class="name">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="transform">
        <span class="hoverable {@gender}_transform">
            <xsl:apply-templates/>
        </span>
        <span class="trans_hover">
            <xsl:text>TRANSFORMATION</xsl:text>
            <br/>
            <xsl:value-of select="@gender"/>
            <xsl:text>, type: </xsl:text>
            <xsl:value-of select="@type"/>
        </span>
    </xsl:template>
</xsl:stylesheet>