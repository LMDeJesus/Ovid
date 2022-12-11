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
                <link rel="stylesheet" type="text/css" href="ovid.css"/>
                <script type="text/javascript" src="readingview.js"/>
                <title>Myth</title>
                <xsl:comment>#include virtual="menu.xhtml" </xsl:comment>
            </head>
            <body>
                <div class="mainNavbar">
                    <ul>
                        <li><a class="main" href="/">Home</a></li>
                        <li><a class="main" href="ovic-meme.png">About</a></li>
                        <li><a class="main" href="ovic-meme.png">Texts</a></li>
                        <li><a class="main" href="character_page.xhtml">Characters</a></li>
                        <li><a class="main" href="ovic-meme.png">Methodology</a></li>
                        <li><a class="main" href="ovic-meme.png">Conclusions</a></li>
                    </ul></div>
                <xsl:apply-templates select="//story"/>
                <div class="stick">
                    <span class="tag">
                        <xsl:text>Tag</xsl:text>
                    </span>
                    <p class="collapse">
                        <strong>Male:</strong>
                    </p>
                    <input type="checkbox" value="male_character"/>
                    <span class="male_character">descriptors</span>
                    <br/>
                    <input type="checkbox" value="male_dia"/>
                    <span class="male_dia">dialogue</span>
                    <br/>
                    <input type="checkbox" value="male_transform"/>
                    <span class="male_transform">transformations</span>
<br/>
                    <p class="collapse">
                        <strong>Female:</strong>
                    </p>
                    <input type="checkbox" value="female_character"/>
                    <span class="female_character">descriptors</span>
                    <br/>
                    <input type="checkbox" value="female_dia"/>
                    <span class="female_dia">dialogue</span>
                    <br/>
                    <input type="checkbox" value="female_transform"/>
                    <span class="female_transform">transformations</span>
<br/>
                    <p class="collapse">
                        <strong>Non-Binary:</strong>
                    </p>
                    <input type="checkbox"  value="nonbinary_character"/>
                    <span class="nonbinary_character">descriptors</span>
                    <br/>
                    <input type="checkbox"  value="nonbinary_dia"/>
                    <span class="nonbinary_dia">dialogue</span>
                    <br/>
                    <input type="checkbox"  value="nonbinary_transform"/>
                    <span class="nonbinary_transform">transformations</span>
                </div>
                <div class="stick2">
                    <span class="tag">
                        <xsl:text>Myths</xsl:text>
                    </span>
                    <ul>
                        <li><a href="Dryope.xhtml">Dryope</a></li>
                        <br/>
                        <li><a href="Caeneus.xhtml">Caeneus</a></li>
                        <br/>
                        <li><a href="CERES-AND-PROSERPINA-OVID.xhtml">Ceres and Proserpina</a></li>
                        <br/>
                        <li><a href="DIANA-AND-ACTEON-OVID.xhtml">Diana and Acteon</a></li>
                    </ul>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="story">
        <h1>
            <span class="myth-label">
                <xsl:text>Myth of:</xsl:text>
            </span>
            <br/>
            <xsl:apply-templates select="title"/>
        </h1>
        <div class="text">
            <h2>
                <xsl:text>Text</xsl:text>
            </h2>
            <strong><xsl:apply-templates select="header"/></strong>
            <xsl:apply-templates select="p"/>
        </div>
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="lb">
        <br/>
    </xsl:template>
    <xsl:template match="character[@descrip]">
        <span class="hoverable {@gender}_character">
            <xsl:apply-templates/>
        </span>
        <span class="char_hover">
            <xsl:value-of select="@descrip"/>
        </span>
    </xsl:template>
    <xsl:template match="dia[@invo]">
        <span class="hoverable {@gender}_dia">
            <xsl:apply-templates/>
        </span>
        <span class="dia_hover">
            <xsl:text>sp: </xsl:text>
            <xsl:value-of select="@speaker"/>
            <br/>
            <xsl:text>invo: </xsl:text>
            <xsl:value-of select="@invo"/>
        </span>
    </xsl:template>
    <xsl:template match="transform">
        <span class="hoverable {@gender}_transform">
            <xsl:apply-templates/>
        </span>
        <span class="trans_hover">
            <xsl:value-of select="@type"/>
        </span>
    </xsl:template>
</xsl:stylesheet>
