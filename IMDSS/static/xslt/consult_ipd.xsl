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
				<br/>
				<h2>
				<span style="font-weight:bold; ">
					<xsl:text></xsl:text>
				</span>
				</h2>
				<xsl:for-each select="$XML">
					<xsl:for-each select="CONSULT_RECORD">
						<xsl:for-each select="CONSULT_APPLY">
							<xsl:for-each select="APPLY_TYPE">
								<span style="font-weight:bold; ">
									<xsl:apply-templates/>
								</span>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<span style="font-weight:bold; ">
						<xsl:text>●會診通知 </xsl:text>
					</span>
					<br/>
					<br/>
					<xsl:choose>
					 <xsl:when test="CONSULT_RECORD/CONSULT_APPLY/APPLY_MAJ_DR!=''">
					<table style="border-bottom-color:transparent; " border="0" width="100%">
						<tbody>
							<tr>
								<td>
									<span>
										<xsl:text>申請日期 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_DT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<span>
										<xsl:text>申請醫師 : </xsl:text>
									</span>
										<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_DR">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
									<span>
										<xsl:text>&#160;</xsl:text>
									</span>
								</td>
								<td>
									<span>
										<xsl:text>姓名 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="PAT_NAME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
									<span>
										<xsl:text>&#160;</xsl:text>
									</span>
								</td>
							</tr>
							<tr>
								<td>
									<span>
										<xsl:text>時間 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_TIME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<span>
										<xsl:text>住院日 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_IPD_DT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<span>
										<xsl:text>病歷號 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
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
								<td>
									<span>
										<xsl:text>申請序號 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_NO">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<span>
										<xsl:text>床號 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_BED">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<span>
										<xsl:text>出生日 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="BIRTH_DT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
									<span>
										<xsl:text>&#160; (</xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="AGE">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
									<span>
										<xsl:text>) &#160;</xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="SEX">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
							<tr >
								<td>
									<span>
										<xsl:text>主治醫師 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_MAJ_DR">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</td>
								</tr>
						</tbody>
					</table>
	                </xsl:when>
                    <xsl:otherwise>
					<table style="border-bottom-color:transparent; " border="0" width="100%">
						<tbody>
							<tr>
								<td>
									<span>
										<xsl:text>申請日期 : </xsl:text>
									</span>
								<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_DT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<span>
										<xsl:text>申請醫師 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_DR">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
									<span>
										<xsl:text>&#160;</xsl:text>
									</span>
								</td>
								<td>
									<span>
										<xsl:text>姓名 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="PAT_NAME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
									<span>
										<xsl:text>&#160;</xsl:text>
									</span>
								</td>
							</tr>
							<tr>
								<td>
									<span>
										<xsl:text>時間 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_TIME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<span>
										<xsl:text>住院日 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_IPD_DT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<span>
										<xsl:text>病歷號 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
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
								<td>
									<span>
										<xsl:text>申請序號 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_NO">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<span>
										<xsl:text>床號 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_APPLY">
											<xsl:for-each select="APPLY_BED">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<span>
										<xsl:text>出生日 : </xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="BIRTH_DT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
									<span>
										<xsl:text>&#160; (</xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="AGE">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
									<span>
										<xsl:text>) &#160;</xsl:text>
									</span>
									<xsl:for-each select="$XML">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="PATIENT_INFO">
											<xsl:for-each select="SEX">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
                    </xsl:otherwise>
                    </xsl:choose>
					<hr style="border-bottom-style:dashed; border-color:gray; " size="1"/>
					<table border="0" width="100%">
						<tbody>
							<tr>
								<td>
									<span>
										<xsl:text>[會診醫師] : </xsl:text>
									</span>
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_INFO">
											<xsl:for-each select="CONSULT_DR">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<span>
										<xsl:text>[會診科別] : </xsl:text>
									</span>
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_INFO">
											<xsl:for-each select="CONSULT_DPT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<span>
										<xsl:text>[回CALL分機] : </xsl:text>
									</span>
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_INFO">
											<xsl:for-each select="CONSULT_TEL">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<span>
						<xsl:text>[主 要 診 斷]&#160; </xsl:text>
					</span>
					<xsl:for-each select="CONSULT_RECORD">
						<xsl:for-each select="CONSULT_INFO">
							<pre>
							<xsl:for-each select="ASSESSMENT">
								<xsl:apply-templates/>
							</xsl:for-each>
							</pre>
						</xsl:for-each>
					</xsl:for-each>
					<br/>
					<span>
						<xsl:text>[會 診 主 因]&#160; </xsl:text>
					</span>
					<xsl:for-each select="CONSULT_RECORD">
						<xsl:for-each select="CONSULT_INFO">
							<pre>
							<xsl:for-each select="CONSULT_REASON">
								<xsl:apply-templates/>
							</xsl:for-each>
							</pre>
						</xsl:for-each>
					</xsl:for-each>
					<br/>
					<xsl:for-each select="CONSULT_RECORD">
						<xsl:for-each select="CONSULT_INFO">
						   <xsl:for-each select="LAB_EXAM">
						     <xsl:if test=".!=' ' ">
								<span>
						           <xsl:text>[檢驗檢查報告數據]&#160; </xsl:text>
					            </span>
							<pre>
								<xsl:apply-templates/>
							</pre>
							</xsl:if>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<br/>
					<xsl:for-each select="CONSULT_RECORD">
						<xsl:for-each select="CONSULT_INFO">
							<xsl:for-each select="EXAM_ITEM">
							 <xsl:if test=".!=' ' ">
					               <span>
						                <xsl:text>[已檢查項目]&#160; </xsl:text>
					               </span>
							<pre>
								<xsl:apply-templates/>
							</pre>
						   </xsl:if>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<br/>
					<span>
						<xsl:text>[主因(傳簡訊用)]&#160; </xsl:text>
					</span>
					<xsl:for-each select="CONSULT_RECORD">
						<xsl:for-each select="CONSULT_INFO">
							<pre>
							<xsl:for-each select="REASON_SHORT">
								<xsl:apply-templates/>
							</xsl:for-each>
							</pre>
						</xsl:for-each>
					</xsl:for-each>
					<br/>
					<br/>
					<hr/>
					<br/>
					<h3>會診報告</h3>


					<table border="0" width="100%">
						<tbody>	
							<tr>
								<td width="13%">
									<span>
										<xsl:text>初次報告日期 : </xsl:text>
									</span>
									</td>
									<td width="10%" align="left">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_INFO">
											<xsl:for-each select="CONSULT_DT">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
								<td align="right" width="10%">
								<span>
										<xsl:text>時間 : </xsl:text>
									</span>
									</td>
									<td width="67%" align="left">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_INFO">
											<xsl:for-each select="CONSULT_TIME">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>

							<tr >
								<td colspan="4">
									<span>
										<xsl:text>報告者 : </xsl:text>
									</span>
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_RESULT">
											<xsl:for-each select="REPORT_DR">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td height="15"></td>
							</tr>
							<tr >
								<td colspan="4">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_RESULT">
											<xsl:for-each select="REPORT_URGENT">
								                 <xsl:if test=".!=' ' ">
									<span>
										<xsl:text>本次會診之建議處置之急迫性 : </xsl:text>
									</span>
												<xsl:apply-templates/>
												</xsl:if>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>臨床主訴  (S.O.) : </xsl:text>
									</span>
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_RESULT">
											<pre>
											<xsl:for-each select="REPORT_SO">
												<xsl:apply-templates/>
											</xsl:for-each>
											</pre>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
								<tr>
								<td colspan="4">
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_RESULT">
											<xsl:for-each select="REPORT_PICTURE">
											<xsl:if test="(. !='')">
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
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>臨床評估  (A) : </xsl:text>
									</span>
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_RESULT">
											<pre>
											<xsl:for-each select="REPORT_A">
												<xsl:apply-templates/>
											</xsl:for-each>
											</pre>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>處置建議  (P) :</xsl:text>
									</span>
									<xsl:for-each select="CONSULT_RECORD">
										<xsl:for-each select="CONSULT_RESULT">
											<pre>
											<xsl:for-each select="REPORT_P">
												<xsl:apply-templates/>
											</xsl:for-each>
											</pre>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
										<xsl:for-each select="$XML">
						<xsl:for-each select="CONSULT_RECORD">
							<xsl:for-each select="VS_UPLOAD">										   	
							     <xsl:if test=".!='' ">
       <table border="0" width="100%" align="center">
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
								<xsl:if test="$XML/CONSULT_RECORD/VSCOMMENT/COMMENT_TEXT!='' ">
											<xsl:for-each select="$XML">
                        <xsl:for-each select="CONSULT_RECORD">   
                           <table border="0" align="center" width="100%">
                           	<tr colspan='2'>
                           		<td>
                           			<span style="font-size:large; font-weight:bold;">VS Comment
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
	<hr/>
<h3>會診追蹤報告</h3>

                  <xsl:for-each select="CONSULT_RECORD">
			<xsl:for-each select="CONSULT_TRACK">
					<table border="0" width="100%">
						<tbody>	
							<tr>
								<td>
									<span>
										<xsl:text>追蹤日期 : </xsl:text>
									</span>
						
											<xsl:for-each select="TRACK_DT">
												<xsl:apply-templates/>
											</xsl:for-each>
								</td>
							</tr>

							<tr>
								<td>
									<span>
										<xsl:text>追蹤醫師 : </xsl:text>
									</span>

											<xsl:for-each select="TRACK_DR">
												<xsl:apply-templates/>
											</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>
									<span>
										<xsl:text>臨床主訴  (S.O.) : </xsl:text>
									</span>
											<pre>
											<xsl:for-each select="TRACK_SO">
												<xsl:apply-templates/>
											</xsl:for-each>
											</pre>
								</td>
							</tr>
								<tr>
								<td>
											<xsl:for-each select="TRACK_PICTURE">
											<xsl:if test="(. !='')">
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
								</td>
							</tr>
							<tr>
								<td>
									<span>
										<xsl:text>臨床評估  (A) : </xsl:text>
									</span>
											<pre>
											<xsl:for-each select="TRACK_A">
												<xsl:apply-templates/>
											</xsl:for-each>
											</pre>
								</td>
							</tr>
							<tr>
								<td>
									<span>
										<xsl:text>處置建議  (P) :</xsl:text>
									</span>
											<pre>
											<xsl:for-each select="TRACK_P">
												<xsl:apply-templates/>
											</xsl:for-each>
											</pre>

								</td>
							</tr>
						</tbody>
					</table>
										</xsl:for-each>
									</xsl:for-each>
					<br/>
					<xsl:for-each select="$XML">
                        <xsl:for-each select="CONSULT_RECORD">                      	
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
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
