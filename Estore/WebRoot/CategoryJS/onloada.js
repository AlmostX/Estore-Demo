/**
 * 
 */
function select_onelevel(){
	var ss = document.getElementById("onelevel");
	var onelevelcode = ss.value;
	if(!onelevelcode)return; // ����������Ҫ�ж��Ƿ�Ϊnull
	$.ajax({
		type:"post",//����ʽget/post
		url:"LinkageServlet",//�����Ӧ�ĵ�ַ
		data:{"levelcode":onelevelcode},//�����������ݵĲ�����
		success:function(data){//�����������ɹ����õĻص�������data���Ƿ������˴��ݳ���������
			var jdata = data.trim(); // ȥǰ��ո�
			if(jdata=="fail"){
				alert("��ѯʧ��!");
			}else{
				var json = eval(jdata);//��json�ַ�������ת����json
				var sel = document.getElementById('twolevel');
				if(json=='null'){
					sel.options.length = 1;
				}else{
					sel.options.length = 0;
					
					for(var i=0; i<json.length; i++) {
						sel.add(new Option(json[i].name,json[i].code));
					}
					showthree(json[0].code);
				}
			}
		}
	});
};
function selsct_twolevel(){
	var sa = document.getElementById("twolevel");
	var twolevelcode = sa.value;
	if(!twolevelcode)return; // ����������Ҫ�ж��Ƿ�Ϊnull
	showthree(twolevelcode);
}
function showthree(code) {
	$.ajax({
		type:"post",//����ʽget/post
		url:"LinkageServlet",//�����Ӧ�ĵ�ַ
		data:{"levelcode":code},//�����������ݵĲ�����
		success:function(data){//�����������ɹ����õĻص�������data���Ƿ������˴��ݳ���������
			var jdata = data.trim(); // ȥǰ��ո�
			if(jdata=="fail"){
				alert("��ѯʧ��!");
			}else{
				var json = eval(jdata);//��json�ַ�������ת����json
				var sel = document.getElementById('threelevel');
				if(json=='null'){
					sel.options.length = 1;
				}else{
					sel.options.length = 0;
					for(var i=0; i<json.length; i++) {
						sel.add(new Option(json[i].name,json[i].code));
					}
				}
			}
		}
	});
}
function selsct(lcode,obj){
	$.ajax({
		type:"post",//����ʽget/post
		url:"LinkageServlet",//�����Ӧ�ĵ�ַ
		data:{"levelcode":lcode},//�����������ݵĲ�����
		success:function(data){
			var jdata = data.trim(); // ȥǰ��ո�
			if(jdata=="fail"){
				alert("��ѯʧ��!");
			}else{
				var json = eval(jdata);//��json�ַ�������ת����json
				var dd = "";
				for(var i=0; i<json.length; i++) {
					dd+="<dd onclick='showck("+json[i].code+")'>"+json[i].name+"</dd>";
				}
				document.getElementById(obj).innerHTML=dd;
			}
		}
	});
}