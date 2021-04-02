<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<%@page import="java.io.PrintWriter"%>
<%@page import="com.src.pojo.*"%>
<%@page import="com.src.db.*"%>
<%@page import="java.util.Iterator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="flag" scope="session" value="true"/> 

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Student Home</title>
    <link rel="stylesheet" href="styles.css">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
      
    
</head>

<body id="test">
    <div class="header">
        <a href="#default" class="logo">Tom's Library</a>
        <div class="header-right">
            <a href="viewbooks.jsp">View Books</a>
            <a href="returnbooks.jsp">Return Books</a>
            <a href="index.jsp">Signout</a>
        </div>
    </div>
    <div >
     <table class="addadmin">
     	<th>
     		<tr><td>Book ID </td> 
     			<td>Book Name </td>
     			<td>Book Author</td>
     			<td>Book Price</td>
      	</th>
     		<% 	
     		//DB db = new DB();
     		for(Book bk: DB.bookList){
     			String bid=bk.getBookId();
     			for (IssuedBook ibk: DB.issuedBookList){
     				if( bid.equals(ibk.getbID())){
     		%>
     				<c:set var="flag" scope="session" value="false"/> 
     				<% 
     				break;
     			}
     		}
     		%>
     		
     		<c:if test= "${flag}">
     			
     			<tr><td><%=bk.getBookId()%></td>
     			<td><%=bk.getBookName() %></td>
     			<td><%=bk.getBookAuthor()%> </td> 
     			<td> <%= bk.getBookPrice() %> </td>
     			       			
     		</tr>
     		</c:if>
     		<c:set var="flag" scope="session" value="true"/> 
     		<%}
     		
     		%>
         		
     			
     		
     		
  			
     </table>
     </div>

	
        
</body>

</html>