package model;

import db.DBConnector;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegistrationAuthenticator {

    public boolean register(UserDTO user) {
        boolean isRegistered = false;

        String sql = "INSERT INTO donors (full_name, email, password, blood_group, city, phone) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnector.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getBloodGroup());
            pst.setString(5, user.getCity());
            pst.setString(6, user.getPhone());

            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                isRegistered = true;
            }

        } catch (SQLException e) {
            System.out.println("Registration Error: " + e);
        }

        return isRegistered;
    }
}
