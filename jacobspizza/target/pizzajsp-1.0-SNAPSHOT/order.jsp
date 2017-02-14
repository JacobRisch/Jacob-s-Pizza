<%-- 
    Document   : order
    Created on : Feb 14, 2017, 5:35:59 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logan's Pizza Order</title>
    </head>
    <body>
        <h1>Order Results</h1>
        
        <p>Email=${param.email}</p>
        <p>Size=${param.size}</p>
       
        <%
            double total=0;
            String size = request.getParameter("size");
            String style = request.getParameter("style");
            
            switch(size)
            {
                case "large":
                    total +=7;
                    break;
                case "medium":
                    total += 6;
                    break;
                case "small":
                    total += 5;
                    break;
            }
            
            switch(style)
            {
                case "pan":
                    total += 1;
                    break;
                case "hand-tossed":
                    total += 0.5;
                    break;
            }
            
            String toppings[] = request.getParameterValues("toppings");
            if (toppings != null && toppings.length != 0)
            {
                out.println("<p>Toppings: ");
                for (String myTopping : toppings)
                {   total += 0.75;
                    out.println(myTopping + ", ");
                }
                out.println("<p>");
                out.println("Your total is: " + total);
                out.println("<p>");
            }
        %>
    </body>
</html>
