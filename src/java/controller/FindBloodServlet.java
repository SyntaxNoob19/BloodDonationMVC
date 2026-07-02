package controller;

import model.FindBloodModel;
import dto.DonorDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

public class FindBloodServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bloodGroup = request.getParameter("blood_group") != null ? request.getParameter("blood_group").trim() : "";
        String city = request.getParameter("city") != null ? request.getParameter("city").trim() : "";

        ArrayList<DonorDTO> donors = new ArrayList<>();

        if (!bloodGroup.isEmpty() && !city.isEmpty()) {
            FindBloodModel model = new FindBloodModel();
            donors = model.findDonors(bloodGroup, city);
        }

        request.setAttribute("donors", donors);
        request.setAttribute("searchedBloodGroup", bloodGroup);
        request.setAttribute("searchedCity", city);

        request.getRequestDispatcher("findblood.jsp").forward(request, response);
    }
}
