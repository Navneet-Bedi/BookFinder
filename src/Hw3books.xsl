<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : Hw3books.xsl
    Created on : February 2, 2016, 11:46 AM
    Author     : Navneet
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name ="data"/>
<xsl:param name="dataType"/>
<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
<xsl:template match ="/books">
<xsl:choose>
  <!-- If Title is selected -->
  <xsl:when test="$dataType='title' and count(book[translate(title, $lowercase, $uppercase)=translate($data, $lowercase, $uppercase)])>0">
       <table border='1'>
             <tr><th>Title</th><th>Author(s)</th><th>Price</th></tr>
             <xsl:for-each select="book[translate(title, $lowercase, $uppercase)=translate($data, $lowercase, $uppercase)]">
             <tr><td> <xsl:value-of select="title"/></td>
             <td><xsl:for-each select="authors/author">
                  <xsl:if test="position()>1">, </xsl:if>
                  <xsl:value-of select="."/>
                 </xsl:for-each></td>
             <td><xsl:value-of select="price"/></td></tr>
             </xsl:for-each>
       </table>
  </xsl:when>
   <!-- If Author is selected --> 
  <xsl:when test="$dataType='author' and count(book[translate(authors/author, $lowercase, $uppercase)=translate($data, $lowercase, $uppercase)])>0">
       <table border='1'>
           <tr><th>Title</th><th>Author(s)</th><th>Price</th></tr>
            <xsl:for-each select="book[translate(authors/author, $lowercase, $uppercase)=translate($data, $lowercase, $uppercase)]">
                 <tr><td> <xsl:value-of select="title"/></td>
                  <td><xsl:for-each select="authors/author">
                      <xsl:if test="position()> 1">, </xsl:if>
                      <xsl:value-of select="."/>
                      </xsl:for-each></td>
                  <td><xsl:value-of select="price"/></td></tr>
           </xsl:for-each>
       </table>
  </xsl:when>
  <!-- If Price is selected -->
  <xsl:when test="$dataType='price' and count(book[price=$data])>0">
    <table border='1'>
     <tr><th>Title</th><th>Author(s)</th><th>Price</th></tr>
      <xsl:for-each select="book[price=$data]">
       <tr><td> <xsl:value-of select="title"/></td>
        <td><xsl:for-each select="authors/author">
            <xsl:if test="position()>1">, </xsl:if>
            <xsl:value-of select="."/>
            </xsl:for-each></td>
        <td><xsl:value-of select="price"/></td></tr>
       </xsl:for-each>
     </table>
  </xsl:when>
   <!-- If no radio button is selected -->
  <xsl:when test="$dataType=''">
    <p>Need to choose Title, Author or Price.</p>                
  </xsl:when> 
  <!-- If wrong or blank data is provided -->
  <xsl:otherwise>
    <p>
       No such <xsl:value-of select="$dataType"/> : <xsl:value-of select="$data"/>
    </p>
  </xsl:otherwise>
 </xsl:choose>
</xsl:template>
</xsl:stylesheet>