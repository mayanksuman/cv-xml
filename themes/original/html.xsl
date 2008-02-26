<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- Content: template -->

<xsl:stylesheet
   version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


  <xsl:template match="b">
    <b><xsl:value-of select="." /></b>
  </xsl:template>


  <xsl:template match="/">
    <html>

      <head>
	<title>
	  <xsl:value-of select="/resume/header/name"/>&#160;<xsl:value-of select="/resume/header/lastname"/>
	  - <xsl:value-of select="resume/header/title"/>
	</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
      </head>

      <body>
	<div class="defaultstyle">

	  <!-- header -->
	  <table width="100%">
	    <tr>
	      <td width="50%">
		<xsl:value-of select="/resume/header/name"/>&#160;<xsl:value-of select="/resume/header/lastname"/>
		<div class="address"><xsl:value-of select="resume/header/coords/address"/></div>
	      </td>
	      <td width="50%">
		<div class="phone"><xsl:value-of select="resume/header/coords/phone" /></div>
		<div class="email">
		  <a href="mailto:{resume/header/coords/email}">
		    <xsl:value-of select="resume/header/coords/email" />
		  </a>
		</div>
	      </td>
	    </tr>
	  </table>

	  <h1><xsl:value-of select="resume/header/title"/></h1>
	  <div class="objective"><xsl:value-of select="resume/header/objective"/></div>


	  <!-- each section ... -->
	  <xsl:for-each select="resume/body/section">

	    <table border="0" width="100%">
	      <tr>
		<td colspan="2" rowspan="1">
		  <h2><xsl:value-of select="title" /></h2>
		</td>
	      </tr>

	      <xsl:if test="description!=''">
		<tr>
		  <td colspan="2" rowspan="1">
		    <xsl:value-of select="description" />
		  </td>
		</tr>
	      </xsl:if>

	      <!-- parse each element of the section -->
              <xsl:for-each select="details/element">
		<tr valign="top">

		  <!-- left column -->
		  <td width="200">
		    <xsl:if test="left!=''"><div class="lefttext"><xsl:value-of select="left"/> :</div></xsl:if>
		    <div class="date"><xsl:value-of select="date" /></div>
		    <xsl:if test="duration!=''"><div class="duration"><xsl:value-of select="duration" /></div></xsl:if>
		  </td>
		  <!-- end left column -->

		  <!-- right column -->
		  <td>
		    <xsl:if test="location/town!=''"><span class="town"><xsl:value-of select="location/town" /></span>/</xsl:if>
		    <xsl:if test="location/country!=''"><span class="country"><xsl:value-of select="location/country" /></span>, </xsl:if>
		    <xsl:if test="location/placename!=''"><span class="locationame"><xsl:value-of select="location/placename" /></span>: </xsl:if>
		    <xsl:if test="label!=''"><xsl:value-of select="label" />. </xsl:if>
		    <xsl:if test="description!=''"><xsl:apply-templates select="description"/></xsl:if>
		    <xsl:if test="apport!=''"><div class="apport"><xsl:value-of select="apport" />.</div></xsl:if>
		  </td>
		  <!-- end right column -->

		</tr>
              </xsl:for-each> <!-- element -->

	    </table>
	  </xsl:for-each> <!-- section -->

	</div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
