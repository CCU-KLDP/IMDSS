<?xml version="1.0" encoding="Big5"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<xsl:output version="1.0" method="html" indent="no" encoding="Big5" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
<xsl:param name="SV_OutputFormat" select="'HTML'"/>
<xsl:variable name="XML" select="/"/>
<xsl:template match="/">
		<html>
			<head>
			</head>
			<body>
				<br/>
				<table border="0" width="100%">
					<tbody>
						<tr>
							<td valign="top" width="38%">
								<span>
									<xsl:text></xsl:text>
									<br/>
									<xsl:text>CHIA-YI CHRISTIAN HOSPITAL</xsl:text>
								</span>
							</td>
							<td width="62%" align="left">
								<span style="font-size:x-large;font-weight:bold;">
									<xsl:text></xsl:text>
									<br/>
									<xsl:text>Admission  Note</xsl:text>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
				<table border="0" width="100%">
					<tbody>
						<tr>
							<td valign="top" width="5%">
								<span>
									<xsl:text></xsl:text>
								</span>
							</td>
							<td width="55%" align="left">
											<span>
												<xsl:text>主治醫師：</xsl:text>
											</span>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="IPD_INFO">
														<xsl:for-each select="IPD_MAJOR_DR">
															<xsl:value-of select="."/>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											<br/>
												<span>
												<xsl:text>住院日期：</xsl:text>
											</span>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="IPD_INFO">
														<xsl:for-each select="IPD_IN_DATE">
															<xsl:value-of select="."/>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
							</td>
							<td width="40%">
								<table border="1" width="80%" align="right">
									<tr>
										<td colspan="2">
											<span>
												<xsl:text>病歷號：</xsl:text>
											</span>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="PATIENT_INFO">
														<xsl:for-each select="PAT_NO">
															<xsl:value-of select="."/>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
										</td>
										<td rowspan="3" align="center">
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
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
												<xsl:for-each select="AdmissionNote_record">
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
												<xsl:for-each select="AdmissionNote_record">
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
												<xsl:for-each select="AdmissionNote_record">
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
												<xsl:for-each select="AdmissionNote_record">
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
				       <hr>
                      </hr>
	            <table border="0" width="90%" align="center" style="font-size:large;font-family:細明體;">
							<tbody>
									<tr>
											<td>											
													<span>
												   <xsl:text>病歷資料來源:</xsl:text>
											       </span>
											       											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="NOTE_SOURCE">
															<xsl:value-of select="."/>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
									<tr>
											<td>		
											<br/>									
													<span style="font-size:large;font-weight:bold;text-decoration:underline;">
												   <xsl:text>Chief Complaints</xsl:text>
											       </span>
											       <br/>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="CHIEF_COMPLAINTS">
															<xsl:value-of select="."/>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
									<tr>
											<td>	
											<br/>										
													<span style="font-size:large;font-weight:bold;text-decoration:underline;">
												   <xsl:text>Present Illness</xsl:text>
											       </span>
											       <br/>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="PRESENT_ILLNESS">
													      <div style="white-space:pre" >															
																<xsl:value-of select="."/>															
														  </div>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
									<tr>
											<td>			
											<br/>								
													<span style="font-size:large;font-weight:bold;text-decoration:underline;">
												   <xsl:text>Past History</xsl:text>
											       </span>
											       <br/>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="PAST_HISTORY">
													    <div style="white-space:pre" >
																<xsl:value-of select="."/>
														</div>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
									<tr>
											<td>		
											<br/>									
													<span style="font-size:large;font-weight:bold;text-decoration:underline;">
												   <xsl:text>Personal, Social and Occupational History</xsl:text>
											       </span>
											       <br/>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="PERSONAL_HISTORY">
													    <div style="white-space:pre" >
																<xsl:value-of select="."/>											
														</div>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
									<tr>
										<td>			
										<br/>								
											<span style="font-size:large;font-weight:bold;text-decoration:underline;">
												<xsl:text>Family History</xsl:text>
											</span>
											       <br/>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="FAMILY_HISTORY">
													    <div style="white-space:pre" >
																<xsl:value-of select="."/>
														</div>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
									<tr>
										<td>											
											       <br/>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="FAMILYTREE">
													    <xsl:for-each select="Picture">
													   <xsl:if test=".!=' ' ">
										                 <img>
											                 <xsl:attribute name="src">
												                  <xsl:if test="substring(string(.), 2, 1) = ':'">
													                     <xsl:text>file:///</xsl:text>
												                  </xsl:if>
												                  <xsl:value-of select="translate(string(.), '&#x5c;', '/')"/>
											                 </xsl:attribute>
											                 <xsl:attribute name="alt"/>
										                 </img>	
										                 	</xsl:if>	
										                 </xsl:for-each>											
										            </xsl:for-each>
								                </xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
									<tr>
								
										<td>		
										<br/>									
											<span style="font-size:large;font-weight:bold;text-decoration:underline;">
												<xsl:text>Review of Systems</xsl:text>
											</span>
											       <br/>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="REVIEW_OF_SYSTEMS">
													    <div style="white-space:pre" >
																<xsl:value-of select="."/>
														</div>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
									<tr>
										<td>		
										<br/>									
											<span style="font-size:large;font-weight:bold;text-decoration:underline;">
												<xsl:text>Physical Examination</xsl:text>
											</span>
											       <br/>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="PHYSICAL_EXAMINATION">
													   <div style="white-space:pre" >
																<xsl:value-of select="."/>
														</div>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
									<tr>
										<td>	
										<br/>										
											<span style="font-size:large;font-weight:bold;text-decoration:underline;">
												<xsl:text>Laboratory Data</xsl:text>
											</span>
											       <br/>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="LABORATORY_DATA">
													    <div style="white-space:pre" >
																<xsl:value-of select="."/>
														</div>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
									<tr>
										<td>	
										<br/>										
											<span style="font-size:large;font-weight:bold;text-decoration:underline;">
												<xsl:text>Image Findings and Other Laboratory Examinations</xsl:text>
											</span>
											       <br/>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="IMAGE_FINDINGS">
													    <div style="white-space:pre" >
															<xsl:value-of select="."/>
														</div>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
									<tr>
										<td>		
										<br/>									
											<span style="font-size:large;font-weight:bold;text-decoration:underline;">
												<xsl:text>Diagnosis / Problem list</xsl:text>
											</span>
											       <br/>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="DIAGNOSIS_PROBLEM">
													    <div style="white-space:pre" >
																<xsl:value-of select="."/>
														</div>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
									<tr>
										<td>		
										<br/>									
											<span style="font-size:large;font-weight:bold;text-decoration:underline;">
												<xsl:text>Assessment and Plan</xsl:text>
											</span>
											       <br/>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="ASSESSMENT_PLAN">
													    <div style="white-space:pre;">
																<xsl:value-of select="."/>
														</div>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
                                        </tr>
 <xsl:for-each select="$XML">
   <xsl:for-each select="AdmissionNote_record">
    <xsl:for-each select="DISCHARGE_PLANNING">
    	  <xsl:if test=".!=' ' ">
    	  	<tr>
    	  		<td>
                    <span style="font-size:large;font-weight:bold;text-decoration:underline;">
						<xsl:text>Discharge planning</xsl:text>
					</span>
                    <div style="white-space:pre;">
						<pre>
							<xsl:value-of select="."/>
						</pre>
                    </div>
            </td>
          </tr>		
        </xsl:if>
    </xsl:for-each>
  </xsl:for-each>
 </xsl:for-each>						
										     <xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="SIDE_EFFECT">
													   <xsl:if test=".!=' ' ">
									<tr>
										<td>			
										<br/>								
											<span style="font-size:large;font-weight:bold;text-decoration:underline;">
												<xsl:text>Side Effect of Previous Course of Chemotherapy</xsl:text>
											</span>
											       <br/>
													    <div style="white-space:pre" >
															<xsl:value-of select="."/>
														</div>
											 </td>
									</tr>
									                       </xsl:if>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="HOSIPITAL_PLAN">
													   <xsl:if test=".!='' ">
									<tr>
										<td>			
										<br/>								
											<span style="font-size:large;font-weight:bold;text-decoration:underline;">
												<xsl:text>住院診療計畫告知</xsl:text>
											</span>
											       <br/>
													    <div style="white-space:pre" >
															<xsl:value-of select="."/>
														</div>
											 </td>
									</tr>
									                       </xsl:if>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
								</tbody>
						</table>
						<xsl:if test="AdmissionNote_record/SPECIALSHEET/Picture!=''">
								<table border="0" width="90%" align="center">
					              <tbody>
					              	<tr>
										<td>	
										   <span style="font-size:large;font-weight:bold;text-decoration:underline;">
												<xsl:text>Special Sheet</xsl:text>
											</span>	
									        <xsl:for-each select="$XML">
										         <xsl:for-each select="AdmissionNote_record">
											         <xsl:for-each select="SPECIALSHEET">
											             <xsl:for-each select="Picture">
								
											       <br/>
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
										            </xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
										</tbody>
									</table>
</xsl:if>	
<xsl:if test="AdmissionNote_record/Injury_Severity_Score!=''">
<table border="0" width="90%" align="center" style="font-size:large;font-family:細明體;">
<tbody>
<tr>
<td>
<span style="font-size:large;font-weight:bold;text-decoration:underline;">
<xsl:text>Injury Severity Score</xsl:text>
</span>
<br/>
<xsl:for-each select="$XML">
<xsl:for-each select="AdmissionNote_record">
<xsl:for-each select="Injury_Severity_Score">
	<div style="white-space:pre" >
	<xsl:value-of select="."/>
	</div>
               </xsl:for-each>
       </xsl:for-each>
</xsl:for-each>
</td>
</tr>
</tbody>
</table>
</xsl:if>	
<xsl:if test="AdmissionNote_record/VSCOMMENT!=''">
<table border="0" width="90%" align="center" style="font-size:large;font-family:細明體;">
<tbody>
<tr>
<td>
<span style="font-size:large;font-weight:bold;text-decoration:underline;">
<xsl:text>VS Comment</xsl:text>
</span>
<br/>
<xsl:for-each select="$XML">
<xsl:for-each select="AdmissionNote_record">
<xsl:for-each select="VSCOMMENT">
	<div style="white-space:pre" >
	     <xsl:value-of select="."/>
	     	</div>
               </xsl:for-each>
       </xsl:for-each>
</xsl:for-each>
</td>
</tr>
</tbody>
</table>
</xsl:if>	
																		 <br/>
							<table align="center">
							    <tbody>
									<tr>
										<td >											
											<xsl:for-each select="$XML">
												<xsl:for-each select="AdmissionNote_record">
													<xsl:for-each select="RECORDER">
															<xsl:value-of select="."/>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											 </td>
									</tr>
							</tbody>
						</table>
						  <xsl:for-each select="$XML">
                        <xsl:for-each select="AdmissionNote_record">
                        
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
