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
												                <xsl:when test="substring(DISCHARGE_STATUS,1,4) = '�X�|���k' or substring(DISCHARGE_STATUS,1,4)='�~���|' or substring(DISCHARGE_STATUS,1,4)='�����ܧ�' ">
                                          <b><xsl:text>���b�f���K�n</xsl:text></b>
                            						</xsl:when>
                            						<xsl:when test="substring(DISCHARGE_STATUS,1,4)='�v¡�X�|'">
                            															<xsl:for-each select="$XML">
									                                           <xsl:for-each select="discharge_record">
										                                            <xsl:for-each select="IN_DATA">
											                                              <xsl:for-each select="ADMISSION_DEPARTMENT"> 
												                                                 <xsl:if test=".='������'">  
                                          <b><xsl:text>���b�f���K�n</xsl:text></b>
                                          </xsl:if>
                                          </xsl:for-each>
												                                                                </xsl:for-each>
												                                                                        </xsl:for-each>
												                                                                                </xsl:for-each>
                            						</xsl:when>
												             <xsl:otherwise>
													                <b><xsl:text>�X�|�f���K�n</xsl:text></b>
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
									<xsl:text>(1)��|�N���ΦW��</xsl:text>
								</span>
							</td>
							<td>
								<span>
									<xsl:text>(2)�m  �W</xsl:text>
								</span>
							</td>
							<td>
								<span>
									<xsl:text>(3)�����Ҹ�</xsl:text>
								</span>
							</td>
							<td>
								<span>
									<xsl:text>(4)�X�ͤ�</xsl:text>
								</span>
							</td>
							<td>
								<span>
									<xsl:text>(5)�f�����X</xsl:text>
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
									<xsl:text>(6)��J��|</xsl:text>
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
									<xsl:text>(7)�a�}</xsl:text>
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
									<xsl:text>(8)�y���s��</xsl:text>
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
									<xsl:text>(9)�J�|���</xsl:text>
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
									<xsl:text>(9)�J�f�Ф��</xsl:text>
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
									<xsl:text>(10)���(��)</xsl:text>
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
									<xsl:text>(11)�X�|���</xsl:text>
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
									<xsl:text>&#160; ��|�ѼơG</xsl:text>
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
									<xsl:text>(12)�E�_</xsl:text>
								</span>
							</td>
							<td colspan="1" width="80">
								<span>
									<xsl:text>�J�|</xsl:text>
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
									<xsl:text>�X�|</xsl:text>
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
									<xsl:text>(13)�D�D</xsl:text>
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
									<xsl:text>(14)�f  �v</xsl:text>
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
									<xsl:text>(15)���˵o�{</xsl:text>
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
									<xsl:text>(16)��N����Τ�</xsl:text>
								</span>
								<span>
									<xsl:text>  �k(�]�A��N</xsl:text>
								</span>
								<span>
									<xsl:text>  �o�{)</xsl:text>
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
									<xsl:text>(17)��|�v��</xsl:text>
								</span>
								<span>
									<xsl:text>    �g  �L</xsl:text>
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
									<xsl:text>(18)�X�֯g</xsl:text>
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
									<xsl:text>(19)�ˬd�O��</xsl:text>
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
									<xsl:text>(20)��g�u</xsl:text>
								</span>
								<span>
									<xsl:text>    ��  �i</xsl:text>
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
									<xsl:text>(21)�f�z���i(�]</xsl:text>
								</span>
								<span>
									<xsl:text>    �A�f�z�o�{)</xsl:text>
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
									<xsl:text>(22)��  �L</xsl:text>
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
									<xsl:text>(23)�X�|��</xsl:text>
								</span>
								<span>
									<xsl:text>    ���p</xsl:text>
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
									<xsl:text>(24)�X�|����</xsl:text>
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
									<xsl:text>(25)���g����</xsl:text>
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
	<xsl:text>(26)�~���Y���׫���(ISS)</xsl:text>
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
	<xsl:text>(27)�������q�����(MRS)</xsl:text>
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
									<xsl:text>�D�v��vñ���G</xsl:text>
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
									<xsl:text>��|��vñ���G</xsl:text>
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
