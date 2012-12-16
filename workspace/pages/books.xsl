<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8"
  indent="yes" />

<xsl:include href="../utilities/master.xsl"/>


<xsl:template match="data">

  <div class="wrapper-books">
    <div class="container">
      <xsl:choose>
        <xsl:when test="$title = ''">
          <div class="marketing">
            <i class="glyphicon-bookmark icon-large"></i>
            <h2>Book Snyposes &amp; Reviews</h2>
            <p class="marketing-byline">Here you will find snyposes and reviews of books that we recommend. While the Scriptures stand as the sole source of Divine inpsiration, books can help us see Biblical truth that we didn't see before.</p>
          </div>
          <hr class="soften" />

          <div class="row">
            <div class="span12">
              <xsl:apply-templates select="/data/books-all/entry"/>
            </div>
          </div>

          <hr class="soften" />
          <div class="row">
            <div class="span12">
              <h3 class="center">Currently Reading</h3>
              <xsl:apply-templates select="/data/books-reading/entry"/>
            </div>
          </div>

        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="/data/books-single/entry"/>
          <hr class="soften" />
          <a href="{$root}/{$root-page}" class="btn btn-primary btn-large">
            <xsl:text>&#8592; Back to </xsl:text>
            <strong>
              <xsl:value-of select="$page-title" />
            </strong>
          </a>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </div>

</xsl:template>


 <xsl:template match="/data/books-all/entry">
  <div class="span3 book">
    <a href="{$root}/books/{title/@handle}" class="book-entry home">

      <img class="img-polaroid" src="/workspace/img/spacer.gif" alt="{image/item/image/caption}" style="width:100%; height:400px;">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="image/item/image/filename" />
        </xsl:attribute>
      </img>

      <div class="metadata">
        <h4>
          <xsl:value-of select="title" />
        </h4>
        <p>
          <xsl:text>by </xsl:text>
          <xsl:value-of select="author" />
          <xsl:if test="review != ''">
            <xsl:text>&#160;</xsl:text>
            <span class="label">Review</span>
          </xsl:if>
        </p>
        <hr class="soften" />
        <div class="ratings">
          <xsl:call-template name="ratings">
            <xsl:with-param name="i" select="1" />
            <xsl:with-param name="count" select="10" />
            <xsl:with-param name="rating-num" select="rating" />
          </xsl:call-template>
        </div>
      </div>
    </a>
  </div>
</xsl:template>


 <xsl:template match="/data/books-reading/entry">
  <div class="span3 book">

    <img class="img-polaroid" src="/workspace/img/spacer.gif" alt="{image/item/image/caption}" style="width:100%; height:400px;">
      <xsl:attribute name="data-responsimage">
        <xsl:value-of select="image/item/image/filename" />
      </xsl:attribute>
    </img>

  </div>
</xsl:template>


<xsl:template match="/data/books-single/entry">
  <div class="row entry">
    <div class="span3">
      <img class="img-polaroid" src="/workspace/img/spacer.gif" style="width:100%; height:400px;">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="image/item/image/filename" />
        </xsl:attribute>
      </img>
    </div>
    <div class="span9">
      <h2>
        <xsl:value-of select="title" />
      </h2>
      <h3>
        <xsl:text>by </xsl:text>
        <xsl:value-of select="author/item/name" />
      </h3>
      <div class="ratings">
        <xsl:call-template name="ratings">
          <xsl:with-param name="i" select="1" />
          <xsl:with-param name="count" select="10" />
          <xsl:with-param name="rating-num" select="rating" />
        </xsl:call-template>
      </div>

      <div class="content">
        <h4>Synopsis</h4>
        <xsl:value-of select="synopsis[@mode='formatted']" disable-output-escaping="yes" />
        <xsl:if test="review != ''">
          <hr />
          <h3 class="center">Book Review</h3>
          <xsl:value-of select="review[@mode='formatted']" disable-output-escaping="yes" />
        </xsl:if>
      </div>

      <hr />

      <a href="{author/item/link}" class="btn" target="_blank">More about the Author &#8594;</a>

    </div>
  </div>
</xsl:template>


</xsl:stylesheet>