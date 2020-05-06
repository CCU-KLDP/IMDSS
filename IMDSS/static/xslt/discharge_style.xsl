<?xml version="1.0" encoding="Big5"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output version="1.0" method="html" indent="no" encoding="Big5" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
	<xsl:param name="SV_OutputFormat" select="'HTML'"/>
	<xsl:variable name="XML" select="/"/>
	<xsl:template match="/">
		<html>
			<head>
				<title/>
			</head>
			<body>
				<br/>
					<h1>
					<span>
						<xsl:text></xsl:text>
					</span>
					</h1>
	<h2>
					       <xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
						
                                	   <xsl:choose>                                	   	
												                <xsl:when test="substring(DISCHARGE_STATUS,1,4) = '出院轉歸' or substring(DISCHARGE_STATUS,1,4)='繼續住院' or substring(DISCHARGE_STATUS,1,4)='身分變更' ">
                                          <b><xsl:text>切帳病歷摘要</xsl:text></b>
                            						</xsl:when>
                            						<xsl:when test="substring(DISCHARGE_STATUS,1,4)='治癒出院'">
                            															<xsl:for-each select="$XML">
									                                           <xsl:for-each select="discharge_record">
										                                            <xsl:for-each select="IN_DATA">
											                                              <xsl:for-each select="ADMISSION_DEPARTMENT"> 
												                                                 <xsl:if test=".='婦產科'">  
                                          <b><xsl:text>切帳病歷摘要</xsl:text></b>
                                          </xsl:if>
                                          </xsl:for-each>
												                                                                </xsl:for-each>
												                                                                        </xsl:for-each>
												                                                                                </xsl:for-each>
                            						</xsl:when>
												             <xsl:otherwise>
													                <b><xsl:text>出院病歷摘要</xsl:text></b>
																				</xsl:otherwise>
                                     </xsl:choose> 
                                   </xsl:for-each> 
                                    </xsl:for-each> 
                                    </h2>
                                    

				<p/>
				<table border="1" width="100%">
					<tbody>
						<tr>
							<td colspan="2" width="150">
								<span>
									<xsl:text>(1)醫院代號及名稱</xsl:text>
								</span>
							</td>
							<td>
								<span>
									<xsl:text>(2)姓  名</xsl:text>
								</span>
							</td>
							<td>
								<span>
									<xsl:text>(3)身份證號</xsl:text>
								</span>
							</td>
							<td>
								<span>
									<xsl:text>(4)出生日</xsl:text>
								</span>
							</td>
							<td>
								<span>
									<xsl:text>(5)病歷號碼</xsl:text>
								</span>
							</td>
						</tr>
						<tr>
							<td width="125">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="HOSPITAL">
											<xsl:for-each select="HOSPITAL_CODE">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td>
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="HOSPITAL">
											<xsl:for-each select="HOSPITAL_TITLE">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td>
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="PAT_NAME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td>
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="PAT_IDNO">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td>
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="BIRTH_DT">
												<xsl:apply-templates/>
											</xsl:for-each>

										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<span>
									<xsl:text> (</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
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
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="SEX">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
			
							</td>
							<td>
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="PAT_NO">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(6)轉入醫院</xsl:text>
								</span>
							</td>
							<td colspan="2" width="80">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="IN_Hospital">
											<xsl:for-each select="IN_HOSPITAL_NAME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td>
								<span>
									<xsl:text>(7)地址</xsl:text>
								</span>
							</td>
							<td>
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="IN_Hospital">
											<xsl:for-each select="IN_HOSPITAL_ADDRESS">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td>
								<span>
									<xsl:text>(8)流水編號</xsl:text>
								</span>
							</td>
						</tr>
			   		<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="IN_DATA">
											<xsl:for-each select="ADMISSION_DATE">
												<xsl:if test=".!='' ">	
						<tr>
							<td width="125">	
								<span>
									<xsl:text>(9)入院日期</xsl:text>
								</span>
							</td>	
							<td colspan="5">							
												<xsl:apply-templates/>
								<span>
									<xsl:text>&#160; </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="IN_DATA">
											<xsl:for-each select="ADMISSION_DEPARTMENT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<span>
									<xsl:text>&#160; </xsl:text>
								</span>
							</td>
							<td/>
						</tr>
												</xsl:if>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
										<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="IN_DATA">
											<xsl:for-each select="NADMISSION_DATE">
												<xsl:if test=".!='' ">	
						<tr>
							<td width="125">	
								<span>
									<xsl:text>(9)入病房日期</xsl:text>
								</span>
							</td>	
							<td colspan="5">							
												<xsl:apply-templates/>
								<span>
									<xsl:text>&#160; </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="IN_DATA">
											<xsl:for-each select="ADMISSION_DEPARTMENT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<span>
									<xsl:text>&#160; </xsl:text>
								</span>
							</td>
							<td/>
						</tr>
												</xsl:if>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(10)轉科(床)</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">	
										<xsl:for-each select="TRANSFER_DATA">
											<li>
											<xsl:for-each select="TRANSFER_DATE">
												<xsl:apply-templates/>
											</xsl:for-each>
											<span>
												<xsl:text>&#160; </xsl:text>
											</span>
											<xsl:for-each select="TRANSFER_DEPARTMENT">
												<xsl:apply-templates/>
											</xsl:for-each>
											<span>
												<xsl:text>&#160; </xsl:text>
											</span>
											<xsl:for-each select="TRANSFER_DR">
												<xsl:apply-templates/>
											</xsl:for-each>
											<span>
												<xsl:text>&#160; </xsl:text>
											</span>
											<xsl:for-each select="TRANSFER_BED">
												<xsl:apply-templates/>
											</xsl:for-each>
											</li>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<span>
									<xsl:text>&#160; </xsl:text>
								</span>

							</td>
						</tr>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(11)出院日期</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="DISCHARGE_DATA">
											<xsl:for-each select="DISCHARGE_DATE">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<span>
									<xsl:text>&#160; 住院天數：</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="LENGTH_OF_STAY">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td rowspan="2" width="125">
								<span>
									<xsl:text>(12)診斷</xsl:text>
								</span>
							</td>
							<td colspan="1" width="80">
								<span>
									<xsl:text>入院</xsl:text>
								</span>
							</td>
							<td colspan="4" width="500">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="DIAGNOSIS">
											<xsl:for-each select="ADMISSION_DIAGNOSIS">
												<xsl:for-each select="A_DG_NAME"><pre>
													<xsl:apply-templates/></pre>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td colspan="1" width="80">
								<span>
									<xsl:text>出院</xsl:text>
								</span>
							</td>
							<td colspan="4" width="500">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="DIAGNOSIS">
											<xsl:for-each select="DISCHARGE_DIAGNOSIS">
												<xsl:for-each select="D_DG_NAME"><pre>
													<xsl:apply-templates/></pre>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(13)主訴</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="CHIEF_COMPLAIN">
										  <pre>
											<xsl:apply-templates/>
										  </pre>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(14)病  史</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="MEDICAL_HISTORY">
										   <pre>
											<xsl:apply-templates/>
										   </pre>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(15)體檢發現</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="PHYSICAL_EXAM_FINDING">
										  <pre>
											<xsl:apply-templates/>
										  </pre>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<br/>
							</td>
						</tr>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(16)手術日期及方</xsl:text>
								</span>
								<span>
									<xsl:text>  法(包括手術</xsl:text>
								</span>
								<span>
									<xsl:text>  發現)</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="OPERATION_DATE_METHOD">
										   <pre>
											<xsl:apply-templates/>
										   </pre>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="OP_DATE_METHOD">
										   <pre>
											<xsl:apply-templates/>
										   </pre>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(17)住院治療</xsl:text>
								</span>
								<span>
									<xsl:text>    經  過</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="TREAT_PROCESSNOTE">
										    <pre>
											<xsl:apply-templates/>
										    </pre>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(18)合併症</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="AMALGAMATE_DISEASE">
										   <pre>
											<xsl:apply-templates/>
										   </pre>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(19)檢查記錄</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
									   <xsl:for-each select="EXAM_RECORD">
										<xsl:for-each select="GENERAL_EXAM_RECORD">
										   <pre>
											<xsl:apply-templates/>
										   </pre>
										</xsl:for-each>
									   </xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>	
								<br/>
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
									   <xsl:for-each select="EXAM_RECORD">
										<xsl:for-each select="SPECIAL_EXAM_RECORD">
										   <pre>
											<xsl:apply-templates/>
										   </pre>
										</xsl:for-each>
									   </xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(20)放射線</xsl:text>
								</span>
								<span>
									<xsl:text>    報  告</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="RADIOACTIVE_RAYS_REPORT">
										    <pre>
											<xsl:apply-templates/>
										    </pre>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(21)病理報告(包</xsl:text>
								</span>
								<span>
									<xsl:text>    括病理發現)</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="PATHOLOGY_REPORT">
										      <pre>
											<xsl:apply-templates/>
										      </pre>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(22)其  他</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="OTHERS"><pre>
											<xsl:apply-templates/></pre>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="125" >
								<span>
									<xsl:text>(23)出院時</xsl:text>
								</span>
								<span>
									<xsl:text>    情況</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="DISCHARGE_STATUS">
										    <div style="white-space:pre" >					                                                                  <xsl:apply-templates/>
										    </div>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
									</td>		
						</tr>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(24)出院指示</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="DISCHARGE_DIRECTION">
										    <pre>
											<xsl:apply-templates/>
										    </pre>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="125">
								<span>
									<xsl:text>(25)癌症分期</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<br/>
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="CANCER_LEVEL">
										   <pre>
											<xsl:apply-templates/>
										   </pre>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>

<xsl:if test="discharge_record/Injury_Severity_Score!=''">
<tr>
<td width="125">
     <span>
	<xsl:text>(26)外傷嚴重度指數(ISS)</xsl:text>
     </span>
</td>
<td colspan="5">
	<xsl:for-each select="$XML">
       <xsl:for-each select="discharge_record">
               <xsl:for-each select="Injury_Severity_Score">
<pre>
                              <xsl:apply-templates/>
</pre>
               </xsl:for-each>
       </xsl:for-each>
</xsl:for-each>
</td>
</tr>
</xsl:if>
<xsl:if test="discharge_record/MRS!=''">
<tr>
<td width="125">
     <span>
	<xsl:text>(27)腦中風量表指數(MRS)</xsl:text>
     </span>
</td>
<td colspan="5">
	<xsl:for-each select="$XML">
       <xsl:for-each select="discharge_record">
               <xsl:for-each select="MRS">
										    <div style="white-space:pre" >
										    	<xsl:apply-templates/>
										    </div>
               </xsl:for-each>
       </xsl:for-each>
</xsl:for-each>
</td>
</tr>
</xsl:if>
						<tr>
							<td colspan="4">
								<span>
									<xsl:text>主治醫師簽章：</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="discharge_record">
										<xsl:for-each select="ATTENDING_PHYSICIAN">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td colspan="2" width="125">
								<span>
									<xsl:text>住院醫師簽章：</xsl:text>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
