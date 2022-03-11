<%@page import="com.PAF.Item"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



    
 <%
 
	//Insert item---------------------------------
	if (request.getParameter("itemCode") != null)
	{
	Item itemObj = new Item();
	String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
	request.getParameter("itemName"),
	request.getParameter("itemPrice"),
	request.getParameter("itemDesc"));
	session.setAttribute("statusMsg", stsMsg);
	}
	//Delete item----------------------------------
	if (request.getParameter("itemID") != null)
	{
	Item itemObj = new Item();
	out.print("Hi");
	String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
	session.setAttribute("statusMsg", stsMsg);
	}
	


%>

 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Item Management</title>
<link rel="stylesheet" href="Views/bootstrap.css">
</head>
<body>
	<div class="container">
 		<div class="row">
 			<div class="col">
 				<h1>Item Management</h1>
				<form method="post" action="Items.jsp">
					Item code: <input name='itemCode' type="text"><br> Item
					name: <input name='itemName' type="text"><br> Item price:<input
						name='itemPrice' type="text"><br> Item description: <input
						name="itemDesc" type="text"><br> <input name="btnSubmit"
						type="submit" value="save">
			
				</form>
				<br>
				
				<h3><% out.print(session.getAttribute("statusMsg")); %></h3>
				<br>
				<%
				 Item itemObj = new Item();
				 out.print(itemObj.readItems());
				%>
	
 			</div>
 		</div>
	</div>
	
	
	

</body>
</html>