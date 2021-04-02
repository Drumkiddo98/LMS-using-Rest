<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<%@page import="com.src.db.DB"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.src.pojo.*"%>
<%@page import="java.util.Iterator"%>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>List Book</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="styles.css">
</head>

<body>
	
    
    <div class="header">
        <a href="#default" class="logo">Tom's Library</a>
                
           <div class="header-right">
        	<a  href="libhome.html">Home</a>
        	<a  href="addbook.jsp">Add Book</a>
        	<a  href="issuebook.html">Issue Book</a>
        	<a  href="listbook.jsp">List Book</a>
            <a 	href="listlibrarian.jsp">List Librarian</a>
            <a 	href="liststudents.jsp">List Students</a>
            <a 	href="index.jsp">Signout</a>
        </div>
     </div>
     
     <div >
     <table class="addadmin">
     	<th>
     		<tr><td>Book ID </td> 
     			<td>Book Name </td>
     			<td>Book Author</td>
     			<td>Book Price</td>
     			<!-- <td>Held By </td> -->
     		</tr>
      	</th>
     		<% 	
     		
     		/* Iterator<IssuedBook> iterator2= DB.issuedBookList.iterator();
     		String sID="NULL";
     		String studName="Un Availed"; */
     		for(Book bk : DB.bookList){
     			/* while(iterator2.hasNext()){
     				IssuedBook ibk = iterator2.next();
     				if(bk.getBookId() == Integer.parseInt(ibk.getbID())){
     					sID=ibk.getsID();
     					break;
     				}
     			}
     			if(!(sID.equals("NULL"))){
     			for(Student s: DB.studList){
     				if(s.getStudentId() == Integer.parseInt(sID)){
						studName= s.getStudName();  
						break;
     				}
     			}
     			} */
     		%>
     		<tr><td><%= bk.getBookId()%></td>
     			<td><%= bk.getBookName() %></td>
     			<td><%= bk.getBookAuthor()%></td>   
     			<td><%= bk.getBookPrice()%></td>
     			<%-- <td><%= studName%></td> --%> 
     			    			
     		</tr>
     		<%
     		}%>    			
     </table>
     </div>
     

</body>

</html>