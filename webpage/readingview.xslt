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
                <title>Reading View</title>
            </head>
            <body>
                <xsl:comment>#include virtual="menu.xhtml" </xsl:comment>
                <!-- Nav bar at top of page for myth selection -->
                <table>
                    <tr>
                        <td>
                            <a href="ARACHNE-AND-MINERVA-OVID.xhtml">Arachne and Minerva</a>
                        </td>
                        <td>
                            <a href="Caeneus.xhtml">Caeneus</a>
                        </td>
                        <td>
                            <a href="CERES-AND-PROSERPINA-OVID.xhtml">Ceres and Proserpina</a>
                        </td>
                        <td>
                            <a href="Dryope.xhtml">Dryope</a>
                        </td>
                        <td>
                            <a href="DIANA-AND-ACTEON-OVID.xhtml">Diana and Actaeon</a>
                        </td>
                        <td>
                            <a href="Hercules-and-Achelous.xhtml">Hercules and Achelous</a>
                        </td>
                        <td>
                            <a href="ECHO-AND-NARCISSUS-OVID.xhtml">Echo and Narcissus</a>
                        </td>
                    </tr>
                    <tr>
                        <td><a href="HERMAPHRODITIS-OVID-XML.xhtml">Hermaphroditus</a></td>
                        <td>
                            <a href="JASON-AND-MEDEA-OVID.xhtml">Jason and Medea</a>
                        </td>
                        <td>
                            <a href="Iphis.xhtml">Iphis and Ianthe</a>
                        </td>
                        <td>
                            <a href="PROCNE-AND-PHILOMELA-OVID.xhtml">Tereus and Philomela</a>
                        </td>
                        <td>
                            <a href="KING-MINOS-AND-SCYLLA.xhtml">Minos and Scylla</a>
                        </td>
                        <td>
                            <a href="Scylla-et-Circe.xhtml">Scylla and Circe</a>
                        </td>
                        <td>
                            <a href="THE-DAUGHTERS-OF-MINYAS-OVID.xhtml">Daughters of Minyas</a>
                        </td>
                    </tr>
                </table>
                <!-- Applying templates to myths -->
                <xsl:apply-templates select="//story"/>
                <!-- Checkbox on right side of page -->
                <div class="stick">
                    <span class="tag">
                        <xsl:text>Tag</xsl:text>
                    </span>
                    <p class="removespace">
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
                    <p class="removespace">
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
                    <p class="removespace">
                        <strong>Non-Binary:</strong>
                    </p>
                    <input type="checkbox" value="nonbinary_character"/>
                    <span class="nonbinary_character">descriptors</span>
                    <br/>
                    <input type="checkbox" value="nonbinary_dia"/>
                    <span class="nonbinary_dia">dialogue</span>
                    <br/>
                    <input type="checkbox" value="nonbinary_transform"/>
                    <span class="nonbinary_transform">transformations</span>
                </div>
            </body>
        </html>
    </xsl:template>
    <!-- Matching story template -->
    <xsl:template match="story">
        <!--Myth name-->
        <h1>
            <span class="myth-label">
                <xsl:text>Myth:</xsl:text>
            </span>
            <br/>
            <xsl:apply-templates select="title"/>
        </h1>
        <!--Content of myth -->
        <p class="highlightguide"><strong>Tip:</strong> Hover over <span class="orangeHighlight">highlighted text</span> to reveal more information about each element!</p>
        <div class="text">
            <h2>
                <xsl:text>Text</xsl:text>
            </h2>
            <!-- Original roman name of myth, if there is one -->
            <strong>
                <xsl:apply-templates select="header"/>
            </strong>
            <xsl:apply-templates select="p"/>
        </div>
    </xsl:template>
    <!-- matching each paragraph in myth -->
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!-- Adjusting line break-->
    <xsl:template match="lb">
        <br/>
    </xsl:template>
    <!-- Creating hover for different elements and attributes, based on gender -->
    <!--Description hover -->
    <xsl:template match="character[@descrip]">
        <span class="hoverable {@gender}_character">
            <xsl:apply-templates/>
        </span>
        <span class="char_hover">
            <xsl:value-of select="@descrip"/>
        </span>
    </xsl:template>
    <!-- Dialogue hover -->
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
    <!-- Transform hover -->
    <xsl:template match="transform">
        <span class="hoverable {@gender}_transform">
            <xsl:apply-templates/>
        </span>
        <span class="trans_hover">
            <xsl:value-of select="@type"/>
        </span>
    </xsl:template>
</xsl:stylesheet>
