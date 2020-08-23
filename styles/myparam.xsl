<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="formalpara">
    <xsl:choose>
      <xsl:when test="@role = 'theorem'">
        <xsl:text>&#10;\begin{theorem}</xsl:text>
        <xsl:apply-templates select="title" mode="format.title"/>
        <xsl:text>&#10;</xsl:text>

        <xsl:apply-templates select="*[not(self::title)]"/>
        <xsl:text>&#10;\end{theorem}&#10;</xsl:text>
      </xsl:when>
      <xsl:when test="@role = 'proof'">
        <xsl:text>\begin{prf}</xsl:text>
        <xsl:apply-templates select="title" mode="format.title"/>
        <xsl:text>&#10;</xsl:text>

        <xsl:apply-templates select="*[not(self::title)]"/>

        <xsl:text>&#10;\end{prf}&#10;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>&#10;{\bf </xsl:text>
        <xsl:call-template name="normalize-scape">
          <xsl:with-param name="string" select="title"/>
        </xsl:call-template>
        <xsl:text>} </xsl:text>
        <xsl:call-template name="label.id"/>
        <xsl:apply-templates/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="pi.texmath_delimiters">
    <xsl:text>user</xsl:text>
  </xsl:template>

</xsl:stylesheet>