<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>注册页面</title>
		<style>
			input,
			select,
			textarea {
				background-color: gainsboro;
			}
			
			#name {
				text-align: center;
				font-size: 20px;
			}
			
			#main {
				width: 600px;
				height: 385px;
				border: 2px solid black;
				background-color: darkgrey;
				margin: auto;
			}
			
			.line {
				height: 28px;
				border-bottom: 1px solid black;
			}
			
			.left {
				width: 25%;
				float: left;
				padding: 1px 30px;
				border-right: 1px solid black;
				line-height: 27px;
			}
			
			.right {
				float: left;
				padding: 2px 0
			}
			
			.clear {
				clear: both;
			}
			
			.line .one {
				float: left;
				margin: 2px 40px 0px 120px;
			}
			
			.line .two {
				float: left;
				margin: 2px 40px;
			}
			
			.line .three {
				float: left;
				margin: 2px 40px;
			}
			
			.line .clear {
				clear: both;
			}
		</style>
	</head>

	<body>
		<form action="${pageContext.request.contextPath }/registerServlet" method="post">
			<div id="name">会员注册</div>
			<div id="main">
				<!--姓名-->
				<div class="line" id="line1" onmouseover="overoutshow(this.id,'over')" onmouseout="overoutshow(this.id,'out')">
					<div class="left">用户名</div>
					<div class="right"><input id="truename" type="text" placeholder="请输入用户名" name="username" />
						<span id="truename_span"  ></span>
					</div>
					<div class="clear"></div>
				</div>
				<!--密码-->
				<div class="line" id="line2" onmouseover="overoutshow(this.id,'over')" onmouseout="overoutshow(this.id,'out')">
					<div class="left">设置密码</div>
					<div class="right"><input id="truepassword" type="password" placeholder="请输入密码" name="password"/>
					<span id="truepassword_span" ></span></div>
					<div class="clear"></div>
				</div>
				<!--确认密码-->
				<div class="line" id="line3" onmouseover="overoutshow(this.id,'over')" onmouseout="overoutshow(this.id,'out')">
					<div class="left">确认密码</div>
					<div class="right"><input id="againpassword" type="password" placeholder="请再次输入" name="repxd" />
					<span id="againpassword_span" ></span></div>
					<div class="clear"></div>
				</div>
				<!--手机-->
								<div class="line" id="line4" onmouseover="overoutshow(this.id,'over')" onmouseout="overoutshow(this.id,'out')">
					<div class="left">手机</div>
					<div class="right"><input id="phonenum" type="text" placeholder="请输入手机号码" name="telephone"/>
					<span id="phonenum_span" ></span></div>
					<div class="clear"></div>
				</div>

				<!--邮箱-->
				<div class="line" id="line4" onmouseover="overoutshow(this.id,'over')" onmouseout="overoutshow(this.id,'out')">
					<div class="left">邮箱</div>
					<div class="right"><input id="emailtxt" type="text" placeholder="请输入邮箱" name="email"/>
					<span id="emailtxt_span" ></span></div>
					<div class="clear"></div>
				</div>
				<!--生日-->
				<div class="line" id="line5" onmouseover="overoutshow(this.id,'over')" onmouseout="overoutshow(this.id,'out')">
					<div class="left">生日</div>
					<div class="right">
						<select id="year" onchange="nianyue(this.value)" name="year">
							<script >
								for(i = 1900; i < 2018; i++) {
									document.write("<option value='"+i+"'>" + i + "</option>")
								}
							</script>
						</select>
						年
						<select id="month" onchange="yueri(this.value)" name="month">
							<script>
								for(i = 1; i <= 12; i++) {
									document.write("<option value='"+i+"'>" + i + "</option>")
								}
							</script>
						</select>
						月
						<select id="day" name="day">
							<script>
								for(i=1;i<=31;i++){
									document.write("<option value='"+i+"'>"+i+"</option>")
								}
							</script>
						</select>
						日</div>
					<div class="clear"></div>
				</div>
				<!--性别-->
				<div class="line" id="line6" onmouseover="overoutshow(this.id,'over')" onmouseout="overoutshow(this.id,'out')">
					<div class="left">性别</div>
					<div class="right"><input type="radio" name="sex" value="男"/>男 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="女"/>女</div>
					<div class="clear"></div>
				</div>
				<!--职业-->
				<div class="line" id="line7" onmouseover="overoutshow(this.id,'over')" onmouseout="overoutshow(this.id,'out')">
					<div class="left">真实姓名</div>
					<div class="right">
						<input type="text" name="name">
					</div>
					<div class="clear"></div>
				</div>
				<!--地址-->
				<div class="line" id="line8" onmouseover="overoutshow(this.id,'over')" onmouseout="overoutshow(this.id,'out')">
					<div class="left">地址</div>
					<div class="right">
						<select id="province" onchange="addcity(this.value)">
							<option>--请选择--</option>
							<option value="0">北京</option>
							<option value="1">上海</option>
							<option value="2">天津</option>
							<option value="3">重庆</option>
							<option value="4">黑龙江</option>
							<option value="5">吉林</option>
							<option value="6">辽宁</option>
							<option value="7">山东</option>
							<option value="8">山西</option>
							<option value="9">陕西</option>
							<option value="10">河北</option>
							<option value="11">河南</option>
							<option value="12">湖北</option>
							<option value="13">湖南</option>
							<option value="14">海南</option>
							<option value="15">江苏</option>
							<option value="16">江西</option>
							<option value="17">广东</option>
							<option value="18">广西</option>
							<option value="19">云南</option>
							<option value="20">贵州</option>
							<option value="21">四川</option>
							<option value="22">内蒙古</option>
							<option value="23">宁夏</option>
							<option value="24">甘肃</option>
							<option value="25">青海</option>
							<option value="26">西藏</option>
							<option value="27">新疆</option>
							<option value="28">安徽</option>
							<option value="29">浙江</option>
							<option value="30">福建</option>
							<option value="31">台湾</option>
							<option value="32">香港</option>
							<option value="33">澳门</option>
						</select>省
						<select id="city">
							<option>--请选择--</option>
						</select>市
					</div>
					<div class="clear"></div>
				</div>
				<!--爱好-->
				<div class="line" id="line9" onmouseover="overoutshow(this.id,'over')" onmouseout="overoutshow(this.id,'out')">
					<div class="left">爱好</div>
					<div class="right">
						<input type="checkbox" name="checkall" />全选&nbsp;&nbsp;
						<input type="checkbox" name="checkone" />放生&nbsp;&nbsp;
						<input type="checkbox" name="checkone" />念经&nbsp;&nbsp;
						<input type="checkbox" name="checkone" />超度&nbsp;&nbsp;
						<input type="checkbox" name="checkone" />敲木鱼&nbsp;&nbsp;
					</div>
					<div class="clear"></div>
				</div>
				<!--简介-->
				<div class="line" style="width:auto;height: 67px;" id="line10" onmouseover="overoutshow(this.id,'over')" onmouseout="overoutshow(this.id,'out')">
					<div class="left" style="line-height: 66px;">自我介绍</div>
					<div class="right"><textarea placeholder="请自我介绍！" col="6" style="resize:none;"></textarea></div>
					<div class="clear"></div>
				</div>
				<!-- 示例头像
				<div class="line" style="height: 90px;" id="line11" onmouseover="overoutshow(this.id,'over')" onmouseout="overoutshow(this.id,'out')">
					<div class="left" style="line-height: 89px;">头像</div>
					<div class="right" style="font-size: 12px;color:darkslategray;padding: 3px 0 3px;">示例：<input type="image" width="30%" height="60%" src="img/timg.jpg" /></div>
					<div class="clear"></div>
				</div>
				上传
				<div class="line" style="height:32px;" id="line12" onmouseover="overoutshow(this.id,'over')" onmouseout="overoutshow(this.id,'out')">
					<div class="left" style="line-height: 31px;">上传头像</div>
					<div class="right"><input type="file" style="border: 2px solid white;" /></div>
					<div class="clear"></div>
				</div> -->
				<!--注册重置返回-->
				<div class="line" id="line13" onmouseover="overoutshow(this.id,'over')" onmouseout="overoutshow(this.id,'out')">
					<div class="one"><input type="submit" value="注册" onclick="return check()" /></div>
					<div class="two"><input type="reset" value="重置" /></div>
					<div class="three"><input type="button" value="返回" onclick="javascript:location.href='${pageContext.request.contextPath }/showAllProductServlet'" /></div>
					<div class="clear"></div>
				</div>
		</form>
		<script>
			var checkal = document.getElementsByName("checkall")[0];
			var arr = document.getElementsByName("checkone");
			
			checkal.onchange=function(){
			if(checkal.checked){
				for(var i = 0; i < arr.length; i++) {
					arr[i].checked = true;
				}
			}else{
				for(var i = 0; i < arr.length; i++) {
					arr[i].checked = false;
				}
			}	
		}
			for (var i = 0; i < arr.length; i++) {
				arr[i].onchange=function(){
					var result=true;
					for(var j=0;j<arr.length;j++){
					if(arr[j].checked==false){
						result=false;
					}
				
				}	
				if(result){
				checkal.checked=true;
				}else{
				checkal.checked=false;
				}
				}	
			}
		</script>
		
		<script>
			function check(){
			var r1=checkNamePassRepaEmai('truename','用户名不能为空');
			var r2=checkNamePassRepaEmai('truepassword','密码不能为空');
			var r3=checkNamePassRepaEmai('againpassword','确认密码不能为空');
			var r4=checkNamePassRepaEmai('phonenum','手机号码不能为空');
			var r5=checkNamePassRepaEmai('emailtxt','邮箱不能为空');
			var r6=checkPassRepa('againpassword','两次密码不一致');
			var r7=checkEmai('emailtxt','邮箱格式有误');
			var r8=checkphone('phonenum','手机号码格式有误');
			if(r1&&r2&&r3&&r4&&r5&&r6&&r7&&r8){
				return true;
			}else{
				return false;
			}
			}
			function checkphone(id,info){
				var ele=document.getElementById(id);
				if(ele.value!=""){
				var span=document.getElementById(id+"_span");
				span.innerHTML="";
				var regex=/^1[3|4|5|7|8][0-9]{9}$/;
				var res=regex.test(ele.value);
				if(!res){
					span.innerHTML="<font style='color:red;font-size:12px;'>"+info+"</font>";
					return false;
				}
				return true;
				}
			}
			function checkEmai(id,info){
				var ele=document.getElementById(id);
				if(ele.value!=""){
				var span=document.getElementById(id+"_span");
				span.innerHTML="";
				var regex=/^(\w+)(\.\w+)*@(\w+)(\.\w+)*.(\w+)$/;
				var res=regex.test(ele.value);
				if(!res){
					span.innerHTML="<font style='color:red;font-size:12px;'>"+info+"</font>";
					return false;
				}
				return true;
				}
			}
			function checkPassRepa(id,info){
				var ele=document.getElementById(id);
				if(ele.value!=""){
				var span=document.getElementById(id+"_span");
				span.innerHTML="";
				var pass=document.getElementById("truepassword");
				if(ele.value!=pass.value){
					span.innerHTML="<font style='color:red;font-size:12px;'>"+info+"</font>";
					return false;
				}
				return true;
				}
			}
			function checkNamePassRepaEmai(id,info){
				var span=document.getElementById(id+"_span");
				span.innerHTML="";
				var ele=document.getElementById(id);
				if(ele.value==""){
					span.innerHTML="<font style='color:red;font-size:12px;'>"+info+"</font>";
					return false;
				}
				return true;
			}
		</script>
		<script>
			function addcity(val){
				var city=document.getElementById("city");
				city.length=1;
				var kindcity=new Array();
				kindcity[0]=new Array("东城区","西城区","崇文区","宣武区","朝阳区","丰台区","石景山区","海淀区门","头沟区","房山区","通州区","顺义区","昌平区","大兴区","怀柔区","平谷区","密云县","延庆县");
				kindcity[1]=new Array("黄浦区","卢湾区","徐汇区","长宁区","普陀区","闸北区","杨浦区","闵行区","宝山区","嘉定区","浦东新区","金山区","松江区","青浦区","南汇区","奉贤区","崇明县");
				kindcity[2]=new Array("和平区","河东区","河西区","南开区","河北区","红桥区","塘沽区","汉沽区","大港区","东丽区","西青区","津南区","北辰区","武清区","宝坻区","宁河县","静海县","蓟县");
				kindcity[3]=new Array("万州区","涪陵区","渝中区","大渡口","区江北区","沙坪坝区","九龙坡区","南岸区","北碚区","万盛区","双桥区","渝北区","巴南区","黔江区","长寿区","江津区","合川区","永川区","南川区","綦江县","潼南县","铜梁县","大足县","荣昌县","璧山县","梁平县","城口县","丰都县","垫江县","武隆县","忠县","开县","云阳县","奉节县","巫山县","巫溪县","石柱土家族自治县","秀山土家族苗族自治县","酉阳土家族苗族自治县","彭水苗族土家族自治县");
				kindcity[4]=new Array("哈尔滨市","齐齐哈尔市","鸡西市","鹤岗市","双鸭山市","大庆市","伊春市","佳木斯市","七台河市","牡丹江市","黑河市","绥化市","大兴安岭地区");
				kindcity[5]=new Array("长春市","吉林市","四平市","辽源市","通化市","白山市","松原市","白城市","延边朝鲜族自治州");
				kindcity[6]=new Array("沈阳市","大连市","鞍山市","抚顺市","本溪市","丹东市","锦州市","营口市","阜新市","辽阳市","盘锦市","铁岭市","朝阳市","葫芦岛市");
				kindcity[7]=new Array("济南市","青岛市","淄博市","枣庄市","东营市","烟台市","潍坊市"," 济宁市","泰安市","威海市","日照市","莱芜市","临沂市","德州市","聊城市","滨州市","菏泽市");
				kindcity[8]=new Array("太原市","大同市","阳泉市","长治市","晋城市","朔州市","晋中市","运城市","忻州市","临汾市","吕梁市");
				kindcity[9]=new Array("西安市","铜川市","宝鸡市","咸阳市","渭南市","延安市","汉中市","榆林市","安康市","商洛市");
				kindcity[10]=new Array("石家庄市","唐山市","秦皇岛市","邯郸市","邢台市","保定市","张家口市","承德市","沧州市","廊坊市","衡水市");
				kindcity[11]=new Array("郑州市","开封市","洛阳市","平顶山市","安阳市","鹤壁市","新乡市","焦作市","济源市","濮阳市许昌市","漯河市","三门峡市","南阳市","商丘市","信阳市","周口市","驻马店市");
				kindcity[12]=new Array("武汉市","黄石市","十堰市","宜昌市","襄樊市","","荆门市","孝感市","黄冈市","咸宁市","随州市","恩施土家族苗族自治州","仙桃市","潜江市","天门市","神农架林区");
				kindcity[13]=new Array("长沙市","株洲市","湘潭市","衡阳市","邵阳市","岳阳市","常德市","张家界市","益阳市","郴州市","永州市","怀化市","娄底市","湘西土家族苗族自治州");
				kindcity[14]=new Array("海口市","三亚市","五指山市","琼海市","儋州市","文昌市","万宁市","东方市","定安县","屯昌县","澄迈县","临高县","白沙黎族自治县","昌江黎族自治县","乐东黎族自治县","陵水黎族自治县","保亭黎族苗族自治县","琼中黎族苗族自治县");
				kindcity[15]=new Array("南京市","无锡市","徐州市","常州市","苏州市","南通市","连云港市","淮安市","盐城市","扬州市","镇江市","泰州市","宿迁市");
				kindcity[16]=new Array("南昌市","景德镇市","萍乡市","九江市","新余市","鹰潭市","吉安市","宜春市","抚州市","上饶市");
				kindcity[17]=new Array("广州市","韶关市","深圳市","珠海市","佛山市","江门市","湛江市","茂名市","肇庆市","惠州市","梅州市","河源市","阳江市","清远市","东莞市","中山市","潮州市","揭阳市","云浮市");
				kindcity[18]=new Array("南宁市","柳州市","桂林市","梧州市","防城港市","钦州市","贵港市","玉林市","百色市","贺州市","河池市","来宾市","崇左市");
				kindcity[19]=new Array("昆明市","曲靖市","玉溪市","昭通市","丽江市","临沧市","楚雄彝族自治州","红河哈尼族彝族自治州","文山壮族苗族自治州","西双版纳傣族自治州","大理白族自治州","德宏傣族景颇族自治州","怒江傈僳族自治州","迪庆藏族自治州");
				kindcity[20]=new Array("贵阳市","六盘水市","遵义市","安顺市","铜仁地区","毕节地区","黔西南布依族苗族自治州","黔东南苗族侗族自治州","黔南布依族苗族自治州");
				kindcity[21]=new Array("成都市","自贡市","攀枝花市","泸州市","德阳市","绵阳市","广元市","遂宁市","内江市","乐山市","眉山市","宜宾市","广安市","达州市","雅安市","巴中市","资阳市","甘孜藏族自治州","凉山彝族自治州");
				kindcity[22]=new Array("呼和浩特市","包头市","乌海市","赤峰市","通辽市","鄂尔多斯市","呼伦贝尔市","巴彦淖尔市","兴安盟","锡林郭勒盟","阿拉善盟");
				kindcity[23]=new Array("银川市","石嘴山市","吴忠市","固原市","中卫市");
				kindcity[24]=new Array("兰州市","嘉峪关市","金昌市","白银市","天水市","武威市","张掖市","平凉市酒泉市","庆阳市","定西市","陇南市","临夏回族自治州","甘南藏族自治州");
				kindcity[25]=new Array("西宁市","海东地区","海北藏族自治州","黄南藏族自治州","海南藏族自治州","果洛藏族自治州","玉树藏族自治州","海西蒙古族藏族自治州");
				kindcity[26]=new Array("拉萨市","昌都地区","山南地区","日喀则地区","那曲地区","阿里地区","林芝地区");
				kindcity[27]=new Array("乌鲁木齐市","克拉玛依市","吐鲁番地区","哈密地区","昌吉回族自治州","博尔塔拉蒙古自治州","巴音郭楞蒙古自治州","阿克苏地区克孜勒苏柯尔克孜自治州","喀什地区和田地区","伊犁哈萨克自治州塔城地区","阿勒泰地区","石河子市阿拉尔市","图木舒克市五家渠市");
				kindcity[28]=new Array("合肥市","芜湖市","蚌埠市","淮南市","马鞍山市","铜陵市","安庆市","黄山市","滁州市","阜阳市","宿州市","六安市","亳州市","池州市","宣城市");
				kindcity[29]=new Array("杭州市","宁波市","温州市","湖州市","绍兴市","金华市","舟山市","台州市","丽水市");
				kindcity[30]=new Array("福州市","厦门市","莆田市","三明市","泉州市","漳州市","南平市","龙岩市","宁德市");
				kindcity[31]=new Array("台北市","高雄市","基隆市","台中市","台南市","新竹市","嘉义市");
				kindcity[32]=new Array("中西区","湾仔区","东区","南区","油尖旺区","深水埗区","九龙城区","黄大仙区","观塘区","荃湾区","葵青区","沙田区","西贡区","大埔区","北区","元朗区","屯门区","离岛区");
				kindcity[33]=new Array("澳门");
				for(var i=0;i<kindcity[val].length;i++){
					var textNode = document.createTextNode(kindcity[val][i]);
					var optNode = document.createElement("option");
					optNode.appendChild(textNode);
					city.appendChild(optNode);
				}
			}
		</script>
		<script>
			function overoutshow(id,info){
				var line=document.getElementById(id);
				if(info=="over"){
					line.style.backgroundColor="#6b637a";
				}
				if(info=="out"){
					line.style.backgroundColor="darkgrey";
				}
			}
		</script>
		<script>
			var num;
			function nianyue(val){
				num=val;
			}
			function yueri(nval){
				var day=document.getElementById("day");
				day.length=0;
				var daylist=new Array();
				if(nval==1||nval==3||nval==5||nval==7||nval==8||nval==10||nval==12){
					daylist[nval]=new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31);
				}
				if(nval==4||nval==6||nval==9||nval==11){
					daylist[nval]=new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30);
				}
				if(nval==2){
					if((num%4===0&&num%100!==0)||num%400===0){
					daylist[nval]=new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29);
					}else{
					daylist[nval]=new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28);
					}	
				}
				for(var i=0;i<daylist[nval].length;i++){
					var textNode = document.createTextNode(daylist[nval][i]);
					var optNode = document.createElement("option");
					optNode.appendChild(textNode);
					day.appendChild(optNode);
				}
			}
		</script>
	</body>

</html>