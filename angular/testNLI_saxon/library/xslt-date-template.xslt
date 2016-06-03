<?xml version="1.0" encoding="UTF-8"?>
<!-- Template to make the iso8601 date -->
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:JodaAdapter="java:ca.discoverygarden.gsearch_extensions.JodaAdapter">
 <xsl:output method="xml" indent="yes"/>
  <xsl:template name="get_ISO8601_date">
    <xsl:param name="date"/>
    <xsl:param name="pid">not provided</xsl:param>
    <xsl:param name="datastream">not provided</xsl:param>

    <xsl:value-of select="JodaAdapter:transformForSolr($date, $pid, $datastream)" />
  </xsl:template>
</xsl:stylesheet>
