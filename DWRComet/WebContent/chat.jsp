<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<title>Insert title here</title>
</head>
<body onload="dwr.engine.setActiveReverseAjax(true);">
<script type="text/javascript" src="${pageContext.request.contextPath }/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/dwr/interface/ChatService.js"></script>
<script type="text/javascript">
	
		

        function send() {
            var time = new Date();
            var content = dwr.util.getValue("content");
            var name = dwr.util.getValue("userName");
            var info = encodeURI(encodeURI(name + " say:\n" + content));
            var msg = {"msg": info, "time": time};
            dwr.util.setValue("content", "");
            if (!!content) {
                ChatService.sendMessage(msg);
            } else {
                alert("发送的内容不能为空！");
            }
        }
 
        function showMessage(data) {
            var message = decodeURI(decodeURI(data.msg));
            var text = dwr.util.getValue("info");
            if (!!text) {  
                dwr.util.setValue("info", text + "\n" + data.time + "  " + message);
            } else {
                dwr.util.setValue("info", data.time + "  " + message);
            }
            document.getElementById("info").scrollTop = document.getElementById("info").scrollHeight;
        }
        
      //  function scrollWindow() {
      // 	content.scrollTop = content.scrollHeight;
      //      setTimeout("scrollWindow()", 1000);
      //   }
      //      setTimeout("scrollWindow()", 1000);
            
            
            
</script>
<textarea rows="20" cols="60" id="info" readonly="readonly"></textarea>
      <hr/>
      昵称：<input type="text" id="userName"/><br/>
      消息：<textarea rows="5" cols="30" id="content"></textarea>
      <input type="button" value=" Send " onclick="send()" style="height: 85px; width: 85px;"/>
      

  
</body>
</html>