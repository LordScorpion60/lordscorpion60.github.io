<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE xsl:stylesheet  [
	<!ENTITY back "&#8249;">
	<!ENTITY reg  "&#174;">
  ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>
<xsl:template match="/">
  <xsl:variable name="ScoreType" select="Scorecard/Course/CourseScoreType"/>
  <xsl:variable name="HoleCount" select="count(Scorecard/Course/CourseHole)"/>
  <xsl:variable name="Counting"  select="Scorecard/Course/CourseCounting"/>
  <xsl:variable name="colspan">
  <xsl:choose><!-- Score type colspan based on number holes -->
    <xsl:when test="$HoleCount=18">22</xsl:when>
    <xsl:otherwise>11</xsl:otherwise>
  </xsl:choose>
  </xsl:variable>
  <xsl:variable name="rowpan">
  <xsl:choose><!-- Player title rowspan based score type -->
    <xsl:when test="$ScoreType&gt;0 and $Counting=1">2</xsl:when>
    <xsl:otherwise>1</xsl:otherwise>
  </xsl:choose>
  </xsl:variable>
  <html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Approach&reg; <xsl:value-of select="Scorecard/Text/ScoreCardText"/> - <xsl:value-of select="Scorecard/Course/CourseName"/> - <xsl:value-of select="Scorecard/Course/CourseDate"/></title>
    <link rel="stylesheet" href="../../GolfViewer/css/screen.css" type="text/css" media="screen, projection"/>
    <link rel="stylesheet" href="../../GolfViewer/css/print.css"  type="text/css" media="print"/>
  </head>
  <body id="scorecard">
    <div id="container">
      <div id="header">
        <a href="http://www.garmin.com" target="_blank"><img src="../../GolfViewer/images/garmin.png" alt=""/></a></div>
      <h1><xsl:value-of select="Scorecard/Text/ScorecardText"/></h1>
      <h2><span id="game-date"><xsl:value-of select="Scorecard/Course/CourseDate"/></span> -
          <span id="course-name"><xsl:value-of select="Scorecard/Course/CourseName"/></span></h2>
      <div id="navigation">
        <a href="../../../ScorecardViewer.html" id="back-btn">&lt;&lt; <xsl:value-of select="Scorecard/Text/BackText"/></a>
      </div>
	  <h1>HI!</h1>
      <div id="content">
      <table id="scorecard">
        <colgroup>
          <col class="title" />
<xsl:for-each select="Scorecard/Course/CourseHole">
          <col class="data" />
  <xsl:if test="position()=9 and $HoleCount=18">
          <col class="header" />
  </xsl:if>
</xsl:for-each>
    <xsl:if test="$HoleCount=18">
          <col class="title" />
    </xsl:if>
          <col class="title" />
        </colgroup>
        <thead>
<xsl:if test="$ScoreType&gt;0">
          <tr id="scoring">
            <th colspan="{$colspan}" id="score-type"><xsl:value-of select="Scorecard/Text/ScoreTypeText"/></th>
          </tr>
</xsl:if>
          <tr id="hole" class="hole number">
            <th class="title text" ><xsl:value-of select="Scorecard/Text/HoleText"/></th>
<xsl:for-each select="Scorecard/Course/CourseHole">
            <th><xsl:value-of select="HoleNumber"/></th>
  <!--<xsl:if test="position()=9 and $HoleCount=18">
            <th><xsl:value-of select="../../Text/OutText"/></th>
  </xsl:if>-->
</xsl:for-each>
    <!--<xsl:if test="$HoleCount=18">
            <th><xsl:value-of select="Scorecard/Text/InText"/></th>
    </xsl:if>-->
            <th><xsl:value-of select="Scorecard/Text/TotalText"/></th>
          </tr>
          <tr id="par" class="par number">
            <th class="title text" ><xsl:value-of select="Scorecard/Text/ParText"/></th>
<xsl:for-each select="Scorecard/Course/CourseHole">
            <th><xsl:value-of select="HolePar"/></th>
  <!--<xsl:if test="position()=9 and $HoleCount=18">
            <th><xsl:value-of select="../CourseParOut"/></th>
  </xsl:if>-->
</xsl:for-each>
    <!--<xsl:if test="$HoleCount=18">
            <th><xsl:value-of select="Scorecard/Course/CourseParIn"/></th>
    </xsl:if>-->
            <th><xsl:value-of select="Scorecard/Course/CourseParTotal"/></th>
          </tr>
<xsl:if test="Scorecard/Course/CourseHandicap=1 and $Counting=1">
          <tr id="handicap" class="handicap number">
            <th class="title text" ><xsl:value-of select="Scorecard/Text/HandicapText"/></th>
<xsl:for-each select="Scorecard/Course/CourseHole">
            <th><xsl:value-of select="HoleHandicap"/></th>
  <xsl:if test="position()=9 and $HoleCount=18">
            <th></th>
  </xsl:if>
</xsl:for-each>
    <xsl:if test="$HoleCount=18">
            <th></th>
    </xsl:if>
            <th></th>
          </tr>
</xsl:if>
        </thead>
        <tbody>
<xsl:for-each select="Scorecard/Player">
  <xsl:if test="$ScoreType&lt;2 or $Counting=1">
          <tr id="player1" class="player number">
            <th rowspan="{$rowpan}" class="title text">
              <xsl:value-of select="PlayerName"/>
      <xsl:if test="$Counting=1 and PlayerHandicap!=''">
              (<xsl:value-of select="PlayerHandicap"/>)
      </xsl:if>
            </th>
  <xsl:if test="$ScoreType=0 or $Counting=1">
    <xsl:for-each select="PlayerHole">
            <td>
            <xsl:if test="HoleScore!=255">
              <xsl:value-of select="HoleStrokeScore"/>
            </xsl:if>
            </td>
      <!--<xsl:if test="position()=9 and $HoleCount=18">
            <th><xsl:value-of select="../PlayerOut"/></th>
      </xsl:if>-->
    </xsl:for-each>
    <!--<xsl:if test="$HoleCount=18">
            <th><xsl:value-of select="PlayerIn"/></th>
    </xsl:if>-->
            <th><xsl:value-of select="PlayerRoundTot"/></th>
  </xsl:if>
        </tr>
</xsl:if>
<xsl:if test="$ScoreType&gt;0">
        <tr id="player1-score" class="score number">
  <xsl:if test="$ScoreType&gt;1 and $Counting=0">
            <th rowspan="{$rowpan}" class="player title text">
              <xsl:value-of select="PlayerName"/>
      <xsl:if test="$Counting=1 and PlayerHandicap!=''">
              (<xsl:value-of select="PlayerHandicap"/>)
      </xsl:if>
            </th>
  </xsl:if>
  <xsl:for-each select="PlayerHole">
            <td>
          <xsl:choose>
          <xsl:when test="$ScoreType=3">
            <xsl:if test="$Counting=1">
              <xsl:if test="HoleScore!=255 and HoleTypeScore!=255">
                <xsl:value-of select="HoleTypeScore"/>
              </xsl:if>
            </xsl:if>
            <xsl:if test="HoleScore=1 and HoleTypeScore!=255">
                <xsl:value-of select="HoleTypeScore"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="$Counting=1">
            <xsl:if test="HoleScore!=255 and HoleTypeScore!=255">
              <xsl:value-of select="HoleTypeScore"/>
            </xsl:if>
          </xsl:when>
          </xsl:choose>
      <xsl:if test="HoleCheck=1">
              <img src="../../GolfViewer/images/check.png" alt="checked" style="float: right;"/>
      </xsl:if>
            </td>
    <xsl:if test="position()=9 and $HoleCount=18">
            <th><xsl:value-of select="../PlayerOutType"/></th>
    </xsl:if>
  </xsl:for-each>
    <xsl:if test="$HoleCount=18">
            <th><xsl:value-of select="PlayerInType"/></th>
    </xsl:if>
            <th><xsl:value-of select="PlayerRoundTotType"/></th>
          </tr>
</xsl:if>
</xsl:for-each>
<xsl:for-each select="Scorecard/Player">
  <xsl:if test="$ScoreType&lt;2 or $Counting=1">
          <tr id="player1" class="player number">
            <th rowspan="{$rowpan}" class="title text">
              <xsl:value-of select="PlayerName"/>'s Putts
      <xsl:if test="$Counting=1 and PlayerHandicap!=''">
              (<xsl:value-of select="PlayerHandicap"/>)
      </xsl:if>
            </th>
  <xsl:if test="$ScoreType=0 or $Counting=1">
    <xsl:for-each select="PlayerHole">
            <td>
            <xsl:if test="HolePutts!=255">
              <xsl:value-of select="HolePutts"/>
            </xsl:if>
            </td>
    </xsl:for-each>
            <th>
			<xsl:value-of select="PlayerPutts"/>
			</th>
  </xsl:if>
        </tr>
</xsl:if>
<xsl:if test="$ScoreType&gt;0">
        <tr id="player1-score" class="score number">
  <xsl:if test="$ScoreType&gt;1 and $Counting=0">
            <th rowspan="{$rowpan}" class="player title text">
              <xsl:value-of select="PlayerName"/>
      <xsl:if test="$Counting=1 and PlayerHandicap!=''">
              (<xsl:value-of select="PlayerHandicap"/>)
      </xsl:if>
            </th>
  </xsl:if>
  <xsl:for-each select="PlayerHole">
            <td>
          <xsl:choose>
          <xsl:when test="$ScoreType=3">
            <xsl:if test="$Counting=1">
              <xsl:if test="HoleScore!=255 and HoleTypeScore!=255">
                <xsl:value-of select="HoleTypeScore"/>
              </xsl:if>
            </xsl:if>
            <xsl:if test="HoleScore=1 and HoleTypeScore!=255">
                <xsl:value-of select="HoleTypeScore"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="$Counting=1">
            <xsl:if test="HoleScore!=255 and HoleTypeScore!=255">
              <xsl:value-of select="HoleTypeScore"/>
            </xsl:if>
          </xsl:when>
          </xsl:choose>
      <xsl:if test="HoleCheck=1">
              <img src="../../GolfViewer/images/check.png" alt="checked" style="float: right;"/>
      </xsl:if>
            </td>
    <xsl:if test="position()=9 and $HoleCount=18">
            <th><xsl:value-of select="../PlayerOutType"/></th>
    </xsl:if>
  </xsl:for-each>
    <xsl:if test="$HoleCount=18">
            <th><xsl:value-of select="PlayerInType"/></th>
    </xsl:if>
            <th><xsl:value-of select="PlayerRoundTotType"/></th>
          </tr>
</xsl:if>
</xsl:for-each>
<xsl:for-each select="Scorecard/Player">
  <xsl:if test="$ScoreType&lt;2 or $Counting=1">
          <tr id="player1" class="player number" style="background-color:white">
            <th rowspan="{$rowpan}" class="title text">
              <xsl:value-of select="PlayerName"/>'s Fairways
      <xsl:if test="$Counting=1 and PlayerHandicap!=''">
              (<xsl:value-of select="PlayerHandicap"/>)
      </xsl:if>
            </th>
  <xsl:if test="$ScoreType=0 or $Counting=1">
    <xsl:for-each select="PlayerHole">
            <td>
			<!-- <HoleFairwayHit> 0=Left,1=Right,2=Hit,3=Par3 -->
			<xsl:if test="HolePutts!=255">
				<xsl:choose>
				 <xsl:when test="HoleFairwayHit=0">
				   <img src="../../GolfViewer/images/left.gif" alt="Left" />
				 </xsl:when>
				 <xsl:when test="HoleFairwayHit=1">
				   <img src="../../GolfViewer/images/right.gif" alt="Right" />
				 </xsl:when>
				 <xsl:when test="HoleFairwayHit=2">
				   <img src="../../GolfViewer/images/hit.gif" alt="Hit" />
				 </xsl:when>
				 <xsl:otherwise>
				  _
				 </xsl:otherwise>
			   </xsl:choose>
		   </xsl:if>
            </td>
    </xsl:for-each>
            <th>
			
			</th>
  </xsl:if>
        </tr>
</xsl:if>
<xsl:if test="$ScoreType&gt;0">
        <tr id="player1-score" class="score number">
  <xsl:if test="$ScoreType&gt;1 and $Counting=0">
            <th rowspan="{$rowpan}" class="player title text">
              <xsl:value-of select="PlayerName"/>
      <xsl:if test="$Counting=1 and PlayerHandicap!=''">
              (<xsl:value-of select="PlayerHandicap"/>)
      </xsl:if>
            </th>
  </xsl:if>
  <xsl:for-each select="PlayerHole">
            <td>
          <xsl:choose>
          <xsl:when test="$ScoreType=3">
            <xsl:if test="$Counting=1">
              <xsl:if test="HoleScore!=255 and HoleTypeScore!=255">
                <xsl:value-of select="HoleTypeScore"/>
              </xsl:if>
            </xsl:if>
            <xsl:if test="HoleScore=1 and HoleTypeScore!=255">
                <xsl:value-of select="HoleTypeScore"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="$Counting=1">
            <xsl:if test="HoleScore!=255 and HoleTypeScore!=255">
              <xsl:value-of select="HoleTypeScore"/>
            </xsl:if>
          </xsl:when>
          </xsl:choose>
      <xsl:if test="HoleCheck=1">
              <img src="../../GolfViewer/images/check.png" alt="checked" style="float: right;"/>
      </xsl:if>
            </td>
    <xsl:if test="position()=9 and $HoleCount=18">
            <th><xsl:value-of select="../PlayerOutType"/></th>
    </xsl:if>
  </xsl:for-each>
    <xsl:if test="$HoleCount=18">
            <th><xsl:value-of select="PlayerInType"/></th>
    </xsl:if>
            <th><xsl:value-of select="PlayerRoundTotType"/></th>
          </tr>
</xsl:if>
</xsl:for-each>

<xsl:if test="count(Scorecard/Player/PlayerFairways)&gt;0">
          <tr id="stats">
            <td colspan="{$colspan}" class="text">
<xsl:for-each select="Scorecard/Player">
  <xsl:if test="PlayerFairways">
              <p><xsl:value-of select="PlayerName"/>: <xsl:value-of select="PlayerFairways"/>, <xsl:value-of select="PlayerGIR"/>, <xsl:value-of select="PlayerPutts"/></p>
  </xsl:if>
</xsl:for-each>
            </td>
          </tr>
</xsl:if>
        </tbody>
      </table>
      </div>
    </div>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

