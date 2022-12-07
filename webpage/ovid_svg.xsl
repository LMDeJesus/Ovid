<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
        version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
        <xsl:output method="xml" indent="yes"/>
        <!-- Stylesheet variables                                       -->
        <!--                                                            -->
        <xsl:variable name="barWidth" as="xs:double" select="20"/>
        <xsl:variable name="spacing" as="xs:double" select="$barWidth div 3"/>
        <xsl:variable name="barInterval" select="$barWidth + $spacing" as="xs:double"/>
        <xsl:variable name="maxWidth" as="xs:double" select="count(//story) * ($barWidth + $spacing)"/>
        <xsl:variable name="yScale" as="xs:double" select="5"/>
        <xsl:variable name="maxHeight" as="xs:double" select="100 * $yScale"/>
        <!-- Templates                                                  -->
        <xsl:template match="/">
            <svg width="70%" height="70%" viewBox="-50 -550 600 600">
                <!-- Ruling line                                    -->
                <line x1="20" x2="20" y1="0" y2="-320" stroke="black" stroke-width="10"/>
                <line x1="20" x2="1550" y1="0" y2="0" stroke="black" stroke-width="10"/>
                <line x1="20" x2="1550" y1="-150" y2="-150" stroke="black" opacity="0.5"
                    stroke-dasharray="8 4" stroke-width="1"/>
                <xsl:apply-templates select="//story"/>
                <!-- general lables -->
                <text x="{$maxWidth div 2}" y="{10 * $yScale}" text-anchor="middle" font-size="x-large">()</text>
                <text x="-60" y="{$yScale div 10}" text-anchor="middle" writing-mode="tb"
                    font-size="x-large">()</text>
            </svg>
        </xsl:template>
</xsl:stylesheet>