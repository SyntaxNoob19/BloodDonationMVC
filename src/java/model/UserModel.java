package model;

import db.DBConnector;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserModel {

    public UserDTO getUserByEmail(String email) {
        UserDTO user = new UserDTO();
        String query = "SELECT donor_id, full_name, email, blood_group, city, phone FROM donors WHERE email = ?";

        try (Connection con = DBConnector.getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {

            pst.setString(1, email);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    user.setDonorId(rs.getInt("donor_id"));
                    user.setName(rs.getString("full_name"));
                    user.setEmail(rs.getString("email"));
                    user.setBloodGroup(rs.getString("blood_group"));
                    user.setCity(rs.getString("city"));
                    user.setPhone(rs.getString("phone"));
                }
            }

        } catch (SQLException e) {
            System.out.println("UserModel Error: " + e);
        }

        return user;
    }
}
