<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Index</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="styles.css">
</head>

<body>
    <div class="header">
        <a href="#default" class="logo">Tom's Library</a>
        <div class="header-right">
            <a href="addstudent.html">New Student Signup</a> 
            <a href="addlibrarian.jsp">New Librarian Signup</a> 
        </div>
    </div>
    <section class="parent">
        <section class="child">
            <form id="LibrarianLoginform">
                <h3>Librarian Login</h3>
                <label for="libmail"></label>
                <input type="text" name="libmail" id="libmail" placeholder="Email" required><br><br>
                <label for="libpass"></label>
                <input type="password" name="libpass" id="libpass" placeholder="Password" required><br><br>
                <button type="button" onclick="libcheck()">Login</button>
            </form>
        </section>
        <section class="child">
            <form id="StudentLoginForm">
                <h3>Student Login</h3>
                <label for="studmail"></label>
                <input type="text" name="studmail" id="studmail" placeholder="Email" required><br><br>
                <label for="studpass"></label>
                <input type="password" name="studpass" id="studpass" placeholder="Password" required><br><br>
                <button type="button" onclick="studcheck()">Login</button>
            </form>
        </section>
    </section>
    <script >
    	function libcheck(){
    		var librarianmail=document.getElementById("libmail").value;
    		var librarianpass=document.getElementById("libpass").value;
    		var x= JSON.stringify({"libmail":librarianmail,"libpass":librarianpass});
    		var xhr= new XMLHttpRequest();
    		var url="http://localhost:8080/lms/webapi/librarian/checklibrarian";
    		console.log(x);
			xhr.open('POST',url,true);
			xhr.setRequestHeader("Content-Type","application/json");
			xhr.send(x); 
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4  && xhr.status==200){		
					var response1=xhr.responseText;
					if(response1=='1'){
						window.location.replace("http://localhost:8080/lms/libhome.html");
					}
					else  {
					alert("Incorrect Login");	
					}
				}
			}
			
    	}
    	function studcheck(){
    		var studentmail=document.getElementById("studmail").value;
    		var studentpass=document.getElementById("studpass").value;
    		var x= JSON.stringify({"studmail":studentmail,"studpass":studentpass});
    		var xhr= new XMLHttpRequest();
    		var url="http://localhost:8080/lms/webapi/student/checkstudent";
    		console.log(x);
			xhr.open('POST',url,true);
			xhr.setRequestHeader("Content-Type","application/json");
			xhr.send(x);  
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4  && xhr.status==200){		
					var response1=xhr.responseText;
					if(response1=='1'){
						window.location.replace("http://localhost:8080/lms/studhome.html");
					}
					else {
					alert("Incorrect Login");	
					}
    		}
		}
    }
    
    
    </script>
    


   
</body>

</html>