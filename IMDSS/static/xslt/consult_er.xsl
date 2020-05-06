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
				<h2>
					<span>
						<xsl:text>急診會診單</xsl:text>
					</span>
				</h2>
				<table style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " border="0" width="100%">
					<tbody>
						<tr>
							<td width="300">
								<span>
									<xsl:text>患者姓名：</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_ER_RECORD">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="PAT_NAME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<span>
									<xsl:text>&#160; (</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_ER_RECORD">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="SEX">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<span>
									<xsl:text>)</xsl:text>
								</span>
							</td>
							<td>
								<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_ER_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_DT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<span>
									<xsl:text> &#160; </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_ER_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_TI">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="367">
								<span>
									<xsl:text>病歷號：</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_ER_RECORD">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="PAT_NO">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<span>
									<xsl:text> (</xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_ER_RECORD">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="AGE">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<span>
									<xsl:text> 歲)</xsl:text>
								</span>
							</td>
							<td>
								<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_ER_RECORD">
										<xsl:for-each select="CONSULT_INFO">
											<xsl:for-each select="CONSULT_DT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<span>
									<xsl:text> &#160;  </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_ER_RECORD">
										<xsl:for-each select="CONSULT_INFO">
											<xsl:for-each select="CONSULT_TI">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="367"/>
							<td>
								<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_ER_RECORD">
										<xsl:for-each select="CONSULT_RESULT">
											<xsl:for-each select="REPORT_DT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<span>
									<xsl:text> &#160;  </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_ER_RECORD">
										<xsl:for-each select="CONSULT_RESULT">
											<xsl:for-each select="REPORT_TI">
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
				<span>
					<xsl:text>會診主診斷：</xsl:text>
				</span>
				<xsl:for-each select="$XML">
					<xsl:for-each select="CONSULT_ER_RECORD">
						<xsl:for-each select="CONSULT_INFO">
							<xsl:for-each select="ASSESSMENT">
							<pre>
								<xsl:text> &#160;&#160;&#160;&#160;&#160;  </xsl:text>
								<xsl:apply-templates/>
							</pre>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				<span>
					<xsl:text>急診診斷：</xsl:text>
				</span>
				<xsl:for-each select="$XML">
					<xsl:for-each select="CONSULT_ER_RECORD">
						<xsl:for-each select="CONSULT_APPLY">
							<xsl:for-each select="ER_ASSESSMENT">
							<pre>
								<xsl:text> &#160;&#160;&#160;&#160;&#160;  </xsl:text>
								<xsl:apply-templates/>
							</pre>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				<span>
					<xsl:text>會診理由：</xsl:text>
				</span>
				<xsl:for-each select="$XML">
					<xsl:for-each select="CONSULT_ER_RECORD">
						<xsl:for-each select="CONSULT_INFO">
							<pre>
							<xsl:for-each select="CONSULT_REASON">
								<xsl:text> &#160;&#160;&#160;&#160;&#160;  </xsl:text>
								<xsl:apply-templates/>
							</xsl:for-each>
							</pre>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				<span>
					<xsl:text>急診醫師：</xsl:text>
				</span>
				<xsl:for-each select="$XML">
					<xsl:for-each select="CONSULT_ER_RECORD">
						<xsl:for-each select="CONSULT_APPLY">
							<xsl:for-each select="APPLY_DR">
								<xsl:apply-templates/>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				<span>
					<xsl:text> 醫師</xsl:text>
				</span>
				<br/>
				<br/>
				<hr/>
				<br/>
				<table style="border-bottom-style:none; border-left-style:none; border-right-style:none; border-top-style:none; " border="0" width="100%">
					<tbody>
						<tr>
							<td>
								<h2>
									<span>
										<xsl:text>會診回覆</xsl:text>
									</span>
								</h2>
								<span>
									<xsl:text>by </xsl:text>
								</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_ER_RECORD">
										<xsl:for-each select="CONSULT_RESULT">
											<xsl:for-each select="REPORT_DR">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<span>
									<xsl:text> 醫師 &#160;&#160;&#160;&#160;&#160;  </xsl:text>
								</span>
							
								<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_ER_RECORD">
										<xsl:for-each select="CONSULT_RESULT">
											<xsl:for-each select="REPORT_DT">
												<xsl:apply-templates/>
											</xsl:for-each>
											<span>
												<xsl:text> &#160;  </xsl:text>
											</span>
											<xsl:for-each select="REPORT_TI">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:for-each select="$XML">
					<xsl:for-each select="CONSULT_ER_RECORD">
						<xsl:for-each select="CONSULT_RESULT">
						    <pre>
							<xsl:for-each select="REPORT_TEXT">
								<xsl:text> &#160;&#160;&#160;&#160;&#160;  </xsl:text>
								<xsl:apply-templates/>
							</xsl:for-each>
						    </pre>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				<br/>
					<xsl:for-each select="$XML">
					  <xsl:for-each select="CONSULT_ER_RECORD">
						  <xsl:for-each select="CONSULT_RESULT">
						  	<xsl:for-each select="COMMENT_TEXT">
						  		<xsl:if test=".!=' ' ">
				<table border='0' width="100%">
					<tr >
						<td colspan="2">
							<h2>
									<span>
										<xsl:text>審核回覆</xsl:text>
									</span>
								</h2>
						</td>
					</tr>
					<tr>
						<td width='6%'>審核醫師:</td>
						<td>
								<xsl:for-each select="$XML">
					        <xsl:for-each select="CONSULT_ER_RECORD">
						        <xsl:for-each select="CONSULT_RESULT">
									    <xsl:for-each select="COMMENT_DR">
										    <xsl:apply-templates/>
									</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
							</td>
					</tr>
					<tr>
						<td>審核內容:</td>
						<td>
								<xsl:for-each select="$XML">
					        <xsl:for-each select="CONSULT_ER_RECORD">
						        <xsl:for-each select="CONSULT_RESULT">
									    <xsl:for-each select="COMMENT_TEXT">
										   <xsl:apply-templates/>
									    </xsl:for-each>
									   </xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</td>
					</tr>
				</table>
				        </xsl:if>
				      </xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				<h3>
					<xsl:for-each select="$XML">
						<xsl:for-each select="CONSULT_ER_RECORD">
							<xsl:for-each select="CONSULT_RESULT">
								<xsl:for-each select="REPORT_MEMO">
									<xsl:for-each select="MEMO_TITLE">
										<xsl:apply-templates/>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</h3>
				<xsl:for-each select="$XML">
					<xsl:for-each select="CONSULT_ER_RECORD">
						<xsl:for-each select="CONSULT_RESULT">
							<xsl:for-each select="REPORT_MEMO">
							   <pre>
								<xsl:for-each select="MEMO_TEXT">
									<xsl:apply-templates/>
								</xsl:for-each>
							   </pre>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				<br/>
<xsl:for-each select="$XML">
                        <xsl:for-each select="CONSULT_ER_RECORD">                      	
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
