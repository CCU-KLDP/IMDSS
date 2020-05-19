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
						<xsl:text>���|�E�q�� </xsl:text>
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
										<xsl:text>�ӽФ�� : </xsl:text>
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
										<xsl:text>�ӽ���v : </xsl:text>
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
										<xsl:text>�m�W : </xsl:text>
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
										<xsl:text>�ɶ� : </xsl:text>
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
										<xsl:text>��|�� : </xsl:text>
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
										<xsl:text>�f���� : </xsl:text>
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
										<xsl:text>�ӽЧǸ� : </xsl:text>
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
										<xsl:text>�ɸ� : </xsl:text>
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
										<xsl:text>�X�ͤ� : </xsl:text>
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
										<xsl:text>�D�v��v : </xsl:text>
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
										<xsl:text>�ӽФ�� : </xsl:text>
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
										<xsl:text>�ӽ���v : </xsl:text>
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
										<xsl:text>�m�W : </xsl:text>
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
										<xsl:text>�ɶ� : </xsl:text>
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
										<xsl:text>��|�� : </xsl:text>
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
										<xsl:text>�f���� : </xsl:text>
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
										<xsl:text>�ӽЧǸ� : </xsl:text>
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
										<xsl:text>�ɸ� : </xsl:text>
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
										<xsl:text>�X�ͤ� : </xsl:text>
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
										<xsl:text>[�|�E��v] : </xsl:text>
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
										<xsl:text>[�|�E��O] : </xsl:text>
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
										<xsl:text>[�^CALL����] : </xsl:text>
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
						<xsl:text>[�D �n �E �_]&#160; </xsl:text>
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
						<xsl:text>[�| �E �D �]]&#160; </xsl:text>
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
						           <xsl:text>[�����ˬd���i�ƾ�]&#160; </xsl:text>
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
						                <xsl:text>[�w�ˬd����]&#160; </xsl:text>
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
						<xsl:text>[�D�](��²�T��)]&#160; </xsl:text>
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
					<h3>�|�E���i</h3>


					<table border="0" width="100%">
						<tbody>	
							<tr>
								<td width="13%">
									<span>
										<xsl:text>�즸���i��� : </xsl:text>
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
										<xsl:text>�ɶ� : </xsl:text>
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
										<xsl:text>���i�� : </xsl:text>
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
										<xsl:text>�����|�E����ĳ�B�m���止�� : </xsl:text>
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
										<xsl:text>�{�ɥD�D  (S.O.) : </xsl:text>
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
										<xsl:text>�{�ɵ���  (A) : </xsl:text>
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
										<xsl:text>�B�m��ĳ  (P) :</xsl:text>
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
        		<td><xsl:text>�D�v��v�G</xsl:text>
        		    <xsl:value-of select="."/>
        		    <xsl:text>�@�w�Ю�</xsl:text>
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
<h3>�|�E�l�ܳ��i</h3>

                  <xsl:for-each select="CONSULT_RECORD">
			<xsl:for-each select="CONSULT_TRACK">
					<table border="0" width="100%">
						<tbody>	
							<tr>
								<td>
									<span>
										<xsl:text>�l�ܤ�� : </xsl:text>
									</span>
						
											<xsl:for-each select="TRACK_DT">
												<xsl:apply-templates/>
											</xsl:for-each>
								</td>
							</tr>

							<tr>
								<td>
									<span>
										<xsl:text>�l����v : </xsl:text>
									</span>

											<xsl:for-each select="TRACK_DR">
												<xsl:apply-templates/>
											</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>
									<span>
										<xsl:text>�{�ɥD�D  (S.O.) : </xsl:text>
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
										<xsl:text>�{�ɵ���  (A) : </xsl:text>
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
										<xsl:text>�B�m��ĳ  (P) :</xsl:text>
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
