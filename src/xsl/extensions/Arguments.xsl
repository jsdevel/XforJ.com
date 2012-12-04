<?xml version="1.0" encoding="UTF-8"?>
<!--
   This stylesheet formats the XforJElements.xml file.
-->
<xsl:stylesheet 
   exclude-result-prefixes="string"
   xmlns:string="java.lang.String"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   version="1.0"
>
   <xsl:import href="XMLToJSONBuilder.xsl"/>

   <xsl:template match="arguments" mode="a">
      <xsl:apply-templates select="argument" mode="arguments"/>
   </xsl:template>

   <xsl:template match="arguments" mode="b">
      <xsl:apply-templates select="antproperty" mode="arguments"/>
   </xsl:template>

   <xsl:template match="arguments" mode="c">
      <xsl:apply-templates select="anttask" mode="arguments"/>
   </xsl:template>

   <xsl:template match="argument|antproperty|anttask" mode="arguments">
      <table border="0" cellspacing="0" cellpadding="0" class="element-list">
         <tr class="bg-color-blue color-white">
            <td class="font-12"><b>Name</b></td>
            <td class="font-20"><xsl:value-of select="@name"/></td>
         </tr>
         <tr>
            <td class="font-12"><b>Description</b></td>
            <td>
               <xsl:choose>
                  <xsl:when test="contains(@description, '*)')">
                     <ul>
                        <xsl:variable name="firstPass" select="string:replaceAll(
                           @description, '\*\)((?:(?!\\n)[\s\S])*+)\\n?', '&lt;li&gt; $1 &lt;/li&gt;'
                        )"/>
                        <xsl:variable name="secondPass" select="string:replaceAll(
                           $firstPass, '\*\)(.*+)', '&lt;li&gt; $1 &lt;/li&gt;'
                        )"/>
                        <xsl:value-of select="string:replaceAll(
                           $secondPass, '\\n', '&lt;br/&gt;&lt;br/&gt;'
                        )" disable-output-escaping="yes"/>
                     </ul>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="string:replaceAll(
                        @description, '\\n', '&lt;br/&gt;&lt;br/&gt;'
                     )" disable-output-escaping="yes"/>
                  </xsl:otherwise>
               </xsl:choose>
            </td>
         </tr>
         <tr>
            <td class="font-12"><b>Type</b></td>
            <td><xsl:value-of select="@type"/></td>
         </tr>
         <xsl:if test="@default">
            <tr>
               <td class="font-12"><b>Default</b></td>
               <td><xsl:value-of select="@default"/></td>
            </tr>
         </xsl:if>
         <xsl:if test="@required">
            <tr>
               <td class="font-12"><b>Required</b></td>
               <td>True</td>
            </tr>
         </xsl:if>
      </table>
   </xsl:template>

   <xsl:template match="project" mode="c">
      <xsl:call-template name="XMLToJSONBuilder">
         <xsl:with-param name="inputNode" select="."/>
      </xsl:call-template>
   </xsl:template>

</xsl:stylesheet>
