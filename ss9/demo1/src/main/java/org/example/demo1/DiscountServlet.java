
        package org.example.demo1;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/display-discount")
public class DiscountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        float percent = Float.parseFloat(request.getParameter("percent"));

        float discountAmount = price * percent * 0.01f;
        float discountPrice = price - discountAmount;

        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<body>");
        out.println("<h2>Kết quả giảm giá</h2>");
        out.println("<p>Tên sản phẩm: " + description + "</p>");
        out.println("<p>Giá gốc: " + price + "</p>");
        out.println("<p>Phần trăm giảm: " + percent + "%</p>");
        out.println("<p>Số tiền giảm: " + discountAmount + "</p>");
        out.println("<p>Giá sau giảm: " + discountPrice + "</p>");
        out.println("</body>");
        out.println("</html>");
    }
}

