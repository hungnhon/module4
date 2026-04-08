package controller;

import entity.calculator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


        import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class calculatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        double firstOperand = Double.parseDouble(
                request.getParameter("firstOperand"));

        double secondOperand = Double.parseDouble(
                request.getParameter("secondOperand"));

        String operator = request.getParameter("operator");

        try {
            double result = calculator.calculate(
                    firstOperand,
                    secondOperand,
                    operator
            );

            request.setAttribute("firstOperand", firstOperand);
            request.setAttribute("secondOperand", secondOperand);
            request.setAttribute("operator", operator);
            request.setAttribute("result", result);

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
        }

        request.getRequestDispatcher("result.jsp")
                .forward(request, response);
    }
}