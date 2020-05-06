<?xml version="1.0" encoding="Big5"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes">
<xsl:output version="1.0" method="html" indent="no" encoding="Big5" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
<xsl:param name="SV_OutputFormat" select="'HTML'"/>
<xsl:variable name="XML" select="/"/>
<xsl:copy-of select="body/text()|body/*"/>
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
									<xsl:text></xsl:text>
									<br/>
									<xsl:text></xsl:text>
								</span>
							</td>
							<td width="40%" align="center">
								<span style="font-size:x-large;font-weight:bold;">
									<xsl:text>Problem List</xsl:text>
									<br/>
								</span>
							</td>
							<td width="30%">
								<table border="1" width="100%">
									<tr>
										<td colspan="2">
											<span>
												<xsl:text>病歷號：</xsl:text>
											</span>
											<xsl:for-each select="$XML">
												<xsl:for-each select="ProblemList">
													<xsl:for-each select="PATIENT_INFO">
														<xsl:for-each select="PAT_NO">
															<xsl:value-of select="."/>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
										</td>
										                                                                                <td class="headTDStyle" rowspan="3"> 
						                               														  <xsl:for-each select="$XML">
                                                                            <xsl:for-each select="ProblemList">
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
												<xsl:text>姓名：</xsl:text>
											</span>
											<xsl:for-each select="$XML">
												<xsl:for-each select="ProblemList">
													<xsl:for-each select="PATIENT_INFO">
														<xsl:for-each select="PAT_NAME">
															<xsl:apply-templates/>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td>
											<span>
												<xsl:text>生日：</xsl:text>
											</span>
											<xsl:for-each select="$XML">
												<xsl:for-each select="ProblemList">
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
												<xsl:for-each select="ProblemList">
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
												<xsl:for-each select="ProblemList">
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
                <table>
					<tbody>
						<tr>
							<td>
							                <span>
												<xsl:text>　　　主治醫師：</xsl:text>
											</span>
											<xsl:for-each select="$XML">
												<xsl:for-each select="ProblemList">
												<xsl:for-each select="IPD_INFO">
														<xsl:for-each select="IPD_MAJOR_DR">
														    <xsl:apply-templates/>
														    </xsl:for-each>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:for-each>
												</td>
						</tr>
						<tr>
							<td>
							                <span>
												<xsl:text>　　　住院日期：</xsl:text>
											</span>
											<xsl:for-each select="$XML">
												<xsl:for-each select="ProblemList">
												<xsl:for-each select="IPD_INFO">
														<xsl:for-each select="IPD_IN_DATE">
														     <xsl:apply-templates/>
														       </xsl:for-each>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:for-each>
												</td>
						</tr>
					</tbody>
				</table>
<br/>                
          <table border="1" width="100%">
                     <tbody>
                                <tr>
					<td width="5%">
                                              <span style="font-size:large;font-weight:bold;">
                                                  <xsl:text>NO.</xsl:text>
                                              </span>
					</td>
					<td width="55%">
                                              <span style="font-size:large;font-weight:bold;">
                                                  <xsl:text>MEDICAL PROBLEM</xsl:text>
                                              </span>
					</td>
					<td  width="20%">
                                              <span style="font-size:large;font-weight:bold;">
                                                  <xsl:text>DATE OF ONSET</xsl:text>
                                              </span>
					</td>
					<td  width="20%">
                                              <span style="font-size:large;font-weight:bold;">
                                                  <xsl:text>DATE RESOLVED</xsl:text>
                                              </span>
					</td>
				</tr>            
                                <xsl:for-each select="$XML">
                                     <xsl:for-each select="ProblemList">
                                         <xsl:for-each select="MED_NO">
                                               <xsl:for-each select="PROBLEM"> 
                                                       <tr>
                                                             <td  width="5%">
					                             <xsl:for-each select="NO"> 
					                                  <div style="white-space:pre" >
					                                      <xsl:apply-templates/>		
					                                  </div>			      
					                             </xsl:for-each>
				                             </td>
                                                             <td  width="55%">
					                          <xsl:for-each select="MED_PRO">
					                                   <div style="white-space:pre" >
					                                        <xsl:apply-templates/>		
					                                  </div>				      
					                          </xsl:for-each>
				                             </td>
                                                             <td width="20%">
					                          <xsl:for-each select="DATE_OF_ONSET">
					                                  	<div style="white-space:pre" >
					                                        <xsl:apply-templates/>		
					                                  </div>				      		      
					                          </xsl:for-each>
				                             </td>
                                                             <td width="20%">
					                          <xsl:for-each select="DATE_RESOLVED">
					                                  	<div style="white-space:pre" >
					                                        <xsl:apply-templates/>		
					                                  </div>				      	      
					                         </xsl:for-each>
				                             </td>     
                                                       </tr>
                                              </xsl:for-each>
                                        </xsl:for-each>
                                  </xsl:for-each>    
                          </xsl:for-each>
                    </tbody>
             </table>
 <br/> 

                     <table border="0" width="100%">
                            <tbody>
                                    <tr>
                                      <td align="center" width="20%">
					  <span style="font-size:large;font-weight:bold;">
					      <xsl:text>主治醫師:　</xsl:text>					      
					  </span>
					      <xsl:for-each select="$XML">
					      <xsl:for-each select="ProblemList">
						          <xsl:for-each select="DR_SIGNED">	 
								      <xsl:value-of select="."/>		 
						    </xsl:for-each>    
					      </xsl:for-each>
					   </xsl:for-each>
                     		      </td> 
                                    </tr>
                            </tbody>
                     </table>
                                    <xsl:for-each select="$XML">
                        <xsl:for-each select="ProblemList">
                        	<br/>
                <table border="0" align="center" width="90%">
                            <tr>
                                <td align="right" colSpan="2" width="80%" color="red">
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