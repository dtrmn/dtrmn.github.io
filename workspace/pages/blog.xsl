<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>


<xsl:template match="data">

  <div class="wrapper-blog">
    <div class="container">

      <xsl:choose>
        <xsl:when test="$title = ''">
          <div class="marketing">
            <i class="glyphicon-list-alt icon-large"></i>
            <h2>Articles of Devotion</h2>
            <p class="marketing-byline">The Determine blog has the purpose of deeping our devotion to Christ. Mediations on the Scripture help us see the beauty of God in the face of Jesus Christ (2 Corinthians 4:6) and respond to Him in worshipful obedience and sacrifice (Romans 12:1).</p>
          </div>
          <hr class="soften" />
          <br /><br />
          <div class="row">
            <div class="span8">
              <xsl:apply-templates select="/data/articles-all/entry"/>
              <hr class="soften" />
            </div>
            <div class="span4">
              <h4>Latest Quotes</h4>
              <hr />
              <xsl:apply-templates select="/data/quotes-4-latest/entry"/>
            </div>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <div class="row">
            <div class="span8 offset2">
              <xsl:apply-templates select="/data/articles-single/entry"/>
            </div>
          </div>
        </xsl:otherwise>
      </xsl:choose>

    </div>
  </div>
</xsl:template>


<xsl:template match="/data/articles-all/entry">
  <div class="article entry list">
    <div class="entry-header">
      <h2>
        <a href="{$root}/{$root-page}/{title/@handle}">
          <xsl:value-of select="title" />
        </a>
        <xsl:call-template name="edit-entry">
          <xsl:with-param name="component" select="'articles'"/>
        </xsl:call-template>
      </h2>
      <h4 class="blog-date">
        <xsl:call-template name="format-date">
          <xsl:with-param name="date" select="date/date/start/@iso" />
          <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
        </xsl:call-template>
      </h4>
    </div>
    <xsl:if test="image != ''">
      <img src="/workspace/img/spacer.gif">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="image/item/image/filename" />
        </xsl:attribute>
      </img>
    </xsl:if>
    <div class="content">
      <xsl:for-each select="verses/item">
        <xsl:call-template name="verse-entry" />
      </xsl:for-each>
      <xsl:call-template name="truncate">
        <xsl:with-param name="node" select="content" />
        <xsl:with-param name="length" select="730" />
      </xsl:call-template>
      <p class="right">
        <a href="{$root}/{$root-page}/{title/@handle}">Read <strong>Full Article </strong> <strong>&#8594;</strong></a>
      </p>
    </div>
  </div>
</xsl:template>


<xsl:template match="/data/articles-single/entry">
  <div class="article entry">
    <h4 class="center">
      <xsl:call-template name="format-date">
        <xsl:with-param name="date" select="date/date/start/@iso" />
        <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
      </xsl:call-template>
      <xsl:call-template name="edit-entry">
        <xsl:with-param name="component" select="'articles'"/>
      </xsl:call-template>
    </h4>
    <h1 class="center">
      <a href="{$root}/{$root-page}/{title/@handle}">
        <xsl:value-of select="title" />
      </a>
    </h1>
    <hr class="soften" />
    <xsl:if test="image != ''">
      <img class="img-polaroid" src="/workspace/img/spacer.gif" alt="{image/item/image/caption}">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="image/item/image/filename" />
        </xsl:attribute>
      </img>
    </xsl:if>
    <div class="content">
      <xsl:for-each select="verses/item">
        <xsl:call-template name="verse-entry" />
      </xsl:for-each>
      <xsl:value-of select="content" disable-output-escaping="yes" />
    </div>
  </div>
  <hr class="soften" />
  <a href="{$root}/{$root-page}" class="btn btn-primary btn-large">
    <xsl:text>&#8592; Back to the </xsl:text>
    <strong>
      <xsl:value-of select="$page-title" />
    </strong>
  </a>
</xsl:template>


</xsl:stylesheet>