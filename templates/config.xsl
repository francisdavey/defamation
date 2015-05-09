<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
<xsl:param name="use.id.as.filename" select="'1'"/>
<xsl:param name="admon.graphics" select="'1'"/>
<xsl:param name="admon.graphics.path"/>
<xsl:param name="html.stylesheet" select="'../../stylesheets/docbook.css'"/>
<xsl:param name="generate.section.toc.level" select="2" />
<xsl:param name="toc.section.depth">3</xsl:param>
<xsl:param name="generate.toc">
  article toc
  sect1 toc
</xsl:param>
</xsl:stylesheet>
