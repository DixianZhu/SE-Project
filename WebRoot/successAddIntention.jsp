<%@ page language="java" import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>

	<body bgcolor="#FFF8DC">
		<meta charset="utf-8">
		<script type="text/javascript">
			/*
			by VILIC VANE
			Web www.vilic.info
			Email i@vilic.info
			*/
			window.onload = function () {
			var text = document.getElementById("text"); //�û��������ı���
			var shadow = document.getElementById("shadow"); //���ص��ı���
			text.oninput = //��IE��
			text.onpropertychange = //IE��
			onchange;
			function onchange() {
			shadow.value = text.value;
			setHeight();
			setTimeout(setHeight, 0); //���IE 6/7/8���ӳ�, ������ʱ����һ���ַ��ĳ���
			function setHeight() { text.style.height = shadow.scrollHeight + "px"; }
			}
			};
		</script>
		<style type="text/css">
			body {
						text-align: center;
					}
					.button {
						width: 60%;
						display: inline-block;
						outline: none;
						cursor: pointer;
						text-align: center;
						text-decoration: none;
						font: 18px/80%;
						font-style: normal;
						padding: .5em 2em .55em;
						text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
						-webkit-border-radius: .5em;
						-moz-border-radius: .5em;
						border-radius: .5em;
						-webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, .2);
						-moz-box-shadow: 0 1px 5px rgba(0, 0, 0, .2);
						box-shadow: 0 1px 5px rgba(0, 0, 0, .2);
					}
					.button:hover {
						text-decoration: none;
					}
					.button:active {
						position: relative;
						top: 1px;
					}
					.orange {
						color: #fef4e9;
						border: solid 1px #da7c0c;
						background: #f78d1d;
						background: -webkit-gradient(linear, left top, left bottom, from(#faa51a), to(#f47a20));
						background: -moz-linear-gradient(top, #faa51a, #f47a20);
						filter: progid: DXImageTransform.Microsoft.gradient(startColorstr='#faa51a', endColorstr='#f47a20');
					}
					.orange:hover {
						background: #a52a2a;
						background: -webkit-gradient(linear, left top, left bottom, from(#f88e11), to(#f06015));
						background: -moz-linear-gradient(top, #f88e11, #f06015);
						filter: progid: DXImageTransform.Microsoft.gradient(startColorstr='#f88e11', endColorstr='#f06015');
					}
					.orange:active {
						color: #fcd3a5;
						background: -webkit-gradient(linear, left top, left bottom, from(#f47a20), to(#faa51a));
						background: -moz-linear-gradient(top, #f47a20, #faa51a);
						filter: progid: DXImageTransform.Microsoft.gradient(startColorstr='#f47a20', endColorstr='#faa51a');
					}
					h1 {
						font-size: 40px;
					}
					legend {
						font-size: 20px;
						font-style: normal;
					}
					label {
						font-family: "����";
						font-size: 20px;
					}
					.t1{
						width: 300px;
						height="100%";
					}
					#shadow, #text { font: 12px/16px Arial; width: 400px; overflow: hidden; height: 46px; }
#shadow { position: absolute; border-width: 0px; padding: 0px; visibility: hidden; }
#text { resize: none; }

.bordered {
	width: 600px;
	height="80%";
    border: solid #ccc 1px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    -webkit-box-shadow: 0 1px 1px #ccc; 
    -moz-box-shadow: 0 1px 1px #ccc; 
    box-shadow: 0 1px 1px #ccc;         
}

.bordered tr:hover {
    background: #fbf8e9;
    -o-transition: all 0.1s ease-in-out;
    -webkit-transition: all 0.1s ease-in-out;
    -moz-transition: all 0.1s ease-in-out;
    -ms-transition: all 0.1s ease-in-out;
    transition: all 0.1s ease-in-out;     
}    
    
.bordered td, .bordered th {
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    padding: 10px;
    text-align: left;    
}

.bordered th {
    background-color: #dce9f9;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
    background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
    border-top: none;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
}

.bordered td:first-child, .bordered th:first-child {
    border-left: none;
}

.bordered th:first-child {
    -moz-border-radius: 6px 0 0 0;
    -webkit-border-radius: 6px 0 0 0;
    border-radius: 6px 0 0 0;
}

.bordered th:last-child {
    -moz-border-radius: 0 6px 0 0;
    -webkit-border-radius: 0 6px 0 0;
    border-radius: 0 6px 0 0;
}

.bordered th:only-child{
    -moz-border-radius: 6px 6px 0 0;
    -webkit-border-radius: 6px 6px 0 0;
    border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
    -moz-border-radius: 0 0 0 6px;
    -webkit-border-radius: 0 0 0 6px;
    border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
    -moz-border-radius: 0 0 6px 0;
    -webkit-border-radius: 0 0 6px 0;
    border-radius: 0 0 6px 0;
}
		</style>
		<table width="100%" height="100%" border="0" cellpadding="0">
			<td width="300px">
				<table class="t1" border="0" cellpadding="0" bgcolor="#787878">
					<tr>
						<td align="center" valign="top">
							<br />
							<h1>Welcome</h1>
							<fieldset>
								<legend>your information:</legend>
								<p>
									<label>��ȥ�ľ��㣺</label>
									<s:property value="intendPlace" />
								</p>
								<p>
									<label>������ʱ��:</label>
									<s:property value="intendTime" />
								</p>
								<p>
									<label>�����Ļ���:</label>
									<s:property value="intendPrice" />
								</p>
								<p>
									<label>����ͬ�������:</label>
									<s:property value="intendTime" />
								</p>
								<p>
									<label>�����Ļ���:</label>
									<s:property value="intendPrice" />
								</p>


								<p>
									<label>����ͬ�������:</label>
									<s:property value="intendFriendAge" />
								</p>
								<p>
									<label>����ͬ����Ա�:</label>
									<s:property value="intendFriendGender" />
								</p>
								<p>
									<label>����ͬ��Ĺ���:</label>
									<s:property value="intendFriendOccupation" />
								</p>
								<p>
									<label>����ͬ��ĵ���:</label>
									<s:property value="intendFriendLocation" />
								</p>

								<p>
									<label>����ͬ��İ���:</label>
									<s:property value="intendFriendHobby" />
								</p>
							</fieldset>
							<br/> <a href='<s:url action="linkNode">

		<s:param name="userName" value="userName" />

		<s:param name="passWord" value="passWord"/>

		<s:param name="intendPlace" value="intendPlace" />

				  </s:url>' class="button orange" color="#6495ED">Ѱ�Ҷ���

				</a>
							<br/> <a href='<s:url action="showTeam">

		<s:param name="userName" value="userName" />

		<s:param name="passWord" value="passWord"/>

		<s:param name="intendPlace" value="intendPlace" />

		<s:param name="teamName" value="teamName" />

				  </s:url>' class="button orange" color="#6495ED">�ҵĶ���

				</a>
							<br/><a href='<s:url action="quitTeam">

		<s:param name="userName" value="userName" />

		<s:param name="passWord" value="passWord"/>

		<s:param name="intendPlace" value="intendPlace"/>

		<s:param name="intendTime" value="intendTime"/>

		<s:param name="intendPrice" value="intendPrice"/>

		<s:param name="intendFriendAge" value="intendFriendAge"/>

		<s:param name="intendFriendGender" value="intendFriendGender"/>

		<s:param name="intendFriendOccupation" value="intendFriendOccupation"/>

		<s:param name="intendFriendLocation" value="intendFriendLocation"/>

		<s:param name="intendFriendHobby" value="intendFriendHobby"/>

		<s:param name="teamName" value="teamName"/>

		<s:param name="apply1" value="apply1"/>

		<s:param name="apply2" value="apply2"/>

		<s:param name="apply3" value="apply3"/>

		<s:param name="invite1" value="invite1"/>

		<s:param name="invite2" value="invite2"/>

		<s:param name="invite3" value="invite3"/>

		<s:param name="applySet" value="applySet"/>

		<s:param name="inviteSet" value="inviteSet"/>

				  </s:url>' class="button orange" color="#6495ED">�˳�����

	</a>
							<br/> <a href='<s:url action="showIntentionOne">

		<s:param name="userName" value="userName" />

		<s:param name="passWord" value="passWord"/>

				  </s:url>' class="button orange" color="#6495ED">������һҳ

	</a>
							<br/><a href='<s:url action="login">

		<s:param name="userName" value="userName"/>

		<s:param name="passWord" value="passWord"/>

				  </s:url>' class="button orange">����������

		</a>
						</td>
					</tr>
				</table>
			</td>
			<td align="center" valign="top" width="900px">
				<table class="bordered">
					<tr>
						<br/>
					</tr>
					<tr>
						<br/>
					</tr>
					<tr>
						<br/>
					</tr>
					<tr>
						<br/>
					</tr>
					<tr>
						<th>���������ӳ�����<s:property value="teamName" /></th>
					</tr>
					<tr>
				</table>
				<table class="bordered">
					<th>�������</th>
					<th>
						�����ˣ�
					</th>
					<th>����ʱ�䣺</th>
					<th>
						#
					</th>
					<s:iterator value="applySet" status="itStatus" id="n">
					<tr>
						<td><s:property value="#itStatus.count" /></td>
						<td><s:property value="#n[0]" /></td>
						<td><s:property value="#n[1]" /></td>
						<td><a href='<s:url action="admitTeam">

		<s:param name="teamName" value="userName" />

		<s:param name="userName" value="#n[0]" />

		<s:param name="passWord" value="passWord"/>

		<s:param name="intendPlace" value="intendPlace"/>

		<s:param name="addTeamFlag" value="' Yes '"/>

				  </s:url>'>ͬ������ </a></td>
					
					</tr>
					</s:iterator>
				</table>
				<table class="bordered">
					<th>�������</th>
					<th>
						�����ˣ�
					</th>
					<th>����ʱ�䣺</th>
					<th>
						#
					</th>
					<s:iterator value="inviteSet" status="itStatus" id="n">
					<tr>
						<td><s:property value="#itStatus.count" /></td>
						<td><s:property value="#n[0]" /></td>
						<td><s:property value="#n[1]" /></td>
						<td><a href='<s:url action="admitTeam">

		<s:param name="teamName" value="#n[0]"/>

		<s:param name="userName" value="userName" />

		<s:param name="passWord" value="passWord"/>

		<s:param name="intendPlace" value="intendPlace"/>

		<s:param name="addTeamFlag" value="' No '"/>

				  </s:url>'>ͬ������ 

		</a></td>
					</tr>
						
					</s:iterator>
					</table>
				<table class="bordered">
					<th>
						�ҵ����룺
					</th>
					<th>������</th>
					<th>
						#
					</th>
					<th>
						�ҵ����룺
					</th>
					<th>������</th>
					<th>#</th>
					</tr>
					<tr>
						<td>�ҵ�����1</td>
						<td><s:property value="apply1" />
						</td>
						<td><a href='<s:url action="clear">

					<s:param name="userName" value="userName" />

					<s:param name="passWord" value="passWord"/>

					<s:param name="intendPlace" value="intendPlace"/>

					<s:param name="clearType" value="' apply '"/>

					<s:param name="clearFlag" value="'1 '"/>

				 	 </s:url>'>����</a>
							<td>�ҵ�����1</td>
							<td><s:property value="invite1" />
							</td>
							<td><a href='<s:url action="clear">

						<s:param name="userName" value="userName" />

						<s:param name="passWord" value="passWord"/>

						<s:param name="intendPlace" value="intendPlace"/>

						<s:param name="clearType" value="' invite '"/>

						<s:param name="clearFlag" value="'1 '"/>

				 	 </s:url>'>����</a>
							</td>
					</tr>
					</tr>
					<tr>
						<td>�ҵ�����2</td>
						<td><s:property value="apply2" />
						</td>
						<td><a href='<s:url action="clear">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="clearType" value="' apply '"/>
		<s:param name="clearFlag" value="'2 '"/>
				  </s:url>'>����</a>
							<td>�ҵ�����2</td>
							<td><s:property value="invite2" />
							</td>
							<td><a href='<s:url action="clear">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="clearType" value="' invite '"/>
		<s:param name="clearFlag" value="'2 '"/>
				  </s:url>'>����</a>
							</td>
					</tr>
					<tr>
						<td>�ҵ�����3</td>
						<td><s:property value="apply3" />
						</td>
						<td><a href='<s:url action="clear">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="clearType" value="' apply '"/>
		<s:param name="clearFlag" value="'3 '"/>
				  </s:url>'>����	</a>
							<td>�ҵ�����3</td>
							<td><s:property value="invite3" />
							</td>
							<td><a href='<s:url action="clear">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="clearType" value="' invite '"/>
		<s:param name="clearFlag" value="'3 '"/>
				  </s:url>'>����</a>
							</td>
					</tr>
				</table>
				<table class="bordered">
					<th>�������ۣ�������鷽�����ۣ��� </th>
				</table>
				<table class="bordered">
					<tr>
							<td>
							<h2>�������ۣ�</h2> <font size="2" color="#000000">

							<s:form action="addChat">

							<s:hidden name="userName" />

							<s:hidden name="passWord" />

							<s:hidden name="teamName" />

							<s:hidden name="intendPlace" />

							<s:textarea name="word" id="text" />

							<s:submit style="background-color:#3bb3e0;
	padding:10px;
	position:relative;
	font-family: 'Open Sans', sans-serif;
	font-size:12px;
	text-decoration:none;
	color:#fff;
	border: solid 1px #186f8f;
	background-image: linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
	background-image: -o-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
	background-image: -moz-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
	background-image: -webkit-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
	background-image: -ms-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
	background-image: -webkit-gradient(
	linear,
	left bottom,
	left top,
	color-stop(0, rgb(44,160,202)),
	color-stop(1, rgb(62,184,229))
	);
	-webkit-box-shadow: inset 0px 1px 0px #7fd2f1, 0px 1px 0px #fff;
	-moz-box-shadow: inset 0px 1px 0px #7fd2f1, 0px 1px 0px #fff;
	box-shadow: inset 0px 1px 0px #7fd2f1, 0px 1px 0px #fff;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	-o-border-radius: 5px;
	border-radius: 5px;"/>

							</s:form> </font>
						</td>
					</tr>
				</table>
				<table class="bordered">
					<th>���</th>
					<th>�û���</th>
					<th>����</th>
					<s:iterator value="broadcast" status="itStatus" id="n">
						<tr>
							<td><s:property value="#itStatus.count" />
							</td>
							<td><s:property value='#n[0]' />
							</td>
							<td><s:property value='#n[1]' />
							</td>
						</tr>
					</s:iterator>
				</table>

				</td>
		</table>

	</body>