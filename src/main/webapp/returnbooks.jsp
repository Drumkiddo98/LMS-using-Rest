<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<%@page import="java.util.ArrayList"%>
<%@page import="com.src.pojo.*"%>
<%@page import="com.src.db.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Student Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <div class="header">
        <a href="#default" class="logo">Tom's Library</a>
        <div class="header-right">
            <a href="viewbooks.jsp"onClick="document.location.reload(true)" >View Books</a>
            <a href="returnbooks.jsp"onClick="document.location.reload(true)">Return Books</a> 
            <a href="index.jsp">Signout</a>
        </div>
        </div>
     
        <div>
     <table class="addadmin">
     	<th>
     		<tr><td>Book ID </td> 
     			<td>Book Name </td>
     			<td>Book Author</td>
     			<td>Book Price</td>
     			<td>Return </td>
      	</th>
     		<% 	String stumail=(String) session.getAttribute("studmail");
     			/* out.println(stumail);
     			System.out.println(stumail); */
     			ArrayList<String> bookList1 = new ArrayList<String>(); 
     			String stuID=null;
     			String bID=null;
     			for(Student st: DB.studList){
     				if(st.getStudentMail().equals(stumail)){
     					stuID = st.getStudentId();
     					System.out.println("Student ID:"+stuID);
     					break;
     				}
     			}
     			for(IssuedBook ibk: DB.issuedBookList){     				
     				if( stuID.equals(ibk.getsID())){ 
     					System.out.println("Book ID:"+ibk.getbID());
     					bookList1.add(ibk.getbID());   						
     			}
     			}
     			for(String bk : bookList1){
     				for(Book bk1: DB.bookList){
     					if(bk.equals(bk1.getBookId())){
     						String bookid=bk1.getBookId();
     						%>
     						 <tr><td><%=bk1.getBookId()%></td>
     							 <td><%=bk1.getBookName() %></td>
     							 <td><%=bk1.getBookAuthor()%> </td> 
     							<td> <%= bk1.getBookPrice()%> </td>
     							<td><button type="button" onclick="deletebook(<%=bk1.getBookId()%>)">Remove Book</button> </td>
     					       <%-- <td><a href="/webapi/librarian/deletebook?id=<%=bk1.getBookId()%>" onclick="removebook()">Return Book</a> </td> --%>
     						</tr>	
     					<% 	
     					}
     				}
     			}
     			
     		
     		%>
     		
     		    			
     </table>
     </div>
     <script>
     function deletebook(id){
    	 	var bid=id.toString();
    	 	var x= JSON.stringify({"bookid":bid});
 			var xhr= new XMLHttpRequest();
 			var url="http://localhost:8080/lms/webapi/librarian/deletebook";
 			console.log(x);
			xhr.open('POST',url,false);
			xhr.setRequestHeader("Content-Type","application/json");
			xhr.send(x);  
			alert("Book Deleted");
			window.location.replace("http://localhost:8080/lms/studhome.html");
     }
     
     </script>

        
</body>

</html>