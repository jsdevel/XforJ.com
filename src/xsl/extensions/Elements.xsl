<?xml version="1.0" encoding="UTF-8"?>
<!--
   This stylesheet formats the XforJElements.xml file.
-->
<xsl:stylesheet 
   exclude-result-prefixes="d xel"
   xmlns:d="d" 
   xmlns:xel="xforj-elements" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   version="1.0"
>
   <xsl:template match="xel:attribute[@type]">
      <a href="#Attribute_{@type}">
         <xsl:value-of select="text()"/>
         <xsl:if test="@optional">&#160;<span>(optional)</span></xsl:if>
      </a>
   </xsl:template>

   <xsl:template match="xel:elements">
      <ul>
         <xsl:apply-templates select="xel:element" mode="list"/>
      </ul>
      <xsl:apply-templates select="xel:element"/>
   </xsl:template>

   <xsl:template match="xel:element" mode="list">
      <li>
         <a href="#ELEMENT_{@name}"><xsl:value-of select="@name"/></a>
      </li>
   </xsl:template>

   <xsl:template match="xel:element">
      <table border="0" cellspacing="0" cellpadding="0" class="element-list" id="ELEMENT_{@name}">
         <tr class="bg-color-blue color-white">
            <td class="font-12"><b>Name</b></td>
            <td class="font-20"><xsl:value-of select="@name"/></td>
         </tr>
         <tr>
            <td class="font-12"><b>Description</b></td>
            <td><xsl:apply-templates select="xel:description/node()"/></td>
         </tr>
         <xsl:if test="xel:note">
            <tr>
               <td class="font-12"><b>Note</b></td>
               <td><xsl:apply-templates select="xel:note/node()"/></td>
            </tr>
         </xsl:if>
         <xsl:if test="xel:attributes">
            <tr>
               <td class="font-12"><b>Attributes</b></td>
               <td class="attributes"><xsl:apply-templates select="xel:attributes/xel:attribute"/></td>
            </tr>
         </xsl:if>
         <xsl:if test="xel:usage">
            <tr>
               <td class="font-12" colspan="2"><b>Usage</b></td>
            </tr>
            <tr>
               <td colspan="2"><xsl:apply-templates select="xel:usage"/></td>
            </tr>
         </xsl:if>
      </table>
   </xsl:template>

   <xsl:template match="xel:usage">
      <pre>
         <xsl:apply-templates mode="pre"/>
      </pre>
   </xsl:template>

</xsl:stylesheet>
