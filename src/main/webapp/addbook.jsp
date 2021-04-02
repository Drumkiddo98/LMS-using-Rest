<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Add Book</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <div class="header">
        <a href="#default" class="logo">Tom's Library</a>
        <div class="header-right">
        	<a  href="libhome.html">Home</a>
        	<a  href="issuebook.html">Issue Book</a>	
        	<a  href="listbook.jsp">List Book</a>
            <a 	href="listlibrarian.jsp">List Librarian</a>
            <a 	href="liststudents.jsp">List Students</a>
            <a 	href="index.jsp">Signout</a>
        </div>
       
    </div>
    <div class="addadmin">
        <form action="addbook" method="post">
        	<h3>Add Book</h3>
         	<label for="bookid"></label>
            <input type="text" name="bookid" id="bookid" placeholder="BookID"required><br><br>
            <label for="bookname"></label>
            <input type="text" name="bookname" id="bookname" placeholder="BookName"required><br><br>
            <label for="bookauthor"></label>
            <input type="text" name="bookauthor" id="bookauthor" placeholder="Bookauthor"required><br><br>
            <label for="bookprice"></label>
            <input type="text" name="bookprice" id="bookprice" placeholder="Bookprice"required><br><br>
            <button type="button" onclick="addbook()">Add Book</button>
        </form>
    </div>
    <div>
    	<table class="addadmin" id="table">
    	<thead>
     		<tr><td>Book ID </td> 
     			<td>Book Name </td>
     			<td>Book Author </td>
     			<td>Book Price </td>
     		</tr>
     	</thead>	
     		<tbody>
     		
     		</tbody>
     	
     		
      	
      	</table>
    </div>
    
   	<script >
   		function addbook(){
   			var bookid=document.getElementById("bookid").value;
   			var bookname=document.getElementById("bookname").value;
    		var bookauthor=document.getElementById("bookauthor").value;
    		var bookprice=document.getElementById("bookprice").value;
    		var x= JSON.stringify({"bookid":bookid,"bookname":bookname,"bookauthor":bookauthor,
    			"bookprice":bookprice});
    		var xhr= new XMLHttpRequest();
    		var url="http://localhost:8080/lms/webapi/librarian/addbook";
			xhr.open('POST',url,true);
			xhr.setRequestHeader("Content-Type","application/json");
			xhr.send(x); 
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4  && xhr.status==200){		
					var response=JSON.parse(xhr.responseText);
					/* console.log('return value');
					console.log(response); */
					const table= document.querySelector("#table > tbody");
					var tr = document.createElement('tr');
					var td = document.createElement('td');
					var text2 = document.createTextNode(response.bookid);
					td.appendChild(text2);
					tr.appendChild(td);
					var td1 = document.createElement('td');
					var text3 = document.createTextNode(response.bookname);
					td1.appendChild(text3);
					tr.appendChild(td1);
					var td4 = document.createElement('td');
					var text4 = document.createTextNode(response.bookauthor);
					td4.appendChild(text4);
					tr.appendChild(td4);
					var td5 = document.createElement('td');
					var text5 = document.createTextNode(response.bookprice);
					td5.appendChild(text5);
					tr.appendChild(td5);
					table.appendChild(tr);
					}
			}
			
    	
   		}
   	
   	</script>

</html>
