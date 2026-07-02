package model;

import db.DBConnector;
import dto.DonorDTO;
import java.sql.*;
import java.util.ArrayList;

public class FindBloodModel {

    public ArrayList<DonorDTO> findDonors(String bloodGroup, String city) {
        ArrayList<DonorDTO> donorList = new ArrayList<>();
        bloodGroup = bloodGroup.trim();
        city = city.trim();

        String query = "SELECT full_name, blood_group, city, phone " +
                       "FROM donors " +
                       "WHERE LOWER(blood_group) = LOWER(?) AND LOWER(city) LIKE LOWER(?)";

        try (Connection con = DBConnector.getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {

            pst.setString(1, bloodGroup);
            pst.setString(2, "%" + city + "%");

            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    DonorDTO donor = new DonorDTO();
                    donor.setName(rs.getString("full_name"));
                    donor.setBloodGroup(rs.getString("blood_group"));
                    donor.setCity(rs.getString("city"));
                    donor.setPhone(rs.getString("phone"));
                    donorList.add(donor);
                }
            }

        } catch (SQLException e) {
        }

        System.out.println("Search completed: found " + donorList.size() + " donors");
        return donorList;
    }
}
