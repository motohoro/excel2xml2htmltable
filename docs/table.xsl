<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!--<xsl:copy-of select="document('book.xml')"/> -->
  <xsl:template match="/">
    <html>
      <head>
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="0" />
        <title>推奨・準推奨リスト</title>
        <script src="https://code.jquery.com/jquery-1.4.4.min.js" integrity="sha256-UXNk8tRRYvtQN0N7W2y5U9ANmys7ebqH2f5X6m7mBww=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/christianbach/tablesorter/77457630/jquery.tablesorter.min.js"></script>
        <script>
$(document).ready(function() 
    { 
        $("#recommendedtable").tablesorter();
        $("#subrecommendedtable").tablesorter();
    } 
); 
</script>
        <style>
table.recommended{
background-color:#ffe4e1;
font-weight:bold;
}
table.recommended tbody tr:nth-child(even) { /* 偶数番目の指定*/
 background-color: #ffB6c1;
}


table.subrecommended{
background-color:#e0ffff;
}
table.subrecommended tbody tr:nth-child(even) { /* 偶数番目の指定*/
 background-color: skyblue;
}

</style>
      </head>
      <body>
        <!--<xsl:copy-of select="document('book1.xml')//books"/>-->
        <table border="1" class="recommended tablesorter" id="recommendedtable">
          <caption>推奨品</caption>
          <thead>
            <tr>
              <th>後発品名</th>
              <th>先発品名</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="document('推奨品リストxlsx2xml.xml')/lists/entry">
              <xsl:sort select="G後発商品名" data-type="text" order="ascending" />
              <tr>
                <td>
                  <xsl:value-of select="G後発商品名" />
                </td>
                <td>
                  <xsl:value-of select="先発商品名" />
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <hr />
        <table border="1" class="subrecommended tablesorter" id="subrecommendedtable">
          <caption>準推奨品</caption>
          <thead>
            <tr>
              <th>後発品名</th>
              <th>先発品名</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="document('準推奨品リストxlsx2xml.xml')/lists/entry">
              <xsl:sort select="G後発商品名" data-type="text" order="ascending" />
              <tr>
                <td>
                  <xsl:value-of select="G後発商品名" />
                </td>
                <td>
                  <xsl:value-of select="先発商品名" />
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
