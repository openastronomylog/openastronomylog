<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- Transforms an OAL21 document into an OAL20 document, omitting the session images -->
<!-- V 1.0, 2011/08/10 (c) by Thomas Pfleger -->

<!-- define a carriage return -->
<!DOCTYPE stylesheet [
<!ENTITY cr "<xsl:text>
</xsl:text>">
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
   xmlns:oal="https://github.com/openastronomylog/openastronomylog" exclude-result-prefixes="oal">
	<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes" media-type="text/xml"/>
   
	<!-- Copy a session to the output, omitting the 'image' element(s) -->
	<xsl:template match="session">
		<xsl:if test="not(boolean(image))">
			<xsl:copy-of select="."/>
		</xsl:if>
		<xsl:if test="boolean(image)">
			<xsl:text disable-output-escaping="yes"><![CDATA[<session id="]]></xsl:text><xsl:value-of select="@id"/>
			<xsl:text>" lang="</xsl:text><xsl:value-of select="@lang"/>
			<xsl:text disable-output-escaping="yes"><![CDATA[">]]></xsl:text>
			<xsl:copy-of select="image[1]/preceding-sibling::node()"/>
			<xsl:text disable-output-escaping="yes"><![CDATA[</session>]]></xsl:text>
		</xsl:if>
	</xsl:template> 
	
   <xsl:template match="node()|@*">
      <xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy>
   </xsl:template>

   <xsl:template match="/">
      <xsl:text disable-output-escaping="yes"><![CDATA[<oal:observations version="2.0"]]></xsl:text>
      <xsl:text disable-output-escaping="yes"><![CDATA[ xmlns:oal="https://github.com/openastronomylog/openastronomylog"]]></xsl:text>
      <xsl:text disable-output-escaping="yes"><![CDATA[ xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"]]></xsl:text>
      <xsl:text disable-output-escaping="yes"><![CDATA[ xsi:schemaLocation="https://github.com/openastronomylog/openastronomylog oal20.xsd">]]></xsl:text>&cr;

      <xsl:text disable-output-escaping="yes"><![CDATA[<observers>]]></xsl:text>&cr;
      <xsl:for-each select="//observers/observer">
		   <xsl:copy-of select="."/>&cr;
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes"><![CDATA[</observers>]]></xsl:text>&cr;

      <xsl:text disable-output-escaping="yes"><![CDATA[<sites>]]></xsl:text>&cr;
      <xsl:for-each select="//sites/site">
		   <xsl:copy-of select="."/>&cr;
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes"><![CDATA[</sites>]]></xsl:text>&cr;

      <xsl:text disable-output-escaping="yes"><![CDATA[<sessions>]]></xsl:text>&cr;
      <xsl:for-each select="//sessions/session">
		   <xsl:apply-templates select="."/>&cr;
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes"><![CDATA[</sessions>]]></xsl:text>&cr;
      
      <xsl:text disable-output-escaping="yes"><![CDATA[<targets>]]></xsl:text>&cr;
      <xsl:for-each select="//targets/target">
		   <xsl:copy-of select="."/>&cr;
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes"><![CDATA[</targets>]]></xsl:text>&cr;
      
      <xsl:text disable-output-escaping="yes"><![CDATA[<scopes>]]></xsl:text>&cr;
      <xsl:for-each select="//scopes/scope">
		   <xsl:copy-of select="."/>&cr;
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes"><![CDATA[</scopes>]]></xsl:text>&cr;
      
      <xsl:text disable-output-escaping="yes"><![CDATA[<eyepieces>]]></xsl:text>&cr;
      <xsl:for-each select="//eyepieces/eyepiece">
		   <xsl:copy-of select="."/>&cr;
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes"><![CDATA[</eyepieces>]]></xsl:text>&cr;
      
      <xsl:text disable-output-escaping="yes"><![CDATA[<lenses>]]></xsl:text>&cr;
      <xsl:for-each select="//lenses/lense">
		   <xsl:copy-of select="."/>&cr;
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes"><![CDATA[</lenses>]]></xsl:text>&cr;
      
      <xsl:text disable-output-escaping="yes"><![CDATA[<filters>]]></xsl:text>&cr;
      <xsl:for-each select="//filters/filter">
		   <xsl:copy-of select="."/>&cr;
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes"><![CDATA[</filters>]]></xsl:text>&cr;
      
      <xsl:text disable-output-escaping="yes"><![CDATA[<imagers>]]></xsl:text>&cr;
      <xsl:for-each select="//imagers/imager">
		   <xsl:copy-of select="."/>&cr;
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes"><![CDATA[</imagers>]]></xsl:text>&cr;
     
      <xsl:for-each select="//oal:observations/observation">
		   <xsl:copy-of select="."/>&cr;
      </xsl:for-each>
      
      <xsl:text disable-output-escaping="yes"><![CDATA[</oal:observations>]]></xsl:text>
   </xsl:template>
   
</xsl:stylesheet>
