<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    
                <xsl:variable name="stories"
                    select="collection('../xml-story-markups/?select=*.xml')" as="document-node()+"/>
                
                <xsl:variable name="desCription"
                    select="count(distinct-values($stories//p/character[@descrip]))"/>
                <xsl:variable name="gender" select="distinct-values($stories//p/character[@gender])"/>
                
                
                <!-- Stylesheet variables                                       -->
                <!--                                                            -->
                <!-- VARIABLES -->
                <xsl:variable name="barWidth" as="xs:double" select="40"/>
                <xsl:variable name="maxWidth" as="xs:double" select="580"/>
                <xsl:variable name="maxHeight" as="xs:double" select="100"/>
                <xsl:variable name="yScale" as="xs:double" select="400"/>
                <xsl:variable name="Spacing" as="xs:double" select="80"/>
                <xsl:variable name="Bars" as="xs:double" select="$desCription * ($barWidth + $Spacing)"/>

                <!-- color key -->

                <xsl:variable name="maleColor" as="xs:string" select="'#AC8CD8'"/>
                <!-- a nice green #4A756E -->
                <xsl:variable name="femaleColor" as="xs:string" select="'#FFA375'"/>
                <!--perinwinkle blue #7899D4 -->
                <xsl:variable name="NonBColor" as="xs:string" select="'#8CD8C0'"/>
                <!-- nice pink #F8AFA6 -->
                <xsl:variable name="grayColor" as="xs:string" select="'#686868'"/>
                <xsl:variable name="mixedColor" as="xs:string" select="'#D88CA2'"/>

    <xsl:template name="xsl:initial-template">
        <svg width="75%" height="75%" viewBox="100 -550 900 900">
            <g>
                <!-- Ruling line                                    -->
                <line x1="20" x2="20" y1="3" y2="-200" stroke="black" stroke-width="5"/>
                <line x1="20" x2="800" y1="3" y2="3" stroke="black" stroke-width="5"/>
                <line x1="20" x2="800" y1="-30" y2="-30" stroke="black" opacity="0.5"
                    stroke-dasharray="8 4" stroke-width="1"/>
                <line x1="20" x2="800" y1="-60" y2="-60" stroke="black" opacity="0.5"
                    stroke-dasharray="8 4" stroke-width="1"/>
                <line x1="20" x2="800" y1="-90" y2="-90" stroke="black" opacity="0.5"
                    stroke-dasharray="8 4" stroke-width="1"/>
                <line x1="20" x2="800" y1="-120" y2="-120" stroke="black" opacity="0.5"
                    stroke-dasharray="8 4" stroke-width="1"/>

                <!-- y-axis ruling line labels -->
                <text x="-15" y="-{$maxHeight * 0.2}" text-anchor="middle">5</text>
                <text x="-15" y="-{$maxHeight * 0.5}" text-anchor="middle">10</text>
                <text x="-15" y="-{$maxHeight * 0.8}" text-anchor="middle">15</text>
                <text x="-15" y="-{$maxHeight * 1.2}" text-anchor="middle">20</text>

                <!-- general lables -->
                <text x="{$maxWidth - 150}" y="100" text-anchor="middle" font-size="x-large"
                    >Description</text>
                <text x="-60" y="-{$maxHeight * 3 div 2}" text-anchor="middle" writing-mode="tb"
                    font-size="x-large">Number of times appeared</text>
                <!--gender lable/color-->
                <text text-anchor="start" x="{$maxWidth + 300}" y="-{$yScale div 4 - 15}"
                    stroke="{$grayColor}" fill="{$grayColor}">Female</text>
                <rect y="-{$yScale div 5 - 15}" x="{$maxWidth + 310}" height="20" width="20"
                    fill="{$femaleColor}" stroke="black" stroke-width="1" stroke-linecap="square"/>
                <text text-anchor="start" x="{$maxWidth + 300}" y="-{$yScale div 4*2 - 15}"
                    stroke="{$grayColor}" fill="{$grayColor}">Non-Binary</text>
                <rect y="-{$yScale div 5 - -90}" x="{$maxWidth + 310}" height="20" width="20"
                    fill="{$NonBColor}" stroke="black" stroke-width="1" stroke-linecap="square"/>
                <text text-anchor="start" x="{$maxWidth + 300}" y="-{$yScale div 4*3 -15}"
                    stroke="{$grayColor}" fill="{$grayColor}">Male</text>
                <rect y="-{$yScale div 5 - -190}" x="{$maxWidth + 310}" height="20" width="20"
                    fill="{$maleColor}" stroke="black" stroke-width="1" stroke-linecap="square"/>
                
                <xsl:apply-templates select="$desCription" mode="descriptions"/>
                
                <xsl:variable name="barOrder" as="xs:string+" select="'virginal', 'matronly', 'protector','protected','rage','jealous','cocky','despair','joy'"/>
                <xsl:for-each-group select="($stories//character/@descrip)" group-by=".">
                    <xsl:variable name="nameOrder" as="xs:integer"
                        select="index-of($barOrder, current-grouping-key())"/>
                    <xsl:variable name="xPosition" as="xs:double"
                        select="$barWidth+ $Spacing * $nameOrder - 10"/>
                    <xsl:variable name="descrip_count" as="xs:integer"
                        select="count(current-group())"/>
                    <xsl:variable name="women_yPos" as="xs:double"
                        select="count($stories//character[@descrip = current-grouping-key() and @gender = 'female']) div $desCription"/>
                    <xsl:variable name="men_yPos" as="xs:double"
                        select="count($stories//character[@descrip = current-grouping-key() and @gender = 'male']) div $desCription"/>
                    <xsl:variable name="nonB_yPos" as="xs:double"
                        select="count($stories//character[@descrip = current-grouping-key() and @gender = 'non-binary']) div $desCription"/>
                    <text text-anchor="middle" x="{$xPosition}" y="30" stroke="{$grayColor}"
                        fill="{$grayColor}">
                        <xsl:value-of select="$barOrder[$nameOrder]"/>
                    </text>
                    <rect x="{$xPosition}" y="-{$nonB_yPos*$yScale}" height="{$nonB_yPos * $yScale}"
                        width="{$barWidth}" fill="{$NonBColor}"/>
                    <rect x="{$xPosition}" y="-{$women_yPos * $yScale}"
                        height="{$women_yPos * $yScale}" width="{$barWidth}" fill="{$femaleColor}"/>
                    <rect x="{$xPosition}" y="-{$men_yPos * $yScale}" height="{$men_yPos * $yScale}"
                        width="{$barWidth}" fill="{$maleColor}"/>
                    
                <!-- main data -->
                <!--
                
                <xsl:for-each select="$descriptions">
                    <xsl:sort order="ascending"/>
                    <xsl:variable name="typePos" select="position() - 1"/>
                    <xsl:variable name="xPos" as="xs:double" select="$typePos * $Bars + $Spacing"/>
                    <xsl:choose>
                        <xsl:when test="(($descriptions = 'virginal') = ($gender = 'female'))">
                            <xsl:value-of select="$femaleColor"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:variable name="mid-barPos" as="xs:double" select="$xPos + $barWidth div 2"/>
                        <rect x="-15" y="0" width="20" height="16" fill="{$femaleColor}"
                            stroke-width="1" stroke="black"/>-->
                </xsl:for-each-group>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>
