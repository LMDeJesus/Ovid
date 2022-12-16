<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    <!-- Stylesheet variables                                       -->
    <!--                                                            -->
    <!-- VARIABLES -->
    <xsl:variable name="barWidth" as="xs:double" select="40"/>
    <xsl:variable name="maxWidth" as="xs:double" select="580"/>
    <xsl:variable name="maxHeight" as="xs:double" select="100"/>
    <xsl:variable name="yScale" as="xs:double" select="400"/>
    <xsl:variable name="Spacing" as="xs:double" select="$barWidth div 2"/>
    <xsl:variable name="Bars" as="xs:double" select="$barWidth + $Spacing"/>
    
    <!-- color key -->
    <!--                                                            -->
    <xsl:variable name="maleColor" as="xs:string" select="'#AC8CD8'"/>
    <!-- a nice green #4A756E -->
    <xsl:variable name="femaleColor" as="xs:string" select="'#FFA375'"/>
    <!--perinwinkle blue #7899D4 -->
    <xsl:variable name="NonBColor" as="xs:string" select="'#8CD8C0'"/>
    <!-- nice pink #F8AFA6 -->
    <xsl:variable name="grayColor" as="xs:string" select="'#686868'"/>
    <xsl:variable name="mixedColor" as="xs:string" select="'#D88CA2'"/>
    
    <xsl:variable name="storyXml" select="collection('Ovid_all-files.xml')"/>
    <!-- Templates                                                  -->
    <xsl:template match="/">
        <svg width="75%" height="75%" viewBox="100 -550 900 900">
            <!-- templete
                <xsl:apply-templates select="//ARACHNE-AND-MINERVA-OVID"/>
                <xsl:apply-templates select="//Caeneus"/>
                <xsl:apply-templates select="//DIANA-AND-ACTEON-OVID"/>
                <xsl:apply-templates select="//Dryope"/>
                <xsl:apply-templates select="//ECHO-AND-NARCISSUS-OVID"/> 
                <xsl:apply-templates select="//Hercules-and-Achelous"/>
                <xsl:apply-templates select="//HERMAPHRODITIS-OVID-XML"/>
                <xsl:apply-templates select="//Iphis"/>
                <xsl:apply-templates select="//JASON-AND-MEDEA-OVID"/>
                <xsl:apply-templates select="//KING-MINOS-AND-SCYLLA"/>
                <xsl:apply-templates select="//PROCNE-AND-PHILOMELA-OVID"/>
                <xsl:apply-templates select="//Scylla-et-Circe"/>
                <xsl:apply-templates select="//THE-DAUGHTERS-OF-MINYAS-OVID"/>
                -->
            <!-- Ruling line                                    -->
            <line x1="20" x2="20" y1="0" y2="-320" stroke="black" stroke-width="10"/>
            <line x1="20" x2="1100" y1="0" y2="0" stroke="black" stroke-width="10"/>
            <line x1="20" x2="1100" y1="-10" y2="-10" stroke="black" opacity="0.5"
                stroke-dasharray="8 4" stroke-width="1"/> 
            <line x1="20" x2="1100" y1="-150" y2="-150" stroke="black" opacity="0.5"
                stroke-dasharray="8 4" stroke-width="1"/> 
            <line x1="20" x2="1100" y1="-300" y2="-300" stroke="black" opacity="0.5"
                stroke-dasharray="8 4" stroke-width="1"/> 
            <!-- y-axis ruling line labels -->
            <text x="-15" y="0" text-anchor="middle">0</text>
            <text x="-15" y="-{$maxHeight * 1.5}" text-anchor="middle">10</text>
            <text x="-15" y="-{$maxHeight * 3}" text-anchor="middle">20</text>
            
            <xsl:apply-templates select="//story"/>
            <!-- general lables -->
            <text x="{$maxWidth + -30}" y="100" text-anchor="middle" font-size="x-large">Description</text>
            <text x="-60" y="-{$maxHeight * 3 div 2}" text-anchor="middle" writing-mode="tb"
                font-size="x-large">Number of times appeared</text>
            <!--gender lable/color-->
            <text text-anchor="start" x="{$maxWidth + 550}" y="-{$yScale div 4 - 15}"
                stroke="{$grayColor}" fill="{$grayColor}">Female</text>
            <rect y="-{$yScale div 5 - 15}" x="{$maxWidth + 560}" height="20" width="20" fill="{$femaleColor}" stroke="black" stroke-width="1" stroke-linecap="square"/>
            <text text-anchor="start" x="{$maxWidth + 550}" y="-{$yScale div 4*2 - 15}"
                stroke="{$grayColor}" fill="{$grayColor}">Non-Binary</text>
            <rect y="-{$yScale div 5 - -90}" x="{$maxWidth + 560}" height="20" width="20" fill="{$NonBColor}" stroke="black" stroke-width="1" stroke-linecap="square"/>
            <text text-anchor="start" x="{$maxWidth + 550}" y="-{$yScale div 4*3 -15}"
                stroke="{$grayColor}" fill="{$grayColor}">Male</text>
            <rect y="-{$yScale div 5 - -190}" x="{$maxWidth + 560}" height="20" width="20" fill="{$maleColor}" stroke="black" stroke-width="1" stroke-linecap="square"/>
        </svg>
    </xsl:template>
    <!-- main data -->
    <xsl:template match="story">
        <!--
        <xsl:for-each-group select="@descrip" group-by=".">
            <xsl:sort order="ascending"/>
            <xsl:variable name="descrip-count" select="count(current-group())"/>
                <xsl:value-of select="@descrip"/>
            <xsl:variable name="typePos" select="position() - 1"/>
            <xsl:variable name="xPos" as="xs:double" select="$typePos * $Bars + $Spacing"/>
            <xsl:variable name="mid-barPos" as="xs:double"
                select="$xPos + $barWidth div 2"/>-->
        
        <!-- description variables-->
        <xsl:variable name="desVirginal" select="count(story/p/character[@descrip = 'virginal'])" as="xs:integer"/>
        <xsl:variable name="desMatronly" select="count(story/p/character[@descrip = 'matronly'])" as="xs:integer"/>
        <xsl:variable name="desProtector" select="count(story/p/character[@descrip = 'protector'])" as="xs:integer"/>
        <xsl:variable name="desProtected" select="count(story/p/character[@descrip = 'protected'])" as="xs:integer"/>
        <xsl:variable name="desRage" select="count(story/p/character[@descrip = 'rage'])" as="xs:integer"/>
        <xsl:variable name="desJealous" select="count(story/p/character[@descrip = 'jealous'])" as="xs:integer"/>
        <xsl:variable name="desCocky" select="count(story/p/character[@descrip = 'cocky'])" as="xs:integer"/>
        <xsl:variable name="desDespair" select="count(story/p/character[@descrip = 'despair'])" as="xs:integer"/>
        <xsl:variable name="desJoy" select="count(story/p/character[@descrip = 'joy'])" as="xs:integer"/>
        
        <!-- actual bar-->
        <rect x="-15" y="0" width="20" height="{$desVirginal}" fill="{$femaleColor}" stroke-width="1" stroke="black"/>
        <rect x="-25" y="0" width="20" height="{$desMatronly}" fill="{$femaleColor}" stroke-width="1" stroke="black"/>
        
        <!--
            <xsl:variable name="barHeight" as="xs:double"
                select="count(current-group()) * $yScale"/>
                <xsl:choose>
                    <xsl:when test="current-grouping-key() = [@gender='female']">
                        <rect x="{$xPos}" y="-{$descrip-count * $yScale}"
                            height="{$descrip-count * $yScale}" width="{$barWidth}" stroke="black"
                            stroke-width=".5" fill="{$femaleColor}"/>
                    </xsl:when>
                    <xsl:when test="current-grouping-key() = [@gender='male']">
                        <rect x="{$xPos}" y="-{$descrip-count * $yScale}"
                            height="{$descrip-count * $yScale}" width="{$barWidth}" stroke="black"
                            stroke-width=".5" fill="{$maleColor}"/>
                    </xsl:when>
                    <xsl:when test="current-grouping-key() = [@gender='non-binary']">
                        <rect x="{$xPos}" y="-{$descrip-count * $yScale}"
                            height="{$descrip-count * $yScale}" width="{$barWidth}" stroke="black"
                            stroke-width=".5" fill="{$NonBColor}"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <rect x="{$xPos}" y="-{$descrip-count * $yScale}"
                            height="{$descrip-count * $yScale}" width="{$barWidth}" stroke="black"
                            stroke-width=".5" fill="{$mixedColor}"/>
                    </xsl:otherwise>
                </xsl:choose>
        </xsl:for-each-group>-->
    </xsl:template>
</xsl:stylesheet>