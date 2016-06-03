<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:mods="http://www.loc.gov/mods/v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
       
    </xsl:template>
    <xsl:template match="mods:mods">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <xsl:if test="not(mods:originInfo)">
                <mods:originInfo>
                    <mods:dateIssued lang="eng">20th century</mods:dateIssued>
                    <mods:dateIssued encoding="iso8601">1900/1999</mods:dateIssued>
                </mods:originInfo>
            </xsl:if>
        </xsl:copy>
       
    </xsl:template>
    
    <xsl:template match="mods:originInfo">
        
          
        
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <xsl:if test="not(mods:dateIssued)">
                <mods:dateIssued lang="eng">20th century</mods:dateIssued>
                <mods:dateIssued encoding="iso8601">1900/1999</mods:dateIssued>
            </xsl:if>
        </xsl:copy>
        
    </xsl:template>
  
</xsl:stylesheet>

