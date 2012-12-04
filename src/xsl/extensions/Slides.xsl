<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
   exclude-result-prefixes="s"
   xmlns:s="js-slides" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   version="1.0"
>
   <xsl:template match="s:slides">
      <div class="slides">
         <xsl:if test="@speed">
            <xsl:attribute name="data-speed">
               <xsl:value-of select="@speed"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:if test="@controls = 'true'">
            <div class="slides-controls">
               <xsl:apply-templates select="s:slide|s:slideGroup" mode="slide-controls"/>
            </div>
         </xsl:if>
         <xsl:apply-templates select="s:slide|s:slideGroup" mode="slide-content"/>
      </div>
   </xsl:template>

   <xsl:template match="text()" mode="slide-content"/>

   <xsl:template match="s:slideGroup" mode="slide-content">
      <xsl:apply-templates mode="slide-content"/>
   </xsl:template>

   <xsl:template match="s:slide" mode="slide-content">
      <div id="SLIDE_{@name}">
         <xsl:if test="position() = 1">
            <xsl:attribute name="class">showing</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <xsl:template match="s:slide" mode="slide-controls">
      <a class="button border-2 rounded" data-slidetoshow="#SLIDE_{@name}" href="#Top">
         <xsl:value-of select="translate(@name, '_', ' ')"/>
      </a>
   </xsl:template>

   <xsl:template match="s:slideGroup" mode="slide-controls">
      <div class="slide-group border-5 rounded">
         <div class="header">
            <xsl:value-of select="translate(@name, '_', ' ')"/>
         </div>
         <xsl:apply-templates select="s:slide" mode="slide-controls"/>
      </div>
   </xsl:template>
</xsl:stylesheet>
