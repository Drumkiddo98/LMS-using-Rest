<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Add Librarian</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="styles.css">
</head>

<body >
    <div class="header">
        <a href="#default" class="logo">Tom's Library</a>
        <h3>Add Librarian</h3>
    </div>
    <div class="addadmin">
        <form action="addlibrarian" method="post">
        	<label for="libid"></label>
            <input type="text" name="libid" id="libid" placeholder="ID"required><br><br>
            
            <label for="libname"></label>
            <input type="text" name="libname" id="libname" placeholder="Name"required><br><br>
            
            <label for="libmail"></label>
            <input type="text" name="libmail" id="libmail" placeholder="Mail"required><br><br>
            
            <label for="libpass"></label>
            <input type="password" name="libpass" id="libpass" placeholder="Password"required><br><br>
            <button type="button" onclick="addlibrarian()">Add Librarian</button>
        </form>
    </div>
     <script >
    	function addlibrarian(){
    		var librarianname=document.getElementById("libname").value;
    		var librarianmail=document.getElementById("libmail").value;
    		var librarianpass=document.getElementById("libpass").value;
    		var librarianid=document.getElementById("libid").value;
    		var x= JSON.stringify({"libid":librarianid,"libname":librarianname,"libmail":librarianmail,
    			"libpass":librarianpass});
    		var xhr= new XMLHttpRequest();
    		var url="http://localhost:8080/lms/webapi/librarian/addlibrarian";
    		console.log(x);
			xhr.open('POST',url,false);
			xhr.setRequestHeader("Content-Type","application/json");
			xhr.send(x);  
			alert("Librarian Added");
			window.location.replace("http://localhost:8080/lms/index.jsp");
    	}
    </script>
   </body>

</html>
