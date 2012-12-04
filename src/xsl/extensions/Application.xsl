<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
   exclude-result-prefixes="app"
   xmlns:app="application"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   version="1.0"
>
   <xsl:template match="app:BNF">
      <a href="https://github.com/jsdevel/XforJ/blob/master/BNF" target="_blank">BNF</a>
   </xsl:template>

   <xsl:template match="app:LICENSE">
      <a href="https://github.com/jsdevel/XforJ/blob/master/LICENSE" target="_blank">License</a>
   </xsl:template>

   <xsl:template match="app:GIT">
      <a href="https://github.com/jsdevel/XforJ" target="_blank">github</a>
   </xsl:template>

</xsl:stylesheet>
