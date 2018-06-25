<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% 
Date date = new Date();
String dateFormatStr = "北京时间:\n\tH:mm:ss\n\tE\n\tyyyy-M-dd";
SimpleDateFormat simpleFormat = new SimpleDateFormat(dateFormatStr);
out.println(simpleFormat.format(date));
%>
