<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
   exclude-result-prefixes="string"
   xmlns:string="java.lang.String"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   version="1.0"
>
   <xsl:template name="XMLToJSONBuilder">
      <xsl:param name="inputNode"/>
      <xsl:apply-templates select="$inputNode" mode="XMLToJSONBuilder"/>
   </xsl:template>

   <xsl:template match="*" mode="XMLToJSONBuilder">
      <xsl:text>{</xsl:text>
         <xsl:value-of select="concat(
            '&quot;name&quot;:&quot;',
            local-name(),
            '&quot;'
         )"/>
         <xsl:text>,"attributes":{</xsl:text>
            <xsl:apply-templates select="@*" mode="XMLToJSONBuilder"/>
         <xsl:text>}</xsl:text>

         <xsl:text>,"elements":[</xsl:text>
         <xsl:for-each select="*|text()">
            <xsl:choose>
               <xsl:when test="'' = local-name()">
                  <xsl:variable name="normalized" select="normalize-space(.)"/>

                  <xsl:if test="not(string:matches($normalized, '^\s*+$'))">
                     <xsl:if test="position() != last() and position() != 1 and last() &gt; 1">,</xsl:if>
                     <xsl:text>{"name":"#text","elements":["</xsl:text>
                        <xsl:value-of select="$normalized"/>
                     <xsl:text>"]}</xsl:text>
                  </xsl:if>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:if test="position() != last() and position() != 1 and last() &gt; 1">,</xsl:if>
                  <xsl:apply-templates select="." mode="XMLToJSONBuilder"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>
         <xsl:text>]</xsl:text>
      <xsl:text>}</xsl:text>
   </xsl:template>

   <xsl:template match="@*" mode="XMLToJSONBuilder">
      <xsl:text>"</xsl:text>
         <xsl:value-of select="name()"/>
      <xsl:text>":"</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>"</xsl:text>
      <xsl:if test="position() != last() and last() &gt; 1">,</xsl:if>
   </xsl:template>

</xsl:stylesheet>
