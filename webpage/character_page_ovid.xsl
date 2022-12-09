<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:variable name="stories" select="collection('../xml-story-markups/?select=*.xml')" as="document-node()+"/>
    <xsl:variable name="characterlist"
        select="distinct-values($stories//p/character[not(@descrip)]) => sort()"/>
    <xsl:template name="xsl:initial-template">
        <html>
            <head>
                <title>Character Page</title>
                <link rel="stylesheet" type="text/css" href="character_page.css"/>
            </head>
            <body>
                <div class="image_title"><h2 class="projectTitle">Portrayals of Divinity in The Metamorphoses</h2></div>
                <div class="mainNavbar">
                    <ul>
                        <li><a class="main" href="/">Home</a></li>
                        <li><a class="main" href="ovic-meme.png">About</a></li>
                        <li><a class="main" href="ovic-meme.png">Texts</a></li>
                        <li><a class="main" href="character_page.xhtml">Characters</a></li>
                        <li><a class="main" href="ovic-meme.png">Methodology</a></li>
                        <li><a class="main" href="ovic-meme.png">Conclusions</a></li>
                    </ul></div>
                <h1>Character Page</h1>
                <section>
                    <ul>
                        <xsl:for-each select="$characterlist">
                            <li>
                                <xsl:value-of select="."/>
                            </li>
                        </xsl:for-each>
                    </ul>
                </section>
                <hr/>
                <section>
                    <xsl:for-each select="$characterlist">
                        <section>
                            <h2>
                                <xsl:value-of select="."/>
                            </h2>
                            <ul>
                                <li>
                                    <strong>Perpetrator: </strong>
                                    <xsl:variable name="desireListPerp" select="$stories//desire[lower-case(@perp) eq lower-case(current())]"/>
                                    <xsl:choose>
                                        <xsl:when test="$desireListPerp">
                                            <ul>
                                                <xsl:for-each select="$desireListPerp">
                                                    <li>
                                                        <xsl:value-of select="."/>
                                                    </li>
                                                </xsl:for-each>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>No Instances of Perpetration</xsl:otherwise>
                                    </xsl:choose>
                                </li>
                                <li>
                                    <strong>Object: </strong>
                                    <xsl:variable name="desireListObject" select="$stories//desire[lower-case(@object) eq lower-case(current())]"/>
                                    <xsl:choose>
                                        <xsl:when test="$desireListObject">
                                            <ul>
                                                <xsl:for-each select="$desireListObject">
                                                    <li>
                                                        <xsl:value-of select="."/>
                                                    </li>
                                                </xsl:for-each>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>No Instances of Objectification</xsl:otherwise>
                                    </xsl:choose>
                                </li>
                            </ul>
                        </section>
                    </xsl:for-each>

                </section>
                <!--<ul>
                    <li>
                        <xsl:for-each select="distinct-values(//p/desire[@object]! name())">
                            <xsl:variable name="objectTest" as="element()*" select="desire[@object]"/>
                            <xsl:value-of select="."/>
                           
                        </xsl:for-each>
                    </li>
                </ul>-->
                <!-- <ul>
                    <xsl:for-each select="$characterlist">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>
                <hr/>
                <ul>
                    <xsl:apply-templates select="distinct-values($stories//p/character[not(@descrip)]) => sort()"/>
                   <xsl:for-each select="$characterlist">
                        <li>
                            <xsl:value-of select="."/>
                            <xsl:apply-templates select=""/>
                        </li>
                   </xsl:for-each>
                </ul>-->
            </body>
        </html>
    </xsl:template>
    <!--<xsl:template match="p/character[not(@descrip)]">
        <li>
                <xsl:apply-templates select="desire ! @object"/>
                <xsl:apply-templates select="desire ! @perp"/>
        </li>
    </xsl:template>-->
</xsl:stylesheet>
