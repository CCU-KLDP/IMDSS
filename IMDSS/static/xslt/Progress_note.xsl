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
#emr @page { 
	size: 210mm 297mm;
	margin-left: 17mm; 
	margin-right: 10mm; 
	margin-top: 15mm; 
	margin-bottom: 30mm; 
}

#emr @media print {
	pre.wdwrapft { 
		overflow: hidden;
		word-wrap: break-word;
		width: 175mm;
	}

	table.tbvisualft {
		width: 175mm;
	}

	body {
		font-size: 12pt;
	}
	
	img {
		width: 100%;
	}
}

#emr @media screen {
	table.tbvisualft {
		width: 100%;
	}

	body {
		font-size: 10pt;
		font-family: 新細明體;
		
	}
}

#emr table, td {
	border-collapse: collapse;
	border-color: #000000; 
}

#emr table.tbinnerft {
	width: 100%;
	border-collapse: collapse;
	empty-cells: hide;
}

#emr td.tdinnerft {
	border-style: solid;
	border-width: 1px;
	border-color: #999999;
}

#emr .tdStyle1{
	width:15%;
	height:33%;

}

#emr .headTDStyle{
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
								<xsl:text>Progress Note</xsl:text>
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
                                                                  <xsl:for-each select="Progress_note">
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
                                                                            <xsl:for-each select="Progress_note">
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
                                                                  <xsl:for-each select="Progress_note">
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
							        <xsl:for-each select="Progress_note">
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
							        <xsl:for-each select="Progress_note">
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
						              <xsl:for-each select="Progress_note">
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
                                                             <xsl:for-each select="Progress_note">
                                                               <xsl:for-each select="IPD_INFO">
						                                         <xsl:for-each select="IPD_IN_DATE">
							                                                 <xsl:value-of select="."/>
						                                             </xsl:for-each>
                                                             </xsl:for-each>
                                                        </xsl:for-each>
						       </xsl:for-each>
                      <hr>
                      </hr>
           <xsl:for-each select="$XML">
						   <xsl:for-each select="Progress_note">
						   	 <xsl:for-each select="PIPING_MARK">
							     <xsl:if test=".='Y' ">
						   	 <table border="1" width="100%">
				          <tbody>
						       <tr style="font-weight:bold;">
                <td align="center">
								<span>
									<xsl:text>天</xsl:text>
								</span>
							</td>                        
							<td align="center">
							        <span>
									<xsl:text>管路敘述</xsl:text>
									</span>
							</td>  
							<td align="center">
								<span>
									<xsl:text>置入部位狀況</xsl:text>
								</span>
							</td>
							<td align="center">
								<span>
									<xsl:text>適應症</xsl:text>
								</span>
							</td>
                            <td align="center">
								<span>
									<xsl:text>置入日</xsl:text>
								</span>
							</td>  
								   </tr>
						<xsl:for-each select="$XML">
						   <xsl:for-each select="Progress_note">
						   	 <xsl:for-each select="PIPING">
									<tr>
										<td>
											<xsl:for-each select="PIPING_DAY">
												<xsl:apply-templates/>
											</xsl:for-each>
										</td>
										<td>
											<xsl:for-each select="PIPING_DESCRIPTION">
												<xsl:apply-templates/>
											</xsl:for-each>
										</td>
										<td>
											<xsl:for-each select="PIPING_STATUS">
												<div style="white-space:pre" >
												<xsl:apply-templates/>
												</div>
											</xsl:for-each>
										</td>
									
										<td>
											<xsl:for-each select="PIPING_INDICATION">
												<xsl:apply-templates/>
											</xsl:for-each>
									</td>
									<td>
											<xsl:for-each select="PIPING_IN_DT">
												<xsl:apply-templates/>
											</xsl:for-each>									
										</td>
								</tr>
							</xsl:for-each>
						</xsl:for-each>  
								</xsl:for-each>       
								  </tbody> 
								 </table>
								</xsl:if>
							</xsl:for-each>
						</xsl:for-each>  
						</xsl:for-each>
          <br/>
          		<xsl:for-each select="$XML">
						   <xsl:for-each select="Progress_note">
						   	 <xsl:for-each select="CULTURE_MARK">
							     <xsl:if test=".='Y' ">
         <b><span><xsl:text>★ CULTURE 追蹤</xsl:text></span></b>
          <table border="1" width="100%">
				       <tbody>  
				       	  <tr style="font-weight:bold;">
                <td align="center">
								<span>
									<xsl:text>送檢日期</xsl:text>
								</span>
							</td>                        
							<td align="center">
							        <span>
									<xsl:text>送檢細菌名稱</xsl:text>
									</span>
							</td>  
							<td align="center">
								<span>
									<xsl:text>檢驗結果</xsl:text>
								</span>
							</td>
							<td align="center">
								<span>
									<xsl:text>報告日期</xsl:text>
								</span>
							</td> 
								   </tr>
						<xsl:for-each select="$XML">
						   <xsl:for-each select="Progress_note">
						   	 <xsl:for-each select="CULTURE">
									<tr>
										<td width="10%">
											<xsl:for-each select="CULTURE_DAY">
												<xsl:apply-templates/>
											</xsl:for-each>
										</td>
										<td width="40%">
											<xsl:for-each select="CULTURE_DESCRIPTION">
												<xsl:apply-templates/>
											</xsl:for-each>
										</td>								
										<td  width="35%">
											<xsl:for-each select="CULTURE_RESULT">
												<xsl:apply-templates/>
											</xsl:for-each>
									</td>
									<td>
											<xsl:for-each select="CULTURE_RPT_DT">
												<xsl:apply-templates/>
											</xsl:for-each>									
										</td>
								</tr>
							</xsl:for-each>
						</xsl:for-each>  
								</xsl:for-each>       
								  </tbody> 
								 </table>
								 						     </xsl:if>
							</xsl:for-each>
						</xsl:for-each>  
						</xsl:for-each>
								  <br/>
					   <xsl:for-each select="$XML">
						   <xsl:for-each select="Progress_note">
						   	 <xsl:for-each select="HYC_MARK">
							     <xsl:if test=".='Y' ">
                       <table border="1" width="100%">
				       <tbody>
						<tr style="font-weight:bold;">
							<td align="center">
								<span>
									<xsl:text>序</xsl:text>
								</span>
							</td>                        
							<td align="center">
							        <span>
									<xsl:text>識</xsl:text>
									</span>
							</td>  
							<td align="center">
								<span>
									<xsl:text>抗生素名稱</xsl:text>
								</span>
							</td>
							<td align="center">
								<span>
									<xsl:text>次劑量</xsl:text>
								</span>
							</td>
                            <td align="center">
								<span>
									<xsl:text>單位</xsl:text>
								</span>
							</td>
							<td align="center">
								<span>
									<xsl:text>服法</xsl:text>
								</span>
							</td>
							<td align="center">
								<span>
									<xsl:text>途徑</xsl:text>
								</span>
							</td>
							<td align="center">
								<span>
									<xsl:text>起日-時</xsl:text>
								</span>
							</td>
						</tr>    
          <xsl:for-each select="$XML">
						   <xsl:for-each select="Progress_note">
							      <xsl:for-each select="HYC_ORDER">
									<tr>
										<td>
											<xsl:for-each select="HYC_ODR_NO">
												<xsl:apply-templates/>
											</xsl:for-each>
										</td>
										<td>
											<xsl:for-each select="HYC_ODR_TYPE">
												<xsl:apply-templates/>
											</xsl:for-each>
										</td>
									
										<td>
											<xsl:for-each select="HYC_NAME">
												<xsl:apply-templates/>
											</xsl:for-each>
									</td>
									<td>
											<xsl:for-each select="HYC_DOSE">
												<xsl:apply-templates/>
											</xsl:for-each>
										
										</td>
                    <td>
											<xsl:for-each select="HYC_UNIT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</td>
										<td>
											<xsl:for-each select="HYC_FREQ">
												<xsl:apply-templates/>
											</xsl:for-each>
										</td>
										<td>
											<xsl:for-each select="HYC_ROUTE">
												<xsl:apply-templates/>
											</xsl:for-each>
										</td>
										<td>
                       <xsl:for-each select="HYC_DAYS">
												<xsl:apply-templates/>
											</xsl:for-each>
										</td>
                      
								</tr>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>        
                   </tbody>
                   </table>  

						<table border="0" width="100%">
							<tbody>
							<xsl:for-each select="$XML">
						   <xsl:for-each select="Progress_note">
								<tr>
									<td width="50%">抗生素開立條件</td><td width="50%">適應症及使用說明</td>
								</tr>
								<tr>
									<td>
										<span><xsl:text>--身高:</xsl:text></span>
										<xsl:for-each select="HEIGHT">
												<xsl:apply-templates/>
											</xsl:for-each>
									</td>
									<td rowspan="2">
										<xsl:for-each select="CONDITION">
												<xsl:apply-templates/>
											</xsl:for-each>	
									</td>
								</tr>
																<tr>
															
									<td>
										<span><xsl:text>--體重:</xsl:text></span>
										<xsl:for-each select="WEIGHT">
												<xsl:apply-templates/>
											</xsl:for-each></td>
								</tr>
																<tr>
																
									<td>
											<span><xsl:text>--血清肌酸酐:</xsl:text></span>
										<xsl:for-each select="VAL">
												<xsl:apply-templates/>
											</xsl:for-each></td>
									<td rowspan="2"><xsl:for-each select="DOSE_STATUS">
												<xsl:apply-templates/>
											</xsl:for-each></td>
								</tr>
								<tr>
									<td>
											<span><xsl:text>--Estimated CCr:</xsl:text></span>
										<xsl:for-each select="NUM">
												<xsl:apply-templates/>
											</xsl:for-each></td>
								</tr>
										</xsl:for-each>
						</xsl:for-each> 
							</tbody>
						</table> 
						     </xsl:if>
							</xsl:for-each>
						</xsl:for-each>  
						</xsl:for-each>  
						<br/>
                 <table border="0" width="90%" align="center">
							<tbody>
									<tr>
											<td><b>											
													<span >
												   <xsl:text>記錄時間：　</xsl:text>
											       </span>
											       <xsl:for-each select="$XML">
												         <xsl:for-each select="Progress_note">
													         <xsl:for-each select="RECORD_DATE">
															     <xsl:value-of select="."/>
													         </xsl:for-each>
												         </xsl:for-each>
											       </xsl:for-each>
											       	<span>
												        <xsl:text>　</xsl:text>
											       </span>
											       	<xsl:for-each select="$XML">
												         <xsl:for-each select="Progress_note">
													         <xsl:for-each select="RECORD_TIME">
															     <xsl:value-of select="."/>
													         </xsl:for-each>
												         </xsl:for-each>
											       </xsl:for-each>
											       </b>
											 </td>
									</tr>
									<tr>
											<td  style="font-size:middle;">	
											<br/>										
													<span style="font-weight:bold;text-decoration:underline;">
												   <xsl:text>Subjective</xsl:text>
											       </span>
											       <br/>
											<xsl:for-each select="$XML">
												<xsl:for-each select="Progress_note">
													<xsl:for-each select="SUBJECTIVE">
															<div style="white-space:pre" >
															<xsl:value-of select="."/>
														  </div>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
									<tr>
											<td style="font-size:middle;">	
											<br/>											
													<span style="font-weight:bold;text-decoration:underline;">
												   <xsl:text>Objective</xsl:text>
											       </span>
											       <br/>
											<xsl:for-each select="$XML">
												<xsl:for-each select="Progress_note">
													<xsl:for-each select="OBJECTIVE">
													      <div style="white-space:pre" >
															<xsl:value-of select="."/>
														  </div>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
									<xsl:for-each select="$XML">
									     <xsl:for-each select="Progress_note">
									       <xsl:for-each select="OBJ">
									<tr>
										<td>
										     	<br/>
										                      <xsl:for-each select="Picture">
										                           <img>
											                           <xsl:attribute name="src">
												                           <xsl:if test="substring(string(.), 2, 1) = ':'">
													                            <xsl:text>file:///</xsl:text>
												                           </xsl:if>
												                       <xsl:value-of select="translate(string(.), '&#x5c;', '/')"/>
											                       </xsl:attribute>
											                  <xsl:attribute name="alt"/>
										               </img>
										        </xsl:for-each>
										</td>
									</tr>
										</xsl:for-each>
									</xsl:for-each>
							</xsl:for-each>
								</tbody>
							</table>
								<br/>
      	  <xsl:choose>
								<xsl:when test="Progress_note/Easy_Progress_Note='Y'">
       <table border="0" width="90%" align="center">
       	 <xsl:for-each select="$XML">
						<xsl:for-each select="Progress_note">
							<xsl:for-each select="ASSESSMENT_EZ">
        	<tr>
        		<td > <span style="font-weight:bold;text-decoration:underline;"> 
												           <xsl:text>Assessment</xsl:text>
									</span>
									<div style="white-space:pre" >
												<xsl:value-of select="."/>
									</div>
									</td>       		
        	</tr>
        	<tr><td><br/></td></tr>
        	   </xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="$XML">
						<xsl:for-each select="Progress_note">
							<xsl:for-each select="PLAN_EZ">
        	<tr>
        		<td > <span style="font-weight:bold;text-decoration:underline;"> 
												           <xsl:text>Plan</xsl:text>
									</span>
									<div style="white-space:pre" >
												<xsl:value-of select="."/>
									</div>
									</td>       		
        	</tr>
        	   </xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					
        </table>
      </xsl:when>
			<xsl:otherwise>
						<xsl:for-each select="$XML">
								<xsl:for-each select="Progress_note">
									<xsl:for-each select="CONTENT">
							<table width="90%" align="center" border='0'>
								<tbody>
									<tr>
											<td style="font-size:middle;">	
											<br/>										
													<span style="font-weight:bold;text-decoration:underline;">
												         <xsl:text>Problem　</xsl:text>
											       </span>
											       <span style="font-size:large;font-weight:bold;text-decoration:underline;">

														           <xsl:for-each select="PROBLEM_COUNT">
															             <xsl:value-of select="."/>
														          </xsl:for-each>
											   </span>
											       <br/>
														<xsl:for-each select="PROBLEM">
													         <div style="white-space:pre" >
															     <xsl:value-of select="."/>
														     </div>
														 </xsl:for-each>
											 </td>
									</tr>
								
									<tr>
											<td style="font-size:middle;">	
											    <br/>		
											    <xsl:for-each select="ASSESSMENT">	
											    	  <xsl:if test=".!='' ">							
													      <span style="font-weight:bold;text-decoration:underline;"> 
												           <xsl:text>Assessment</xsl:text>
											          </span>
													      <div style="white-space:pre" >
															     <xsl:value-of select="."/>
														    </div>
														 </xsl:if>
													</xsl:for-each>
											 </td>
									</tr>
								
									<tr>
										<td style="font-size:middle;">		
										<br/>										
											<span style="font-weight:bold;text-decoration:underline;">
													<xsl:for-each select="PLAN">
														<xsl:if test=".!=' ' ">
													         <div style="white-space:pre" >
															      <xsl:value-of select="."/>
														     </div>
														</xsl:if>
													</xsl:for-each>
											</span>
											       <br/>
													  <xsl:for-each select="DIAG_PLAN">
													     <xsl:if test=".!=' ' ">
													     	 <span style="font-size:large;font-weight:bold;">
												             <xsl:text>---Diagnostic plan</xsl:text>
											           </span>
													           <div style="white-space:pre" >
															         <xsl:value-of select="."/>
														       </div>
														  </xsl:if>
													  </xsl:for-each>
										 <br/>
													  <xsl:for-each select="THERA_PLAN">
													    <xsl:if test=".!=' ' ">
													    	<span style="font-size:large;font-weight:bold;">
												             <xsl:text>---Therapeutic plan</xsl:text>
											           </span>
													        <div style="white-space:pre" >
															     <xsl:value-of select="."/>
														     </div>
														  </xsl:if>
													  </xsl:for-each>
															
											       <br/>
													<xsl:for-each select="EDUCA_PLAN">
													    <xsl:if test=".!=' ' ">
													    		<span style="font-size:large;font-weight:bold;">
												             <xsl:text>---Educational plan</xsl:text>
											           </span>
													         <div style="white-space:pre" >
															     <xsl:value-of select="."/>
														      </div>
														    </xsl:if>
														</xsl:for-each>
											 </td>
									</tr>
									<tr>
										<td>											
											       <br/>
													<xsl:for-each select="END">
													   <xsl:if test=".!=' ' ">
													        <div style="white-space:pre" >
															    <xsl:value-of select="."/>
														    </div>
														    </xsl:if>
														</xsl:for-each>
											 </td>
									</tr>
								</tbody>
						</table>
						        </xsl:for-each>
						     </xsl:for-each>
						</xsl:for-each>
					</xsl:otherwise>
			</xsl:choose>
						<br/>
				<xsl:for-each select="$XML">
						<xsl:for-each select="Progress_note">
								<xsl:choose>
									<xsl:when test="$XML/Progress_note/RECORDER!='' ">
					         <table border="0" width="90%" align="center">
								     <tbody>
									     <tr>
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
									    <tr>
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
						<xsl:for-each select="Progress_note">
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
						<xsl:for-each select="Progress_note">
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
								<xsl:if test="$XML/Progress_note/VSCOMMENT/COMMENT_TEXT!='' ">
											<xsl:for-each select="$XML">
                        <xsl:for-each select="Progress_note">   
                           <table border="0" align="center" width="90%">
                           	<tr colspan='2'>
                           		<td>
                           			<span style="font-size:large;font-weight:bold;text-decoration:underline;">
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
                        <xsl:for-each select="Progress_note">       
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
              <br/>
              </body>
      </html>
</xsl:template>
</xsl:stylesheet>
   
