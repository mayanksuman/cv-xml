<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
  <xsl:param name="versionParam" select="'1.0'"/>

  <xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master
	   master-name="simpleA4"
	   page-height="29.7cm"
	   page-width="21cm"
	   margin-top="2cm"
	   margin-bottom="2cm"
	   margin-left="2cm"
	   margin-right="2cm">
	  <fo:region-body/>
	</fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="simpleA4">
        <fo:flow flow-name="xsl-region-body">

	  <!-- header -->
	  <fo:block
	     margin-bottom="5mm"
	     font-size="10pt">
	    <fo:table table-layout="fixed" width="100%">
              <fo:table-column column-width="proportional-column-width(1)"/>
              <fo:table-column column-width="proportional-column-width(1)"/>
              <fo:table-body>
		<fo:table-row>

		  <!-- left column -->
		  <fo:table-cell column-number="1">
		    <fo:block>
		      <fo:block>
			<xsl:value-of select="resume/header/name"/>&#160;<xsl:value-of select="resume/header/lastname"/>
		      </fo:block>
		      <fo:block font-size="9pt">
			<xsl:value-of select="resume/header/coords/address" />
		      </fo:block>
		    </fo:block>
		  </fo:table-cell>

		  <!-- right column -->
		  <fo:table-cell column-number="2" text-align="end">
		    <fo:block>
		      <fo:block>
			<xsl:value-of select="resume/header/coords/phone" />
		      </fo:block>
		      <fo:block>
			<fo:basic-link
			   external-destination="mailto:{resume/header/coords/email}">
			  <xsl:value-of select="resume/header/coords/email"
					/>
			</fo:basic-link>
		      </fo:block>
		    </fo:block>
		  </fo:table-cell>
		</fo:table-row>
              </fo:table-body>
	    </fo:table>

	    <!-- title and objective -->
	    <fo:block
	       margin-top="1cm"
	       text-align="center"
	       font-size="16pt">
	      <xsl:value-of select="resume/header/title"/>
	    </fo:block>
	    <fo:block
	       text-align="center"
	       font-style="italic"
	       margin-top="2mm"
	       font-size="8pt"
	       width="80%"
	       margin-bottom="1cm">
	      <xsl:if test="resume/header/objective!=''">
		<xsl:value-of select="resume/header/objective"/>
	      </xsl:if>
	    </fo:block>

	  </fo:block>
	  <!-- end header -->


	  <!-- for each sections -->
	  <xsl:for-each select="resume/body/section">
	    <fo:block space-after="5mm">

	      <!-- display the title of the section -->
	      <fo:block border-bottom-style="solid"
			border-bottom-color="black"
			margin-bottom="2mm"
			padding-left="2mm"
			background-color="#ddddff">
		<xsl:value-of select="title"/>
	      </fo:block>

	      <xsl:if test="description!=''">
		<fo:block>
		  <xsl:value-of select="description" />
		</fo:block>
	      </xsl:if>
	      <!-- end title of section -->

	      <!-- parse each element of the section -->
	      <xsl:for-each select="details/element">

		<fo:table table-layout="fixed" width="100%">
		  <fo:table-column column-width="40mm"/>
		  <fo:table-column column-width="2mm"/>
		  <fo:table-column column-width="proportional-column-width(1)"/>
		  <fo:table-body>
		    <fo:table-row>


		      <!-- left column -->
		      <fo:table-cell column-number="1" text-align="end">
			<fo:block font-size="10pt" color="#009900">
			  <xsl:value-of select="date" />
			  <xsl:if test="duration!=''">
			    <fo:block font-size="8pt" color="#666">
			      <xsl:value-of select="duration" />
			    </fo:block>
			  </xsl:if>
			<xsl:if test="left!=''">
			  <fo:block color="#333366">
			    <xsl:value-of select="left" /> :
			  </fo:block>
			</xsl:if>
			</fo:block>
		      </fo:table-cell>
		      <!-- end left column -->


		      <!-- right column -->
		      <fo:table-cell column-number="3">
			<fo:block margin-bottom="2mm">
			  <fo:block font-size="10pt">
			    <xsl:if test="location/town!=''"><xsl:value-of select="location/town"/>/</xsl:if>
			    <xsl:if test="location/country!=''"><xsl:value-of select="location/country" />, </xsl:if>
			    <xsl:if test="location/placename!=''"><xsl:value-of select="location/placename" />: </xsl:if>
			    <xsl:if test="label!=''"><xsl:value-of select="label"/>. </xsl:if>
			    <xsl:value-of disable-output-escaping="yes"
			    select="description"/>
			  </fo:block>
			  <xsl:if test="apport!=''">
			  <fo:block font-size="8pt" color="#444">
			    <xsl:value-of select="apport" />.
			  </fo:block>
			  </xsl:if>
			</fo:block>
		      </fo:table-cell>
		      <!--- end right column -->

		    </fo:table-row>
		  </fo:table-body>
		</fo:table>

	      </xsl:for-each> <!-- each element of a setion -->
	    </fo:block> <!-- each section -->
	  </xsl:for-each>

        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

</xsl:stylesheet>
