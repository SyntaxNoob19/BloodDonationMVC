package model;

import db.DBConnector;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginAuthenticator {

    private String userName = "";

    public boolean isLogin(UserDTO user) {
        String email = user.getEmail();
        String password = user.getPassword();
        String tablePassword = "";

        String query = "SELECT password, full_name, blood_group, city, phone FROM donors WHERE email = ?";

        try (Connection con = DBConnector.getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {

            pst.setString(1, email);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    tablePassword = rs.getString("password");
                    userName = rs.getString("full_name");

                    user.setBloodGroup(rs.getString("blood_group"));
                    user.setCity(rs.getString("city"));
                    user.setPhone(rs.getString("phone"));
                } else {
                    return false;
                }
            }

        } catch (SQLException e) {
            System.out.println("Login Error: " + e);
            return false;
        }

        return password != null && password.equals(tablePassword);
    }

    public String getUserName() {
        return userName;
    }
}
