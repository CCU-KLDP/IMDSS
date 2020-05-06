<?xml version="1.0" encoding="Big5"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output version="1.0" method="html" indent="no" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
	<xsl:param name="SV_OutputFormat" select="'HTML'"/>
	<xsl:variable name="XML" select="/"/>
	<xsl:template match="/">
		<html>
			<head>
				<title/>
			</head>
			<body>
				<xsl:for-each select="$XML">
					<table border="0" width="100%">
						<tbody>
							<tr>
								<td>
									<span style="font-size:large; font-style:oblique; ">
										<xsl:text>門急診記錄</xsl:text>
									</span>
									<hr/>
								</td>
							</tr>
						</tbody>
					</table>
					<table style="border-bottom-color:black; border-color:black; " border="0" width="100%">
						<tbody>
							<tr>
								<td width="260">
									<span style="font-size:medium; ">
										<xsl:text>日期: </xsl:text>
									</span>
									<xsl:for-each select="opd_record">	
										<xsl:for-each select="Visit_info">
                         <xsl:for-each select="ADMIT_DT">
												     <xsl:apply-templates/>
											   </xsl:for-each>	
										</xsl:for-each>
									</xsl:for-each>
									<xsl:for-each select="opd_record">	
										<xsl:for-each select="VISIT_INFO">											
                         <xsl:for-each select="ADMIT_DT">
												     <xsl:apply-templates/>
											   </xsl:for-each>		
										</xsl:for-each>
									</xsl:for-each>
								</td>
								<td width="266">
									<span style="font-size:medium; ">
										<xsl:text>病歷: </xsl:text>
									</span>
									<xsl:for-each select="opd_record">
										<xsl:for-each select="patient_info">
											<xsl:for-each select="PAT_NO">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<span style="font-size:medium; ">
										<xsl:text>身份: </xsl:text>
									</span>
									<xsl:for-each select="opd_record">
										<xsl:for-each select="patient_info">
											<xsl:for-each select="PAT_TYPE">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td width="260">
									<span style="font-size:medium; ">
										<xsl:text>科別: </xsl:text>
									</span>
									<xsl:for-each select="opd_record">
										<xsl:for-each select="Visit_info">
											<xsl:for-each select="VISIT_DEPT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									<xsl:for-each select="opd_record">	
										<xsl:for-each select="VISIT_INFO">											
                         <xsl:for-each select="VISIT_DEPT">
												     <xsl:apply-templates/>
											   </xsl:for-each>		
										</xsl:for-each>
									</xsl:for-each>
								</td>
								<td width="266">
									<span style="font-size:medium; ">
										<xsl:text>姓名: </xsl:text>
									</span>
									<xsl:for-each select="opd_record">
										<xsl:for-each select="patient_info">
											<xsl:for-each select="PAT_NAME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<span style="font-size:medium; ">
										<xsl:text>卡序: </xsl:text>
									</span>
									<xsl:for-each select="opd_record">
										<xsl:for-each select="patient_info">
											<xsl:for-each select="IC_NO">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td valign="top" width="260">
									<span style="font-size:medium; ">
										<xsl:text>醫師: </xsl:text>
									</span>
									<xsl:for-each select="opd_record">
										<xsl:for-each select="DR_NAME">
											<xsl:apply-templates/>
										</xsl:for-each>
										<br/>
									</xsl:for-each>
								</td>
								<td width="266">
									<span style="font-size:medium; ">
										<xsl:text>性別: </xsl:text>
									</span>
									<xsl:for-each select="opd_record">
										<xsl:for-each select="patient_info">
											<xsl:for-each select="SEX">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
								<td valign="top">
									<span style="font-size:medium; ">
										<xsl:text>年齡: </xsl:text>
									</span>
									<xsl:for-each select="opd_record">
										<xsl:for-each select="patient_info">
											<xsl:for-each select="AGE">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<hr/>
					<p>
						<span style="color:red; font-size:medium; ">
							<xsl:text>藥物過敏 :</xsl:text>
						</span>
						<span style="font-size:medium; ">
							<xsl:text>&#160;</xsl:text>
						</span>
						<xsl:for-each select="opd_record">
							<xsl:for-each select="Allergy">
								<xsl:apply-templates/>
								<span>
									<xsl:text>.&#160;&#160;</xsl:text>
								</span>
							</xsl:for-each>
						</xsl:for-each>
					</p>
					<p>

						<xsl:for-each select="opd_record">
							<pre>
							<xsl:for-each select="Header_comment">
								<xsl:apply-templates/>
							</xsl:for-each>
							</pre>
						</xsl:for-each>
					</p>
					<p align="justify">
						<span style="color:blue; font-size:medium; font-style:normal; ">
							<xsl:text>主訴/徵候:</xsl:text>
						</span>
						<span style="font-size:medium; ">
							<xsl:text>&#160;</xsl:text>
						</span>
						<xsl:for-each select="opd_record">
							<xsl:for-each select="SOAP">
								<xsl:for-each select="SO_TEXT"><pre>
									<xsl:apply-templates/></pre>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</p>
					<xsl:for-each select="opd_record">
						<xsl:for-each select="SOAP">
							<xsl:for-each select="SO_PICTURE">
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
					<p>
						<span style="color:blue; font-size:medium; ">
							<xsl:text>診斷: </xsl:text>
						</span>
						<ul type="square">
							<xsl:for-each select="opd_record">
								<xsl:for-each select="SOAP">
									<xsl:for-each select="A_DG_NAME">
										<li>
											<xsl:apply-templates/>
										</li>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
						</ul>
					</p>
					<span style="color:blue; font-size:medium; ">
						<xsl:text>處置: </xsl:text>
							<xsl:for-each select="opd_record">
								<xsl:for-each select="SOAP">
									<xsl:for-each select="ODR_TEXT">
										<xsl:apply-templates/>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
					</span>
					<br/>

                                        <xsl:choose>
                                             <xsl:when test="opd_record/VISIT_INFO/VISIT_ROOM='ER' and opd_record/VISIT_INFO/VISIT_TYPE='ER'">   
					<table border="1">
						<thead>
							<tr>
								<th>
									<span>
										<xsl:text></xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text></xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>處置碼</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>處置名稱</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>劑量</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>單位</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>頻率</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>途徑</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>天數</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>總量</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>總量單位</xsl:text>
									</span>
								</th>
                                 <th>
									<span>
										<xsl:text>開立時間</xsl:text>
									</span>
								</th>
								 <th>
									<span>
										<xsl:text>開立者</xsl:text>
									</span>
								</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td/>
								<td/>
								<td/>
								<td/>
								<td/>
								<td/>
								<td/>
								<td width="26"/>
								<td/>
								<td/>
								<td/>
							</tr>
						</tfoot>
						<tbody>
                        <xsl:for-each select="$XML">
							<xsl:for-each select="opd_record">
								<xsl:for-each select="SOAP">
									<xsl:for-each select="P_MED">
										<tr>
											<td>
												<xsl:for-each select="URG_MARK">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="CONT_MARK">
													<xsl:apply-templates/>
												</xsl:for-each>
												<xsl:for-each select="SLF_MARK">
													<xsl:apply-templates/>
												</xsl:for-each>
												<xsl:for-each select="POWDER_MARK">
													<xsl:apply-templates/>
												</xsl:for-each>

											</td>
											<td>
												<xsl:for-each select="MED_CODE">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="MED_NAME">
													<xsl:apply-templates/>												

												</xsl:for-each>
<br/>
												<xsl:for-each select="IV_METHOD">
													<xsl:apply-templates/>												

												</xsl:for-each>
<xsl:for-each select="MED_NOTE">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="MED_DOSE">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="GIVE_UNIT">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="GIVE_FREQ">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="GIVE_ROUTE">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="MED_DAYS">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="TOT_MED_AMT">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="TOT_MED_UNITS">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
                                            <td>
												<xsl:for-each select="CRE_DT_TI">
													 <xsl:value-of select="substring(string(.),9,2)"/>
                                                         <xsl:text>_</xsl:text>
                                                     <xsl:value-of select="substring(string(.),12,5)"/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="CRE_OPN_DR">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
                            </xsl:for-each>
						</tbody>
					</table>
    </xsl:when>
    <xsl:otherwise>
					<table border="1">
						<thead>
							<tr>
								<th>
									<span>
										<xsl:text></xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text></xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>處置碼</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>處置名稱</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>劑量</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>單位</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>頻率</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>途徑</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>天數</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>總量</xsl:text>
									</span>
								</th>
								<th>
									<span>
										<xsl:text>總量單位</xsl:text>
									</span>
								</th>

							</tr>
						</thead>
						<tfoot>
							<tr>
								<td/>
								<td/>
								<td/>
								<td/>
								<td/>
								<td/>
								<td/>
								<td width="26"/>
								<td/>
								<td/>
								<td/>
							</tr>
						</tfoot>
						<tbody>
                        <xsl:for-each select="$XML">
							<xsl:for-each select="opd_record">
								<xsl:for-each select="SOAP">
									<xsl:for-each select="P_MED">
										<tr>
											<td>
												<xsl:for-each select="URG_MARK">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="CONT_MARK">
													<xsl:apply-templates/>
												</xsl:for-each>
												<xsl:for-each select="SLF_MARK">
													<xsl:apply-templates/>
												</xsl:for-each>
												<xsl:for-each select="POWDER_MARK">
													<xsl:apply-templates/>
												</xsl:for-each>

											</td>
											<td>
												<xsl:for-each select="MED_CODE">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="MED_NAME">
													<xsl:apply-templates/>												

												</xsl:for-each>
<br/>
												<xsl:for-each select="IV_METHOD">
													<xsl:apply-templates/>												

												</xsl:for-each>
<xsl:for-each select="MED_NOTE">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="MED_DOSE">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="GIVE_UNIT">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="GIVE_FREQ">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="GIVE_ROUTE">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="MED_DAYS">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="TOT_MED_AMT">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="TOT_MED_UNITS">
													<xsl:apply-templates/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
                            </xsl:for-each>
						</tbody>
					</table>
    </xsl:otherwise>
   </xsl:choose>

                       
					<br/>
					<xsl:for-each select="opd_record">
						<xsl:for-each select="FOOT_TEXT"><pre>
							<xsl:apply-templates/></pre>
						</xsl:for-each>

					</xsl:for-each>
					<br/>
				</xsl:for-each>
                         <xsl:for-each select="$XML">
                        <xsl:for-each select="opd_record">                      	
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
