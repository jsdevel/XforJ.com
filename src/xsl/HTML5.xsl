<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
   version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   xmlns:d="default" 
   xmlns:saxon="http://icl.com/saxon"
   exclude-result-prefixes="saxon d"
>
   <xsl:import href="Vars.xsl"/>
   <xsl:import href="Templates.xsl"/>
   <xsl:import href="Extensions.xsl"/>
   <xsl:import href="Header.xsl"/>

   <xsl:param name="basedir"/>

   <xsl:output method="html" saxon:omit-meta-tag="yes" indent="no"/>


   <xsl:template name="CopyrightComment">
      <xsl:comment>&#169; Joseph Spencer 2012.</xsl:comment>
   </xsl:template>

   <xsl:template name="HTML5DOCTYPE">
      <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
   </xsl:template>

   <xsl:template match="/d:page">
      <xsl:call-template name="HTML5DOCTYPE"/>
      <xsl:call-template name="CopyrightComment"/>
      <html class="no-js">
         <head>
            <xsl:call-template name="HeadScript"/>
            <title><xsl:value-of select="@title"/></title>
            <meta charset="UTF-8"/>
            <xsl:apply-templates select="." mode="GlobalCSS"/>
            <xsl:apply-templates select="d:css/d:url" mode="GlobalCSS"/>
         </head>
         <body>
            <xsl:call-template name="GlobalHeader"/>
            <div class="global-wrapper">
               <xsl:apply-templates/>
            </div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
            <script src="{$jsdir}/common.js"></script>
            <xsl:apply-templates select="//d:script" mode="js"/>
            <xsl:copy-of select="$googleTracking"/>
         </body>
      </html>
   </xsl:template>

   <xsl:template name="HeadScript">
      <script>document.getElementsByTagName('html')[0].className="js";</script>
   </xsl:template>

   <xsl:template match="d:page" mode="GlobalCSS">
      <link href="{$cssdir}/main.css" rel="stylesheet" type="text/css"/>
      <link href="{$cssdir}/theme.css" rel="stylesheet" type="text/css"/>
   </xsl:template>
   <xsl:template match="d:css/d:url" mode="GlobalCSS">
      <link href="{$cssdir}{text()}" rel="stylesheet" type="text/css"/>
   </xsl:template>
</xsl:stylesheet>
