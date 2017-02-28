package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by suman maharjan on 09/09/2016.
 */
public class DatabaseConnection {
    String url="jdbc:mysql://localhost:3306/dat";
    String user="root";
    String password="";

    Connection connection=null;

    public DatabaseConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public PreparedStatement getPreparedStatement(String query){
        PreparedStatement pstm=null;
        try {
            pstm=connection.prepareStatement(query);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return pstm;
    }
}
