<?xml version="1.0" encoding="UTF-8"?>
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
				<h3>
					<span>
						<xsl:text></xsl:text>
					</span>
				</h3>

				<h2 align="center">
					<span>
						<xsl:text>Operation Note</xsl:text>
					</span>
				</h2>
				<br/>
				<table style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " border="1" width="100%">
					<tbody>
						<tr>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="300"/>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="IPD_DR">
											<xsl:if test=".!=''">
								<span>
									<xsl:text>主治醫師 : </xsl:text>
								</span>
											<xsl:apply-templates/>
											</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="NOT_NO">
											<xsl:if test=".!=''">
								<span>
									<xsl:text>手術通知單號 : </xsl:text>
								</span>
											<xsl:apply-templates/>
											</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:dashed; border-right-style:dashed; border-top-style:dotted; ">
								<span>
									<xsl:text>姓名 : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
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
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="228"/>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="ADT_DT">
											<xsl:if test=".!=''">
								<span>
									<xsl:text>住院日 : </xsl:text>
								</span>					
											<xsl:apply-templates/>
											</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
									<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="NOT_NO_SEQ">
											<xsl:if test=".!=''">
								<span>
									<xsl:text>術式 : </xsl:text>
								</span>					
											<xsl:apply-templates/>
											</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:dashed; border-right-style:dashed; border-top-style:none; ">
								<span>
									<xsl:text>病歷號 : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
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
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="228"/>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="BED_NO">
											<xsl:if test=".!=''">
								<span>
									<xsl:text>床號 : </xsl:text>
								</span>
											<xsl:apply-templates/>
												</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="NOT_OP_DT">
											<xsl:if test=".!=''">
								<span>
									<xsl:text>手術日期 : </xsl:text>
								</span>
											<xsl:apply-templates/>
												</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:dashed; border-left-style:dashed; border-right-style:dashed; border-top-style:none; ">
								<span>
									<xsl:text>出生日 : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="BIRTH_DT">
												<xsl:apply-templates/>
											</xsl:for-each>
											<span>
												<xsl:text>( </xsl:text>
											</span>
											<xsl:for-each select="AGE">
												<xsl:apply-templates/>
											</xsl:for-each>
											<span>
												<xsl:text>) </xsl:text>
											</span>
											<xsl:for-each select="SEX">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							</tr>
							<tr>	
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="228"/>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="OP_MAJ_DR">
											<xsl:if test=".!=''">
								<span>
									<xsl:text>主刀醫師 : </xsl:text>
								</span>
											<xsl:apply-templates/>
												</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="OP_MAJ_DR_DPT">
											<xsl:if test=".!=''">
											<xsl:apply-templates/>
												</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
					</tbody>
				</table>
				<hr/>
				<table style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " border="1" width="100%">
					<tbody>
						<tr>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="429">
								<span>
									<xsl:text>麻醉開始日期 ：</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="ANESTHESIA_DTTM">
											<xsl:for-each select="ANESTHESIA_START_DATE">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>sign in 時間：</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="SIGN_DTTM">
											<xsl:for-each select="SIGN_IN_TIME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>麻醉開始時間 ：</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="ANESTHESIA_DTTM">
											<xsl:for-each select="ANESTHESIA_START_TIME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; "/>
						</tr>
						<tr>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="429">
								<span>
									<xsl:text>麻醉完成時間：</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="ANESTHESIA_DTTM">
											<xsl:for-each select="ANESTHESIA_FINISH_TIME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>手術起始日期：</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="OP_START_DTTM">
											<xsl:for-each select="OP_START_DATE">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>Time  Out時間：</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="SIGN_DTTM">
											<xsl:for-each select="TIME_OUT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; "/>
						</tr>
						<tr>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="429">
								<span>
									<xsl:text>手術開始時間：</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="OP_START_DTTM">
											<xsl:for-each select="OP_START_TIME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>手術結束時間：</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="OP_STOP_DTTM">
											<xsl:for-each select="OP_STOP_TIME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>Sign Out時間：</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="SIGN_DTTM">
											<xsl:for-each select="SIGN_OUT_TIME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; "/>
						</tr>
					</tbody>
				</table>
				<hr/>
				<table style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " border="1" width="100%">
					<tbody>
						<tr>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="360">
								<span>
									<xsl:text>Surgeon Dr : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="OPERATION_DR">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>Anesthesiologist Dr : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="ANESTHESIA_DR">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="360">
								<span>
									<xsl:text>Assistant Dr : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="ASSISTANT_DR">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>Anesthesiology Resident : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="ANESTHESIA_RESIDENTESIDENT">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="360">
								<span>
									<xsl:text>Assistant Nurse : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="ASSISTANT_NURSE">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>Anesthetist: </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="ANESTHESIA_NURSE">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="360">
								<span>
									<xsl:text>Scrubbing Nurse : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="SCRUB_NURSE">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>Type of Anesthesia : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="TYPE_ANESTHESIA">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="360">
								<span>
									<xsl:text>Circulating Nurse : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="CIRC_NURSE">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>Specimen to Laboratory : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="SPECIMEN_TO_LAB">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="360">
								<span>
									<xsl:text>Sponge Count : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="SPONGE_COUNT">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>Drains&#160; : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="DRAINS">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="360">
								<span>
									<xsl:text>Instrument Count : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="INSTRUMENT_COUNT">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>Specimen to pathology: </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="SPECIMEN_TO_PATHOLOGY">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " width="360">
								<span>
									<xsl:text>出血量 : </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="BLEEDING">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>Specimen obtained / remova: </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="SPECIMEN_OB_RE">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
					</tbody>
				</table>
				<hr/>
				<span style="color:black; font-weight:bold; ">
					<xsl:text>Preoperative Diagnosis :</xsl:text>
				</span>
				<br/>
				<span>
					<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
				</span>
				<xsl:for-each select="$XML">
					<xsl:for-each select="operation_record">
						<xsl:for-each select="DIAGNOSIS">
							<xsl:for-each select="PRE_OP_DIAGNOSIS">
								<xsl:for-each select="PRE_DG_NAME">
									<xsl:apply-templates/>
								</xsl:for-each>
							</xsl:for-each>
							<br/>
							<xsl:for-each select="PRE_OP_PIC">
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
				<br/>
				<span>
					<xsl:text>&#160;</xsl:text>
				</span>
				<br/>
				<br/>
				<span>
					<xsl:text>&#160;</xsl:text>
				</span>

				<span style="font-weight:bold; ">
					<xsl:text>Postoperative Diagnosis :</xsl:text>
				</span>
				<br/>
				<span>
					<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
				</span>
				<xsl:for-each select="$XML">
					<xsl:for-each select="operation_record">
						<xsl:for-each select="DIAGNOSIS">
							<xsl:for-each select="POST_OP_DIAGNOSIS">
								<xsl:for-each select="POST_DG_NAME">
									<xsl:apply-templates/>
								</xsl:for-each>
							</xsl:for-each>
							<br/>
							<xsl:for-each select="POST_OP_PIC">
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
				<br/>
				<span>
					<xsl:text>&#160;</xsl:text>
				</span>

				<br/>
				<br/>
				<span style="font-weight:bold; ">
					<xsl:text>Operation :</xsl:text>
				</span>
				<span>
					<xsl:text>&#160;</xsl:text>
				</span>
				<br/>
				<span>
					<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
				</span>
				<xsl:for-each select="$XML">
					<xsl:for-each select="operation_record">
						<xsl:for-each select="OP_NAME"><pre>
							<xsl:apply-templates/>
							</pre>
						</xsl:for-each>
						<br/>
						<xsl:for-each select="OP_PIC">
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
				<br/>
				<br/>
				<hr/>
				<span style="font-weight:bold; ">
					<xsl:text>Operative Findings and Operative Procedures :</xsl:text>
				</span>
				<br/>
				<span>
					<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
				</span>
				<xsl:for-each select="$XML">
					<xsl:for-each select="operation_record">
						<xsl:for-each select="OP_FINDING"><pre>
							<xsl:apply-templates/></pre>
						</xsl:for-each>
						<xsl:for-each select="OP_PROCEDURE"><pre>
							<xsl:apply-templates/></pre>
						</xsl:for-each>
						<br/>
						<xsl:for-each select="OP_PROCEDURE_PIC">
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
				<br/>
				<br/>
				<span style="font-weight:bold; ">
					<xsl:text>Wound :</xsl:text>
				</span>
				<span>
					<xsl:text>&#160;</xsl:text>
				</span>
				<xsl:for-each select="$XML">
					<xsl:for-each select="operation_record">
						<xsl:for-each select="WOUND">
							<xsl:apply-templates/>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				<br/>
				<br/>
				<span style="font-weight:bold; ">
					<xsl:text>計劃重回手術室 :</xsl:text>
				</span>
				<span>
					<xsl:text>&#160;</xsl:text>
				</span>
				<xsl:for-each select="$XML">
					<xsl:for-each select="operation_record">
						<xsl:for-each select="OP_RETURN">
									<xsl:if test=".!=''">
											<xsl:apply-templates/>
									</xsl:if>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				<br/>
				<span>
					<xsl:text>&#160;</xsl:text>
				</span>
				<pre>
				<xsl:for-each select="$XML">
					<xsl:for-each select="operation_record">
						<xsl:for-each select="OP_RETURN_IPD">
									<xsl:if test=".!=''">
											<xsl:apply-templates/>
									</xsl:if>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				</pre>
				<table style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " border="0" width="100%">
					<tbody>
						<tr>
							<td width="50%"></td>
							<td style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; ">
								<span>
									<xsl:text>簽名 :</xsl:text>
								</span>
												<span>
					<xsl:text>&#160;</xsl:text>
				</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="operation_record">
										<xsl:for-each select="OP_MAJ_DR">
											<xsl:if test=".!=''">
											<xsl:apply-templates/>
												</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
					<table align="center" border="0" cellSpacing="0" width="100%">
						<tbody>
							<tr>
								<td align="right" style="font-weight:bold;font-size:large;color:red" width="90%">
								  <b>
								 <xsl:for-each select="$XML">
											<xsl:for-each select="operation_record">										
													<xsl:for-each select="SIGNED_NOTE">
														<xsl:apply-templates/>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
										</b>
										</td>
										<td width="10%"></td>
							</tr>
						</tbody>
					</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
