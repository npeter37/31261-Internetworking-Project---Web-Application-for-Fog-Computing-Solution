<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : viewUsers.xsl
    Created on : 15 September 2017, 8:57 PM
    Author     : Peter Nguyen
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="users">
        <html>
            <head>
                <title>Users</title>
                <style>
                    table.format {border: solid 1px black; width:100%; }
                    table.format td { border: solid 1px #999; }
                </style>
            </head>
            <body>
                <table class="format">
                    <thead>
                        <th>Name</th>
                        <th>Email</th>
                        <th>MAC</th>
                        <th>Privilege</th>
                    </thead>
                    <tbody>
                        <xsl:apply-templates />
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="user">
        <tr>
            <td>
                <xsl:value-of select="name"/>
            </td>
            <td>
                <xsl:value-of select="email"/>
            </td>
            <td>
                <xsl:value-of select="mac"/>
            </td>
            <td>
                <xsl:value-of select="privilege"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>

