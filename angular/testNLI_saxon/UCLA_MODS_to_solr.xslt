<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink" 
  xmlns:mods="http://www.loc.gov/mods/v3" exclude-result-prefixes="mods xlink">
    <xsl:output method="xml" indent="yes"/>
  <xsl:variable name="modsPrefix">mods_</xsl:variable>
  <xsl:variable name="modsSuffix">_ms</xsl:variable>
  <xsl:include href="slurp_all_MODS_to_solr.xslt"/>
  <!--
    SECTION 1:

    Our root MODS processing template; this is where we split out specific MODS
    collections that need special metadata field templates. Not all collections
    will need this; if they don't, the generic stuff below takes care of them.
    
    Collections being given special treatment in here should also have templates
    in the second and third sections below.
  -->

  <xsl:template match="/">
    

    <!-- xslt 1.0 doesn't allow use of multiple modes; we need wrapper code -->
    <xsl:for-each select="mods:mods">
        <document>
             <xsl:apply-templates mode="slurping_MODS" select="current()">
	 <xsl:with-param name="suffix" select="'ms'"/>      	
      </xsl:apply-templates>
        </document>
      <!-- We always get the generic treatment -->
     
    </xsl:for-each>
  </xsl:template>

 
  <!--
    SECTION 3:
    
    Below this are collection level mode switches (needed b/c we use xslt 1.0).
    These basically handle the non-special fields in a collection that is being
    given special treatment...  It switches them to use the generic templates.
  -->

  <xsl:template match="mods:*" mode="CollectingLA">
    <xsl:apply-templates select="self::mods:*"/>
  </xsl:template>
  
  <xsl:template match="mods:*" mode="Tahrir">
    <xsl:apply-templates select="self::mods:*"/>
  </xsl:template>
</xsl:stylesheet>

