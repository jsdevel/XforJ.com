<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:variable name="cssdir" select="concat($basedir, 'css')"/>
   <xsl:variable name="jsdir" select="concat($basedir, 'js')"/>
   <xsl:variable name="xmldir">../xml</xsl:variable>
   <xsl:variable name="googleTracking">
      <script type="text/javascript">var _gaq=_gaq||[];_gaq.push(['_setAccount','UA-36027688-1']);_gaq.push(['_trackPageview']);(function(){var ga=document.createElement('script');ga.type='text/javascript';ga.async=true;ga.src=('https:'==document.location.protocol?'https://ssl':'http://www')+'.google-analytics.com/ga.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(ga,s);})();</script>
   </xsl:variable>

</xsl:stylesheet>
