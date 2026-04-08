package controller;

import entity.customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/customers")
public class customerservlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

List<customer> customers = new ArrayList<customer>();
customers.add(new customer("Mai Văn Hoàn","1983-08-20","Hà Nội","images/img1.png"));
customers.add(new customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang","images/img2.png"));
customers.add(new customer("Nguyễn Thái Hòa","1983-08-22","Nam Định","images/img3.png"));
customers.add(new customer("Trần Đăng Khoa","1983-08-23","Hà Tây","images/img4.png"));

request.setAttribute("customers", customers);
request.getRequestDispatcher("index.jsp").forward(request, response);
}}