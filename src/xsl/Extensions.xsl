<?xml version="1.0" encoding="UTF-8"?>
<!--
   This file allows for the XSL to be extended.  It is recommended to place
   xsl extension files in an extensions directory.

   To add extensions, simply add import statements herein that link to XSL files
   within your extensions directory.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:import href="extensions/Slides.xsl"/>
   <xsl:import href="extensions/Arguments.xsl"/>
   <xsl:import href="extensions/Elements.xsl"/>
   <xsl:import href="extensions/Application.xsl"/>
</xsl:stylesheet>
