<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- Filters an OAL21 document to contain only target types supported by Eye&Telescope 3.3 -->
<!-- V 1.0, 2020/06/08 (c) by Thomas Pfleger -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
   xmlns:oal="http://groups.google.com/group/openastronomylog" exclude-result-prefixes="oal">
	<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes" media-type="text/xml"/>
   
	<!-- Identity transform -->
	<xsl:template match="node()|@*">
      <xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy>
   </xsl:template>
   
   <xsl:key name="targetKey" match="targets/target" use="@id"/>
   
   <xsl:template match="target">
		<xsl:param name="target_type" select="./@xsi:type"/> 
		<xsl:if test="contains($target_type, 'oal:SunTargetType') or contains($target_type, 'oal:MoonTargetType') or contains($target_type, 'oal:PlanetTargetType') or contains($target_type, 'oal:MinorPlanetTargetType') or contains($target_type, 'oal:CometTargetType') or contains($target_type, 'oal:deepSky')">
			<xsl:copy-of select="."/>
		</xsl:if>
   </xsl:template>
    
	<!-- Restrict to bservation of target types known to Eye&Telescope (solar system, deep sky) -->
	<xsl:template match="observation">
		<xsl:param name="target_type" select="key('targetKey', target)/@xsi:type"/> 
		<xsl:if test="contains($target_type, 'oal:SunTargetType') or contains($target_type, 'oal:MoonTargetType') or contains($target_type, 'oal:PlanetTargetType') or contains($target_type, 'oal:MinorPlanetTargetType') or contains($target_type, 'oal:CometTargetType') or contains($target_type, 'oal:deepSky')">
			<xsl:copy-of select="."/>
		</xsl:if>
   </xsl:template>
   
</xsl:stylesheet>