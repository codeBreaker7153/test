<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BMI Result</title>
</head>
<body>
    <h1>BMI Result</h1>
    <%
        try {
            // Retrieving user input
            String weightStr = request.getParameter("weight");
            String heightStr = request.getParameter("height");

            if (weightStr != null && heightStr != null) {
                double weight = Double.parseDouble(weightStr);
                double height = Double.parseDouble(heightStr);

                // Calculating BMI
                double bmi = weight / (height * height);

                // Classifying BMI
                String category;
                if (bmi < 18.5) {
                    category = "Underweight";
                } else if (bmi >= 18.5 && bmi < 24.9) {
                    category = "Normal weight";
                } else if (bmi >= 25 && bmi < 29.9) {
                    category = "Overweight";
                } else {
                    category = "Obese";
                }

                // Displaying result
                out.println("<p>Your BMI: " + String.format("%.2f", bmi) + "</p>");
                out.println("<p>Category: " + category + "</p>");
            } else {
                out.println("<p>Invalid input. Please go back and try again.</p>");
            }
        } catch (Exception e) {
            out.println("<p>Error processing input. Please ensure all fields are filled correctly.</p>");
        }
    %>
    <br><br>
    <a href="form.jsp">Go Back</a>
</body>
</html>
