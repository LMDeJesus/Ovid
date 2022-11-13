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
                <link rel="stylesheet" type="text/css" href="arachne.css"/>
                <title>Arachne and Minerva</title>                
            </head>
            <body>
                <xsl:apply-templates select="//story"/>
            </body>
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
    <xsl:template match="character">
        <span class="hoverable {@gender}_character">
            <xsl:apply-templates/>
        </span>
        <span class="hover">
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
        <xsl:template match="dia">
            <span class="hoverable {@gender}_dia">
                <xsl:apply-templates/>
            </span>
            <span class="hover">
                <xsl:value-of select="@gender"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="@speaker"/>
                <xsl:text>, </xsl:text>
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
        <span class="hover">
            <xsl:value-of select="@gender"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="@type"/>
        </span>
    </xsl:template>
</xsl:stylesheet>