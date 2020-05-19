<?xml version="1.0" encoding="Big5"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<xsl:output version="1.0" method="html" indent="no" encoding="Big5" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
<xsl:param name="SV_OutputFormat" select="'HTML'"/>
<xsl:variable name="XML" select="/"/>
<xsl:template match="/">
          <html>
                 <head>
                 		<meta http-equiv="X-UA-Compatible" content="IE=8" />
<style type="text/css"> 
@page { 
	size: 210mm 297mm;
	margin-left: 17mm; 
	margin-right: 10mm; 
	margin-top: 15mm; 
	margin-bottom: 30mm; 
}

@media print {
	pre.wdwrapft { 
		overflow: hidden;
		word-wrap: break-word;
		width: 175mm;
	}

	table.tbvisualft {
		width: 175mm;
	}

	body {
		font-size: 9pt;
	}
	
	img {
		width: 100%;
	}
}

@media screen {
	table.tbvisualft {
		width: 100%;
	}

	body {
		font-size: 12pt;
		font-family: 微軟正黑體;
	}
}

table, td {
	border-collapse: collapse;
	border-color: #000000; 
}

table.tbinnerft {
	width: 100%;
	border-collapse: collapse;
	empty-cells: hide;
}

td.tdinnerft {
	border-style: solid;
	border-width: 1px;
	border-color: #999999;
}

.tdStyle1{
	width:15%;
	height:33%;

}

.headTDStyle{
	TEXT-ALIGN:Left;
}

</style> 
                 </head>
                 <body>
                           <br/>
                           <table border="0" width="100%">
                                  <tbody>
                                             <tr>
                                                    <td valign="top" width="30%">
                                                             <span>
                                                                     <xsl:text></xsl:text><br/>
                                                                     <xsl:text></xsl:text>
                                                             </span>
                                                    </td>
                                                    <td align="center" width="40%">
                                                             <span style="font-size:x-large; font-weight:bold;" >
                                                                                      <xsl:for-each select="$XML">
                                                                                          <xsl:for-each select="Special_Note">
                                                                                              <xsl:for-each select="TITLE">
                                                                                                      <xsl:value-of select="."/>
                                                                                              </xsl:for-each>
							                                                             </xsl:for-each>
						                                                             </xsl:for-each>
                                                             </span>
                                                    </td>
                                                    <td width="30%">
                                                             <table border="1" width="100%">
                                                                         <tr>
                                                                                <td colspan="2">
                                                                                      <span>
                                                                                            <xsl:text>姓名：</xsl:text>
                                                                                      </span>
                                                                                      <xsl:for-each select="$XML">
                                                                                          <xsl:for-each select="Special_Note">
                                                                                              <xsl:for-each select="PATIENT_INFO">
                                                                                                  <xsl:for-each select="PAT_NAME">
                                                                                                      <xsl:value-of select="."/>
                                                                                                  </xsl:for-each>
                                                                                              </xsl:for-each>
							                                  </xsl:for-each>
						                                      </xsl:for-each>
                                                                                </td>
                                                                                <td class="headTDStyle" rowspan="3"> 
						                               														  <xsl:for-each select="$XML">
                                                                            <xsl:for-each select="Special_Note">
						                                                                       <xsl:for-each select="IPD_INFO">
													                                                                <xsl:for-each select="IPD_BED">
													                                                                	<xsl:apply-templates/>
														                                              </xsl:for-each>		
													 						                                    </xsl:for-each>
													 						                                    </xsl:for-each>
													 						                                      </xsl:for-each> 
							                                
												</td>
                                                                         </tr>
                                                                         <tr>
                                                                              <td colspan="2">
                                                                                    <span>
						                                           <xsl:text>病歷號：</xsl:text>
					                                            </span>
                                                                                    <xsl:for-each select="$XML">
                                                                                        <xsl:for-each select="Special_Note">
						                                            <xsl:for-each select="PATIENT_INFO">
						                                                <xsl:for-each select="PAT_NO">
								                                   <xsl:value-of select="."/>
								                  						                                    </xsl:for-each>
							                                </xsl:for-each>
						                                    </xsl:for-each>
						                                     </xsl:for-each>
						                               </td>
						                               													
                                                                          </tr>
                                                                          <tr>
					                                      <td>
						                                  <span>
							                                 <xsl:text>出生日：</xsl:text>
						                                  </span>
						                                  <xsl:for-each select="$XML">
							                              <xsl:for-each select="Special_Note">
							                                  <xsl:for-each select="PATIENT_INFO">
							                                      <xsl:for-each select="BIRTH_DT">
								                                   <xsl:apply-templates/>
								                              </xsl:for-each>
							                                  </xsl:for-each>
							                              </xsl:for-each>
					                                         </xsl:for-each>
							                         <span>
							                                  <xsl:text> ( </xsl:text>
							                         </span>
							                         <xsl:for-each select="$XML">
							                             <xsl:for-each select="Special_Note">
								                         <xsl:for-each select="PATIENT_INFO">
									                     <xsl:for-each select="AGE">
									                         <xsl:apply-templates/>
									                     </xsl:for-each>
								                         </xsl:for-each>
							                             </xsl:for-each>
							                         </xsl:for-each>
							                         <span>
								                           <xsl:text> ) </xsl:text>
							                         </span>
						                            </td>
						                            <td>
						                                 <xsl:for-each select="$XML">
						                                     <xsl:for-each select="Special_Note">
								                          <xsl:for-each select="PATIENT_INFO">
									                      <xsl:for-each select="SEX">
									                          <xsl:apply-templates/>
									                      </xsl:for-each>
								                          </xsl:for-each>
							                             </xsl:for-each>
						                                 </xsl:for-each>
						                            </td>
					                               </tr>
                                                             </table>
                                                    </td>
                                             </tr>
                                  </tbody>
                           </table>


                                                      <br/>
                                                      
                                                      <span>
							       <xsl:text>　　　住院日期：</xsl:text>
						      </span>
                                                      <xsl:for-each select="$XML">
                                                             <xsl:for-each select="Special_Note">
                                                              <xsl:for-each select="IPD_INFO">
						                           <xsl:for-each select="IPD_IN_DATE">
							                            <xsl:value-of select="."/>
						                                </xsl:for-each>
                                                       </xsl:for-each>
                                                </xsl:for-each>
						       </xsl:for-each>
                                                       <hr>
                                                       </hr>
                      <table  border="0" width="90%" align="center">
                             <tbody>
                                        <tr>
                                             <td colspan="2">
                                             <span style="font-size:large; font-weight:bold;" >
				                                 <xsl:text>紀錄時間：</xsl:text>
                                                  <xsl:for-each select="$XML">
							<xsl:for-each select="Special_Note">
							     <xsl:for-each select="CONTENT">
							          <xsl:for-each select="RECORD_DATE">
								     <xsl:apply-templates/>
							          </xsl:for-each>
							     </xsl:for-each>
							</xsl:for-each>
                                                  </xsl:for-each> 
                                             </span>
                                             <span style="font-size:large; font-weight:bold;" >
							<xsl:text>　</xsl:text>
						<xsl:for-each select="$XML">
							<xsl:for-each select="Special_Note">
							     <xsl:for-each select="CONTENT">
							          <xsl:for-each select="RECORD_TIME">
								     <xsl:apply-templates/>
								  </xsl:for-each>
							     </xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
                                             </span>
                                             <br/>
                                             </td>
                                        </tr>
                                        <tr>
                                             <td width="2%">
                                             </td>
                                             <td width="98%">
                                                <pre>
                                                    <xsl:for-each select="$XML">
							<xsl:for-each select="Special_Note">
							     <xsl:for-each select="CONTENT">
							          <xsl:for-each select="DIAGNOSIS">
							           <div style="white-space:pre;">
								     <xsl:apply-templates/>
								     </div>
								  </xsl:for-each>
							     </xsl:for-each>
							</xsl:for-each>
                                   </xsl:for-each></pre>
                                             <br/>
                                                    <xsl:for-each select="$XML">
									<xsl:for-each select="Special_Note">
                                         <xsl:for-each select="CONTENT">
										          <xsl:for-each select="Picture">
										<img style="width:50%;">
											<xsl:attribute name="src">
												<xsl:if test="substring(string(.), 2, 1) = ':'">
													<xsl:text>file:///</xsl:text>
												</xsl:if>
												<xsl:value-of select="translate(string(.), '&#x5c;', '/')"/>
											</xsl:attribute>
											<xsl:attribute name="alt"/>
										</img>
										</xsl:for-each>
                                             </xsl:for-each>
									</xsl:for-each>
                                </xsl:for-each>
                                             </td>
                                        </tr>
                                    </tbody>
                      </table>
                      <br/>
          <xsl:for-each select="$XML">
						<xsl:for-each select="Special_Note">
								<xsl:choose>
									<xsl:when test="$XML/Special_Note/RECORDER!='' ">
					         <table border="0" width="90%" align="center">
								     <tbody>
									     <tr >
									     	<td width='45%'></td>
										<td >	
											<span>
												<xsl:text>紀錄者：</xsl:text>
											</span>			
											<xsl:for-each select="RECORDER">								
														<xsl:value-of select="."/>
											</xsl:for-each>
										</td>
									</tr>
							</tbody>
						</table>
					</xsl:when>
						  <xsl:otherwise>
						     <table border="0" width="90%" align="center">
										<tbody>
									    <tr >
									    	<td width='45%'></td>
										    <td >	
											    <span>
												    <xsl:text>輔助紀錄者：</xsl:text>
											     </span>			
											     <xsl:for-each select="RECORDER2">													
														<xsl:value-of select="."/>
														</xsl:for-each>
										    </td>
									    </tr>
							      </tbody>
						     </table>
						  </xsl:otherwise>
        </xsl:choose>
													</xsl:for-each>
												</xsl:for-each>
												 	<xsl:for-each select="$XML">
						<xsl:for-each select="Special_Note">
							<xsl:for-each select="VS_UPLOAD">										   	
							     <xsl:if test=".!='' ">
       <table border="0" width="90%" align="center">
        	<tr>
        		<td width='45%'></td>
        		<td><xsl:text>主治醫師：</xsl:text>
        		    <xsl:value-of select="."/>
        		    <xsl:text>　已覆核</xsl:text>
        		</td>
        	</tr>
        </table>
        	          </xsl:if>
											</xsl:for-each>
												</xsl:for-each>
													</xsl:for-each>
							
												 	<xsl:for-each select="$XML">
						<xsl:for-each select="Special_Note">
							<xsl:for-each select="VS_NO_UPLOAD">										   	
							     <xsl:if test=".!='' ">
       <table border="0" width="90%" align="center">
        	<tr>
        		<td width='45%'></td>
        		<td><xsl:text>(主治醫師：</xsl:text>
        		    <xsl:value-of select="."/>
        		    <xsl:text>　未覆核)</xsl:text>
        		</td>
        	</tr>
        </table>
        	          </xsl:if>
											</xsl:for-each>
												</xsl:for-each>
													</xsl:for-each>
								<xsl:if test="$XML/Special_Note/VSCOMMENT/COMMENT_TEXT!='' ">
											<xsl:for-each select="$XML">
                        <xsl:for-each select="Special_Note">   
                           <table border="0" align="center" width="90%">
                           	<tr colspan='2'>
                           		<td>
                           			<span style="font-size:large; font-weight:bold;">
                           		    VS Comment
                           		    </span>
                           		</td>
                            </tr>
                            <xsl:for-each select="VSCOMMENT"> 
                              <tr colspan='2'>
                                <td>
                                <span>
                                	        <div style="white-space:pre" >
                                            <xsl:for-each select="COMMENT_TEXT">
                                                <xsl:apply-templates/>
                                            </xsl:for-each>
                                          </div>
                                </span>
                                </td>
                              </tr>
                              <tr>
                              	<td width='45%'></td>
                                <td >
                                <span>
                                	<div style="white-space:pre" >
                                            <xsl:for-each select="COMMENT_DR">
                                                <xsl:apply-templates/>
                                            </xsl:for-each>
                                            </div>
                                </span>
                                </td>
                               </tr>
                              </xsl:for-each>   
                          </table>      
                      </xsl:for-each>
						         </xsl:for-each>  
						        </xsl:if>
											<xsl:for-each select="$XML">
                        <xsl:for-each select="Special_Note">       
                            <table border="0" align="center" width="90%">
                              <tr>
                                <td align="right"  width="80%" color="red">
                                <span><font color="RED">
                                <b>
                                            <xsl:for-each select="SIGNED_NOTE">
                                                <xsl:apply-templates/>
                                            </xsl:for-each>
                                   </b>     
                                </font></span>
                                </td>
                            </tr>
                          </table>       
                      </xsl:for-each>
						         </xsl:for-each>  
                 </body>
          </html>
    </xsl:template>
</xsl:stylesheet>